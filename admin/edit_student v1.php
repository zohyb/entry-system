<?php
session_start();
if (!isset($_SESSION['admin_logged_in'])) { header("Location: ../admin_login.php"); exit(); }
include '../config/db.php';
include '../includes/admin_header.php'; // Updated to use admin_header

$student = null;
$msg = "";
$msgType = "";

// 1. SEARCH LOGIC (STRICT: TICKET SERIAL ONLY)
if (isset($_GET['search'])) {
    $search = $conn->real_escape_string(trim($_GET['search']));
    
    // STRICT QUERY: Only match ticket_serial
    $sql = "SELECT * FROM tickets WHERE ticket_serial = '$search' LIMIT 1";
    
    $result = $conn->query($sql);
    if ($result->num_rows > 0) {
        $student = $result->fetch_assoc();
    } else { 
        $msg = "No record found for Ticket Serial: <strong>$search</strong>"; 
        $msgType = "warning"; 
    }
}

// 2. UPDATE DATA LOGIC
if (isset($_POST['update_data'])) {
    $id = $_POST['id'];
    $name = $_POST['name'];
    $roll = $_POST['roll'];
    $class = $_POST['class'];
    $serial = $_POST['serial'];
    
    // Check Unique Serial (excluding self)
    $check = $conn->query("SELECT id FROM tickets WHERE ticket_serial = '$serial' AND id != $id");
    if ($check->num_rows > 0) {
        $msg = "Error: Serial '$serial' is already assigned to another student.";
        $msgType = "danger";
        // Keep the old data visible so admin knows what they are editing
        $student = $conn->query("SELECT * FROM tickets WHERE id=$id")->fetch_assoc(); 
    } else {
        $stmt = $conn->prepare("UPDATE tickets SET student_name=?, roll_no=?, class_section=?, ticket_serial=? WHERE id=?");
        $stmt->bind_param("ssssi", $name, $roll, $class, $serial, $id);
        if ($stmt->execute()) {
            // Log It
            $admin = $_SESSION['username'] ?? 'Admin';
            $conn->query("INSERT INTO audit_logs (admin_username, action_type, target_ticket_serial, details, ip_address) 
                          VALUES ('$admin', 'UPDATE', '$serial', 'Updated details for $name', '{$_SERVER['REMOTE_ADDR']}')");
            
            $msg = "Record updated successfully.";
            $msgType = "success";
            $student = $conn->query("SELECT * FROM tickets WHERE id=$id")->fetch_assoc();
        }
    }
}

// 3. RESET ENTRY LOGIC
if (isset($_POST['reset_entry'])) {
    $id = $_POST['id'];
    $serial = $_POST['serial'];
    $reason = ($_POST['reset_reason'] == 'Other') ? $_POST['custom_reset_reason'] : $_POST['reset_reason'];
    
    if (empty($reason)) {
        $msg = "Reset failed: Reason is required.";
        $msgType = "danger";
    } else {
        $conn->query("UPDATE tickets SET has_entered = 0, entry_time = NULL WHERE id = $id");
        
        // Log It
        $admin = $_SESSION['username'] ?? 'Admin';
        $detail = "Reset entry status (Previously entered: " . $_POST['prev_time'] . ")";
        $stmt = $conn->prepare("INSERT INTO audit_logs (admin_username, action_type, target_ticket_serial, details, reason_provided, ip_address) VALUES (?, 'RESET', ?, ?, ?, ?)");
        $stmt->bind_param("sssss", $admin, $serial, $detail, $reason, $_SERVER['REMOTE_ADDR']);
        $stmt->execute();
        
        $msg = "Entry Status RESET. Student can enter again.";
        $msgType = "success";
        $student = $conn->query("SELECT * FROM tickets WHERE id=$id")->fetch_assoc();
    }
}
?>

<div class="container mt-5">
    <a href="admin.php" class="btn btn-outline-secondary mb-3">&larr; Back to Dashboard</a>
    
    <?php if($msg): ?>
        <div class="alert alert-<?php echo $msgType; ?> alert-dismissible fade show">
            <?php echo $msg; ?>
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    <?php endif; ?>

    <?php if($student): ?>
    <div class="row">
        <div class="col-md-8">
            <div class="card bg-dark border-secondary text-white">
                <div class="card-header border-secondary fw-bold">
                    <i class="bi bi-pencil"></i> Edit Student Data
                </div>
                <div class="card-body">
                    <form method="POST">
                        <input type="hidden" name="id" value="<?php echo $student['id']; ?>">
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label class="form-label text-light small text-uppercase">Ticket Serial</label>
                                <input type="text" name="serial" class="form-control bg-secondary text-white border-0 font-monospace" value="<?php echo $student['ticket_serial']; ?>" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label text-light small text-uppercase">Roll No</label>
                                <input type="text" name="roll" class="form-control bg-secondary text-white border-0" value="<?php echo $student['roll_no']; ?>" required>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label text-light small text-uppercase">Student Name</label>
                            <input type="text" name="name" class="form-control bg-secondary text-white border-0" value="<?php echo $student['student_name']; ?>" required>
                        </div>
                        <div class="mb-4">
                            <label class="form-label text-light small text-uppercase">Class / Section</label>
                            <input type="text" name="class" class="form-control bg-secondary text-white border-0" value="<?php echo $student['class_section']; ?>" required>
                        </div>
                        <button type="submit" name="update_data" class="btn btn-primary">Save Changes</button>
                    </form>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card bg-dark border-secondary text-white h-100">
                <div class="card-header border-secondary fw-bold">
                    <i class="bi bi-toggle-on"></i> Entry Status
                </div>
                <div class="card-body text-center d-flex flex-column justify-content-center">
                    <?php if($student['has_entered']): ?>
                        <div class="mb-4">
                            <i class="bi bi-check-circle-fill text-success display-1"></i>
                            <h3 class="text-success mt-2">INSIDE</h3>
                            <p class="text-light">Time: <?php echo $student['entry_time']; ?></p>
                        </div>
                        <button class="btn btn-outline-danger w-100 mt-auto" data-bs-toggle="modal" data-bs-target="#resetModal">
                            <i class="bi bi-arrow-counterclockwise"></i> RESET ENTRY
                        </button>
                    <?php else: ?>
                        <div class="mb-4">
                            <i class="bi bi-circle text-light display-1"></i>
                            <h3 class="text-light mt-2">NOT ENTERED</h3>
                        </div>
                        <div class="alert alert-secondary text-small">Student is waiting to enter.</div>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </div>
    <?php endif; ?>
</div>

<div class="modal fade" id="resetModal" tabindex="-1">
    <div class="modal-dialog">
        <div class="modal-content bg-dark text-white border-danger">
            <div class="modal-header border-danger">
                <h5 class="modal-title text-danger fw-bold">Confirm Entry Reset</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>
            <form method="POST">
                <div class="modal-body">
                    <p>You are about to revoke the entry status for <strong><?php echo $student['student_name']; ?></strong>.</p>
                    <p class="small text-light">This allows the ticket to be scanned again. This action will be logged.</p>
                    
                    <input type="hidden" name="id" value="<?php echo $student['id']; ?>">
                    <input type="hidden" name="serial" value="<?php echo $student['ticket_serial']; ?>">
                    <input type="hidden" name="prev_time" value="<?php echo $student['entry_time']; ?>">

                    <div class="mb-3">
                        <label class="form-label text-warning">Reason for Reset (Mandatory)</label>
                        <select name="reset_reason" id="resetReasonSelect" class="form-select bg-secondary text-white border-0" required onchange="toggleResetInput()">
                            <option value="">Select Reason...</option>
                            <option value="Accidental Scan">Accidental Scan (Staff Error)</option>
                            <option value="Technical Glitch">Technical Glitch / Double Count</option>
                            <option value="Student Exited Event">Student Left & Returning</option>
                            <option value="Other">Other</option>
                        </select>
                    </div>
                    <div class="mb-3 d-none" id="customResetReasonBox">
                        <input type="text" name="custom_reset_reason" class="form-control bg-secondary text-white border-warning" placeholder="Specify reason...">
                    </div>
                </div>
                <div class="modal-footer border-secondary">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" name="reset_entry" class="btn btn-danger">Confirm Reset</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
function toggleResetInput() {
    var select = document.getElementById('resetReasonSelect');
    var input = document.getElementById('customResetReasonBox');
    if (select.value === 'Other') {
        input.classList.remove('d-none');
        input.querySelector('input').setAttribute('required', 'required');
    } else {
        input.classList.add('d-none');
        input.querySelector('input').removeAttribute('required');
    }
}
</script>