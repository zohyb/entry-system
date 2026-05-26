<?php 
include 'config/db.php';
include 'includes/header.php'; 

// Fetch Stats
$total_reg = $conn->query("SELECT COUNT(*) as c FROM tickets")->fetch_assoc()['c'];
$total_entered = $conn->query("SELECT COUNT(*) as c FROM tickets WHERE has_entered = 1")->fetch_assoc()['c'];
$pending = $total_reg - $total_entered;

// Fetch student lists
$allStudents = $conn->query("SELECT id, ticket_serial, student_name, roll_no, class_section FROM tickets ORDER BY CASE WHEN class_section LIKE '%MS%' THEN 1 ELSE 0 END, class_section ASC");
$enteredStudents = $conn->query("SELECT id, ticket_serial, student_name, roll_no, class_section FROM tickets WHERE has_entered = 1 ORDER BY CASE WHEN class_section LIKE '%MS%' THEN 1 ELSE 0 END, class_section ASC");
$pendingStudents = $conn->query("SELECT id, ticket_serial, student_name, roll_no, class_section FROM tickets WHERE has_entered = 0 ORDER BY CASE WHEN class_section LIKE '%MS%' THEN 1 ELSE 0 END, class_section ASC");

// Class-wise breakdown
$classSql = "SELECT class_section, 
            COUNT(*) as total, 
            SUM(CASE WHEN has_entered = 1 THEN 1 ELSE 0 END) as entered
            FROM tickets 
            GROUP BY class_section";
$classResult = $conn->query($classSql);
?>

<div class="d-flex justify-content-between align-items-center mb-4">
    <div>
        <h2 class="mb-1">Live Dashboard</h2>
        <p class="text-muted small mb-0">Real-time data stream</p>
    </div>
    <div class="btn-group">
        <button class="btn btn-light border" onclick="location.reload()"><i class="bi bi-arrow-clockwise"></i> Refresh</button>
    </div>
</div>

<div class="row g-4 mb-5">
    <div class="col-md-4">
        <button class="card stat-card-btn bg-tech-1 text-white p-4 w-100 h-100" data-bs-toggle="modal" data-bs-target="#allStudentsModal">
            <div class="d-flex justify-content-between align-items-start">
                <div>
                    <span class="d-block text-white-50 text-uppercase small fw-bold mb-1">Total Registered</span>
                    <h2 class="display-4 fw-bold mb-0"><?php echo $total_reg; ?></h2>
                </div>
                <i class="bi bi-people display-6 text-white-50"></i>
            </div>
            <div class="mt-3 small text-white-50">Click to view all records &rarr;</div>
        </button>
    </div>
    <div class="col-md-4">
        <button class="card stat-card-btn bg-tech-2 text-white p-4 w-100 h-100" data-bs-toggle="modal" data-bs-target="#enteredStudentsModal">
            <div class="d-flex justify-content-between align-items-start">
                <div>
                    <span class="d-block text-white-50 text-uppercase small fw-bold mb-1">Checked In</span>
                    <h2 class="display-4 fw-bold mb-0"><?php echo $total_entered; ?></h2>
                </div>
                <i class="bi bi-check-circle display-6 text-white-50"></i>
            </div>
             <div class="mt-3 small text-white-50">View active attendees &rarr;</div>
        </button>
    </div>
    <div class="col-md-4">
        <button class="card stat-card-btn bg-tech-3 text-white p-4 w-100 h-100" data-bs-toggle="modal" data-bs-target="#pendingStudentsModal">
            <div class="d-flex justify-content-between align-items-start">
                <div>
                    <span class="d-block text-white-50 text-uppercase small fw-bold mb-1">Pending Arrival</span>
                    <h2 class="display-4 fw-bold mb-0"><?php echo $pending; ?></h2>
                </div>
                <i class="bi bi-clock-history display-6 text-white-50"></i>
            </div>
             <div class="mt-3 small text-white-50">View pending list &rarr;</div>
        </button>
    </div>
</div>

<div class="card border-0 shadow-sm">
    <div class="card-header bg-white py-3">
        <h5 class="mb-0"><i class="bi bi-bar-chart-fill text-primary me-2"></i>Class Attendance Performance</h5>
    </div>
    <div class="card-body p-0">
        <div class="table-responsive">
            <table class="table table-hover align-middle mb-0">
                <thead class="table-dark">
                    <tr>
                        <th class="ps-4">Class / Section</th>
                        <th class="text-center">Allocation</th>
                        <th class="text-center">Present</th>
                        <th class="text-center">Absent</th>
                        <th class="text-end pe-4">Progress</th>
                    </tr>
                </thead>
                <tbody>
                    <?php while($row = $classResult->fetch_assoc()): 
                        $percent = ($row['total'] > 0) ? round(($row['entered'] / $row['total']) * 100, 1) : 0;
                        $barColor = ($percent > 80) ? 'bg-success' : (($percent > 50) ? 'bg-info' : 'bg-warning');
                    ?>
                    <tr>
                        <td class="ps-4 fw-bold text-primary"><?php echo htmlspecialchars($row['class_section']); ?></td>
                        <td class="text-center"><span class="badge bg-light text-dark border"><?php echo $row['total']; ?></span></td>
                        <td class="text-center text-success fw-bold"><?php echo $row['entered']; ?></td>
                        <td class="text-center text-muted"><?php echo $row['total'] - $row['entered']; ?></td>
                        <td class="text-end pe-4">
                            <div class="d-flex align-items-center justify-content-end gap-3">
                                <span class="small fw-bold text-muted" style="width: 40px"><?php echo $percent; ?>%</span>
                                <div class="progress" style="width: 100px; height: 8px; border-radius: 10px;">
                                    <div class="progress-bar <?php echo $barColor; ?>" style="width: <?php echo $percent; ?>%"></div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <?php endwhile; ?>
                </tbody>
            </table>
        </div>
    </div>
</div>

<div class="modal fade" id="allStudentsModal" tabindex="-1">
    <div class="modal-dialog modal-xl modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title">All Registered Students (<?php echo $total_reg; ?>)</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body p-0">
                <table class="table table-striped mb-0">
                    <thead class="table-light sticky-top">
                        <tr>
                            <th>Ticket Serial</th>
                            <th>Student Name</th>
                            <th>Roll No</th>
                            <th>Class</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php 
                        $allStudents->data_seek(0);
                        while($row = $allStudents->fetch_assoc()): 
                        ?>
                        <tr>
                            <td class="font-monospace text-primary"><?php echo htmlspecialchars($row['ticket_serial']); ?></td>
                            <td><?php echo htmlspecialchars($row['student_name']); ?></td>
                            <td><?php echo htmlspecialchars($row['roll_no']); ?></td>
                            <td><?php echo htmlspecialchars($row['class_section']); ?></td>
                        </tr>
                        <?php endwhile; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="enteredStudentsModal" tabindex="-1">
    <div class="modal-dialog modal-xl modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header bg-success text-white">
                <h5 class="modal-title">Checked-in Students (<?php echo $total_entered; ?>)</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body p-0">
                <table class="table table-striped mb-0">
                    <thead class="table-light sticky-top">
                        <tr>
                            <th>Ticket Serial</th>
                            <th>Student Name</th>
                            <th>Roll No</th>
                            <th>Class</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php 
                        $enteredStudents->data_seek(0);
                        while($row = $enteredStudents->fetch_assoc()): 
                        ?>
                        <tr>
                            <td class="font-monospace text-success"><?php echo htmlspecialchars($row['ticket_serial']); ?></td>
                            <td><?php echo htmlspecialchars($row['student_name']); ?></td>
                            <td><?php echo htmlspecialchars($row['roll_no']); ?></td>
                            <td><?php echo htmlspecialchars($row['class_section']); ?></td>
                        </tr>
                        <?php endwhile; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="pendingStudentsModal" tabindex="-1">
    <div class="modal-dialog modal-xl modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header bg-warning text-dark">
                <h5 class="modal-title">Pending Students (<?php echo $pending; ?>)</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body p-0">
                <table class="table table-striped mb-0">
                    <thead class="table-light sticky-top">
                        <tr>
                            <th>Ticket Serial</th>
                            <th>Student Name</th>
                            <th>Roll No</th>
                            <th>Class</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php 
                        $pendingStudents->data_seek(0);
                        while($row = $pendingStudents->fetch_assoc()): 
                        ?>
                        <tr>
                            <td class="font-monospace text-muted"><?php echo htmlspecialchars($row['ticket_serial']); ?></td>
                            <td><?php echo htmlspecialchars($row['student_name']); ?></td>
                            <td><?php echo htmlspecialchars($row['roll_no']); ?></td>
                            <td><?php echo htmlspecialchars($row['class_section']); ?></td>
                        </tr>
                        <?php endwhile; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<?php include 'includes/footer.php'; ?>