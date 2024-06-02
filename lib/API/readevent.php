<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");
header("Content-Type: application/json; charset=UTF-8");
$response = [];
try {
    $conn = new mysqli("localhost", "root", "", "jemberwonder");
    if ($conn->connect_error) {
        throw new Exception("Koneksi gagal: " . $conn->connect_error);
    }
    $query = mysqli_query($conn, "SELECT * FROM event");
    if (!$query) {
        throw new Exception("Query gagal: " . mysqli_error($conn));
    }
    $data = mysqli_fetch_all($query, MYSQLI_ASSOC);
    $response['status'] = 'success';
    $response['data'] = $data;
    $conn->close();
} catch (Exception $e) {
    $response['status'] = 'error';
    $response['message'] = $e->getMessage();
}
echo json_encode($response);
?>
