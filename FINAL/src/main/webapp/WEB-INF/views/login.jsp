<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

  <meta charset="UTF-8">  
  <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="1001790183901-cb9d2bt84dqu3v7e0gfsg6rtjrpapdd7.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
  
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>로그인 페이지</title>
  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
  <script>
        // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
        //Kakao.init('37ce67905ce0fd50ce6c67104e979081');
        Kakao.init('8ea6851c46139f72cfdeecdff1f58acf');
        
        function loginWithKakao() {
        Kakao.Auth.authorize({
           redirectUri: "http://localhost:9090/final/result",
            scope: 'account_email,birthday'
        });
		/*
        Kakao.Auth.login({
        	scope: 'account_email,birthday',
          success: function(authObj) {
            //alert(JSON.stringify(authObj))
            alert("로그인 성공");
            console.log(authObj);
            console.log(authObj.id);
          },
          fail: function(err) {
            // alert(JSON.stringify(err))
            alert("로그인 실패")
          },
        })*/
        /*
        Kakao.API.request({
            url: '/v2/user/me',
            success: function(res) {
                console.log(res);
                var id = res.id;
                var name =res.properties["nickname"];
                var email = res.properties["email"];
                var birthday = res.properties["birthday"]
            	location.href="naverLogin?name="+name+"&email="+email+"&birthday="+birthday+"&api='kakao'";
            },
            fail: function(error) {
                console.log(error);
            }
        });
        */
      }
        // SDK 초기화 여부를 판단합니다.
        console.log(Kakao.isInitialized());
    </script> 
    <script>
    
	    function moveClose() {
	      opener.location.href="../idcheck";
	      self.close();
	    }
	    function moveClose2() {
		      opener.location.href="../pwcheck";
		      self.close();
		    }
	    function moveClose3() {
		      opener.location.href="../singup";
		      self.close();
		    }
	    function moveClose4() {
		      opener.location.href="main";
		      self.close();
		    }
    </script>
    <style>
    	input{
        display: block;
        margin: 5px;
        width: 400px;
        height: 40px;
        margin-top: 20px;
      }
      li{
      	list-style: none;
      	display: inline;
      	padding-left: 15px;
      	padding-right: 15px;
      	color: #cccccc;
      }
      a{
      	text-decoration: none;
      	color: black;
      }
      
    </style>
</head>
<body>

	<div id="container" style="width: 600px; height: 600px; margin-left: 50px;">
    <form action = "loginaction" method="post" style="margin-top: 100px;">
        <input type="text" name="ID" id="ID" placeholder="아이디" >
        <input type="password" name="pw" id="pw" placeholder="비밀번호">
        <input type="submit" value="로그인" style=" margin-left: 5px; background-color: #FFAC04; color: white;
        height: 60px;">
        <ul>
        	<li><a href="javascript:moveClose()">아이디 찾기</a></li>
        	<li style="border-left: 1px solid #cccccc"><a href="javascript:moveClose2()">비밀번호 찾기</a></li>
        	<li style="border-left: 1px solid #cccccc"><a href="javascript:moveClose3()">회원가입</a></li>
        </ul>
        
        <div id="kakao_id_login" style="margin-left: 50px; margin-top: 30px;">
        <a id="custom-login-btn" href="${kakaoUrl}">
	  	<img
	    src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg"
	    width="277px;" height="60px;"/>
		</a>
		
		
		</div>
	    <!-- 네이버아이디로로그인 버튼 노출 영역 
	  <div id="naver_id_login" style="margin-left: 50px; margin-top: 10px;">-->
	  <!-- //네이버아이디로로그인 버튼 노출 영역 
	  <script type="text/javascript">
	  	var naver_id_login = new naver_id_login("2ti48YANpdiJUdiguK3P", "http://localhost:9090/final/result/");
	  	var state = naver_id_login.getUniqState();
	  	naver_id_login.setButton("white", 277,60);
	  	naver_id_login.setDomain("http://localhost:9090/final/login/");
	  	naver_id_login.setState(state);
	  	naver_id_login.init_naver_id_login();
	  </script>
	  </div>-->
	  
	  <div id="naver_id_login" style="margin-left:50px; margin-top: 10px;"><a href="${url}"><img width="277" src="http://static.nid.naver.com/oauth/big_w.PNG"/></a></div>
    </form>
    
    
    <!--  data-onsuccess="onSignIn"-->
   
     <div id="google_id_login" style="margin-left: 50px; margin-top: 7px; width: 277px; height: 60px;">
	    <a href="${googleUrl}"><img src="${pageContext.request.contextPath}/resources/img/google1.png"
	    style="width: 277px; height: 60px;"/></a>
	  </div>
    <script>
    /*
        function onSignIn(googleUser) {
            // Useful data for your client-side scripts:
            var profile = googleUser.getBasicProfile();
            console.log("ID: " + profile.getId()); // Don't send this directly to your server!
            console.log('Full Name: ' + profile.getName());
            //console.log("Email: " + profile.getAccountEmail());
            //console.log("birth: "+profile.getBirthDay())
            console.log("email: "+profile.getEmail())

            // The ID token you need to pass to your backend:
            var id_token = googleUser.getAuthResponse().id_token;
            console.log("ID Token: " + id_token);
        };
        */
    </script>
  </div>
</body>
</html>