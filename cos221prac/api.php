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

    public function getProducts($data) //curl -X POST http://localhost/cos221prac/api.php -H "Content-Type: application/json" -d "{\"type\":\"getProducts\", \"limit\":\"50\"}"
    {
        $stmt = $this->conn->prepare("SELECT * FROM `products` WHERE 1 LIMIT ?");
        $stmt->bind_param("i", $data->limit);

        if ($stmt->execute()) {
            $result = $stmt->get_result();
            $products = [];

            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    array_push($products, $row);
                }
                return $this->response(true, ['products' => $products]);
            }

            return $this->response(false, 'no products found');
        } else {
            return $this->response(false, $stmt->error);
        }
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
        case "getProducts":
            echo $instance->getProducts($data);
            break;
        default:
            echo $instance->response(false, 'post parameters missing');
    }
}
