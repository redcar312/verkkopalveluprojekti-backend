<?php
require_once '../headers.php';
require_once '../functions.php';

$search = $_POST['name'];

try {
    $db = getDbConnection();

    selectAsJson($db, "SELECT name, price, image FROM product WHERE name = '$search'");

} catch(PDOException $pdoex) {
    returnError($pdoex);
}