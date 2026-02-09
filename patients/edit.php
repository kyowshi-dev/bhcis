<?php
session_start();
require_once __DIR__ . '/../config/db.php';

$patient_id = (int)($_GET['id'] ?? 0);

$stmt = $pdo->prepare("
SELECT p.*, h.household_contact, h.zone_id
FROM patient p
LEFT JOIN household h ON p.household_id = h.household_id
WHERE p.patient_id = ?
");
$stmt->execute([$patient_id]);
$patient = $stmt->fetch();
if (!$patient) die("Patient not found.");

$zones = $pdo->query("SELECT zone_id, zone_number FROM zone ORDER BY zone_number")->fetchAll();
?>

<div style="font-family:Arial;background:#f4f6f8;padding:20px;">
<div style="max-width:700px;margin:auto;background:#fff;padding:25px;border-radius:8px;">

<h2>Edit Patient</h2>

<form method="POST" action="update.php">
<input type="hidden" name="patient_id" value="<?= $patient_id ?>">

<label>Last Name</label>
<input name="last_name" value="<?= $patient['last_name'] ?>" required>

<label>First Name</label>
<input name="first_name" value="<?= $patient['first_name'] ?>" required>

<label>Middle Name</label>
<input name="middle_name" value="<?= $patient['middle_name'] ?>">

<label>Suffix</label>
<input name="suffix" value="<?= $patient['suffix'] ?>">

<label>Date of Birth</label>
<input type="date" name="date_of_birth" value="<?= $patient['date_of_birth'] ?>" required>

<label>Address</label>
<textarea name="residential_address"><?= $patient['residential_address'] ?></textarea>

<label>Zone</label>
<select name="zone_id" required>
<?php foreach ($zones as $z): ?>
<option value="<?= $z['zone_id'] ?>" <?= $patient['zone_id']==$z['zone_id']?'selected':'' ?>>
Zone <?= $z['zone_number'] ?>
</option>
<?php endforeach; ?>
</select>

<label>Household Contact</label>
<input name="household_contact" value="<?= $patient['household_contact'] ?>">

<br><br>
<button style="padding:10px 16px;background:#1e88e5;color:#fff;border:none;border-radius:4px;">
Update Patient
</button>
</form>
</div>
</div>
