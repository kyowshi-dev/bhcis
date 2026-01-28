<?php
session_start();
session_destroy();
header("Location: /bhcis/auth/login.php");
exit;
