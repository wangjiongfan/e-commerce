<?php
	header("content-Type:application/json;charset=UTF-8");
	header("Access-control-Allow-Origin:*");//解决跨域问题
	header("Access-control-Allow-Headers:Content-Type, Content-Length, Authorization, Accept, X-Requested-With , yourHeaderFeild");
	header("Access-control-Allow-Methods:GET,POST");
	
	
	$servername = "localhost";
	$username = "root";
	$password = "root";
	$dbname = "test";
	
	$uname = isset($_REQUEST['usname']) ? $_REQUEST['usname'] : 'none';
	$upwd = isset($_REQUEST['password']) ? $_REQUEST['password'] : 'none';
	
	//连接数据库 数据库的地址,数据库用户名,数据库密码,要连接的数据库名字
	$conn = @mysqli_connect($servername,$username,$password,$dbname);
	$sql = "SELECT * FROM `user` WHERE name='".$uname."' AND password='".$upwd."'";
	// echo $sql;
	//执行sql操作,在$conn数据库中,找到满足$sql条件的行
	$res = mysqli_query($conn,$sql);
	
	if(mysqli_num_rows($res) > 0){//mysqli_num_rows表示查询括号里的对象有几条数据
		$row = mysqli_fetch_array($res,MYSQLI_ASSOC);//表示查询遍历对象$res,第二个参数MYSQLI_ASSOC表示将$res变换成关联数组(js中的对象),不加的话就是数字数组和关联数组各返回一次(默认MYSQLI_BOTH).  MYSQLI_NUM表示将$res变换成数字数组
		// var_dump($row);
		//把字符串作为JSON格式返回(还是一个JSON样式的字符串)
		echo json_encode(array('code'=>'1000','msg'=>'success','list'=>$row));
	}else{
		echo json_encode(array('code'=>'2001','msg'=>'error'));
	}
	
	
	
?>