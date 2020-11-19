<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script>
	$(document).ready(function() {
		$("#spreadBtn01").click(function() {
			if ($("#hiddenFAQ01").is(":visible")) {
				$("#hiddenFAQ01").slideUp();
			} else {
				$("#hiddenFAQ01").slideDown();
			}
		});
	});
	$(document).ready(function() {
		$("#spreadBtn02").click(function() {
			if ($("#hiddenFAQ02").is(":visible")) {
				$("#hiddenFAQ02").slideUp();
			} else {
				$("#hiddenFAQ02").slideDown();
			}
		});
	});
</script>
</head>
<body>
	<div class="content">
		<%@ include file="aside.jsp"%>
		<main class="cs_main">
			<div class="cs_main_faq faq" id="faq_list">
				<section class="content_header">
					<h3>자주 찾는 질문</h3>
				</section>
				<div id="faq-wrap">
					<div id="spreadBtn01" class="btn">오프라인 스토어의 운영 시간은 어떻게 되나요?</div>
					<hr>
					<div id="hiddenFAQ01" class="faq-con" style="display: none;">
						<p>안녕하세요 고객님, 담당자입니다. 운영 시간은 월요일~일요일 10:30~19:00입니다.</p>
					</div>
					<div id="spreadBtn02" class="btn">회원가입 시 어떠한 혜택이 있나요?</div>
					<hr>
					<div id="hiddenFAQ02" class="faq-con" style="display: none;">
						<p>혜택을 받으실 수 있습니다.</p>
					</div>
				</div>
			</div>
		</main>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>