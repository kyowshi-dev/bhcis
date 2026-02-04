<?php
session_start();
require_once __DIR__ . '/../config/db.php';
require_once __DIR__ . '/../includes/auth_check.php';

$stmt = $pdo->query("
    SELECT p.patient_id, p.first_name, p.last_name, p.middle_name, p.suffix, z.zone_number
    FROM patient p
    LEFT JOIN household h ON p.household_id = h.household_id
    LEFT JOIN zone z ON h.zone_id = z.zone_id
    ORDER BY p.last_name ASC
");
$patients = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html>
<head>
<title>Patients</title>
</head>
<body style="font-family:Arial;background:#f4f6f8;padding:20px;margin:0;">

<div style="max-width:1000px;margin:auto;">

<h2 style="color:#1e88e5;margin-top:0;">Patients</h2>

<a href="create.php"
   style="
    display:inline-block;
    margin-bottom:15px;
    padding:10px 16px;
    background:#1e88e5;
    color:#fff;
    text-decoration:none;
    border-radius:4px;
    font-weight:bold;
   ">
+ Register Patient
</a>

<table style="
    width:100%;
    border-collapse:collapse;
    background:#fff;
    box-shadow:0 2px 6px rgba(0,0,0,0.1);
">
<thead style="background:#e3f2fd;">
<tr>
    <th style="padding:12px;border:1px solid #ccc;">Name</th>
    <th style="padding:12px;border:1px solid #ccc;text-align:center;">Zone</th>
    <th style="padding:12px;border:1px solid #ccc;text-align:center;">Action</th>
</tr>
</thead>
<tbody>
<?php if (!$patients): ?>
<tr>
<td colspan="3" style="padding:15px;text-align:center;color:#777;">No patients found.</td>
</tr>
<?php else: foreach ($patients as $row): ?>
<tr>
<td style="padding:10px;border:1px solid #ddd;">
<?= htmlspecialchars(
    $row['last_name'] . ', ' . $row['first_name'] .
    ($row['middle_name'] ? ' ' . $row['middle_name'] : '') .
    ($row['suffix'] ? ', ' . $row['suffix'] : '')
) ?>
</td>
<td style="padding:10px;border:1px solid #ddd;text-align:center;">
<?= htmlspecialchars($row['zone_number'] ?? '—') ?>
</td>
<td style="padding:10px;border:1px solid #ddd;text-align:center;">
<a href="view.php?id=<?= $row['patient_id'] ?>"
   style="padding:6px 12px;background:#43a047;color:#fff;border-radius:3px;text-decoration:none;">
View
</a>
</td>
</tr>
<?php endforeach; endif; ?>
</tbody>
</table>

</div>
</body>
</html>
