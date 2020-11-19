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
	#dealtable{
		width: 1000px;
		margin-left: 300px;		
		text-align: center;
		
	}
	th{
		border-bottom: 1px solid #cccccc;
	}
	td{
		border-bottom: 1px solid #cccccc;
		padding: 10px;
	}
</style>
</head>
<body>
	<div id="container" style="margin-top: 200px; margin-left: 30%;">
	
<h2>--판매--</h2><br/>
		<table id="salestable">
			<tr>
				<th>번호</th>
				<th>상품이름</th>
				<th>구매자</th>
				<th>가격</th>
				<th>날짜</th>
			</tr>
		<c:forEach var="sales" items="${sales }">
			<tr>
				<td>${sales.pno }</td>
				<td>${sales.pname }</td>
				<td>${sales.ID }</td>
				<td>${sales.bestmoney }</td>
				<td>${sales.buydate }</td>
			</tr>
		</c:forEach>
		</table>
<br/>
<h2>--구매--</h2>
<br/>
		<table id="purchasetable">
			<tr>
				<th>번호</th>
				<th>상품이름</th>
				<th>판매자</th>
				<th>가격</th>
				<th>날짜</th>
			</tr>
		<c:forEach var="purchase" items="${purchase }">
			<tr>
				<td>${purchase.idx }</td>
				<td>${purchase.pname }</td>
				<td>${purchase.ID }</td>
				<td>${purchase.myprice }</td>
				<td>${purchase.buydate }</td>
			</tr>
		</c:forEach>
		</table>
	</div>
</body>
</html>