<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
</head>
<body>
<form action = "newPWaction" style="margin-top: 20%; margin-left: 35%;">
	<h1>새로운 비밀번호를 설정하세요</h1>
	<section id="container" style="margin-top: 100px; display: flex;">
		<div class="form-group has-feedback">
				<input type="hidden" value="${member.ID}" name="ID"/>
			<label class="control-label" for="pw" style="font-size: 20px;">패스워드</label> 
			<input class="form-control" type="password" id="pw" name="pw" style="width: 250px;"/>
		</div>
		<div class="form-group has-feedback" style="margin-left: 20px; margin-top: 5px;">
			<button class="btn btn-success" type="submit" id="submit">확인</button>
		</div>
	</section>
</form>
</body>
</html>