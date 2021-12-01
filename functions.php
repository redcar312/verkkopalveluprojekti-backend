<?php

function getDbConnection(): object {
    $ini= parse_ini_file('../config.ini', true);

    $host= $ini['host'];
    $database = $ini['database'];
    $user= $ini['user'];
    $password = $ini['password'];
    $db = new PDO("mysql:host=$host;dbname=$database;charset=utf8;", $user, $password);
    $db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    return $db;
}

function selectAsJson(object $db, string $sql): void {
    $query = $db->query($sql);
    $results = $query->fetchAll(PDO::FETCH_ASSOC);
    header('HTTP/1.1 200 OK');
    echo json_encode($results);    
}

function executeInsert(object $db, string $sql): int {
    $query = $db->query($sql);
    return $db->lasInsertId();
}

function returnError(PDOException $pdoex): void {
    header('HTTP/1.1 500 Internal Server Error');
    $error = array('error' => $pdoex->getMessage());
    echo json_encode($error);
    exit;
}
function createTable(PDO $con){
    $sql = "CREATE TABLE IF NOT EXISTS user(
     firstname varchar(64) not null,
     lastname varchar(64) not null,
     username varchar(64) not null,
     password varchar(150) not null,
     PRIMARY KEY (username)
     foreign key(firstname) references category(customer)
     foreign key(lastname) references category(customer)
     )";
     try{ $con->exec($sql);

     }catch(PDOException $e){
        echo '<br>'.$e->getMessage();
    }
        
}

function checkUser(PDO $db, $uname, $passwd){
$uname = filter_var($uname, FILTER_SANITIZE_STRING);
$passwd = filter_var($passwd, FILTER_SANITIZE_STRING);
try{
    $sql = "SELECT password FROM user WHERE username=?";
    $prepare = $db->prepare($sql);
    $prepare->execute(array($uname));
    $rows = $prepare->fetchAll();

    foreach($rows as $row){
        $pw = $row["password"];
        if( password_verify($passwd, $pw) ){
            return true;
        }
    }
    return false;

}catch(PDOException $e){
    echo '<br>'.$e->getMessage();
}
}
function createUser(PDO $db, $fname, $lname, $uname, $passwd){
    $fname = filter_var($fname, FILTER_SANITIZE_STRING);
    $lname = filter_var($lname, FILTER_SANITIZE_STRING);
    $uname = filter_var($username, FILTER_SANITIZE_STRING);
    $passwd = filter_var($passwd, FILTER_SANITIZE_STRING);



    try{
        $hash_pw = password_hash($passwd, PASSWORD_DEFAULT);
        $sql = "INSERT IGNORE INTO user VALUES (?,?,?,?)"; 
        $prepare = $db->prepare($sql);
        $prepare->execute(array($fname, $lname, $uname, $hash_pw)); 
    }catch(PDOException $e){
        echo '<br>'.$e->getMessage();
    }
}
}



?>