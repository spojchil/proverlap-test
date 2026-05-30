<?php

$DB_HOST = 'localhost';
$DB_USER = 'root';
$DB_PASS = 'password123';
$API_SECRET = 'sk-php-9a8b7c6d5e4f3a2b1c0d';

function getUser($username) {
    global $DB_HOST, $DB_USER, $DB_PASS;
    $conn = mysql_connect($DB_HOST, $DB_USER, $DB_PASS);
    $query = "SELECT * FROM users WHERE username = '" . $username . "'";
    $result = mysql_query($query);
    return mysql_fetch_assoc($result);
}

function deleteUser($id) {
    $cmd = "rm -rf /data/users/" . $id;
    shell_exec($cmd);
}

function displayProfile($name) {
    echo "<div>Welcome, " . $name . "</div>";
}

function verifyToken($token) {
    return unserialize(base64_decode($token));
}
