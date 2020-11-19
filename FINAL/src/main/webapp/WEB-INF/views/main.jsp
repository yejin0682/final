<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<style>
	img {
		width: 200px;
    	height: 200px;
	}
</style>
<body>
	<h3>인기순</h3>
	<c:forEach begin="0" end="4" var="showPop" items="${showPop }">
		<a href="showDetail?pno=${showPop.pno }"><img src="${showPop.image }"/></a>
	</c:forEach>
	
	<h3>시간촉박순</h3>
	<c:forEach var="showHurry" items="${showHurry }">
		<a href="showDetail?pno=${showHurry.pno }"><img src="${showHurry.image }"/></a>
	</c:forEach>
</body>
</html>


