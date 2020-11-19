<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	var result = "${msg}";
	if(result == "regSuccess"){
		alert("게시들 등록이 되었습니다.");
	}
</script>
</head>
<body>
<%-- 	가입 완료 되었습니다.<br/>
	ID : ${mvo.ID } <br/>
	PW : ${mvo.PW } <br/>
	NAME : ${mvo.name } <br/> --%>
</body>
</html>