<?php
// Database connection settings
$host = 'localhost';
$dbname = 'db_tacosoftapp';
$user = 'root';
$pass = 't4a2x0a6';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Database connection failed: " . $e->getMessage());
}
?>
