<?php
include 'db.php';

$region = str_replace("'", "''", $_GET['region']);

$sql = "SELECT TeamID, Team_Name, Organization FROM Robotics_Team WHERE Region='$region'";
$result = $conn->query($sql);

$data = [];

while ($row = $result->fetch_assoc()) {
    $data[] = $row;
}

echo json_encode($data);
?>