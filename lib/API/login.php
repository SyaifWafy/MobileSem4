<?php
include 'db.php';

$data = json_decode(file_get_contents('php://input'), true);

if (isset($data['username_cus'], $data['pw_cus'])) {
    $username = $data['username_cus'];
    $password = $data['pw_cus'];

    $sql = "SELECT pw_cus FROM customer WHERE username_cus = ?";
    $stmt = $conn->prepare($sql);
    $stmt->execute([$username]);
    $user = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($user && password_verify($password, $user['pw_cus'])) {
        echo json_encode(['message' => 'Login successful']);
    } else {
        echo json_encode(['message' => 'Invalid username or password']);
    }
} else {
    echo json_encode(['message' => 'Invalid input']);
}
?>
