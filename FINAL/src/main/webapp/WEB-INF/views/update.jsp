<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<title>회원가입</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				
				location.href = "/";
						    
			})
		
			$("#submit").on("click", function(){
				if($("#userPass").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userPass").focus();
					return false;
				}
				if($("#userName").val()==""){
					alert("성명을 입력해주세요.");
					$("#userName").focus();
					return false;
				}
			});
			
				
			
		})
	</script>
	<body>
		<section id="container">
			<form action="/memberupdateAction">
				<div class="form-group has-feedback">
					<label class="control-label" for="ID">아이디</label>
					<input class="form-control" type="text" id="ID" name="userId" value="${id}" readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="pw">패스워드</label>
					<input class="form-control" type="password" id="pw" name="pw" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="name">성명</label>
					<input class="form-control" type="text" id="name" name="name" value="${name}"/>
				</div>
				<div class="form-group has-feedback">
					<button class="btn btn-success" type="submit" id="submit">회원정보수정</button>
					<button class="cencle btn btn-danger" type="button">취소</button>
				</div>
			</form>
		</section>
		
	</body>
	
</html>
 