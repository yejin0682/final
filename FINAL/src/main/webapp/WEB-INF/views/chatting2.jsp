<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script src = "https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script type="text/javascript">
	var sock = null;
	$(function(){
		$("#sendBtn").click(function(){
			sendMessage();
			$("#message").val('');
		});
		$("#chatting").click(function(){
			sock= new SockJS("<c:url value="/echo"/>");
			sock.onmessage = onMessage;
			$("#data").append($("#userId").val()+"님 채팅 입장\n");
		});
		$("#message").keydown(function(key){
			if(key.keyCode==13){
				sendMessage();
				$("#message").val('');
				}
			});
		$("#exit").click(function(){
			sock.onclose = onClose;
		});
	});
	
	//sock.onclose = onClose;
	
	function sendMessage(){
		sock.send($("#userId").val()+" : "+$("#message").val());
	}
	
	function onClose(evt){
		$("#data").append("연결 끊김");
	}
	// evt : websocket이 보내준 데이터
	function onMessage(evt){
		var data = evt.data;
		var sessionid = null;
		var message = null;
		var current_session = $("#userId").val();
		//$("#data").append(data);
		var arr = data.split(" : ");
		sessionid= arr[0];
		message = arr[1];
		console.log(data);
		if(sessionid == current_session){
			var str = "나 : "+message;
			$("#data").append(str);
		}else{
			var str =sessionid+" : "+message;
			$("#data").append(str);
		}
		/*
		var strArray = data.split('|');

		for(var i=0 ; i<strArray.length; i++){
			console.log('str['+i+']:'+strArray[i]);
		}
		var currnetuser_session = $('#sessionuserid').val();
		*/
	}

</script>
<style>

</style>
</head>
<body>
<div>
	<textarea rows="10" cols="50" readonly="readonly" id="data" 
	style="position:absolute; top: 50px;width: 400px; height: 500px; z-index:1; background-color: #F2F2F2;"></textarea><br/>
	<div style="position: absolute; top: 455px; width: 404px; height: 100px; background-color: white;
	border: 1px solid #cccccc; z-index: 2;">
	<input type="text" id="message"/ style="width: 300px; height: 70px; margin-top: 15px; margin-left: 20px;">
	<input type="button" value="보내기" id="sendBtn" 
	style="width: 60px; height: 68px; margin-left: 4px; background-color: #CECEF6; color: white; 
	font-weight: 700; font-size: 16px; border: none; border-radius: 2px 2px 2px 2px;"/>
	</div>
	<input type="button" value="채팅참여" id="chatting" 
	style="position: absolute; top: 0px; width: 100px; height: 50px;"/>
	<input type="button" value="퇴장" id="exit"
	style="position: absolute; top: 0px; left: 106px; width: 100px; height: 50px;"/>
	<input type="text" value="${member.ID}" id="userId"
	style="position: absolute; top: 0px; left: 206px; width: 200px; height: 50px; text-align: center;"/>
</div>

</body>

</html>