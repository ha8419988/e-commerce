<?php
include '../connection.php';
header('Content-Type: application/json');

$userName = $_POST['user_name'];
$userEmail = $_POST['user_email'];
$userPassword = md5($_POST['user_password']);

$sqlQuery = "insert into users_table set user_name= '$userName',user_email='$userEmail',user_password= '$userPassword' ";
$resultQuery = $connectNow->query($sqlQuery);

if ($resultQuery) {
    # code...
    echo json_encode(array("success" => true));
} else {
    echo json_encode(array("success" => false));
}
