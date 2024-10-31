<?php
$severHost = 'localHost';
$user = 'root';
$password = '';
$database = 'clothes_app';

$connectNow = new mysqli(
    $severHost,
    $user,
    $password,
    $database,
);
if ($connectNow->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}