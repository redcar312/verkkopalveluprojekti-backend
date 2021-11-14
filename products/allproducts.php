<?php 
require_once '../headers.php';
require_once '../functions.php';

$url = parse_url(filter_input(INPUT_SERVER, 'PATH_INFO'), PHP_URL_PATH);
$parameters = explode('/', $url);
$category_id = $parameters[1];

try {
    $db = getDbConnection();
    selectAsJson($db, "select * from product where category_id = $category_id");
} catch (PDOException $pdoex) {
    returnError($pdoex);
}