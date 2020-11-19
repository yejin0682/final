<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
	th{
		border: 1px solid #cccccc;
		
	}
	td{
		border: 1px solid #cccccc;
	}
	table{
		width: 1200px;
		margin-top: 150px;
		margin-left: 22.5%;
		font-size: 18px;
		text-align: center;
	}
	#searchtable{
		width: 200px;
		margin-top: -100px;;
		float: right;
		
	}
   h2 {
	    text-align: center;
	    margin: 0 auto;
	    margin-top: 20px;
   }
</style>
<script>
function ajax_admin(admin,offset) {
	var data = {
		admin: admin,
		offset : offset
		}
	$.ajax({
		url: 'http://localhost:9090/final/rest/admin/itemadmin',
		type: 'post',
		data: JSON.stringify(data),
		dataType: 'json',
		contentType: 'application/json',
		success: function(response){
			list = response;
			for(var i=0; i<=list.length-1; i++){
				var str="";
				str += "<tr>";
				str += "<td>" +list[i].pno + "</td>";
				str += "<td><a href='../showDetail?pno="+ list[i].pno +"'>"  +list[i].pname +"</a></td>";
				str += "<td>" +list[i].id +"</td>";
				str += "<td>" +list[i].grade +"</td>";
				str += "<td>" +list[i].uploaddate +"</td>";
				str += "<td>" +list[i].admin +"</td>";
				str += "<td>" +list[i].deal +"</td>";
				str += "</tr>";
				$("#theTable").append(str);
				}
			},
		error: function() {
			alert("에러!admin");
			}
		})
	}
function ajax(admin,offset,deal) {
	var data = {
		admin: admin,
		offset:offset,
		deal: deal
		}
	$.ajax({
		url: 'http://localhost:9090/final/rest/admin/itemmanager',
		type: 'post',
		data: JSON.stringify(data),
		dataType: 'json',
		contentType: 'application/json',
		success: function(response){
			list = response;
			
			for(var i=0; i<=list.length-1; i++){

				var str="";
				str += "<tr>";
				str += "<td>" +list[i].pno + "</td>";
				str += "<td><a href='../showDetail?pno="+ list[i].pno +"'>" +list[i].pname +"</a></td>";
				str += "<td>" +list[i].id +"</td>";
				str += "<td>" +list[i].grade +"</td>";
				str += "<td>" +list[i].uploaddate +"</td>";
				str += "<td>" +list[i].admin +"</td>";
				str += "<td>" +list[i].deal +"</td>";
				str += "</tr>";
				$("#theTable").append(str);
			}
		},
		error: function() {
			alert("에러!");
			}
		})
	}

function ajax_page(admin,offset,deal){
	var data = {
			admin: admin,
			offset : offset,
			deal : deal
			}
	$.ajax({
		url: 'http://localhost:9090/final/rest/admin/page',
		type: 'post',
		data: JSON.stringify(data),
		dataType: 'json',
		contentType: 'application/json',
		success:function(response){
			var sp = response["startPage"];
			var ep = response["endPage"];
			var admin = response["admin"];
			var str="";
			for(var i=sp; i<=ep ;i++){
			str+="<form class='pageForm'>";
			str+="<input type='button' id='btn"+(admin+1)+"' class='btn"+(admin+1)+"' value='"+i+"'/>";
			str+="<input type='hidden' value="+(i*10-10)+" name='offset' class='offset'/>";
			str+="</form>";
			}
			$(".pageDiv").append(str);
			
			},
		error : function(){
			alert("페이지에러!");
			}
		})
}
$(document).ready(function() {
	$(".admin").click(function(){
			
		});
/*
	$("#btn1").click(function() {
		$("#trr").nextAll().remove();
		$(".pageForm").remove();
		ajax_admin(0,0);
		ajax_page(0,0);
		})
	$("#btn2").click(function() {
		$("#trr").nextAll().remove();
		ajax_admin(1);
		})
	$("#btn3").click(function() {
		$("#trr").nextAll().remove();
		ajax_admin(2);
		})
	$("#btn4").click(function() {
		$("#trr").nextAll().remove();
		ajax(1,1,0);
		})
	$("#btn5").click(function() {
		$("#trr").nextAll().remove();
		ajax(1,2,0);
		})
	*/
});
$(document).on("click","#btn1",function(){
	/*
	var offset=$(this).parent().find("input.offset").val();
	$("#trr").nextAll().remove();
	$(".pageForm").remove();
	ajax_admin(0,offset);
	ajax_page(0,offset,-1);
	*/
});
$(document).on("click","#btn2",function(){
	/*
	var offset=$(this).parent().find("input.offset").val();
	$("#trr").nextAll().remove();
	$(".pageForm").remove();
	ajax_admin(1,offset);
	ajax_page(1,offset,-1);
	*/
});
$(document).on("click","#btn3",function(){
	/*
	var offset=$(this).parent().find("input.offset").val();
	$("#trr").nextAll().remove();
	$(".pageForm").remove();
	ajax_admin(2,offset);
	ajax_page(2,offset,-1);
	*/
});
/*
$(document).on("click","#btn4",function(){
	var offset=$(this).parent().find("input.offset").val();
	$("#trr").nextAll().remove();
	$(".pageForm").remove();
	ajax(1,offset,1);
	ajax_page(1,offset,1);
});
$(document).on("click","#btn5",function(){
	var offset=$(this).parent().find("input.offset").val();
	$("#trr").nextAll().remove();
	$(".pageForm").remove();
	ajax(1,offset,2);
	ajax_page(1,offset,2);
});*/

</script>
<style>
	form{
		display: inline;
	}
	a{
		text-decoration: none;
		color: black;
	}
	th{
		background-color: #F9E198;
	}
</style>
</head>
<body>
		
		<button id="btn1" onclick="location.href='item?offset=0&admin=0&deal=-1'" class="btn btn-outline-dark">승인요청</button>	<!-- => 옵션으루  0.0 -->
		<button id="btn2" onclick="location.href='item?offset=0&admin=1&deal=-1'" class="btn btn-outline-primary">승인</button>		<!-- 1.0 -->
		<button id="btn3" onclick="location.href='item?offset=0&admin=2&deal=-1'" class="btn btn-outline-warning">거부</button>	<!-- 2.0 -->
<br/>
		<button id="btn4" onclick="location.href='item?offset=0&admin=1&deal=1'" class="btn btn-outline-success">경매중</button>	<!-- 1.1 -->
		<button id="btn5"onclick="location.href='item?offset=0&admin=1&deal=2'" class="btn btn-outline-danger">마감</button>	<!-- 1.2 -->
		<button id="menuBtn" style="float: right;"onclick="location.href='../admin'">메뉴로</button>
	<c:choose>
		<c:when test="${admin eq 0 }">
			<h2>승인요청</h2>
		</c:when>
		<c:when test="${admin eq 1 }">
			<c:if test="${deal eq -1 }">
				<h2>승인</h2>
			</c:if>
			<c:if test="${deal eq 1 }">
				<h2>경매중</h2>
			</c:if>
			<c:if test="${deal eq 2 }">
				<h2>마감</h2>
			</c:if>
		</c:when>
		<c:when test="${admin eq 2 }">
			<h2>거절</h2>
		</c:when>
		<c:otherwise>
			<h2>전체</h2>
		</c:otherwise>
	</c:choose>
	<div id="container">
		<table id="theTable">
			<tr id="trr">
				<th>번호</th>
				<th>상품이름</th>
				<th>아이디</th>
				<th>등급</th>
				<th>업로드 날짜</th>
				<th>승인여부</th>
				<!-- 승인여부 완료시 -->
		<!--	<th>승인여부</th>
				<th>경매여부</th>	-->
			</tr>
			<c:forEach var="list" items="${list }">
				<tr id="del">
					<td>${list.pno }</td>
					<td><a href="../showDetail?pno=${list.pno }">${list.pname }</a></td>
					<td>${list.ID }</td>
					<td>${list.grade }</td>
					<td>${list.uploaddate }</td>
					
				<c:choose>
					<c:when test="${list.admin == 1 && list.deal == 1 }">
						<td><button id="admin" style="margin: 10px;" class="btn btn-dark">경매중</button></td>
					</c:when>
					<c:when test="${list.admin == 1 && list.deal ==2 }">
						<td><button id="admin" style="margin: 10px;" class="btn btn-danger">마감됨</button></td>
					</c:when>
					<c:when test="${list.admin == 2 }">
						<td><button id="admin" style="margin: 10px;" class="btn btn-outline-danger">거절됨</button></td>
					</c:when>
					<c:otherwise>
						<td>
							<button id="admin" style="margin: 10px;" class="btn btn-primary" onclick="location.href='approveItem?pno=${list.pno}'" >승인</button>
							<button onclick="location.href='rejectItem?pno=${list.pno}'" class="btn btn-danger">거절</button>
						</td>
					</c:otherwise>
				</c:choose>
					
				</tr>
			</c:forEach>
		</table>
		<div class="pageDiv" style="margin-top: 60px; margin-left: 40%;">
			<c:forEach var="i" begin="${startPage}" end="${endPage}">

			<form action="item" class="pageForm" style="padding: 5px;">
			<c:choose>
				<c:when test="${(offset+10)/10 eq i}">
					<input type="submit" style= "font-weight:bold;" value="${i}"/>
				</c:when>
				<c:otherwise>
					<input type="submit" value="${i}"/>
				</c:otherwise>

			</c:choose>


				<input type="hidden" value="${i*10-10}" name="offset" class="offset"/>
				<input type="hidden" value="${deal}" name="deal"/>
				<input type="hidden" value="${admin}" name="admin" id="admin"/>
			</form>
			</c:forEach>
		</div>
	</div>
</body>
</html>