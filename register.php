<?php 
include 'config/db.php';
include 'includes/header.php'; 

$msg = "";
$msgType = "";

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $serial = trim($_POST['serial']);
    $name = trim($_POST['name']);
    $roll = trim($_POST['roll']);
    $class = trim($_POST['class']);

    if(empty($serial) || empty($name)) {
        $msg = "Please fill all required fields.";
        $msgType = "danger";
    } else {
        // Check for duplicates
        $checkStmt = $conn->prepare("SELECT id FROM tickets WHERE ticket_serial = ? OR roll_no = ?");
        $checkStmt->bind_param("ss", $serial, $roll);
        $checkStmt->execute();
        $checkStmt->store_result();

        if ($checkStmt->num_rows > 0) {
            $msg = "Error: Ticket Serial <strong>$serial</strong> or Roll No <strong>$roll</strong> is already registered!";
            $msgType = "danger";
        } else {
            // Insert
            $stmt = $conn->prepare("INSERT INTO tickets (ticket_serial, student_name, roll_no, class_section) VALUES (?, ?, ?, ?)");
            $stmt->bind_param("ssss", $serial, $name, $roll, $class);
            
            if ($stmt->execute()) {
                $msg = "Success! Ticket <strong>$serial</strong> assigned to <strong>$name</strong>.";
                $msgType = "success";
            } else {
                $msg = "Database Error.";
                $msgType = "danger";
            }
            $stmt->close();
        }
        $checkStmt->close();
    }
}
?>

<div class="row justify-content-center">
    <div class="col-lg-6 col-md-8">
        <div class="card shadow-lg border-0">
            <div class="card-header bg-white text-center py-4 border-bottom-0">
                <div class="mb-3 d-flex justify-content-center">
                    <span class="bg-primary bg-opacity-10 text-primary rounded-circle d-flex align-items-center justify-content-center" style="width: 70px; height: 70px;">
                        <i class="bi bi-person-plus-fill" style="font-size: 2rem;"></i>
                    </span>
                </div>
                <h4 class="mb-1 fw-bold">Issue New Ticket</h4>
                <p class="text-muted small">Bind a physical ticket to a student record</p>
            </div>
            
            <div class="card-body p-4 pt-0">
                <?php if($msg): ?>
                    <div class="alert alert-<?php echo $msgType; ?> alert-dismissible fade show shadow-sm border-0">
                        <?php if($msgType == 'success'): ?><i class="bi bi-check-circle-fill me-2"></i><?php endif; ?>
                        <?php echo $msg; ?>
                        <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                    </div>
                <?php endif; ?>

                <form method="POST" action="">
                    <div class="mb-4">
                        <label class="form-label small text-uppercase fw-bold text-muted ls-1">Ticket Serial Number</label>
                        <div class="input-group">
                            <span class="input-group-text bg-light"><i class="bi bi-upc"></i></span>
                            <input type="text" name="serial" class="form-control form-control-lg font-monospace" placeholder="e.g. 0000001" required autofocus style="letter-spacing: 2px; font-weight: bold;">
                        </div>
                    </div>
                    
                    <div class="row g-2 align-items-center mb-4">
                        <div class="col">
                            <hr class="text-muted opacity-25">
                        </div>
                        <div class="col-auto text-muted small text-uppercase">Student Details</div>
                        <div class="col">
                            <hr class="text-muted opacity-25">
                        </div>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">Full Name</label>
                        <input type="text" name="name" class="form-control" placeholder="Student Name" required>
                    </div>
                    
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label">Roll No</label>
                            <input type="text" name="roll" class="form-control" placeholder="Reg Number" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Class/Section</label>
                            <select name="class" class="form-select" required>
                                <option value="">Select Class...</option>
                                <option>BS 2nd Morning</option>
                                <option>BS 2nd Evening</option>
                                <option>BS 4th Morning A</option>
                                <option>BS 4th Morning B</option>
                                <option>BS 4th Evening A</option>
                                <option>BS 4th Evening B</option>
                                <option>BS 6th Morning Regular</option>
                                <option>BS 6th Evening Regular</option>
                                <option>BS 6th Morning Shifted</option>
                                <option>BS 6th Evening Shifted</option>
                                <option>BS 8th Morning Regular</option>
                                <option>BS 8th Evening Regular</option>
                                <option>BS 8th Morning Shifted</option>
                                <option>BS 8th Evening Shifted</option>
                                <option>BS 8th Bridging A</option>
                                <option>BS 8th Bridging B</option>
                                <option>MS Students</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="d-grid mt-4">
                        <button type="submit" class="btn btn-primary btn-lg rounded-pill shadow-sm">
                            <i class="bi bi-save me-2"></i> Register Student
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<?php include 'includes/footer.php'; ?>