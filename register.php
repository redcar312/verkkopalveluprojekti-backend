<?php
require_once '../inc/headers.php';
require_once '../inc/functions.php';


$json = json_decode(file_get_contents('php://input'));
$fname = filter_var( $json->fname, FILTER_SANITIZE_STRING);
$lname = filter_var( $json->$lname, FILTER_SANITIZE_STRING);
$uname = filter_var( $json->$uname, FILTER_SANITIZE_STRING);
$passwd = filter_var( $json->$passwd, FILTER_SANITIZE_STRING);  


try{
    $db = getDbConnection();
    $hash_pw = password_hash($passwd, PASSWORD_DEFAULT);
    $sql ="insert into kayttaja (firstname, lastname, username, password) values ('$fname','$lname','$uname','$hash_pw)"; 
   
   executeInsert($db,$sql);
} catch(PDOException $e) {
    echo '<br>'.$e->getMessage();}
    ?>