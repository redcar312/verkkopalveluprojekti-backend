<?php 
require_once '../headers.php';
require_once '../functions.php';

$json = json_decode(file_get_contents('php://input'));
$categoryname = filter_var($json->category, FILTER_SANITIZE_STRING);
try{
    $db = getDbConnection();
    $sql = "INSERT INTO category(name) VALUES('$categoryname')";

    $prepared=$db->prepare($sql);
    $prepared->execute();

    $results = $prepared->fetchAll(PDO::FETCH_ASSOC);
    $results = json_encode($results);
    echo $results;
} catch(PDOException $pdoex) {
    returnError($pdoex);
}