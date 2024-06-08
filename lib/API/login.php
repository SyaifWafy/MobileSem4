<?php
include 'db.php';

header('Content-Type: application/json');
$data = json_decode(file_get_contents('php://input'), true);

if (isset($data['username_cus'], $data['pw_cus'])) {
    $username = $data['username_cus'];
    $password = $data['pw_cus'];
    try {
        if ($conn) {
            $sql = "SELECT pw_cus FROM customer WHERE username_cus = ?";
            $stmt = $conn->prepare($sql);
            $stmt->execute([$username]);
            $user = $stmt->fetch(PDO::FETCH_ASSOC);
            if ($user && password_verify($password, $user['pw_cus'])) {
                echo json_encode(['message' => 'Login berhasil']);
            } else {
                echo json_encode(['message' => 'Username atau password salah']);
            }
        } else {
            echo json_encode(['message' => 'Koneksi database gagal']);
        }
    } catch (PDOException $e) {
        echo json_encode(['message' => 'Kesalahan server: ' . $e->getMessage()]);
    }
} else {
    echo json_encode(['message' => 'Kesalahan input']);
}
?>
