<?php
require_once '../headers.php';
require_once '../functions.php';

$search = $_GET['name'];
$search = filter_var($search, FILTER_SANITIZE_STRING);

try {
    $db = getDbConnection();

    selectAsJson($db, "SELECT name, price, image, info FROM product WHERE name LIKE '%$search%'");

} catch(PDOException $pdoex) {
    returnError($pdoex);
}