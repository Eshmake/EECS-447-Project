<?php
include 'db.php';

$userId = $_GET['userId'];

$sql = "SELECT Member_Registry.UserID, Member_Registry.TeamID, Member_Registry.User_Password, Robotics_Team.Team_Name FROM Member_Registry JOIN Robotics_Team ON Member_Registry.TeamID = Robotics_Team.TeamID WHERE UserID = '$userId'";
$result = $conn->query($sql);

$data = [];

while ($row = $result->fetch_assoc()) {
    $data[] = $row;
}

echo json_encode($data);
?>
