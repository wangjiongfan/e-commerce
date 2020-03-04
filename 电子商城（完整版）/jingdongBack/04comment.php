<?php
	header("content-Type:application/json;charset=UTF-8");
	header("Access-control-Allow-Origin:*");//解决跨域问题
	header("Access-control-Allow-Headers:Content-Type, Content-Length, Authorization, Accept, X-Requested-With , yourHeaderFeild");
	header("Access-control-Allow-Methods:GET,POST");
	
	
	$servername = "localhost";
	$username = "root";
	$password = "root";
	$dbname = "test";
	
	$pid = isset($_REQUEST['pid']) ? $_REQUEST['pid'] : '';
	
	$conn = @mysqli_connect($servername,$username,$password,$dbname);
	
	if(!$conn){//判断是否连接成功
		die("Connection failed: ".mysqli_connect_error());
	}
	
	$sql = "SELECT comment.Id,comment.pid,comment.uid,comment.commentary,comment.reply,comment.replayId,comment.replayTid,user.name,user.src FROM `comment` inner join `user` on comment.uid=user.Id WHERE comment.pid=".$pid;
	
	$res = mysqli_query($conn,$sql);
	$i = 0;
	$dat = [];
	// echo $sql;
	if(mysqli_num_rows($res) > 0){//mysqli_num_rows表示查询括号里的对象有几条数据
		while($row = mysqli_fetch_array($res,MYSQLI_ASSOC)){//表示查询遍历对象$res,第二个参数MYSQLI_ASSOC表示将$res变换成关联数组(js中的对象),不加的话就是数字数组和关联数组各返回一次(默认MYSQLI_BOTH).  MYSQLI_NUM表示将$res变换成数字数组
			$dat[$i] = $row;
			$i++;
		}
	}else{
		die(json_encode(array('code'=>'2001','msg'=>'系统异常')));
	}
	
	echo json_encode(array('code'=>'1000','msg'=>'success','data'=>$dat));
?>