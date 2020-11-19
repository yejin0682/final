<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>문의글 쓰기</title>
<script src="//cdn.ckeditor.com/4.15.0/standard/ckeditor.js"></script>
<!-- <script type="text/javascript" src="/ckeditor/ckeditor.js"></script> -->
<style>
	.cke_chrome{
		width: 600px;
	}
	.writebtn{
		float: right;
	}
</style>
</head>
<body>
   <c:choose>
   <c:when test="${member.grade ne 'z' }">
   <form action="qnaWriteAction" style="margin-left: 35%; margin-top: 250px; font-size: 20px; width: 600px;">
   </c:when>
   <c:otherwise>
   <form action="noticeWrite" style="margin-left: 35%; margin-top:250px; font-size :20px">
   </c:otherwise>
   </c:choose>
      제목<br/>
      <input type="text" name="title" placeholder="제목을 입력하세요"/ style="width: 600px; font-size: 20px"><br/>
      내용<br/>
      <textarea rows="30" cols="30" id="content" name="content" placeholder="내용을 입력하세요" style="width: 500px;
      height: 300px; font-size: 20px;"></textarea><br/>
      <input type="text" name="ID" value="${member.ID}"/>
      <input type="submit" value="문의글쓰기"/ class="writebtn">
   </form>
</body>
<script>
   CKEDITOR.replace("content");
</script>
<%@ include file="footer.jsp" %>
</html>