<?php
header('Content-Type: application/json');

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "jemberwonder";

$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
if (isset($_GET['kd_event'])) {
    $kd_event = $_GET['kd_event'];
    $query = "SELECT gambarevent FROM event WHERE kd_event=?";
    $stmt = $conn->prepare($query);
    $stmt->bind_param("i", $kd_event);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $image_name = $row['gambarevent'];
        $image_path = "D:/XAMPP/htdocs/ProjekWebSem4/public/storage/img/" . $image_name;
        if (file_exists($image_path)) {
            $image_url = "http://172.26.189.216/ProjekWebSem4/public/storage/img/" . $image_name;
            echo json_encode(['image_url' => $image_url]);
        } else {
            echo json_encode(['error' => 'Image file not found on server']);
        }
    } else {
        echo json_encode(['error' => 'Image not found']);
    }
    $stmt->close();
} else {
    echo json_encode(['error' => 'Invalid parameter']);
}

$conn->close();
?>
