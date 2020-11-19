<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>문의게시판</title>
<style>
	form{
		display: inline;
	}
	
	table{
		margin: 0 auto;
		margin-top: 100px;
		width: 1000px;
		border-top: 1px solid black;
		text-align: center;
		
	}
	th{
		padding: 5px;
		border-bottom: 1px solid #cccccc;
		background-color: #cccccc;
	}
	td{
		padding: 10px;
		border-bottom: 1px solid #cccccc;
	}
	#number{
		margin-top: 40px;
		text-align: center;
	}
	.search2{
		padding-bottom: 50px;
		margin-left: 520px;
	}
	select{
		font-size: 15px;
		height: 25px;
	}
	a{
		text-decoration: none;
		color: black;
	}
	.wrapper-customer .wrap-aside {
    margin-top: 60px;
}
.wrap-aside .aside {
    float: left;
}
.wrap-aside{
	text-align: left;
}
.aside-customer {
    width: 158px;
}
.aside-customer .title {
    padding: 10px 20px 0;
    font-size: 23px;
    color: #fff;
    line-height: 90px;
    background-color: #222;
    font-family: 'ssgBan', sans-serif;
}
.aside{
	margin-left: 40px;
}
.aside-customer .wrap-link {
    padding: 0 10px;
    border: 1px solid #ddd;
}
.aside-customer .wrap-link .link:first-of-type {
    border-top: 0;
}
.aside-customer .wrap-link .link {
    display: block;
    padding: 0 5px;
    border-top: 1px solid #ddd;
    line-height: 50px;
}
</style>
</head>
<body>
<div style="margin-top: 200px;">
	<h2 style="text-align: center; font-size: 30px;">문의게시판</h2>
	<div class="wrap-aside" style="position: fixed;">
			<div class="aside aside-customer">
				<p class="title">고객센터</p>
				<div class="wrap-link" style="">
				<a href="notice?offset=0" class="link">공지사항</a>
				<a href="qnaBoard?offset=0" class="link">문의게시판</a>
				<a href="new?userId=${member.ID}&user=${member.name}&name=${member.ID}의 채팅방" class="link">채팅</a>
				</div>
			</div>
		</div>
	<c:choose>
	<c:when test="${endPage >0 }">
	<table>
		<tr>
			<th>글번호</th>
			<th>글제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
	<c:forEach var="qnaBoard" items="${qnaBoard}">
		<tr>
			<td>${qnaBoard.qbno}</td>
			<td><a href="qnaDetail?qbno=${qnaBoard.qbno}">${qnaBoard.title}</a></td>
			<td>${qnaBoard.ID}</td>
			<td>${qnaBoard.writedate}</td>
			<td>${qnaBoard.hitcount}</td>
		</tr>
	</c:forEach>
	</table>
	<div id="number">
		<c:if test="${sp ne 0 }">
			<!-- <a href="qnaBoard?offset=${offset-100}&keyword=${keyword}&searchMenu=${searchMenu}"><<</a> -->
			<form action="qnaBoard">
				<input type="submit" value="<<"/>
				<input type="hidden" value="${sp*100-100}" name="offset"/>
				<input type="hidden" value="${keyword}" name="keyword"/>
				<input type="hidden" value="${searchMenu}" name="searchMenu"/>
			</form>
		</c:if>	
		
	<c:forEach var="i" begin="${startPage}" end="${endPage}">
		<!-- <a href="qnaBoard?offset=${i*10}">${i+1}</a> -->
		<form action="qnaBoard">
			<c:choose>
				<c:when test="${(offset+10)/10 eq i}">
					<input type="submit" style= "font-weight:bold;" value="${i}"/>
				</c:when>
				<c:otherwise>
					<input type="submit" value="${i}"/>
				</c:otherwise>
			</c:choose>
			<input type="hidden" value="${i*10-10}" name="offset"/>
			<input type="hidden" value="${keyword}" name="keyword"/>
			<input type="hidden" value="${searchMenu}" name="searchMenu"/>
		</form>
	</c:forEach>
	
		<c:if test="${ps ne sp }">
			<form action="qnaBoard">
				<!--  <a href="qnaBoard?offset=${offset+100}&keyword=${keyword}&searchMenu=${searchMenu}">>></a>-->
				<input type="submit" value=">>"/>
				<input type="hidden" value="${sp*100+100}" name="offset"/>
				<input type="hidden" value="${keyword}" name="keyword"/>
				<input type="hidden" value="${searchMenu}" name="searchMenu"/>
			</form>
		</c:if>
	</div>
	</c:when>
	<c:otherwise>
		<table>
		<tr>
			<td>글번호</td>
			<td>글제목</td>
			<td>작성자</td>
			<td>날짜</td>
			<td>조회수</td>
		</tr>
		</table>
		찾으시는 게시글이 없습니다.
	</c:otherwise>
	</c:choose>
	<br/>
	<form action="qnaBoard" class="search2" style="margin-left: 38%">
		<select name="searchMenu">
			<option value="titleAndContent">제목+내용</option>	
			<option value="title" >제목</option>		
			<option value="content">내용</option>	
			<option value="writer">작성자</option>		
		</select>
		<input type="hidden" name="offset" value="0"/>
		<input name="keyword" value="${keyword}"/ style="width: 300px; font-size: 15px;">
		<input type="submit" value="조회"/>
	</form>
	<input style="float: right; margin-right: 50px;" type="button" value="문의글쓰기" onclick="location.href='qnaWrite'"/>
</div>
</body>
<%@ include file="footer.jsp" %>
</html>







