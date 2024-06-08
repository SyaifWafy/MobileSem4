<?php
include 'db.php';

$data = json_decode(file_get_contents('php://input'), true);

if (isset($data['username_cus'], $data['pw_cus'], $data['fullname_cus'], $data['pertanyaan'], $data['jawaban'])) {
    $username = $data['username_cus'];
    $password = ($data['pw_cus']);
    $fullname = $data['fullname_cus'];
    $pertanyaan = $data['pertanyaan'];
    $jawaban = $data['jawaban'];

    $sql = "INSERT INTO customer (username_cus, pw_cus, fullname_cus, pertanyaan, jawaban) VALUES (?, ?, ?, ?, ?)";
    $stmt= $conn->prepare($sql);
    if($stmt->execute([$username, $password, $fullname, $pertanyaan, $jawaban])){
        echo json_encode(['message' => 'Registrasi berhasil']);
    } else {
        echo json_encode(['message' => 'Registrasi gagal']);
    }
} else {
    echo json_encode(['message' => 'Kesalahan input']);
}
?>
