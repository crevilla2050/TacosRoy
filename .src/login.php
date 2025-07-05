<?php
session_start();
require_once 'db.php';

$error = '';

function hashPassword($password) {
    return hash('sha256', $password);
}

// Temporary modification to accept user and password via GET for testing
if (isset($_POST['user']) && isset($_POST['password'])) {
    $user = $_POST['user'];
    $password = $_POST['password'];

    $hashedPassword = hashPassword($password);

    $stmt = $pdo->prepare("SELECT id_usuario, int_status FROM tbl_usuarios WHERE chr_login = :user AND chr_password = :pass");
    $stmt->execute(['user' => $user, 'pass' => $hashedPassword]);
    $result = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($result) {
        $_SESSION['user_id'] = $result['id_usuario'];
        $_SESSION['user_level'] = $result['int_status'];
        header('Location: main.php');
        exit;
    } else {
        $error = "Usuario/Contraseña incorrectos";
    }
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $user = $_POST['username'] ?? '';
    $password = $_POST['password'] ?? '';

    if ($user && $password) {
        $hashedPassword = hashPassword($password);
        $stmt = $pdo->prepare("SELECT id_usuario, int_status FROM tbl_usuarios WHERE chr_login = :user AND chr_password = :pass");
        $stmt->execute(['user' => $user, 'pass' => $hashedPassword]);
        $result = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($result) {
            $_SESSION['user_id'] = $result['id_usuario'];
            $_SESSION['user_level'] = $result['int_status'];
            header('Location: main.php');
            exit;
        } else {
            $error = "Usuario/Contraseña incorrectos";
        }
    } else {
        $error = "Por favor ingrese usuario y contraseña";
    }
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Login - Tacos Roy</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
<div class="container mt-5" style="max-width: 400px;">
    <h3 class="mb-4 text-center">Tacos Roy Software 2.0</h3>
    <?php if ($error): ?>
        <div class="alert alert-danger"><?= htmlspecialchars($error) ?></div>
    <?php endif; ?>
    <form method="post" action="login.php">
        <img src="images/TacoSoftLogo.png" alt="TacoSoft Logo" class="mb-3 d-block mx-auto" style="max-width: 100%; height: auto;">
        <div class="mb-3">
            <label for="username" class="form-label">Usuario</label>
            <input type="text" class="form-control" id="username" name="username" required autofocus />
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Contraseña</label>
            <input type="password" class="form-control" id="password" name="password" required />
        </div>
        <button type="submit" class="btn btn-primary w-100">Ingresar</button>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
