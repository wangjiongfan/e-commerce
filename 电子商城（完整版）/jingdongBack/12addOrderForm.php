<?php
	header("content-Type:application/json;charset=UTF-8");
	header("Access-control-Allow-Origin:*");//解决跨域问题
	header("Access-control-Allow-Methods:GET,POST");
	header("Access-control-Allow-Headers:Content-Type, Content-Length, Authorization, Accept, X-Requested-With , yourHeaderFeild");
	
	
	$servername = "localhost";
	$username = "root";
	$password = "root";
	$dbname = "test";
	
	$Id = isset($_GET['Id']) ? $_GET['Id'] : '';
	$uid = isset($_GET['uid']) ? $_GET['uid'] : '';
	$pid = isset($_GET['pid']) ? $_GET['pid'] : '';
	$productDetail = isset($_GET['productDetail']) ? $_GET['productDetail'] : '';
	$count = isset($_GET['count']) ? $_GET['count'] : '';
	
	$conn = @mysqli_connect($servername,$username,$password,$dbname);
	$sql1 = "INSERT INTO `userorder` (`uid`, `pid`,`productDetail`, `count`) VALUES (".$uid.",".$pid.",'".$productDetail."',".$count.")";

	$res1 = mysqli_query($conn,$sql1);
	
	if($res1){
		echo json_encode(array('code' => '1000','msg' => 'userorder添加成功'));
	}else{
		echo json_encode(array('code' => '2001','msg' => 'userorder添加失败'));
	}
	$sql2 = "DELETE FROM `usercart2` WHERE Id=".$Id;
	$res2 = mysqli_query($conn,$sql2);
	if($res2){
		echo json_encode(array('code' => '1000','msg' => 'usercart2删除成功'));
	}else{
		echo json_encode(array('code' => '2001','msg' => 'usercart2删除失败'));
	}
?>
