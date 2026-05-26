<?php
if (session_status() === PHP_SESSION_NONE) { session_start(); }
if (!isset($_SESSION['admin_logged_in']) || $_SESSION['admin_logged_in'] !== true) {
    header("Location: ../admin_login.php");
    exit();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin CRUD | TechInnovate</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="../assets/style.css">
    <style>
        .navbar-admin { background: #0f172a; border-bottom: 2px solid #dc3545; }
        .nav-link.active { color: #dc3545 !important; font-weight: bold; }
        body { background-color: #f1f5f9; } /* Light background for CRUD readability */
        .table-actions { width: 150px; }
    </style>
</head>
<body class="d-flex flex-column min-vh-100">

<nav class="navbar navbar-expand-lg navbar-dark navbar-admin sticky-top">
    <div class="container-fluid px-4">
        <a class="navbar-brand d-flex align-items-center gap-2" href="admin.php">
            <i class="bi bi-database-fill-gear text-danger"></i>
            <span class="fw-bold">DATA<span class="text-danger">MANAGER</span></span>
        </a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav me-auto">
                <li class="nav-item"><a class="nav-link <?php echo basename($_SERVER['PHP_SELF']) == 'admin.php' ? 'active' : ''; ?>" href="admin.php">Manage Students</a></li>
                <li class="nav-item"><a class="nav-link <?php echo basename($_SERVER['PHP_SELF']) == 'add_student.php' ? 'active' : ''; ?>" href="add_student.php">Add New</a></li>
                <li class="nav-item"><a class="nav-link <?php echo basename($_SERVER['PHP_SELF']) == 'logs.php' ? 'active' : ''; ?>" href="logs.php">Audit Logs</a></li>
            </ul>
            <a href="../logout.php" class="btn btn-danger btn-sm fw-bold">Logout</a>
        </div>
    </div>
</nav>
<div class="container-fluid px-4 py-4 flex-grow-1">