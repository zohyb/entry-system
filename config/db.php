<?php
/* config/db.php */
$host = 'localhost';
$user = 'root';
$pass = '';
$dbname = 'annual_dinner_db';

mysqli_report(MYSQLI_REPORT_OFF); // Turn off raw PHP warnings for DB

$conn = new mysqli($host, $user, $pass, $dbname);

if ($conn->connect_error) {
    // Log error internally in a real scenario
    die("<div style='padding:20px; text-align:center; font-family:sans-serif;'>
        <h2>System Temporarily Unavailable</h2>
        <p>Please contact the administrator.</p>
    </div>");
}
?>