<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: *");
//http://localhost/assignment_web/downloadData.php
    function downloadData (){
        include('db.php');
        //make sure data won't be duplicated for each download ;
        $sql = "DELETE FROM `government_data`";
        mysqli_query($conn,$sql);
        //download start here
        $url = "https://www.lcsd.gov.hk/datagovhk/facility/facility-bbqs.json";
        $json = file_get_contents($url);
        $json_data = json_decode($json, true);
        $keysql = "INSERT INTO `government_data`(`District_en`, `District_cn`, `Name_en`, `Name_cn`, `Address_en`, `Address_cn`, `GIHS`, `Facilities_en`, `Facilities_b5`, `Ancillary_facilities_en`, `Ancillary_facilities_cn`, `Opening_hours_en`, `Opening_hours_cn`, `Phone`, `Remarks_en`, `Remarks_cn`, `Longitude`, `Latitude`) VALUES (";
        $count = 0 ;
        foreach($json_data as $rows){
            $valuesql = "" ; 
            foreach($rows as $key => $value){
                $valuesql = $valuesql."'".$value."'," ; 
            }
            $valuesql = rtrim($valuesql,", ");
            $sql = $keysql.$valuesql.")" ;
            $result = $conn->query($sql);
            $count++ ;
        }
        if($result){
            echo "data downloaded totally '$count' items" ;
        }else{
            $arr = array();
            $arr["status"] = "error";
            $arr["errcode"] = "201";
            $arr["errmsg"] = "SQL failed, cannot insert downloaded data to database ";
            echo json_encode($arr);
            exit;
        }
    }
    downloadData();
?>