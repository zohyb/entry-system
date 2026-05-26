<?php
include '../config/db.php';
include '../includes/admin_header.php';

// --- DELETE LOGIC ---
if (isset($_POST['delete_id'])) {
    $id = intval($_POST['delete_id']);
    $serial = $_POST['del_serial'];
    
    // Log before delete
    $admin = $_SESSION['username'] ?? 'Admin';
    $logStmt = $conn->prepare("INSERT INTO audit_logs (admin_username, action_type, target_ticket_serial, details, ip_address) VALUES (?, 'DELETE', ?, 'Deleted student record', ?)");
    $ip = $_SERVER['REMOTE_ADDR'];
    $logStmt->bind_param("sss", $admin, $serial, $ip);
    $logStmt->execute();

    // Perform Delete
    $conn->query("DELETE FROM tickets WHERE id = $id");
    echo "<div class='alert alert-success'>Record deleted successfully.</div>";
}

// --- PAGINATION & SEARCH ---
$page = isset($_GET['page']) ? (int)$_GET['page'] : 1;
$limit = 20;
$offset = ($page - 1) * $limit;
$search = isset($_GET['search']) ? $conn->real_escape_string($_GET['search']) : '';

$where = "1";
if (!empty($search)) {
    $where = "(student_name LIKE '%$search%' OR ticket_serial LIKE '%$search%' OR roll_no LIKE '%$search%')";
}

// Count total for pagination
$total = $conn->query("SELECT COUNT(*) as c FROM tickets WHERE $where")->fetch_assoc()['c'];
$totalPages = ceil($total / $limit);

// Fetch Data
$sql = "SELECT * FROM tickets WHERE $where ORDER BY id DESC LIMIT $limit OFFSET $offset";
$result = $conn->query($sql);
?>

<div class="d-flex justify-content-between align-items-center mb-4">
    <h3 class="fw-bold text-dark"><i class="bi bi-list-task text-primary"></i> Student Database</h3>
    <a href="add_student.php" class="btn btn-primary"><i class="bi bi-plus-lg"></i> Add New Student</a>
</div>

<div class="card shadow-sm border-0 mb-4">
    <div class="card-body">
        <form method="GET" class="row g-2">
            <div class="col-md-10">
                <input type="text" name="search" class="form-control" placeholder="Search by Name, Roll No, or Ticket Serial..." value="<?php echo htmlspecialchars($search); ?>">
            </div>
            <div class="col-md-2">
                <button type="submit" class="btn btn-dark w-100">Search</button>
            </div>
        </form>
    </div>
</div>

<div class="card shadow border-0">
    <div class="card-body p-0">
        <div class="table-responsive">
            <table class="table table-hover align-middle mb-0">
                <thead class="table-dark">
                    <tr>
                        <th class="ps-3">Ticket Serial</th>
                        <th>Student Name</th>
                        <th>Roll No</th>
                        <th>Class / Section</th>
                        <th>Status</th>
                        <th class="text-end pe-3">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <?php if ($result->num_rows > 0): ?>
                        <?php while($row = $result->fetch_assoc()): ?>
                        <tr>
                            <td class="ps-3 font-monospace text-primary fw-bold"><?php echo htmlspecialchars($row['ticket_serial']); ?></td>
                            <td class="fw-bold"><?php echo htmlspecialchars($row['student_name']); ?></td>
                            <td><?php echo htmlspecialchars($row['roll_no']); ?></td>
                            <td><?php echo htmlspecialchars($row['class_section']); ?></td>
                            <td>
                                <?php if($row['has_entered']): ?>
                                    <span class="badge bg-success">Inside</span>
                                <?php else: ?>
                                    <span class="badge bg-secondary">Pending</span>
                                <?php endif; ?>
                            </td>
                            <td class="text-end pe-3">
                                <a href="edit_student.php?id=<?php echo $row['id']; ?>" class="btn btn-sm btn-outline-primary me-1"><i class="bi bi-pencil-fill"></i></a>
                                
                                <form method="POST" class="d-inline" onsubmit="return confirm('Permanently delete this student? This action is logged.');">
                                    <input type="hidden" name="delete_id" value="<?php echo $row['id']; ?>">
                                    <input type="hidden" name="del_serial" value="<?php echo $row['ticket_serial']; ?>">
                                    <button type="submit" class="btn btn-sm btn-outline-danger"><i class="bi bi-trash-fill"></i></button>
                                </form>
                            </td>
                        </tr>
                        <?php endwhile; ?>
                    <?php else: ?>
                        <tr><td colspan="6" class="text-center py-4 text-muted">No records found.</td></tr>
                    <?php endif; ?>
                </tbody>
            </table>
        </div>
    </div>
    
    <?php if($totalPages > 1): ?>
    <div class="card-footer bg-white d-flex justify-content-end py-3">
        <nav>
            <ul class="pagination mb-0">
                <?php for($i=1; $i<=$totalPages; $i++): ?>
                    <li class="page-item <?php echo ($i == $page) ? 'active' : ''; ?>">
                        <a class="page-link" href="?page=<?php echo $i; ?>&search=<?php echo urlencode($search); ?>"><?php echo $i; ?></a>
                    </li>
                <?php endfor; ?>
            </ul>
        </nav>
    </div>
    <?php endif; ?>
</div>

<?php include '../includes/footer.php'; ?>