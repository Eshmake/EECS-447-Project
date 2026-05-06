<?php
include 'db.php';

$teamId = str_replace("'", "''", $_GET['teamId']);

$sql = "SELECT COUNT(UserID) AS TeamSize FROM Member_Registry WHERE TeamID='$teamId'";
$result = $conn->query($sql);

echo json_encode($result->fetch_assoc());
?>