<?php 
require_once '../headers.php';
require_once '../functions.php';

$json = json_decode(file_get_contents('php://input'));
$option = filter_var($json->option, FILTER_SANITIZE_NUMBER_INT);

try{
    $db=getDbConnection();

    $sql="DELETE FROM category WHERE id = $option";

    $prepare = $db->prepare($sql);
    $prepare->execute();

    echo "Kategoria poistettu";
}catch(PDOException $pdoex){
    returnError($pdoex);
}