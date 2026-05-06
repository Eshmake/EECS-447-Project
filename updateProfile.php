<?php
include 'db.php';

$data = json_decode(file_get_contents("php://input"), true);

$userId = $data['userId'];
$username = $data['username'];
$password = $data['password'];
$team = $data['team'];

$userId = str_replace("'", "''", $userId);
$username = str_replace("'", "''", $username);
$password = str_replace("'", "''", $password);
$team = str_replace("'", "''", $team);

$sql = "UPDATE Member_Registry 
            SET UserID = '$username', TeamID = '$team', User_Password = '$password'
            WHERE UserID = '$userId'";

// Execute
if ($conn->query($sql) === TRUE) {
    echo json_encode(["success" => true]);
} else {
    echo json_encode(["success" => false, "error" => $conn->error]);
}
?>