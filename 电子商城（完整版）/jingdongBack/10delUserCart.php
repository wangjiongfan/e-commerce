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
	
	$conn = @mysqli_connect($servername,$username,$password,$dbname);
	$sql = "DELETE FROM usercart WHERE Id=".$Id;

	$res = mysqli_query($conn,$sql);
	
	if($res){
		echo json_encode(array('code' => '1000','msg' => '删除成功'));
	}else{
		echo json_encode(array('code' => '2001','msg' => '删除失败'));
	}

?>