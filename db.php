<?php
$conn = new mysqli("sql213.infinityfree.com", "if0_41790916", "AcWYP4m1CZ0HJz", "if0_41790916_vex_dbs");

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
?>