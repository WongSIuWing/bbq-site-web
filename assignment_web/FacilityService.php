<?php

include_once('RESTfulInterface.php');
class FacilityService implements RESTfulInterface {
    function fetchSQL($sql){
        include('db.php');
        if($result = $conn->query($sql)){
            $answer = array ();
            while($row = $result->fetch_assoc()){
                $answer[]=$row ;
            }
        echo json_encode($answer,JSON_FORCE_OBJECT);
        }else{
            //json error code and message 
            $arr = array();
            $arr["status"] = "error";
            $arr["errcode"] = "301";
            $arr["errmsg"] = "SQL failed to execute and get data specified in request .";
            echo json_encode($arr);
            exit;
        }
    }
	function restGet($urlSegments) {
        //shift out and return the first segment 
        //eg "all" ->$currentSeg
        $currentSeg = array_shift($urlSegments);
        if($currentSeg==="all"){
            $sql = "SELECT * FROM government_data";
            $this->fetchSQL($sql);
        }
        else if($currentSeg==="district"){
            $currentSeg = array_shift($urlSegments);
            //$sql = "SELECT * FROM `government_data` WHERE `District_en` = '".$currentSeg."' ";
            $sql = "SELECT * FROM `government_data` WHERE `District_en` LIKE '%".$currentSeg."%'";
            $this->fetchSQL($sql);
        }
        else if($currentSeg==="name"){
            $currentSeg = array_shift($urlSegments);
            $currentSeg= str_replace("'","&apos;",$currentSeg);
            //$sql = "SELECT * FROM `government_data` WHERE `Name_en` = '".$currentSeg."' ";
            $sql = "SELECT * FROM `government_data` WHERE `Name_en` LIKE '%".$currentSeg."%'";
            $this->fetchSQL($sql);
        }else if($currentSeg==="any"){
            $currentSeg = array_shift($urlSegments);
            $sql = "SELECT * FROM `government_data` WHERE concat(`District_en`,`Name_en`,`Address_en`,`Facilities_en`,`Remarks_en`,`Ancillary_facilities_en`) LIKE '%".$currentSeg."%'";
            //$sql = "SELECT * FROM `government_data` WHERE `Name_en` = '".$currentSeg."' ";
            $this->fetchSQL($sql);
        }else if($currentSeg==="both"){
            $currentSeg = array_shift($urlSegments);
            //$sql = "SELECT * FROM `government_data` WHERE `Name_en` = '".$currentSeg."' ";
            $sql = "SELECT * FROM `government_data` WHERE concat(`Name_en`,`District_en`) LIKE '%".$currentSeg."%'";
            $this->fetchSQL($sql);
        }else{
            $arr = array();
            $arr["status"] = "error";
            $arr["errcode"] = "300";
            $arr["errmsg"] = "The required get service do not exist";
            echo json_encode($arr);
            exit;
        }
    }
    // /name/[name]/new/[name]
	function restPut($urlSegments) {
        $currentSeg = array_shift($urlSegments);
        if($currentSeg=="name"){
            $oldName = array_shift($urlSegments);
            $currentSeg = array_shift($urlSegments);
            if($currentSeg=="new"){
                $newName = array_shift($urlSegments);
                $sql = "UPDATE `government_data` SET `Name_en`='".$newName."' WHERE `Name_en`='".$oldName."'" ; 
                include('db.php');
                if($conn->query($sql)){
                    echo "updated" ;
                }
                else{ 
                    $arr = array();
                    $arr["status"] = "error";
                    $arr["errcode"] = "311";
                    $arr["errmsg"] = "SQL failed, cannot update new name";
                    echo json_encode($arr);
                    exit;
                }
            }else{
                $this->wrongPutUrl();
                exit;
            }
        }else{
            $this->wrongPutUrl();
            exit;
        }
	}
    function wrongPutUrl (){
        $arr = array();
        $arr["status"] = "error";
        $arr["errcode"] = "310";
        $arr["errmsg"] = "The required put service do not exist";
        echo json_encode($arr);
    }
    /* /District_en/Name_en/
    /Address_en/Facilities_en/
    Ancillary_facilities_en/Opening_hours_en/
    Phone/Remarks_en*/
	function restPost($urlSegments) {
        $district = array_shift($urlSegments);
        $name = array_shift($urlSegments);
        $address = array_shift($urlSegments);
        $facilities = array_shift($urlSegments);
        $af  = array_shift($urlSegments);
        $openHour = array_shift($urlSegments);
        $phone = array_shift($urlSegments);
        $remark = array_shift($urlSegments);
        $sql = "INSERT INTO `government_data`(`District_en`, `Name_en`,`Address_en`, `Facilities_en`, `Ancillary_facilities_en`, `Opening_hours_en`, `Phone`, `Remarks_en`)"
                ."VALUES ('$district','$name','$address ','$facilities','$af','$openHour','$phone','$remark')" ;
        include('db.php');
        if($conn->query($sql)){
            echo "success post" ; 
        }else{
            $arr = array();
            $arr["status"] = "error";
            $arr["errcode"] = "320";
            $arr["errmsg"] = "SQL failed, cannot post data";
            echo json_encode($arr);
            exit;
        }
	}
    // /name/Wang Toi Shan Playground
	function restDelete($urlSegments) {
        $currentSeg = array_shift($urlSegments);
        //target/view/view/view_value;
        if($currentSeg=="name"){
            include('db.php');
            $currentSeg = array_shift($urlSegments);
            $currentSeg= str_replace("'","&apos;",$currentSeg);
            $sql = "DELETE FROM `government_data` WHERE `Name_en` = '".$currentSeg."' ";
            if($conn->query($sql)){
                echo "deleted" ;
            }else{
                $arr = array();
                $arr["status"] = "error";
                $arr["errcode"] = "331";
                $arr["errmsg"] = "SQL failed , cannot delete data";
                echo json_encode($arr);
                exit;
            }
        }else{
            //json error code and message 
            $arr = array();
            $arr["status"] = "error";
            $arr["errcode"] = "330";
            $arr["errmsg"] = "The required delete service do not exist";
            echo json_encode($arr);
            exit;
        }
	}
}
?>