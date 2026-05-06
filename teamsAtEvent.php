<?php
include 'db.php';

$eventCode = str_replace("'", "''", $_GET['eventCode']);

$sql = "SELECT Robotics_Team.TeamID, Team_Name, Organization
        FROM Robotics_Team
        JOIN Competes_At 
        ON Robotics_Team.TeamID = Competes_At.TeamID
        WHERE EventCode = '$eventCode'";

$result = $conn->query($sql);

$data = [];

while ($row = $result->fetch_assoc()) {
    $data[] = $row;
}

echo json_encode($data);
?>