<?php
	header("content-Type:application/json;charset=UTF-8");
	header("Access-control-Allow-Origin:*");//解决跨域问题
	header("Access-control-Allow-Headers:Content-Type, Content-Length, Authorization, Accept, X-Requested-With , yourHeaderFeild");
	header("Access-control-Allow-Methods:GET,POST");
	

	$servername = "localhost";
	$username = "root";
	$password = "root";
	$dbname = "test";
	
	$pid = isset($_REQUEST['id']) ? $_REQUEST['id'] : '';
	
	$conn = @mysqli_connect($servername,$username,$password,$dbname);
	
	if(!$conn){//判断是否连接成功
		die("Connection failed:".mysqli_connect_error());
	}
	
	$sql = "SELECT * FROM `product`  WHERE Id=".$pid;
	
	$res = mysqli_query($conn,$sql);
	$i = 0;
	$dat = [];
	
	if(mysqli_num_rows($res) > 0){//mysqli_num_rows表示查询括号里的对象有几条数据
		while($row = mysqli_fetch_array($res,MYSQLI_ASSOC)){
			$dat[$i] = $row;
			$i++;
		}
	}else{
		echo json_encode(array('code'=>'2001','msg'=>'系统异常'));
	}
	
	echo json_encode(array('code'=>'1000','msg'=>'success','data'=>$dat));
?>