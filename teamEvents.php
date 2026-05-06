<?php
include 'db.php';

$teamId = str_replace("'", "''", $_GET['teamId']);

$sql = "SELECT Robotics_Event.Event_Name, StartDate
        FROM Robotics_Event
        JOIN Competes_At 
        ON Robotics_Event.EventCode = Competes_At.EventCode
        WHERE TeamID = '$teamId'";

$result = $conn->query($sql);

$data = [];

while ($row = $result->fetch_assoc()) {
    $data[] = $row;
}

echo json_encode($data);
?>