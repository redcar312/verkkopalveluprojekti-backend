<?php
require_once '../headers.php';
require_once '../functions.php';

try {
    $db = getDbConnection();
    selectAsJson($db, "SELECT * FROM product
                        ORDER BY RAND()
                        LIMIT 3;");
} catch(PDOException $pdoex) {
    returnError($pdoex);
}