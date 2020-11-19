<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<style>
	#name{
		margin-top: 8px;
		width: 200px;
		margin-bottom: 8px;
	}
	#email{
		margin-top: 8px;
		width: 200px;
	}
	#btn{
		margin-top: 20px;
		width: 70px;
		font-weight: 900;
		font-size: 20px; 
	}
	body{
		/*background-color: #F7F1E9;*/
	}
	#search{
		width: 550px;
		border: 1px solid #cccccc;
	}
</style>
</head>
<body>
	<form action = "PWfind" id="search" style="margin-left: 500px; margin-top: 100px; height: 500px;">
	<h1 style="margin-left: 150px; margin-top: 100px;">비밀번호 찾기</h1>
	<div style="margin-top: 20px;">
		<label style="margin-left: 150px;">이름</label> <br/>
		<input type="text" name="name" id="name" style="margin-left: 150px; width: 250px; height: 20px;"><br/>
		<label style="margin-left: 150px;">아이디</label><br/>
		<input type="text" name="ID" id="ID" style="margin-left: 150px; width: 250px; height: 20px;"><br/>
		<input type="submit" id="btn" value="확인" style="margin-left: 158px; width: 240px; height: 60px;
		background-color: #FFAC04;">
	</div>	
	</form>
</body>
</html>