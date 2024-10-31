<?php
include '../connection.php';
header('Content-Type: application/json');

$userEmail = $_POST['user_email'];
$userPassword = md5($_POST['user_password']);

$sqlQuery = "select *from users_table where user_email='$userEmail' and user_password= '$userPassword' ";
$resultQuery = $connectNow->query($sqlQuery);

if ($resultQuery->num_rows > 0) {
    # code...
    $userRecord = array();
    while ($rowFound = $resultQuery->fetch_assoc()) {
        $userRecord = $rowFound;
    }
    echo json_encode(array(
        "success" => true,
        "data" => $userRecord

    ));
} else {
    echo json_encode(array("success" => false));
}
