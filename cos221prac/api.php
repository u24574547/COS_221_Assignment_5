<?php
spl_autoload_register(function ($class) {
    require __DIR__ . "/PA5/config/$class.php";
});
set_exception_handler('ErrorHandler::errorMessage');
session_start();
$json = file_get_contents('php://input');
$data = json_decode($json);

class API
{
    private $conn;

    public static function instance()
    {
        static $instance = null; // remember this only ever gets called once, why
        if ($instance === null)
            $instance = new API();
        return $instance;
    }

    private function __construct()
    { /* Connect to the database */
        require_once("PA5/config/config.php");
        $this->conn = getDBConnection();
        $this->conn->select_db("schema");
    }

    public function __destruct()
    { /* Disconnect from the database */
        $this->conn->close();
    }

    function response($success, $data = "")
    {
        header("HTTP/1.1 200 OK");
        header("Content-Type: application/json");

        return json_encode([
            "success" => $success,
            "timestamp" => (int)(microtime(true) * 1000),
            "data" => $data
        ]);
    }

    public function register($data)
    {
        if (!isset($data->fname) || $data->fname === "") {
            return $this->response(false, 'missing fname');
        }

        if (!isset($data->lname) || $data->lname === "") {
            return $this->response(false, 'missing lname');
        }

        $stmt = $this->conn->prepare("
        INSERT INTO `user`(`fname`, `lname`, `api_key`, `password`, `email`) 
        VALUES (?,?,?,?,?)
        ");
        $stmt->bind_param(
            'sssss',
            $data->fname,
            $data->lname,
            $api_key, //$data->api_key,
            $password, //$data->password,
            $data->email
        );

        $stmtEmail = $this->conn->prepare("SELECT * FROM user WHERE email = ?");
        $stmtEmail->bind_param("s", $data->email);
        $stmtEmail->execute();
        if ($stmtEmail->get_result()->num_rows !== 0) {
            return $this->response(false, 'email in use');
        }

        if (!preg_match("/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/", $data->email)) {
            return $this->response(false, 'email format incorrect');
        }

        if (!preg_match("/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^\w\s]).{8,}$/", $data->password)) {
            return $this->response(false, 'password format incorrect');
        }

        $api_key = substr(bin2hex(random_bytes(32)), 0, 32);
        $stmtApi_key = $this->conn->prepare("SELECT * FROM user WHERE api_key = ?");
        $stmtApi_key->bind_param("s", $api_key);
        $stmtApi_key->execute();
        if ($stmtApi_key->get_result()->num_rows !== 0) {
            $api_key = substr(bin2hex(random_bytes(32)), 0, 32);
            $stmtApi_key->execute();
        }

        $password = password_hash($data->password, PASSWORD_DEFAULT);

        if ($stmt->execute()) {
            $stmtC = $this->conn->prepare("
            INSERT INTO `customer`(`user_id`, `customer_id`, `num_purchases`, `total_spent`) 
            VALUES (?,?,0,0)
            ");
            $stmtC->bind_param(
                'ii',
                $user_id,
                $customer_id,
            );

            $user_id = -1;
            $stmtU = $this->conn->prepare("
            SELECT user_id FROM `user` WHERE 1 AND api_key = ?
            ");
            $stmtU->bind_param('s', $api_key);
            if ($stmtU->execute()) {
                $result = $stmtU->get_result();
                if ($result->num_rows !== 0) {
                    $row = $result->fetch_assoc();
                    $user_id = $row['user_id'];
                }
            }

            $customer_id = $user_id;

            if ($user_id !== -1 && $stmtC->execute()) {
                return $this->response(true, ["api_key" => $api_key]);
            }

            return $this->response(false, ["api_key" => $api_key, 'message' => 'added user but failed to add customer']);
        } else {
            return $this->response(false, $stmt->error, ["timestamp" => (int)(microtime(true) * 1000)]);
        }
    }

    public function login($data)
    {
        $stmtEmail = $this->conn->prepare("SELECT * FROM user WHERE email = ?");
        $stmtEmail->bind_param("s", $data->email);
        if ($stmtEmail->execute()) {
            $result = $stmtEmail->get_result();
            if ($result->num_rows !== 0) {
                $row = $result->fetch_assoc();

                // Let password_verify handle the comparison properly
                if (password_verify($data->password, $row['password'])) {
                    return $this->response(true, ["api_key" => $row["api_key"]]);
                } else {
                    return $this->response(false, 'password incorrect');
                }
            }
            return $this->response(false, 'email not found');
        } else {
            return $this->response(false, $stmtEmail->error);
        }
    }

    public function verifyAdmin($data) //accepts either email or api_key, returns json object with {success: true, data: {isAdmin: true/false}}
    {
        /*if (isset($data->email)) {
            $stmt = $this->conn->prepare("SELECT user_id FROM user WHERE email = ?");
            $stmt->bind_param("s", $data->email);
        } else */if (isset($data->api_key)) {
            $stmt = $this->conn->prepare("SELECT user_id FROM user WHERE api_key = ?");
            $stmt->bind_param("s", $data->api_key);
        }
        else {
            return $this->response(true, ['isAdmin' => false]);
        }

        if ($stmt->execute()) {
            $result = $stmt->get_result();
            if ($result->num_rows !== 0) {
                $row = $result->fetch_assoc();

                $stmtA = $this->conn->prepare("SELECT * FROM `admin` WHERE 1 AND user_id = ?"); //user is admin if user_id is in admin table
                $stmtA->bind_param("s", $row['user_id']);
                if ($stmtA->execute()) {
                    $resultA = $stmtA->get_result();
                    if ($resultA->num_rows !== 0) {
                        return $this->response(true, ['isAdmin' => true]);
                    } else {
                        return $this->response(true, ['isAdmin' => false]);
                    }
                }
            }
            return $this->response(false, 'email not found');
        } else {
            return $this->response(false, $stmt->error);
        }
    }

    public function getProducts($data)
    {
        // Start with a base query
        $query = "SELECT * FROM products WHERE 1";

        // ——— Optional CATEGORY filter ———
        if (isset($data->category) && $data->category !== "") {
            // escape to avoid injection
            $cat = $this->conn->real_escape_string($data->category);

            if (isset($data->fuzzy) && $data->fuzzy === true) {
                $query .= " AND category REGEXP '" . $cat . "'";
            } else {
                $query .= " AND category = '" . $cat . "'";
            }
        }

        // ——— Other SEARCH properties ———
        if (isset($data->search)) {
            $properties = get_object_vars($data->search);
            foreach ($properties as $name => $value) {
                // skip price_min / price_max here (you could add them below if needed)
                if ($name !== "price_min" && $name !== "price_max") {
                    $val = $this->conn->real_escape_string($value);
                    if (isset($data->fuzzy) && $data->fuzzy === true) {
                        $query .= " AND {$name} REGEXP '{$val}'";
                    } else {
                        $query .= " AND {$name} = '{$val}'";
                    }
                }
            }
        }

        // ——— LIMIT ———
        if (isset($data->limit) && is_numeric($data->limit)) {
            $query .= " LIMIT " . (int)$data->limit;
        }

        // Execute
        $result = $this->conn->query($query);

        if ($result) {
            $productsArr = [];
            while ($row = $result->fetch_assoc()) {
                $productsArr[] = $row;
            }
            return $this->response(true, ['products' => $productsArr]);
        } else {
            return $this->response(false, 'failed to retrieve products');
        }
    }

    
    public function updateUser($data) //curl -iX POST [absolute path to api.php] -H "Content-Type: application/json" -d '{"type":"updateUser","fname":"frank","lname":"horigan","oldEmail":"asdfasdf@asdfasdf.com", "api_key":"f1c509ebc0e70ab2eb1a149da0e82370"}'
    {
        if(!isset($data->api_key)){
            return $this->response(false, 'Missing API key.');
        }
        if(isset($data->oldEmail)){
            $admin = json_decode($this->verifyAdmin($data));
            if($admin->data->isAdmin){
                $prepared = $this->conn->prepare("SELECT user_id FROM user WHERE email=?");
                $prepared->bind_param('s', $data->oldEmail);
                $prepared->execute();
                $prepared->bind_result($data->user_id);
                if(!$prepared->fetch()) return $this->response(false, 'Invalid old email');
                $prepared->close();
            }
            else{
                return $this->response(false, 'You do not have access to edit another users details or your API key is invalid.');
            }
        }
        else{
            $prepared = $this->conn->prepare('SELECT user_id FROM user WHERE api_key=?');
            $prepared->bind_param('s', $data->api_key);
            $prepared->execute();
            $prepared->bind_result($data->user_id);
            if (!$prepared->fetch()) return $this->response(false, 'Invalid API key.');
            $prepared->close();
        }

        $setParts = [];
        $params = [];
        $types = '';

        if (isset($data->fname)) {
            $setParts[] = "fname = ?";
            $params[] = $data->fname;
            $types .= 's';
        }
        if (isset($data->lname)) {
            $setParts[] = "lname = ?";
            $params[] = $data->lname;
            $types .= 's';
        }
        if (isset($data->password)) {
            $setParts[] = "password = ?";
            $params[] = $data->password;
            $types .= 's';
        }
        if (isset($data->email)) {
            $setParts[] = "email = ?";
            $params[] = $data->email;
            $types .= 's';
        }

        if (empty($setParts)) {
            return $this->response(false, "No fields to update");
        }

        $params[] = $data->user_id;
        $types .= 'i';

        $stmt = "UPDATE `user` SET " . implode(', ', $setParts) . " WHERE user_id = ?";

        $prepared = $this->conn->prepare($stmt);
        if (!$prepared) {
            return $this->response(false, "Prepare failed: " . $this->conn->error);
        }

        $prepared->bind_param($types, ...$params);

        if ($prepared->execute()) {
            return $this->response(true, "User UPDATE success");
        } else {
            return $this->response(false, "User UPDATE failure: " . $prepared->error);
        }
    }

    public function getUser($data){
        //with an admin API key to get that admins details: curl -iX POST http://localhost/Practicals/cos221prac/api.php -H "Content-Type: application/json" -d '{"type":"getUser", "api_key":"f1c509ebc0e70ab2eb1a149da0e82370"}'
        //with an admin API key to get another users details: curl -iX POST http://localhost/Practicals/cos221prac/api.php -H "Content-Type: application/json" -d '{"type":"getUser", "api_key":"f1c509ebc0e70ab2eb1a149da0e82370", "email":"asdfasdf@asdfasdf.com"}'
        //for a normal user: curl -iX POST http://localhost/Practicals/cos221prac/api.php -H "Content-Type: application/json" -d '{"type":"getUser", "api_key":"526ae9614c6834e4ff56a19a2fa4321f"}'

        if(!isset($data->api_key)){
            return $this->response(false, 'Missing API key.');
        }
        $admin = json_decode($this->verifyAdmin($data));
        if ($admin->data->isAdmin && isset($data->email)) {
            $prepared = $this->conn->prepare('SELECT user_id FROM user WHERE email=?');
            $prepared->bind_param('s', $data->email);
            $prepared->execute();
            $prepared->bind_result($data->user_id);
            if (!$prepared->fetch()) return $this->response(false, 'Invalid email address.');
            $prepared->close();
        } else {
            if(isset($data->email)) return $this->response(false, 'You do not have access to user '.$data->email.'. If this is your email address, do not include it in the request.');
            $prepared = $this->conn->prepare('SELECT user_id FROM user WHERE api_key=?');
            $prepared->bind_param('s', $data->api_key);
            $prepared->execute();
            $prepared->bind_result($data->user_id);
            if (!$prepared->fetch()) return $this->response(false, 'Invalid API key.');
            $prepared->close();
        }

        $prepared = $this->conn->prepare('SELECT user.fname, user.lname, user.email, IF(admin.user_id IS NOT NULL, "admin", "user") AS type FROM user LEFT JOIN admin ON user.user_id=admin.user_id WHERE user.user_id=?');
        $prepared->bind_param('i', $data->user_id);
        $prepared->execute();
        $result = $prepared->get_result();
        if ($result->num_rows !== 0) {
            $row = $result->fetch_assoc();
            $prepared->close();
            return $this->response(false, $row);
        }
        else{
            return $this->response(false, 'Invalid API key.');
        }

    }


    public function getVendorListingsForProduct($data)
    {
        if (!isset($data->product_id)) {
            return $this->response(false, 'Missing product_id');
        }

        $stmt = $this->conn->prepare("
            SELECT 
                l.listing_id,
                l.price,
                l.currency,
                l.in_stock,
                l.last_updated,
                v.name AS vendor_name,
                v.website_url
            FROM listing l
            JOIN vendor v ON l.vendor_id = v.vendor_id
            WHERE l.product_id = ?
            ORDER BY l.price ASC
        ");
        $stmt->bind_param("i", $data->product_id);

        if ($stmt->execute()) {
            $result = $stmt->get_result();
            $listings = [];

            while ($row = $result->fetch_assoc()) {
                $listings[] = $row;
            }

            if (count($listings) > 0) {
                return $this->response(true, ["listings" => $listings]);
            } else {
                return $this->response(false, "No listings found for this product");
            }
        } else {
            return $this->response(false, $stmt->error);
        }
        
    }

    public function getCategories($data)
    {
        $stmt = $this->conn->prepare("SELECT DISTINCT category FROM products");
        if (! $stmt->execute()) {
            return $this->response(false, 'DB error: ' . $stmt->error);
        }
        $result = $stmt->get_result();
        $cats = [];
        while ($row = $result->fetch_assoc()) {
            $cats[] = $row['category'];
        }
        return $this->response(true, ['categories' => $cats]);
    }

}

$instance = API::instance();

if (isset($data->type)) {
    switch ($data->type) {
        case "register":
            echo $instance->register($data);
            break;
        case "login":
            echo $instance->login($data);
            break;
        case "verifyAdmin":
            echo $instance->verifyAdmin($data);
            break;
        case "getProducts":
            echo $instance->getProducts($data);
            break;
        case "getCategories":
            echo $instance->getCategories($data);
            break;
        case "updateUser":
            echo $instance->updateUser($data);
            break;
        case 'getUser':
            echo $instance->getUser($data);
            break;

        case "getVendorListingsForProduct":
            echo $instance->getVendorListingsForProduct($data);
            break;
            
        default:
            echo $instance->response(false, 'post parameters missing');
    }
}