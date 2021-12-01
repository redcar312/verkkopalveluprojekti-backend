<?php
require_once '../headers.php';
require_once '../functions.php';

try {
    $db = getDbConnection();
    $search = 'Mikroaaltouuni';

    $sql = "SELECT * FROM product WHERE name = :search";
    $prepared = $db->prepare($sql);
    $prepared->bindParam(':search', $search);

    $prepared->execute();

    foreach($prepared as $row) {
        echo $row['name'];
    }

} catch(PDOException $pdoex) {
    returnError($pdoex);
}