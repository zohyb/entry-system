<?php
include '../config/db.php';
include '../includes/admin_header.php';

$id = isset($_GET['id']) ? intval($_GET['id']) : 0;
$student = $conn->query("SELECT * FROM tickets WHERE id = $id")->fetch_assoc();

if (!$student) {
    echo "<div class='container mt-5'><div class='alert alert-danger'>Student not found.</div><a href='admin.php' class='btn btn-dark'>Back</a></div>";
    exit();
}

$msg = "";
$msgType = "";

if (isset($_POST['update'])) {
    $serial = $_POST['serial'];
    $name = $_POST['name'];
    $roll = $_POST['roll'];
    $class = $_POST['class'];
    $status = isset($_POST['status']) ? 1 : 0; // Checkbox logic

    // Update Query
    $stmt = $conn->prepare("UPDATE tickets SET ticket_serial=?, student_name=?, roll_no=?, class_section=?, has_entered=? WHERE id=?");
    $stmt->bind_param("ssssii", $serial, $name, $roll, $class, $status, $id);

    if ($stmt->execute()) {
        // Log Update
        $admin = $_SESSION['username'] ?? 'Admin';
        $logStmt = $conn->prepare("INSERT INTO audit_logs (admin_username, action_type, target_ticket_serial, details, ip_address) VALUES (?, 'UPDATE', ?, ?, ?)");
        $details = "Updated record: $name";
        $ip = $_SERVER['REMOTE_ADDR'];
        $logStmt->bind_param("ssss", $admin, $serial, $details, $ip);
        $logStmt->execute();

        $msg = "Record updated successfully.";
        $msgType = "success";
        // Refresh data
        $student = $conn->query("SELECT * FROM tickets WHERE id = $id")->fetch_assoc();
    } else {
        $msg = "Update failed: " . $conn->error;
        $msgType = "danger";
    }
}
?>

<div class="row justify-content-center">
    <div class="col-md-8">
        <div class="card shadow border-0">
            <div class="card-header bg-dark text-white">
                <h5 class="mb-0"><i class="bi bi-pencil-square me-2"></i> Edit Student</h5>
            </div>
            <div class="card-body p-4">
                <?php if($msg): ?>
                    <div class="alert alert-<?php echo $msgType; ?>"><?php echo $msg; ?></div>
                <?php endif; ?>

                <form method="POST">
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label class="form-label fw-bold">Ticket Serial</label>
                            <input type="text" name="serial" class="form-control font-monospace" value="<?php echo htmlspecialchars($student['ticket_serial']); ?>" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-bold">Roll No</label>
                            <input type="text" name="roll" class="form-control" value="<?php echo htmlspecialchars($student['roll_no']); ?>" required>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold">Student Name</label>
                        <input type="text" name="name" class="form-control" value="<?php echo htmlspecialchars($student['student_name']); ?>" required>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-bold">Class / Section</label>
                        <input type="text" name="class" class="form-control" value="<?php echo htmlspecialchars($student['class_section']); ?>" required>
                    </div>

                    <div class="mb-4">
                        <div class="form-check form-switch p-3 bg-light border rounded">
                            <input class="form-check-input ms-0 me-3" type="checkbox" name="status" id="statusSwitch" <?php echo ($student['has_entered'] == 1) ? 'checked' : ''; ?>>
                            <label class="form-check-label fw-bold" for="statusSwitch">
                                Mark as "Inside" (Entered)
                            </label>
                            <div class="form-text ms-1">Uncheck to reset entry status.</div>
                        </div>
                    </div>

                    <div class="d-flex justify-content-between">
                        <a href="admin.php" class="btn btn-secondary">Back to List</a>
                        <button type="submit" name="update" class="btn btn-primary px-5 fw-bold">Save Changes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<?php include '../includes/footer.php'; ?>