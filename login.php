<?php
include 'db.php';

$data = json_decode(file_get_contents("php://input"), true);

$username = str_replace("'", "''", $data['username']);
$password = str_replace("'", "''", $data['password']);

$sql = "SELECT UserID, TeamID FROM Member_Registry WHERE UserID='$username' AND User_Password='$password'";

$result = $conn->query($sql);

$output = [];

while ($row = $result->fetch_assoc()) {
    $output[] = $row;
}

echo json_encode($output);
?>