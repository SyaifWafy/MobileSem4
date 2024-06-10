<?php
include 'db.php';

header('Content-Type: application/json');
$data = json_decode(file_get_contents('php://input'), true);

if (isset($data['username_cus'], $data['pertanyaan'], $data['jawaban'], $data['newPassword'])) {
    $username = $data['username_cus'];
    $pertanyaan = $data['pertanyaan'];
    $jawaban = $data['jawaban'];
    $newPassword = $data['newPassword'];

    try {
        if ($conn) {
            $sql = "SELECT pertanyaan, jawaban FROM customer WHERE username_cus = ?";
            $stmt = $conn->prepare($sql);
            $stmt->execute([$username]);
            $user = $stmt->fetch(PDO::FETCH_ASSOC);

            if (!$user) {
                echo json_encode(['message' => 'Username tidak ditemukan']);
            } elseif ($user['pertanyaan'] === $pertanyaan && $user['jawaban'] === $jawaban) {
                $sql = "UPDATE customer SET pw_cus = ? WHERE username_cus = ?";
                $stmt = $conn->prepare($sql);
                if ($stmt->execute([$newPassword, $username])) {
                    echo json_encode(['message' => 'Password berhasil diperbarui']);
                } else {
                    echo json_encode(['message' => 'Password gagal diperbarui']);
                }
            } else {
                echo json_encode(['message' => 'Pertanyaan atau jawaban salah']);
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
