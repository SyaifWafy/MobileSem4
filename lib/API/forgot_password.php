<?php
include 'db.php';

header('Content-Type: application/json');
$data = json_decode(file_get_contents('php://input'), true);
if (isset($data['username_cus'], $data['jawaban'], $data['newPassword'])) {
    $username = $data['username_cus'];
    $jawaban = $data['jawaban'];
    $newPassword = $data['newPassword'];

    try {
        if ($conn) {
            $sql = "SELECT jawaban FROM customer WHERE username_cus = ?";
            $stmt = $conn->prepare($sql);
            $stmt->execute([$username]);
            $user = $stmt->fetch(PDO::FETCH_ASSOC);
            if ($user && $user['jawaban'] === $jawaban) {
                $sql = "UPDATE customer SET pw_cus = ? WHERE username_cus = ?";
                $stmt = $conn->prepare($sql);
                if ($stmt->execute([$newPassword, $username])) {
                    echo json_encode(['message' => 'Password berhasil diperbarui']);
                } else {
                    echo json_encode(['message' => 'Password gagal diperbarui']);
                }
            } else {
                echo json_encode(['message' => 'Jawaban salah']);
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
