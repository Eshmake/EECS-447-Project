<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);

header('Content-Type: application/json');

include 'db.php';

$data = json_decode(file_get_contents("php://input"), true);

$username = $conn->real_escape_string($data['username']);
$password = $conn->real_escape_string($data['password']);
$team = $conn->real_escape_string($data['team']);

$check = $conn->query("SELECT 1 FROM Member_Registry WHERE UserID='$username'");

if ($check->num_rows > 0) {
    echo json_encode(["success" => false, "message" => "Username already exists"]);
    exit();
}

$sql = "INSERT INTO Member_Registry (UserID, TeamID, User_Password)
        VALUES ('$username', '$team', '$password')";

if ($conn->query($sql)) {
    echo json_encode(["success" => true]);
} else {
    echo json_encode(["success" => false, "message" => $conn->error]);
}
?>