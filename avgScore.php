<?php
include 'db.php';

$eventCode = str_replace("'", "''", $_GET['eventCode']);

$sql = "SELECT AVG(ProgrammingScore + DrivingScore) AS AverageScore
        FROM Robotics_Team
        JOIN Competes_At ON Robotics_Team.TeamID = Competes_At.TeamID
        WHERE EventCode = '$eventCode'";

$result = $conn->query($sql);

echo json_encode($result->fetch_assoc());
?>