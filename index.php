<?php
// Start session
session_start();

// Base path definition
define('BASE_PATH', __DIR__);

// Core includes
require_once BASE_PATH . '/config/db.php';
require_once BASE_PATH . '/includes/auth_check.php';
require_once BASE_PATH . '/includes/header.php';

// Simple router using ?page=
$page = $_GET['page'] ?? 'dashboard';

$routes = [
    'dashboard'     => 'patients/dashboard.php',
    'patients'      => 'patients/index.php',
    'consultations' => 'consultations/index.php',
    'prenatal'      => 'prenatal/index.php',
    'postpartum'    => 'postpartum/index.php',
    'immunization'  => 'immunization/index.php',
    'users'         => 'users/index.php',
];

if (array_key_exists($page, $routes)) {
    $file = BASE_PATH . '/' . $routes[$page];
    if (file_exists($file)) {
        require $file;
    } else {
        echo "<h3>Module file not found.</h3>";
    }
} else {
    echo "<h3>404 - Page not found</h3>";
}

// Footer
require_once BASE_PATH . '/includes/footer.php';
