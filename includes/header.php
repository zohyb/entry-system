<?php include 'includes/auth.php'; ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TechEntry | Event System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="assets/style.css">
</head>
<body class="d-flex flex-column min-vh-100">

<nav class="navbar navbar-expand-lg navbar-dark sticky-top">
    <div class="container">
        <a class="navbar-brand d-flex align-items-center gap-2" href="index.php">
            <i class="bi bi-cpu-fill text-info"></i>
            TECH<span style="color: var(--tech-secondary)">INNOVATE</span>
        </a>
        <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav gap-lg-3">
                <li class="nav-item"><a class="nav-link" href="register.php"><i class="bi bi-person-plus me-1"></i> Register</a></li>
                <li class="nav-item"><a class="nav-link" href="entry.php"><i class="bi bi-qr-code-scan me-1"></i> Gate Entry</a></li>
                <li class="nav-item"><a class="nav-link" href="exit.php"><i class="bi bi-box-arrow-right me-1"></i> Gate Exit</a></li>
                <li class="nav-item"><a class="nav-link" href="dashboard.php"><i class="bi bi-speedometer2 me-1"></i> Dashboard</a></li>
                <li class="nav-item ms-lg-3"><a class="nav-link text-danger" href="logout.php"><i class="bi bi-power"></i> Logout</a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="container py-5 flex-grow-1">