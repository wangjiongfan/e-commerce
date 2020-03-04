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
	$uid = isset($_REQUEST['uid']) ? $_REQUEST['uid'] : '';
	$commentary = isset($_REQUEST['commentary']) ? $_REQUEST['commentary'] : '';
	$time = isset($_REQUEST['time']) ? $_REQUEST['time'] : '';
	$reply = isset($_REQUEST['reply']) ? $_REQUEST['reply'] : '';
	$replayId = isset($_REQUEST['replayId']) ? $_REQUEST['replayId'] : '';
	$replayTid = isset($_REQUEST['replayTid']) ? $_REQUEST['replayTid'] : '';

	
	
	$conn = @mysqli_connect($servername,$username,$password,$dbname);
	
	if(!$conn){//判断是否连接成功
		die("Connection failed: ".mysqli_connect_error());
	}
	
	$sql = "INSERT INTO `comment`(`pid`, `uid`,`commentary`, `time`, `reply`, `replayId`, `replayTid`) VALUES (".$pid.",".$uid.",'".$commentary."','".$time."',".$reply.",".$replayId.",".$replayTid.")";
	
	$res = mysqli_query($conn,$sql);
	// echo $sql;
	
	if($res){
		echo json_encode(array('code' => '1000','msg' => '加入成功'));
	}else{
		echo json_encode(array('code' => '2001','msg' => '加入失败'));
	}
?>