<?php 
include 'config/db.php';
include 'includes/header.php'; 

$student = null;
$error = "";
$success = "";

// Handle Authorization Action
if (isset($_POST['authorize_entry'])) {
    $ticket_id = $_POST['ticket_id'];
    $updateStmt = $conn->prepare("UPDATE tickets SET has_entered = 1, entry_time = NOW() WHERE id = ?");
    $updateStmt->bind_param("i", $ticket_id);
    if($updateStmt->execute()){
        $success = "Entry Authorized! Ticket Locked.";
    } else {
        $error = "System Error.";
    }
}

// Handle Search
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
            <h2 class="m-0"><i class="bi bi-shield-check text-primary"></i> Gate Control</h2>
            <span class="badge bg-light text-dark border"><i class="bi bi-broadcast"></i> System Live</span>
        </div>

        <div class="card mb-4 border-primary border-opacity-50" style="background: linear-gradient(to bottom, #fff, #f8faff);">
            <div class="card-body p-4">
                <form method="POST" action="entry.php">
                    <label class="form-label text-uppercase text-xs fw-bold text-muted ls-1">Scan Barcode / Enter Serial</label>
                    <div class="input-group input-group-lg">
                        <span class="input-group-text bg-white border-end-0"><i class="bi bi-upc-scan"></i></span>
                        <input type="text" name="serial" class="form-control border-start-0 ps-0" placeholder="Waiting for input..." value="<?php echo htmlspecialchars($search_serial); ?>" autofocus autocomplete="off">
                        <button class="btn btn-primary px-4" type="submit">VERIFY</button>
                    </div>
                </form>
            </div>
        </div>

        <?php if($error): ?>
            <div class="alert alert-danger d-flex align-items-center shadow-sm p-4 rounded-3 border-0 bg-danger text-white mb-4">
                <i class="bi bi-x-octagon-fill display-4 me-3"></i>
                <div>
                    <h4 class="alert-heading fw-bold mb-1">ACCESS DENIED</h4>
                    <p class="mb-0 opacity-75"><?php echo $error; ?></p>
                </div>
            </div>
        <?php endif; ?>

        <?php if($success): ?>
            <div class="alert alert-success d-flex align-items-center shadow-sm p-4 rounded-3 border-0 bg-success text-white mb-4">
                <i class="bi bi-check-circle-fill display-4 me-3"></i>
                <div>
                    <h4 class="alert-heading fw-bold mb-1">WELCOME</h4>
                    <p class="mb-0 opacity-75"><?php echo $success; ?></p>
                </div>
            </div>
        <?php endif; ?>

        <?php if($student && !$success): ?>
            <div class="card border-0 shadow-lg overflow-hidden">
                <div class="card-header text-center border-0 pt-4 pb-3" style="background: <?php echo ($student['has_entered'] == 1) ? '#ffe5e5' : '#e3fce3'; ?>">
                    <h5 class="text-uppercase small fw-bold text-muted ls-2 mb-2">Ticket Status</h5>
                    <?php if($student['has_entered'] == 1): ?>
                        <h2 class="text-danger fw-bold mb-0"><i class="bi bi-exclamation-triangle"></i> STUDENT ENTERED THE HALL</h2>
                        <div class="badge bg-danger mt-2">Entered: <?php echo $student['entry_time']; ?></div>
                    <?php else: ?>
                        <h2 class="text-success fw-bold mb-0"><i class="bi bi-patch-check"></i> VALID TICKET</h2>
                    <?php endif; ?>
                </div>

                <div class="card-body p-4 bg-white">
                    <div class="row g-3 mb-4">
                        <div class="col-4 text-muted small text-uppercase">Student Name</div>
                        <div class="col-8 fw-bold h5 text-dark"><?php echo htmlspecialchars($student['student_name']); ?></div>
                        
                        <div class="col-4 text-muted small text-uppercase">Roll Number</div>
                        <div class="col-8 fw-bold text-dark font-monospace"><?php echo htmlspecialchars($student['roll_no']); ?></div>
                        
                        <div class="col-4 text-muted small text-uppercase">Class Section</div>
                        <div class="col-8 text-primary"><?php echo htmlspecialchars($student['class_section']); ?></div>
                    </div>

                    <?php if($student['has_entered'] == 0): ?>
                        <div class="d-grid">
                            <form method="POST">
                                <input type="hidden" name="ticket_id" value="<?php echo $student['id']; ?>">
                                <input type="hidden" name="serial" value="<?php echo $student['ticket_serial']; ?>">
                                <button type="submit" name="authorize_entry" class="btn btn-success btn-lg py-3 rounded-pill fw-bold shadow-sm">
                                    <i class="bi bi-door-open-fill me-2"></i> AUTHORIZE ENTRY
                                </button>
                            </form>
                        </div>
                    <?php else: ?>
                        <div class="p-3 bg-light rounded text-center text-muted border border-dashed">
                            <i class="bi bi-lock-fill"></i> Entry capability locked.
                        </div>
                    <?php endif; ?>
                </div>
            </div>
        <?php endif; ?>
    </div>
</div>

<?php include 'includes/footer.php'; ?>