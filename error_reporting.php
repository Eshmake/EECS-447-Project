<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

include 'db.php';

$teamId = $_GET['teamId'];

$sql = "SELECT Robotics_Event.Name, Robotics_Event.StartDate
        FROM Robotics_Event
        JOIN Competes_At 
        ON Robotics_Event.EventCode = Competes_At.EventCode
        WHERE Competes_At.TeamID = '$teamId'";

$result = $conn->query($sql);

if (!$result) {
    die("SQL ERROR: " . $conn->error);
}

$data = [];

while ($row = $result->fetch_assoc()) {
    $data[] = $row;
}

echo json_encode($data);
?>