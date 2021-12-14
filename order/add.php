<?php
require_once '../functions.php';
require_once '../headers.php';

//read input as json
$input = json_decode(file_get_contents('php://input'));
$fname = filter_var($input->firstname,FILTER_SANITIZE_STRING);
$lname = filter_var($input->lastname,FILTER_SANITIZE_STRING);
$address = filter_var($input->address,FILTER_SANITIZE_STRING);
$zip = filter_var($input->zip,FILTER_SANITIZE_STRING);
$city = filter_var($input->city,FILTER_SANITIZE_STRING);
$cart = $input->cart;

$db = null; //declare and initialize variable for database connection

try {
    $db = getDbConnection(); //open database connection

    $db->beginTransaction(); //execute all database acrtions within transaction

    //insert customer
    $sql = "insert into customer (firstname, lastname, address, zip, city) values
    ('" .
        filter_var($fname,FILTER_SANITIZE_STRING) . "','" .
        filter_var($lname,FILTER_SANITIZE_STRING) . "','" .
        filter_var($address,FILTER_SANITIZE_STRING) . "','" .
        filter_var($zip,FILTER_SANITIZE_STRING) . "','" .
        filter_var($city,FILTER_SANITIZE_STRING)
        . "')";

        $customer_id = executeInsert($db, $sql);

        //insert order
        $sql = "insert into 'order' (customer_id) values ($customer_id)";
        $order_id = executeInsert($db, $sql);

        //insert order rows by looping trough cart (which is an array).
        foreach ($cart as $product) {
            $sql = "insert into order_row (order_id, product_id) values ("
            .
                $order_id . "," .
                $product->id
            . ")";
            executeInsert($db, $sql);
        }

        $db->commit(); //commit transaction

        header('HTTP/1.1 200 OK');
        $data = array('id' => $customer_id);
        echo json_encode($data);

}   catch (PDOException $pdoex) {
        $db->rollback(); //errrorr, rollback transactio
        returnError($pdoex);
    }
