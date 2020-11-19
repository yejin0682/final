<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- https://code.jquery.com/ui/ -->
  <script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>
  <link href="${pageContext.request.contextPath}/resources/css/jquery-ui-sunny.css" rel="stylesheet" type="text/css">
  <link href="${pageContext.request.contextPath}/resources/css/singup.css" rel="stylesheet" type="text/css">
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src='https://www.google.com/recaptcha/api.js'></script>
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/data.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/utilities.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery-custom-ui.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
  <title>회원가입 페이지</title>
<script>
$(function(){	/* 비밀번호 같은지 확인 */
	$('#pw2').blur(function(){
		if($('#pw').val() != $('#pw2').val()){
			if($('#pw2').val()!=''){
				alert("비밀번호가 일치하지 않습니다.");
				$('#pw2').val('');
				$('#pw2').focus();
				}
			}
		})
});
/* 
$(function(){
	$('#ID').blur(function(){
		$.ajax({
			type : 'POST',
			url : '/rest/Idcheck';
			data : {
					"ID":$('#ID').val()
				},
				success:function(data){
					if($.trim(data)=="YES"){
						if($('#ID').val()!=''){
							alert("사용 가능한 아이디 입니다.");
							}
						}else {
						if($('#ID').val()!=''){
							alert("중복된 아이디 입니다.");
							$('#ID').val('');
							$('#ID').focus();
							}
						}
					}
			})
		})
});  */

$(function() {
	  $("form").submit(function() {
	  		var captcha = 1;
	  		$.ajax({
	              url: 'http://localhost:9090/final/rest/VerifyRecaptcha',
	              type: 'post',
	              data: {
	                  recaptcha: $("#g-recaptcha-response").val()
	              },
	              success: function(data) {
	                  switch (data) {
	                      case 0:
	                          console.log("자동 가입 방지 봇 통과");
	                          captcha = 0;
	                  		break;
	                      case 1:
	                          alert("로봇이 아님을 증명하시오.");
	                          console.log(data);
	                          break;
	                      default:
	                          alert("자동 가입 방지 봇을 실행 하던 중 오류가 발생 했습니다. [Error bot Code : " + Number(data) + "]");
	                     		break;
	                  }
	              }
	          });
	  		if(captcha != 0) {
	  			return false;
	  		} 
	  });
	  });

</script>

</head>
<body>
  <div id="container">
  <form action="signupaction" method="post" style="height: 100%;">
    <table id="signup-table" style="margin-top: 20px;">
        <tr>
          <th>아이디</th>
          <td><input type="text" id = "ID" name="ID" placeholder="사용할 아이디"/></td>
            
        </tr>
        <tr>
          <th>비밀번호</th>
          <td><input type="password" id = "pw" name="pw" placeholder="비밀번호"/></td>
        </tr>
        <tr>
        <tr>
          <th>비밀번호 확인</th>
          <td><input type="password" id ="pw2" placeholder="비밀번호확인"/></td>
        </tr>
        <tr>
          <th>이름</th>
          <td><input type="text" name="name" placeholder="이름"/></td>
        </tr>
        <tr>
          <th>우편번호</th>
          <td>
            <input type="text" name="zonecode" placeholder="우편번호"/>
          </td>
        </tr>
        <tr>
          <th>주소</th>
          <td>
            <input type="text" name="addr" placeholder="주소" />
          </td>
        </tr>
        <tr>
          <th>상세주소</th>
          <td>
            <input type="text" name="addrdetail" placeholder="상세주소"/>
          </td>
        </tr>
        <tr>
          <th>전화번호</th>
          <td>
            <input type="text" name="phonenum" placeholder="휴대전화 번호"/>
          </td>
        </tr>
        <tr>
          <th>이메일</th>
          <td>
            <input title="정확한 메일 주소를 작성해주세요" type="email" name="email" placeholder="이메일">
          </td>
        </tr>
        <tr>
          <th>생년월일</th>
          <td>
            <input type="text" name="birth" placeholder="생년월일" autocomplete="off"/>
          </td>
        </tr>
        <tr>
        
    </table>
    <div class="g-recaptcha" style="margin-left: 170px; margin-top: 20px" data-sitekey="6LeALOAZAAAAALbcueiR4B_xygyYaNkRCv4mQ1MJ"></div>



    <div id="buttons">
      <input title="가입하기" type="submit" id="btn_join" class="btn ui-button ui-corner-all ui-widget" 
      value="가입" role="button" style="margin-left: 100px;">
      <input title="처음 상태로" type="reset" id="btn_cancel" class="btn" value="리셋">
    <button type="button" class="idCheck" style=" margin-left: 20px; position: absolute;top: 90px; /* right: 750px; */">아이디확인</button>
    </div>
    </form>
  </div>

</body>
<script>
$(function(){
	var check=0;
$(".idCheck").click(function(){
	
	var query = {ID : $("#ID").val()};

	$.ajax({
		url : "rest/Idcheck",
		type : "POST",
		data : JSON.stringify(query),
		contentType :'application/json',
		success : function(data){
			if(data == 1 || query == ''){
				alert("사용 불가능합니다. 다른 아이디를 입력하세요.");
				$('#ID').val('');
				$('#ID').focus();
			}

			if(data == 0){
				alert("사용 가능한 아이디 입니다.");
				check=1;
			}
		}	
	}); 
	
});
$('.btn ui-button ui-corner-all ui-widget').click(function(){
	if(check==0){
		alert("중복체크 하세요.");
		}
	})
}); 

</script>
</html>