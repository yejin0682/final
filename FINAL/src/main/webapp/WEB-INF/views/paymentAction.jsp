<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<script>
</script>
<style>
	th{
		padding: 5px;
	}
	td{
		padding: 5px;
	}
</style>
<body>
<button id="menuBtn" onclick="location.href='./main'">메인화면</button>
<div style="margin-top: 10%; margin-left: 35%; display: flex; width: 1300px;">
	
	<div style="width: 450px;">
	<h1 style="width: 450px;">결제완료가 완료되었습니다.</h1>
	<h2 style="width: 300px; height: 250px;">
		  <c:if test="${vo.image ne null}">
		   		<img src="${vo.image}" style="width: 300px; height: 400px;"/>
		   </c:if>
		   <c:if test="${vo.image eq null }">
			        <c:choose>
			            <c:when test="${vo.img1 ne '(이름없음)' }">
			            	<img src="resources/images/${vo.img1 }"  style="width: 300px; height: 400px;"/>
			            </c:when>
			            <c:otherwise>
			            	<img src="resources/images/${vo.img2 }"  style="width: 300px; height: 400px;"/>
			            </c:otherwise>
			        </c:choose>
		        <br/>
		   </c:if>
	
	</h2>
	</div>
	<div>
	<table style=" text-align: center; margin-top: 100px;">
	<tr>
	<th colspan="2" style="font-size: 18px;">결제정보</th>
	</tr>
	<tr>
	<td>가격</td><td>${map.amount}원</td>
	</tr>
	<tr>
	<td>결제코드</td> <td>${map.apply_num}</td>
	</tr>
	<tr>
	<td>이메일</td> <td>${map.buyer_email}</td>
	</tr>
	<tr>
	<td>이름</td>	 <td>${map.buyer_name}</td>
	</tr>
	<tr>
	<td>우편번호</td> <td>${map.buyer_postcode}</td>
	</tr>
	<tr>
	<td>주소</td><td>${map.buyer_addr}</td>
	</tr>
	<tr>
	<td>전화번호</td> <td>${map.buyer_tel}</td>
	</tr>
	<tr>
	<td>카드</td> <td>${map.card_name} ${map.card_number}</td>
	</tr>
	</table>
	</div>
</div>
</body>
</html>