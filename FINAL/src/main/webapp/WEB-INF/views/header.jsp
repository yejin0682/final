<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script src = "https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
function popup(){
      var url = "login/";
      var name = "login popup";
      var option = "width = 550, height = 636, top = 100, left = 200, location = no"
      window.open(url, name, option);
 }
var check =0;
var sock;
//var nickname;
//<![CDATA[
var roomId = "${room.roomId}";
//]]>
$(function(){
   if(${member.grade !='z'}){
         $("#chatting").click(function(){
            if(check==0){
               sock= new SockJS("<c:url value="/chat"/>");
               sock.onopen=onOpen;
               sock.onmessage = onMessage;
               sock.onclose = onClose;
                  }
           check=1;
            //$("#data").append($("#userId").val()+"님 채팅 입장\n");
         });
      }else{
            sock= new SockJS("<c:url value="/chat"/>");
            sock.onopen = onOpen2;
            $("#chatting").click(function(){
                if(check==0){
                  onOpen();
               }
               check=1;
               });
            sock.onmessage = onMessage;
            sock.onclose = onClose;
      }
   $("#sendBtn").click(function(){
      sendMessage();
      $("#message").val('');
   });
   $("#message").keydown(function(key){
      if(key.keyCode==13){
         sendMessage();
         $("#message").val('');
         }
      });
   $("#exit").click(function(){
       onClose();
   });

});

//sock.onclose = onClose;
function onOpen(){
    sock.send(JSON.stringify({chatRoomId : roomId,type:'ENTER',writer:$("#userId").val(),grade:"${member.grade}"}));
   }
function onOpen2(){
    sock.send(JSON.stringify({type:'ENTER',writer:$("#userId").val(),grade:"${member.grade}"}));
   }
function sendMessage(){
   sock.send(JSON.stringify({chatRoomId : roomId, type :'CHAT', writer:$("#userId").val(), message:$("#message").val()}));
   }

function onClose(){
      sock.send(JSON.stringify({chatRoomId : roomId,type:'LEAVE',writer:$("#userId").val()}));
       check=0;
}
function enter(){
      sock.send("채팅입장");
   }
// evt : websocket이 보내준 데이터
function onMessage(evt){
   var data = evt.data;
   var userRoomId = data.split(":")[0];
   var sessionid = data.split(":")[1];
   var message = data.split(":")[2];
   var person = data.split(":")[0];
   var userid = $("#userId").val();
   if(check==0){
      alert(data);
   }
   if(check==1){
     if(userRoomId==roomId){
         if(sessionid == userid){
               $("#data").append("<span class='chat'><b>나</b></span><br/>");
               $("#data").append("<span class='chat'>"+message+"</span><br/>");
               $("#data").scrollTop($("#data")[0].scrollHeight);
         }else{
            if(message!=undefined){
               $("#data").append("<b>"+sessionid+"</b><br/>");
               $("#data").append(message+"<br/>");
               $("#data").scrollTop($("#data")[0].scrollHeight);
               }else{
               $("#data").append(sessionid+"<br/>");
                  }
             }
      }else{
         alert(data);
          }
   }
}

function onMessage2(evt){
   var data = evt.data;
   alert(data);
}
   /*
if(${member.grade == 'z'}){
   var sock;
   alert("관리자 입장");
   $(function(){
          sock= new SockJS("<c:url value="/chat"/>");
          sock.onopen = onOpen;
          sock.onmessage = onMessage;
          sock.onclose = onClose;
    });
       function onOpen(){ 
            sock.send(JSON.stringify({type:'ENTER',writer:"${member.ID}",grade:"${member.grade}"}));
       }
      function onMessage(evt){
         alert(evt.data);
         console.log(evt.data);
      }
}*/
</script>
<style>
html, body {
   margin:0px;
}

* {
   box-sizing: border-box;
}

.header {
   margin-bottom:45px;
}

#topMenu {
   height: 30px;
   width: 1600px; 
   position: relative;
}

#topMenu ul { /* 메인 메뉴 안의 ul을 설정함: 상위메뉴의 ul+하위 메뉴의 ul */
   list-style-type: none;
   margin: 0px;
   padding: 0px;
}

#topMenu ul li { /* 메인 메뉴 안에 ul 태그 안에 있는 li 태그의 스타일 적용(상위/하위메뉴 모두) */
   color: black;
   display:inline-block;
   line-height: 30px;
   vertical-align: middle;
   text-align: center;
   -position: relative;
   padding: 0 40px 50px;
}

.topMenuLi {
	text-align:center;
}

.menuLink { /* 상위 메뉴와 하위 메뉴의 a 태그에 공통으로 설정할 스타일 */
   text-decoration: none;
   display: inline-block;
   width: 150px;
   font-size: 20px;
    color: #000;
    font-weight: 700;
    font-family: "Nanum Barun Gothic", sans-serif;
}

.menuLink { /* 상위 메뉴의 글씨색을 흰색으로 설정 */
   color: black;
}

.topMenuLi:hover .menuLink { /* 상위 메뉴의 li에 마우스오버 되었을 때 스타일 설정 */
   color: #1691ce;
   text-decoration:underline;
}

.longLink { /* 좀 더 긴 메뉴 스타일 설정 */
   width: 190px;
   color: gray;
   text-decoration: none;
}

.submenuLink { /* 하위 메뉴의 a 태그 스타일 설정 */
   color: gray;
   background-color: black; /* [변경] 배경색 변경 */
   text-decoration: none;
   display: block;
   width: 150px;
   font-size: 18px;
    font-family: "Nanum Barun Gothic", sans-serif;
}

 .submenu { /* 하위 메뉴 스타일 설정 */
   position: absolute;
   height: 0px;
   overflow: hidden;
   transition: height .2s;
   width: 1600px;
   left: 38px;
   top: 75px;
   background-color: black; /* [추가] 하위 메뉴 전체에 배경색 설정 */
   display:inline-block;
}

.submenu li {
   display: inline-block;
   margin:10px;
   text-align:center;
}

.topMenuLi:hover .submenu {
   height: 55px;
}

.submenuLink:hover {
   color: #3dbfff;
}

a {
   text-decoration : none;
	color: black;
}

.login a {
   font-size: 12px;
}

ul, li {
   list-style: none;
}
.logo{
   width:440px;
   height:80px;
}
.logo_img {
   width:200px;
   height:80px;
   margin-top: -30px;
   margin-left:50px;
   margin-right:20px;
}

.search_img {
   width: 40px;
   height: 40px;
   margin-top: -5px;
}

.inner_wrap {
   margin-top:60px;
}

.search {
   float:right;
   margin-left:40px;
}

.login {
   float:right;
}

.login:hover {
   text-decoration:underline;
}

.login a {
   color:blue;
}

.logo {
   float:left;
}

hr {
   width:100%;
   height:10px;
   border:3px;
   box-shadow:0 10px 10px -15px #000 inset;
}
.chat{
	float: right;
}
.topMenuLi > a{
	text-decoration: none;
	color: black;
}
.submenu > .submenuLink{
	color: gray;
	text-decoration : none;
}
</style>
</head>
<body>
   <header class="header">
      <section class="nav_wrap">
         <div class="inner_wrap">
            <nav id="topMenu">
               <ul>
                  <div class="logo">
                     <a href="main">
                        <img class="logo_img" src="${pageContext.request.contextPath}/resources/img/로고.png">
                     </a>
                  </div>
                  <li class="topMenuLi">
                     <a class="menuLink" href="showAuctionNormal">경매</a>
                     <ul class="submenu">
                        <li><a href="showAuctionNormal" class="submenuLink longLink">온라인 경매</a></li>
                        <li><a href="showAuctionBlind" class="submenuLink longLink">블라인드 경매</a></li>
                     </ul>
                  </li>
                  <li>|</li>
                  <li class="topMenuLi">
                     <a class="menuLink" href="showBiddingAuction">서비스 소개</a>
                  </li>
                  <li>|</li>
                  <li class="topMenuLi"><a class="menuLink" href="notice?offset=0">고객센터</a>
                     <ul class="submenu">
                        <li><a href="notice?offset=0" class="submenuLink">공지사항</a></li>
                        <li><a href="qnaBoard?offset=0" class="submenuLink">문의 게시판</a></li>
                        <li><a href="new?userId=${member.ID}&user=${member.name}&name=${member.ID}의 채팅방" class="submenuLink">1:1 문의</a></li>
                     </ul>
                  </li>
                  
                  <div class="login">
                        <c:choose>
                              <c:when test="${member.grade eq null }">
                                    <a href="javascript:popup()">로그인</a>
                              </c:when>
                              <c:when test="${member.grade eq 'z' }">
                                    <a href="logout">로그아웃</a>
                                    <a href="admin" style="margin-left: 20px;">관리자 페이지</a>
                              </c:when>
                              <c:otherwise>
                              <c:choose>
                              	<c:when test="${member.api eq 'home' }">
                              		${member.ID }님 <br/>
                                    <a href="logout">로그아웃</a>
                                    <a href="myPage" style="margin-left: 20px;">마이페이지</a>
                              	</c:when>
                              	<c:otherwise>
                              		${member.name }님 <br/>
                                    <a href="logout">로그아웃</a>
                                    <a href="myPage" style="margin-left: 20px;">마이페이지</a>
                              	</c:otherwise>
                              </c:choose>
                              </c:otherwise>
		                  </c:choose>
                     </div>
                     <div class="search" style="position: absolute; right: -80px; top: 0;">
                      <a href="Search">
                        <img class="search_img" src="https://media.istockphoto.com/vectors/basic-app-magnifier-icon-vector-id800313034?k=6&m=800313034&s=170667a&w=0&h=uvpZQHYd9nB6yyL3bnogFSF1XC_cewQ3I6kUItSVTIw=">
                     </a>
                  </div>
               </ul>
            </nav>
         </div>
      </section>
   </header>
   <hr>
</body>
</html>