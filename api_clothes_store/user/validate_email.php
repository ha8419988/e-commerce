<?php
include '../connection.php';
header('Content-Type: application/json');

$userEmail = $_POST['user_email'];
$sqlQuery = "select * from users_table where user_email='$userEmail'";
$resultOfQuery = $connectNow->query($sqlQuery);
if ($resultOfQuery->num_rows > 0) {
    echo json_encode(array("emailFound" => true));
} else {
    echo json_encode(array("emailFound" => false));
}
