<?php
function getDBConnection()
{
    $hostname = "127.0.0.1";  // force TCP
    $username = "root";
    $password = "";
    $port     = 3307;         // custom port
    $conn = new mysqli(
        $hostname,
        $username,
        $password,
        "",       // leave blank so you can select_db in the API
        $port
    );

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    return $conn;
}
