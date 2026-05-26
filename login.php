<?php
session_start();
include 'config/db.php';

// If already logged in, go to home
if (isset($_SESSION['user_logged_in']) && $_SESSION['user_logged_in'] === true) {
    header("Location: index.php");
    exit();
}

$error = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = trim($_POST['username']);
    $password = trim($_POST['password']);

    // Direct comparison (No Hashing as requested)
    $stmt = $conn->prepare("SELECT id FROM users WHERE username = ? AND password = ?");
    $stmt->bind_param("ss", $username, $password);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows > 0) {
        $_SESSION['user_logged_in'] = true;
        $_SESSION['username'] = $username;
        header("Location: index.php");
        exit();
    } else {
        $error = "Access Denied: Invalid Credentials";
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>System Login | TechInnovate</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="assets/style.css">
    <style>
        body {
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }
        .login-card {
            width: 100%;
            max-width: 400px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            background: rgba(15, 23, 42, 0.6); /* Darker glass for login */
            backdrop-filter: blur(20px);
        }
        .form-control {
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: #fff;
        }
        .form-control:focus {
            background: rgba(255, 255, 255, 0.2);
            color: #fff;
            border-color: var(--tech-secondary);
            box-shadow: 0 0 0 4px rgba(0, 212, 255, 0.1);
        }
        .form-control::placeholder { color: rgba(255, 255, 255, 0.5); }
    </style>
</head>
<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-5">
            <div class="card login-card bg-info shadow-lg p-4">
                <div class="card-body">
                    <div class="text-center mb-4">
                        <i class="bi bi-cpu-fill display-4 text-primary"></i>
                        <h3 class="mt-3 text-white fw-bold" style="font-family: 'Rajdhani', sans-serif; letter-spacing: 2px;">SYSTEM LOGIN</h3>
                        <p class="text-white-50 small">Event Management Terminal</p>
                    </div>

                    <?php if($error): ?>
                        <div class="alert alert-danger py-2 text-center small border-0 bg-danger text-white">
                            <i class="bi bi-exclamation-triangle-fill me-1"></i> <?php echo $error; ?>
                        </div>
                    <?php endif; ?>

                    <form method="POST">
                        <div class="mb-3">
                            <div class="input-group">
                                <span class="input-group-text bg-transparent border-light text-light"><i class="bi bi-person"></i></span>
                                <input type="text" name="username" class="form-control border-light" placeholder="Username" required autofocus>
                            </div>
                        </div>
                        <div class="mb-4">
                            <div class="input-group">
                                <span class="input-group-text bg-transparent border-light text-light"><i class="bi bi-key"></i></span>
                                <input type="password" name="password" class="form-control border-light" placeholder="Password" required>
                            </div>
                        </div>
                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary rounded-pill fw-bold">AUTHENTICATE</button>
                        </div>
                    </form>

                    <div class="text-center mt-4">
                        <a href="admin_login.php" class="text-decoration-none text-white small hover-opacity-100" style="font-size: 0.75rem;">
                            <i class="bi bi-shield-lock"></i> Admin Access
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>