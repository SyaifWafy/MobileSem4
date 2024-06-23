<?php
$db = mysqli_connect("localhost", "root", "", "jemberwonder");

if (!$db) {
    die("Connection failed: " . mysqli_connect_error());
}

$sql = "SELECT gambarwisata FROM wisata";
$result = mysqli_query($db, $sql);

$images = array();
while ($row = mysqli_fetch_assoc($result)) {
    $images[] = $row;
}

header('Content-Type: application/json');
echo json_encode($images);

mysqli_close($db);
?>
