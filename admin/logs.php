<?php
include '../config/db.php';
include '../includes/admin_header.php';

$logs = $conn->query("SELECT * FROM audit_logs ORDER BY created_at DESC LIMIT 100");
?>

<div class="d-flex justify-content-between align-items-center mb-4">
    <h3 class="fw-bold text-dark"><i class="bi bi-shield-lock text-danger"></i> Audit Logs</h3>
    <span class="badge bg-secondary">Last 100 Actions</span>
</div>

<div class="card shadow border-0">
    <div class="card-body p-0">
        <div class="table-responsive">
            <table class="table table-striped table-hover mb-0">
                <thead class="table-dark">
                    <tr>
                        <th class="ps-3">Time</th>
                        <th>Admin</th>
                        <th>Action</th>
                        <th>Target Serial</th>
                        <th>Details</th>
                        <th>IP</th>
                    </tr>
                </thead>
                <tbody>
                    <?php while($row = $logs->fetch_assoc()): 
                        $badge = 'secondary';
                        if($row['action_type'] == 'CREATE') $badge = 'success';
                        if($row['action_type'] == 'UPDATE') $badge = 'primary';
                        if($row['action_type'] == 'DELETE') $badge = 'danger';
                    ?>
                    <tr>
                        <td class="ps-3 text-muted small"><?php echo $row['created_at']; ?></td>
                        <td class="fw-bold"><?php echo htmlspecialchars($row['admin_username']); ?></td>
                        <td><span class="badge bg-<?php echo $badge; ?>"><?php echo $row['action_type']; ?></span></td>
                        <td class="font-monospace text-primary"><?php echo $row['target_ticket_serial']; ?></td>
                        <td><?php echo htmlspecialchars($row['details']); ?></td>
                        <td class="small text-muted"><?php echo $row['ip_address']; ?></td>
                    </tr>
                    <?php endwhile; ?>
                </tbody>
            </table>
        </div>
    </div>
</div>
<?php include '../includes/footer.php'; ?>