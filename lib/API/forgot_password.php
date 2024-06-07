<?php
include 'db.php';

$data = json_decode(file_get_contents('php://input'), true);

if (isset($data['username_cus'], $data['jawaban'], $data['new_pw_cus'])) {
    $username = $data['username_cus'];
    $jawaban = $data['jawaban'];
    $newPassword = password_hash($data['new_pw_cus'], PASSWORD_DEFAULT);

    $sql = "SELECT jawaban FROM customer WHERE username_cus = ?";
    $stmt = $conn->prepare($sql);
    $stmt->execute([$username]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($user && $user['jawaban'] === $jawaban) {
        $sql = "UPDATE customer SET pw_cus = ? WHERE username_cus = ?";
        $stmt = $conn->prepare($sql);
        if($stmt->execute([$newPassword, $username])) {
            echo json_encode(['message' => 'Password updated successfully']);
        } else {
            echo json_encode(['message' => 'Failed to update password']);
        }
    } else {
        echo json_encode(['message' => 'Invalid answer']);
    }
} else {
    echo json_encode(['message' => 'Invalid input']);
}
?>
