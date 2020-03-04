<?php
	header("content-Type:application/json;charset=UTF-8");
	header("Access-control-Allow-Origin:*");//解决跨域问题
	header("Access-control-Allow-Headers:Content-Type, Content-Length, Authorization, Accept, X-Requested-With , yourHeaderFeild");
	header("Access-control-Allow-Methods:GET,POST");
	
	
	$servername = "localhost";
	$username = "root";
	$password = "root";
	$dbname = "test";
	
	$page = isset($_REQUEST['page']) ? $_REQUEST['page'] : '1';
	$pagesize = isset($_REQUEST['pagesize']) ? $_REQUEST['pagesize'] : '1';
	
	$conn = @mysqli_connect($servername,$username,$password,$dbname);
	
	if(!$conn){//判断是否连接成功
		die("Connection failed:".mysqli_connect_error());
	}
	
	$all = "SELECT count(*) as zongshu FROM `product`";
	
	$resall = mysqli_query($conn,$all);
	$total;
	
	if(mysqli_num_rows($resall) > 0){//mysqli_num_rows表示查询括号里的对象有几条数据
		while($row = mysqli_fetch_array($resall,MYSQLI_ASSOC)){
			$total = $row['zongshu'];
		}
	}else{
		die(json_encode(array('code'=>'2000','msg'=>'系统异常')));
	}
	
	$sql = "SELECT * FROM `product` LIMIT " .(($page - 1) * $pagesize). "," .$pagesize;//LIMIT表示范围限制,第一个数字表示从第几条开始,第二个数字表示往后数几条.
	
	$res = mysqli_query($conn,$sql);
	$i = 0;
	$dat = [];
	// echo $sql;
	if(mysqli_num_rows($res) > 0){//mysqli_num_rows表示查询括号里的对象有几条数据
		while($row = mysqli_fetch_array($res,MYSQLI_ASSOC)){
			$dat[$i] = $row;
			$i++;
		}
	}else{
		die(json_encode(array('code'=>'2001','msg'=>'系统异常')));
	}
	
	echo json_encode(array('code'=>'1000','msg'=>'success','data'=>$dat,'zongshu'=>$total));
?>