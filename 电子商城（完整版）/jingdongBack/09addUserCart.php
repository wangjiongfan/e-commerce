<?php
	header("content-Type:application/json;charset=UTF-8");
	header("Access-control-Allow-Origin:*");//解决跨域问题
	header("Access-control-Allow-Methods:GET,POST");
	header("Access-control-Allow-Headers:Content-Type, Content-Length, Authorization, Accept, X-Requested-With , yourHeaderFeild");
	
	
	$servername = "localhost";
	$username = "root";
	$password = "root";
	$dbname = "test";
	
	$uid = isset($_GET['uid']) ? $_GET['uid'] : '';
	$pid = isset($_GET['pid']) ? $_GET['pid'] : '';
	$productDetail = isset($_GET['productDetail']) ? $_GET['productDetail'] : '';
	$count = isset($_GET['count']) ? $_GET['count'] : '';
	
	$conn = @mysqli_connect($servername,$username,$password,$dbname);
	$sql = "INSERT INTO `usercart`(`uid`, `pid`,`productDetail`, `count`) VALUES (".$uid.",".$pid.",'".$productDetail."',".$count.")";

	$res = mysqli_query($conn,$sql);
	
	if($res){
		echo json_encode(array('code' => '1000','msg' => '加入成功'));
	}else{
		echo json_encode(array('code' => '2001','msg' => '加入失败'));
	}

?>