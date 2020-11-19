<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
	#btn{
		float: right;
	}
</style>
</head>
<body>
	<div id="container" style="margin-left: 10%;">
		<div style="height: 100px; margin-right: 20px;">


			<a href="main"><button id="btn" style="height: 50px;" class="btn btn-secondary">메인화면</button></a>

		</div>	
			<div style="display: flex; margin-top: 200px; margin-left: 250px;">
				<div style="width: 200px; height: 200px; ">
					<h2 style="font-size: 35px;">고객관리</h2>
					<a href="admin/customer"><button style=" width: 70px; height: 40px; font-size: 18px;
					font-weight: 900; margin-left: 35px; margin-top: 50px;" class="btn btn-dark">이동</button></a>
				</div>
				<div style="width: 200px; height: 200px; margin-left: 250px;">
					<h2 style="font-size: 35px;">상품관리</h2>
					<a href="admin/item?offset=0&admin=-1&deal=-1"><button style=" width: 70px; height: 40px; font-size: 18px;
					font-weight: 900; margin-left: 35px; margin-top: 50px;" class="btn btn-dark">이동</button></a>
				</div>
				<div style="width: 200px; height: 200px; margin-left: 250px;">
					<h2 style="font-size: 35px;">1대1 문의</h2>
					<a href="rooms"><button style=" width: 70px; height: 40px; font-size: 18px;
					font-weight: 900; margin-left: 35px; margin-top: 50px;" class="btn btn-dark">이동</button></a>
				</div>
		    </div>
	</div>
</body>
</html>