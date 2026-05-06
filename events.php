<?php
include 'db.php';

$region = str_replace("'", "''", $_GET['region']);

$sql = "SELECT Event_Name, StartDate FROM Robotics_Event WHERE Region='$region'";
$result = $conn->query($sql);

$data = [];

while ($row = $result->fetch_assoc()) {
    $data[] = $row;
}

echo json_encode($data);
?>