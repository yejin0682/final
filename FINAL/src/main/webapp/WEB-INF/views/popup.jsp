<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		function popup(){
				var url = "chatting2/";
				var name = "chatting popup";
				var option = "width = 450, height = 570, top = 400, left = 400, location = no"
				window.open(url, name, option);
			}
	</script>
	<a href=" javascript:popup()">팝업</a>
</body>
</html>