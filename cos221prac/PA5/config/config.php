<?php
function getDBConnection()
{
    $servername = "localhost";
    $username = "root";
    $password = "Kutlwano@2007";
    // Create connection
    $conn = new mysqli(
        $servername,
        $username,
        $password
    );
    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    // echo "Connected successfully";
    return $conn;
}