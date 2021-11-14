<?php
require_once './headers.php';
require_once './functions.php';

try {
    $db = getDbConnection();
    selectAsJson($db, 'select * from category');
} catch(PDOException $pdoex) {
    returnError($pdoex);
}