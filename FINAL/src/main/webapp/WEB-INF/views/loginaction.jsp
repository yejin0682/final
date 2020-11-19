<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="resources/js/jquery-3.5.1.min.js"></script>
<title>Insert title here</title>
<script>
opener.parent.location.reload();
	window.close();
</script>

</head>
<body>
	<c:if test="${member != null }">
		<div>
			<p>${member.ID }님 환영합니다.</p>
			<button id="memberUpdateBtn" type="button">회원정보수정</button>
			<input type = "submit" value = "게시글 작성"/>
		</div>
	</c:if>
	
</body>
</html>