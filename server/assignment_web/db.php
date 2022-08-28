<?php
$server ="localhost";
$dbuser ="root";
$dbpassword ="";
$dbname ="assignment_web";
$conn = new mysqli($server,$dbuser,$dbpassword,$dbname);
if($conn->connect_error){
    //assignmetn json , status failed reason unable to connect 
    $arr = array();
    $arr["status"] = "error";
    $arr["errcode"] = "200";
    $arr["errmsg"] = "Failed to connect database";
    echo json_encode($arr);
    //die close programe
    die("database failed");
}
?>