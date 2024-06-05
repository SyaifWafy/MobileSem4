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
    $input = json_decode(file_get_contents("php://input"), true);
    $nama = isset($input['nama']) ? $input['nama'] : null;
    $masukan = isset($input['masukan']) ? $input['masukan'] : null;
    if ($nama === null || $masukan === null) {
        throw new Exception("Nama dan masukan harus diisi");
    }
    $stmt = $conn->prepare("INSERT INTO masukan (username_cus, nama, masukan) VALUES (?, ?, ?)");
    $username_cus = "Customer";
    $stmt->bind_param("sss", $username_cus, $nama, $masukan);
    if (!$stmt->execute()) {
        throw new Exception("Query gagal: " . $stmt->error);
    }
    $response['status'] = 'success';
    $response['message'] = 'Data berhasil dimasukkan';
    $stmt->close();
    $conn->close();
} catch (Exception $e) {
    $response['status'] = 'error';
    $response['message'] = $e->getMessage();
}
echo json_encode($response);
?>
