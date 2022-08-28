<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: *");
// http://localhost/rest/index.php/student/211234/atwd/49
//Download and update data for each rounds 

class Controller {
	private $urlSegments; //use this to store url parameters as array 
	private $serviceProvider;
	//construct controller object 
	function __construct() {
		//$_SERVER['PATH_INFO'] returns stuff after php file 
		//eg . /facility/all
		if (!isset($_SERVER['PATH_INFO']) or $_SERVER['PATH_INFO']=='/' ) {
			$arr = array();
			$arr["status"] = "error";
			$arr["errcode"] = "100";
			$arr["errmsg"] = "No path or no specified service";
			echo json_encode($arr);
			exit;
		}
		//parameters received , explode to array with ignoring /
		// eg "","facility","all"
		$this->urlSegments = explode('/', $_SERVER['PATH_INFO']);
		//shift out the blank data before / 
		// eg "facility","all"
		array_shift($this->urlSegments);
		//uppercase first char the  returned value urlSegments [0]
		// eg "Facility"->$resource,"all"
		$resource = ucfirst(array_shift($this->urlSegments)); 
		$serviceName = $resource.'Service';
		$serviceFilename = $resource.'Service'.'.php';
		if (file_exists($serviceFilename)) {
			//call service php file 
			require_once $serviceFilename;
			//initiate object serviceProvider from seviceName class 
			$this->serviceProvider = new $serviceName;
		} else {
			$arr = array();
			$arr["status"] = "error";
			$arr["errcode"] = "101";
			$arr["errmsg"] = "Service no found.";
			echo json_encode($arr);
			exit;
		}
	}
	
	function run() {
		//according to RESTfullinterface function name , default request method returns uc char
		$functionName = 'rest'.ucfirst(strtolower($_SERVER['REQUEST_METHOD']));
		//call object serviceProvider function 
		//eg . object FacilityService -> function restGet("all")
		$this->serviceProvider->$functionName($this->urlSegments);	
	}
}
//declare controller object and use function run  
//include ('downloadData.php');
//$tmp = downloadData();
$con = new Controller();
$con->run();
?>