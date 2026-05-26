<?php
session_start();
include 'config/db.php';

$error = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = trim($_POST['username']);
    $password = trim($_POST['password']);

    // Admin Authentication
    $stmt = $conn->prepare("SELECT id FROM admins WHERE username = ? AND password = ?");
    $stmt->bind_param("ss", $username, $password);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows > 0) {
        $_SESSION['admin_logged_in'] = true;
        $_SESSION['username'] = $username;
        header("Location: admin/admin.php");
        exit();
    } else {
        $error = "Restricted: Admin Credentials Invalid";
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Access | TechInnovate</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="assets/style.css">
    <style>
        body {
            background-image: linear-gradient(135deg, #0f172a 0%, #330000 100%);
            display: flex; align-items: center; justify-content: center; min-height: 100vh;
        }
        .login-card { background: rgba(0, 0, 0, 0.7); border-color: #ef4444; }
        .btn-danger { background: #ef4444; border: none; }
        .btn-danger:hover { background: #dc2626; }
    </style>
</head>
<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-4">
            <div class="card login-card shadow-lg p-4 border-top-0 border-end-0 border-bottom-0 border-3">
                <div class="card-body">
                    <div class="text-center mb-4">
                        <i class="bi bi-shield-lock-fill display-4 text-danger"></i>
                        <h4 class="mt-3 text-white fw-bold text-uppercase">Admin Console</h4>
                    </div>

                    <?php if($error): ?>
                        <div class="alert alert-danger py-2 text-center small border-0">
                            <?php echo $error; ?>
                        </div>
                    <?php endif; ?>

                    <form method="POST">
                        <div class="mb-3">
                            <input type="text" name="username" class="form-control bg-secondary border-secondary text-white" placeholder="Admin User" required>
                        </div>
                        <div class="mb-4">
                            <input type="password" name="password" class="form-control bg-secondary border-secondary text-white" placeholder="Secret Key" required>
                        </div>
                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-danger fw-bold">UNLOCK</button>
                            <a href="login.php" class="btn btn-outline-light btn-sm opacity-50">Back to Staff Login</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>