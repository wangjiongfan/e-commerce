<?php
	require '15tool.php';
	header("Access-control-Allow-Origin:*");//解决跨域问题
	header("Access-control-Allow-Headers:Content-Type, Content-Length, Authorization, Accept, X-Requested-With , yourHeaderFeild");
	header("Content-type: multipart/form-data");
	date_default_timezone_set("PRC");

	$servername = "localhost";
	$username = "root";
	$password = "root";
	$dbname = "test";
	
	$uid = $_POST['uid'];
	$conn = dbConnect($servername,$username,$password,$dbname);
	//获取文件扩展名
	$files= $_FILES["file"];
	$pathinfo = pathinfo($_FILES["file"]["name"]);
	$extension = $pathinfo["extension"];
	// 利用随机值、MD5、时间戳等方案生成一个唯一的文件名
	$fileName = md5(rand(1, 1000)).time().".".$extension;
	//移动临时文件到指定路径中
	$res = move_uploaded_file($_FILES['file']['tmp_name'], "../img/headImg/".$fileName);
		
	if ($res == 1) {
		$sql = "UPDATE user SET src='http://192.168.1.6/img/headImg/".$fileName."' WHERE Id=" .$uid; 
		$ress = mysqli_query($conn, $sql);		
		if ($ress) {
			echo "http://192.168.1.6/img/headImg/".$fileName;			
		}
	} else {
		echo $res;
	}
	
?>