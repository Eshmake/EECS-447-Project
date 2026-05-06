<?php
include 'db.php';

$userId = $_GET['userId'];

$sql = "SELECT UserID, TeamID FROM Member_Registry WHERE UserID='$userId'";
$result = $conn->query($sql);

$data = [];

while ($row = $result->fetch_assoc()) {
    $data[] = $row;
}

echo json_encode($data);
?>