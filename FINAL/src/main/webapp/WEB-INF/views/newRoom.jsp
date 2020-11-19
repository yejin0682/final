<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
	${form.name}
	<form action="room/new">
		방제목<input type="text" name="name" value="${member.ID }의 채팅방"/>
		<input type="submit" value="방생성"/>
	</form>
</body>
</html>