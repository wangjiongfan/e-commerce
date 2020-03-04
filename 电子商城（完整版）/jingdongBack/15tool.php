<?php
	header("Content-Type:html/text; CharSet=utf-8");
	header("Access-control-Allow-Origin:*");//解决跨域问题
	header("Access-control-Allow-Headers:Content-Type, Content-Length, Authorization, Accept, X-Requested-With , yourHeaderFeild");
	function dbConnect($servername,$username,$password,$dbname){
		$conn = @mysqli_connect($servername,$username,$password,$dbname);
		
		//	print_r($conn);
		//	echo "<br>";
		//判断连接是否成功
		if (!$conn) {
			// die("Connection failed: " . mysqli_connect_error());
			return null;
		} else {
		//		print_r("connent success!");
			return $conn;
		}
	}
?>