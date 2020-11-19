<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search</title>
</head>
<style>
	img {
		width: 200px;
    	height: 200px;
	}
	li{
		display: inline-block;
		list-style: none;
	}
</style>
<body>
<div id="container" style="width: -webkit-fill-available; margin-top:200px">
	<form action="Search" style="margin-left: 35%;">
		<input name="keyword" value="${keyword}" style="width: 500px; height: 30px;"/>
		<input type="submit" value="조회" style="height: 30px; margin: 2px;"/>
	</form>
	<div style="width: 300px; height: 1000px; position: fixed;">
	<c:forEach var="category" items="${category}">
		<a href="showAuctionNormal?category=${category}">${category}</a><br/>
	</c:forEach>
	
	</div>
	<div style="width: 1100px; margin: 0 auto; ">
	<ul>
	<c:forEach var="vo" items="${list }">
	<li style="margin-top: 50px;">
	<div style="margin-left: 50px; width: 200px; display: block;" >
	<c:if test="${vo.image ne null }">
			<a href="showDetail?pno=${vo.pno }"><img src="${vo.image }"/></a>	
		</c:if>
		<c:if test="${vo.image eq null }">
			<a href="showDetail?pno=${vo.pno }">
			<c:choose>
				<c:when test="${vo.img1 ne '(이름없음)' }">
				<img src="resources/images/${vo.img1 }"/>
				</c:when>
				<c:otherwise>
				<img src="resources/images/${vo.img2 }"/>
				</c:otherwise>
			</c:choose>
			</a> <br/>
		</c:if>
	<div style="width :189.13px; height :21.6px;">
	<c:set var="name" value="${vo.pname }"/>
		<p><b><a href="showDetail?pno=${vo.pno }">
		<c:choose>
	        <c:when test="${fn:length(name) gt 13}">
	        	<c:out value="${fn:substring(name, 0, 12)}..."></c:out>
	        </c:when>
	        <c:otherwise>
	        	<c:out value="${vo.pname }"></c:out>
	        </c:otherwise>
		</c:choose>
		</a></b></p>
	</div>
	<c:set var="dead" value="${vo.deadlinedate }"/>
		<p>마감날: ${fn:substring(dead,0,10) } </p>
		조회수: ${vo.hitcount }<span>&nbsp</span><span>&nbsp</span>
		입찰수 ${vo.count }<br/></p>
	</div>
	</li>
	</c:forEach>
	</ul>
	</div>
</div>
</body>
</html>
<%@ include file="footer.jsp" %>	