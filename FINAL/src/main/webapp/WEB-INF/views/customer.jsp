<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<style>
	th{
		border: 1px solid #cccccc;
		background-color: #F9E198;
	}
	td{
		border: 1px solid #cccccc;
	}
	table{
		width: 1200px;
		margin-top: 150px;
		margin-left: 200px;
		font-size: 18px;
		text-align: center;
	}
	a{
		text-decoration: none;
	}
</style>
</head>
<body>
	<button id="menuBtn" onclick="location.href='../admin'">메뉴로</button>	
	<div id="container" style="margin-left: 10%;">
		<table>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>우편번호</th>
				<th>주소</th>
				<th>상세주소</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>생년월일</th>
				<th>api</th>
				<th>등급</th>
			</tr>
			<c:forEach var="list" items="${list }">
			<c:if test="${list.grade ne 'z' }">
			<tr>
				<td><a href="customer/info?id=${list.ID }" style="color: black;">${list.ID }</a></td>
				<td><a href="customer/info?id=${list.ID }" style="color: black;">${list.name }</a></td>
				<td>${list.zonecode }</td>
				<td>${list.addr }</td>
				<td>${list.addrdetail }</td>
				<td>${list.phonenum }</td>
				<td>${list.email }</td>
				<td>${list.birth }</td>
				<td>${list.api }</td>
				<td>${list.grade }</td>
			</tr>
			</c:if>
			</c:forEach>
		</table>
	</div>
</body>
</html>