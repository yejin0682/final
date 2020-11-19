<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
	<div class="content">
		<%@ include file="aside.jsp"%>
		<main>
			<section class="content_header no_border">
				<h3>문의게시판</h3>
				<small class="list_count"> 총 180개 </small>
			</section>
			<table class="item_list">
				<thead>
					<tr>
						<th class="classify">구분</th>
						<th class="subject">제목</th>
						<th class="date">등록일</th>
					</tr>
				</thead>
				<tbody id="notice_list">
					<tr class="top">
						<td class="classify">구분</td>
						<td class="title"><a href="상세정보">공지사항</a></td>
						<td class="date">2020.10.21</td>
					</tr>
				</tbody>
			</table>
			<div class="pagination"></div>
		</main>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>