<?php include 'includes/header.php'; ?>

<div class="row justify-content-center text-center mb-5">
    <div class="col-lg-8">
        <div class="badge bg-primary bg-opacity-10 text-primary mb-3 px-3 py-2 rounded-pill border border-primary border-opacity-25">
            Admin Control Panel
        </div>
        <h1 class="display-4 fw-bold mb-3">Event Management <span style="color: var(--tech-primary)">System</span></h1>
        <p class="lead text-muted">Manage registrations, verify tickets, and track live attendance analytics.</p>
    </div>
</div>

<div class="row g-4 justify-content-center">
    
    <div class="col-md-6">
        <div class="card h-100 p-3 border-0 position-relative group-hover">
            <div class="card-body text-center">
                <div class="bg-primary bg-opacity-10 rounded-circle d-inline-flex p-4 mb-4 text-primary">
                    <i class="bi bi-person-badge display-6 mx-2"></i>
                </div>
                <h3 class="h4 mb-3">Registration Desk</h3>
                <p class="text-muted mb-4 small">Issue new tickets and bind physical passes to student records instantly.</p>
                <a href="register.php" class="btn btn-outline-primary w-100 stretched-link rounded-pill">Launch Terminal</a>
            </div>
        </div>
    </div>

    <div class="col-md-6">
        <div class="card h-100 p-3 border-0 position-relative">
            <div class="card-body text-center">
                <div class="bg-success bg-opacity-10 rounded-circle d-inline-flex p-4 mb-4 text-success">
                    <i class="bi bi-qr-code display-6 mx-2"></i>
                </div>
                <h3 class="h4 mb-3">Gate Entry</h3>
                <p class="text-muted mb-4 small">Live scanning interface. Verify validity and authorize student access.</p>
                <a href="entry.php" class="btn btn-outline-success w-100 stretched-link rounded-pill">Open Scanner</a>
            </div>
        </div>
    </div>

    <div class="col-md-6">
        <div class="card h-100 p-3 border-0 position-relative">
            <div class="card-body text-center">
                <div class="bg-danger bg-opacity-10 rounded-circle d-inline-flex p-4 mb-4 text-danger">
                    <i class="bi bi-box-arrow-right display-6 mx-2"></i>
                </div>
                <h3 class="h4 mb-3">Student Exit</h3>
                <p class="text-muted mb-4 small">Process student departures, mark tickets as exited, and update logs.</p>
                <a href="exit.php" class="btn btn-outline-danger w-100 stretched-link rounded-pill">Log Exit</a>
            </div>
        </div>
    </div>

    <div class="col-md-6">
        <div class="card h-100 p-3 border-0 position-relative">
            <div class="card-body text-center">
                <div class="bg-info bg-opacity-10 rounded-circle d-inline-flex p-4 mb-4 text-info">
                    <i class="bi bi-graph-up-arrow display-6 mx-2"></i>
                </div>
                <h3 class="h4 mb-3">Live Analytics</h3>
                <p class="text-muted mb-4 small">Real-time attendance tracking, class breakdown and entry logs.</p>
                <a href="dashboard.php" class="btn btn-outline-info w-100 stretched-link rounded-pill">View Stats</a>
            </div>
        </div>
    </div>

</div>

<?php include 'includes/footer.php'; ?>