<?php
// populate_products.php

// 1. Database configuration
const DB_HOST = '127.0.0.1';
const DB_PORT = '3307';
const DB_NAME = 'schema';
const DB_USER = 'root';
const DB_PASS = '';

try {
    $pdo = new PDO(
        "mysql:host=".DB_HOST.";port=".DB_PORT.";dbname=".DB_NAME.";charset=utf8mb4",
        DB_USER,
        DB_PASS,
        [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION]
    );
} catch (PDOException $e) {
    die("DB connection failed: " . $e->getMessage());
}

// **WIPE EXISTING DATA**
$pdo->exec("TRUNCATE TABLE products");

// 2. Fetch up to 200 products using file_get_contents()
$totalToFetch = 400;
$pageSize     = 100;
$allProducts  = [];

for ($skip = 0; $skip < $totalToFetch; $skip += $pageSize) {
    $url  = "https://dummyjson.com/products?limit={$pageSize}&skip={$skip}";
    $resp = file_get_contents($url);
    if ($resp === false) {
        die("Failed to fetch data at skip={$skip}");
    }
    $data = json_decode($resp, true);
    if (!isset($data['products'])) {
        die("Unexpected response at skip={$skip}");
    }
    $allProducts = array_merge($allProducts, $data['products']);
}

// 3. Prepare INSERT statement
$sql = "
    INSERT INTO products (brand, description, name, category, images, Num_Products)
    VALUES (:brand, :description, :name, :category, :images, :stock)
";
$stmt = $pdo->prepare($sql);

// 4. Loop through fetched products and insert
$pdo->beginTransaction();
foreach ($allProducts as $prod) {
    $rawBrand    = $prod['brand']       ?? '';
    $rawDesc     = $prod['description'] ?? '';
    $rawName     = $prod['title']       ?? '';
    $rawCategory = $prod['category']    ?? '';
    $rawImages   = $prod['images']      ?? [];
    $rawStock    = $prod['stock']       ?? 0;

    $brand       = substr($rawBrand,    0, 30);
    $description = substr($rawDesc,     0, 255);
    $name        = substr($rawName,     0, 45);
    $category    = substr($rawCategory, 0, 45);
    $images      = json_encode($rawImages);
    $stock       = (int)$rawStock;

    $stmt->execute([
        ':brand'       => $brand,
        ':description' => $description,
        ':name'        => $name,
        ':category'    => $category,
        ':images'      => $images,
        ':stock'       => $stock,
    ]);
}
$pdo->commit();

echo "✅ Successfully wiped & populated " . count($allProducts) . " products.\n";
