<?php
include '../config/db.php';
include '../includes/admin_header.php';

$msg = "";
$msgType = "";

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $serial = trim($_POST['serial']);
    $name = trim($_POST['name']);
    $roll = trim($_POST['roll']);
    $class = trim($_POST['class']);

    // Check Duplicates
    $check = $conn->query("SELECT id FROM tickets WHERE ticket_serial = '$serial' OR roll_no = '$roll'");
    if ($check->num_rows > 0) {
        $msg = "Error: Ticket or Roll Number already exists.";
        $msgType = "danger";
    } else {
        $stmt = $conn->prepare("INSERT INTO tickets (ticket_serial, student_name, roll_no, class_section) VALUES (?, ?, ?, ?)");
        $stmt->bind_param("ssss", $serial, $name, $roll, $class);
        
        if ($stmt->execute()) {
            // Log Create
            $admin = $_SESSION['username'] ?? 'Admin';
            $logStmt = $conn->prepare("INSERT INTO audit_logs (admin_username, action_type, target_ticket_serial, details, ip_address) VALUES (?, 'CREATE', ?, ?, ?)");
            $details = "Added new student: $name";
            $ip = $_SERVER['REMOTE_ADDR'];
            $logStmt->bind_param("ssss", $admin, $serial, $details, $ip);
            $logStmt->execute();

            $msg = "Student created successfully.";
            $msgType = "success";
        } else {
            $msg = "Database Error: " . $conn->error;
            $msgType = "danger";
        }
    }
}
?>

<div class="row justify-content-center">
    <div class="col-md-8">
        <div class="card shadow-lg border-0">
            <div class="card-header bg-primary text-white">
                <h5 class="mb-0"><i class="bi bi-person-plus-fill me-2"></i> Add New Student</h5>
            </div>
            <div class="card-body p-4">
                <?php if($msg): ?>
                    <div class="alert alert-<?php echo $msgType; ?>"><?php echo $msg; ?></div>
                <?php endif; ?>

                <form method="POST">
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label class="form-label fw-bold">Ticket Serial</label>
                            <input type="text" name="serial" class="form-control" placeholder="e.g. 000500" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-bold">Roll No</label>
                            <input type="text" name="roll" class="form-control" placeholder="e.g. 123456" required>
                        </div>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label fw-bold">Student Name</label>
                        <input type="text" name="name" class="form-control" required>
                    </div>

                    <div class="mb-4">
                        <label class="form-label fw-bold">Class / Section</label>
                        <select name="class" class="form-select" required>
                            <option value="">Select Class...</option>
                            <option>BS 2nd Morning</option>
                            <option>BS 4th Morning A</option>
                            <option>BS 4th Morning B</option>
                            <option>BS 6th Morning Regular</option>
                            <option>BS 8th Morning Regular</option>
                            <option>Faculty/Staff</option>
                            <option>Guest</option>
                        </select>
                    </div>

                    <div class="d-flex justify-content-between">
                        <a href="admin.php" class="btn btn-secondary">Cancel</a>
                        <button type="submit" class="btn btn-primary px-5 fw-bold">Create Record</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<?php include '../includes/footer.php'; ?>