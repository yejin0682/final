<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" pageEncoding="UTF-8"%>

<html>
<head>
	<title>ServiceCenter</title>
</head>
<body>
<input type="button" value="채팅" onclick="location.href='chatting'"/>
<input type="button" value="문의게시판" onclick="location.href='qnaBoard?offset=0'"/>
<input type="button" value="공지사항" onclick="location.href='notice?offset=0'"/>
<form action="new">
		방제목<input type="text" name="name" value="${member.ID }의 채팅방"/>
		<input type="submit" value="방생성"/>
</form>
</body>
<%@ include file="footer.jsp" %>
</html>