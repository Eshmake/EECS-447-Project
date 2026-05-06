<?php
include 'db.php';

header('Content-Type: application/json');

$sql = "SELECT TeamID, Team_Name FROM Robotics_Team";
$result = $conn->query($sql);

$data = [];

if ($result) {
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
}

// CRITICAL: ensure nothing else is output
echo json_encode($data);
exit;
?>