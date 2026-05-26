<?php 
include 'config/db.php';
include 'includes/header.php'; 

$student = null;
$error = "";
$success = "";

// ---------------------------------------------------------
// 1. HANDLE EXIT PROCESS
// ---------------------------------------------------------
if (isset($_POST['process_exit'])) {
    $ticket_id = $_POST['ticket_id'];
    $serial = $_POST['serial'];
    $name = $_POST['student_name'];

    // Update status to 0 (Outside)
    // We leave entry_time as is, so we know when they originally came, 
    // or you could set it to NULL. For now, we just flag them as "OUT".
    $updateStmt = $conn->prepare("UPDATE tickets SET has_entered = 0 WHERE id = ?");
    $updateStmt->bind_param("i", $ticket_id);
    
    if($updateStmt->execute()){
        $success = "Exit Verified. Goodbye, $name!";
        
        // Log the Exit (If audit table exists)
        // We use a try-catch silence or check simple existence to avoid breaking if table missing
        $checkTable = $conn->query("SHOW TABLES LIKE 'audit_logs'");
        if($checkTable && $checkTable->num_rows > 0) {
            $ip = $_SERVER['REMOTE_ADDR'];
            $details = "Student Exited Event";
            $logStmt = $conn->prepare("INSERT INTO audit_logs (admin_username, action_type, target_ticket_serial, details, ip_address) VALUES ('System', 'EXIT', ?, ?, ?)");
            $logStmt->bind_param("sss", $serial, $details, $ip);
            $logStmt->execute();
        }
    } else {
        $error = "System Error: Could not process exit.";
    }
}

// ---------------------------------------------------------
// 2. SEARCH / SCAN LOGIC
// ---------------------------------------------------------
$search_serial = "";
if (isset($_GET['serial']) || isset($_POST['serial'])) {
    $search_serial = isset($_POST['serial']) ? trim($_POST['serial']) : trim($_GET['serial']);
    
    if(!empty($search_serial)){
        $stmt = $conn->prepare("SELECT * FROM tickets WHERE ticket_serial = ?");
        $stmt->bind_param("s", $search_serial);
        $stmt->execute();
        $result = $stmt->get_result();
        
        if ($result->num_rows > 0) {
            $student = $result->fetch_assoc();
        } else {
            $error = "INVALID TICKET: Serial Number not found.";
        }
    }
}
?>

<div class="row justify-content-center">
    <div class="col-lg-6 col-md-8">
        
        <div class="d-flex align-items-center justify-content-between mb-4">
            <h2 class="m-0 text-danger"><i class="bi bi-box-arrow-right"></i> Exit Terminal</h2>
            <span class="badge bg-danger bg-opacity-10 text-danger border border-danger"><i class="bi bi-circle-fill small me-1"></i> Live Mode</span>
        </div>

        <div class="card mb-4 border-danger border-opacity-50 shadow-sm" style="background: linear-gradient(to bottom, #fff, #fff5f5);">
            <div class="card-body p-4">
                <form method="POST" action="exit.php">
                    <label class="form-label text-uppercase text-xs fw-bold text-danger ls-1">Scan Ticket to Exit</label>
                    <div class="input-group input-group-lg">
                        <span class="input-group-text bg-white border-end-0 text-danger"><i class="bi bi-upc-scan"></i></span>
                        <input type="text" name="serial" class="form-control border-start-0 ps-0" placeholder="Scan Serial..." value="<?php echo htmlspecialchars($search_serial); ?>" autofocus autocomplete="off">
                        <button class="btn btn-danger px-4" type="submit">CHECK</button>
                    </div>
                </form>
            </div>
        </div>

        <?php if($error): ?>
            <div class="alert alert-dark d-flex align-items-center shadow-sm p-4 rounded-3 border-start border-5 border-danger mb-4">
                <i class="bi bi-x-circle-fill display-5 text-danger me-3"></i>
                <div>
                    <h5 class="alert-heading fw-bold mb-1 text-danger">ERROR</h5>
                    <p class="mb-0 opacity-75"><?php echo $error; ?></p>
                </div>
            </div>
        <?php endif; ?>

        <?php if($success): ?>
            <div class="alert alert-success d-flex align-items-center shadow-sm p-4 rounded-3 border-0 bg-success text-white mb-4">
                <i class="bi bi-hand-thumbs-up-fill display-4 me-3"></i>
                <div>
                    <h4 class="alert-heading fw-bold mb-1">EXIT CONFIRMED</h4>
                    <p class="mb-0 opacity-75"><?php echo $success; ?></p>
                </div>
            </div>
        <?php endif; ?>

        <?php if($student && !$success): ?>
            <div class="card border-0 shadow-lg overflow-hidden">
                <div class="card-header text-center border-0 pt-4 pb-3" style="background: <?php echo ($student['has_entered'] == 1) ? '#ffe5e5' : '#f8f9fa'; ?>">
                    <h5 class="text-uppercase small fw-bold text-muted ls-2 mb-2">Current Status</h5>
                    
                    <?php if($student['has_entered'] == 1): ?>
                        <h2 class="text-danger fw-bold mb-0"><i class="bi bi-geo-alt-fill"></i> INSIDE HALL</h2>
                        <div class="badge bg-danger mt-2">Entry Time: <?php echo $student['entry_time']; ?></div>
                    <?php else: ?>
                        <h2 class="text-muted fw-bold mb-0"><i class="bi bi-house-door"></i> ALREADY OUTSIDE</h2>
                        <div class="small text-muted mt-2">This ticket is not currently marked as "Inside".</div>
                    <?php endif; ?>
                </div>

                <div class="card-body p-4 bg-white">
                    <div class="row g-3 mb-4">
                        <div class="col-4 text-muted small text-uppercase">Student Name</div>
                        <div class="col-8 fw-bold h5 text-dark"><?php echo htmlspecialchars($student['student_name']); ?></div>
                        
                        <div class="col-4 text-muted small text-uppercase">Roll Number</div>
                        <div class="col-8 fw-bold text-dark font-monospace"><?php echo htmlspecialchars($student['roll_no']); ?></div>
                        
                        <div class="col-4 text-muted small text-uppercase">Class Section</div>
                        <div class="col-8 text-danger"><?php echo htmlspecialchars($student['class_section']); ?></div>
                    </div>

                    <?php if($student['has_entered'] == 1): ?>
                        <div class="d-grid">
                            <form method="POST">
                                <input type="hidden" name="ticket_id" value="<?php echo $student['id']; ?>">
                                <input type="hidden" name="serial" value="<?php echo $student['ticket_serial']; ?>">
                                <input type="hidden" name="student_name" value="<?php echo $student['student_name']; ?>">
                                
                                <button type="submit" name="process_exit" class="btn btn-outline-danger btn-lg py-3 rounded-pill fw-bold shadow-sm border-2">
                                    <i class="bi bi-box-arrow-right me-2"></i> CONFIRM EXIT
                                </button>
                            </form>
                        </div>
                    <?php else: ?>
                        <div class="p-3 bg-light rounded text-center text-muted border border-dashed">
                            <i class="bi bi-slash-circle"></i> No action needed. Student is outside.
                        </div>
                    <?php endif; ?>
                </div>
            </div>
        <?php endif; ?>
    </div>
</div>

<?php include 'includes/footer.php'; ?>