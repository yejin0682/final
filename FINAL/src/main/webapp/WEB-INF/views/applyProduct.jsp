<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script src="resources/js/jquery-3.5.1.min.js"></script>
<script src="resources/js/jquery-ui.min.js"></script>
<script src="resources/js/deadline/deadlinedate.js"></script>
<script src="resources/js/deadline/deadlinemain.js"></script>
<link href="resources/css/jquery-ui-sunny.css" rel="stylesheet" type="text/css">
<script src="resources/js/plmi.js"></script>

<style>
	body {
	    margin-top: 200px;
			
	}
	.ui-datepicker{ font-size: 15px; width: 400px; height: 300px;}
	
	form {
    margin-left: 30%;
    margin-top: 20px;
    height: 700px;
}
	th{
		text-align: right;
		padding: 5px;
		margin-top: 10px;
		font-size: 25px;
	}
	input{
		margin-left: 30px;
		font-size: 20px;
		width: 300px;
	}
	
	.category{
		font-size: 20px;
		width: 300px;
		height: 40px;
		text-align: center;
	}
	td{
		padding: 10px;
		margin-top: 30px;
	}
	#radio{
		font-size: 20px;
	}	
	select option { text-align: center; }
	h2{
		font-size: 40px;
		margin-top: 50px;
	}
</style>
<script>
$(document).ready(function(){
	   $("input[name=auctionmenu]").change(function() {
	      var radioValue = $(this).val();
	      if(radioValue == "블라인드"){
	            $(".sptable").hide();
	         } else if(radioValue == "일반"){
	               $(".sptable").show();
	            }
	   });
	});
</script>
</head>
<body>
<div id="container" style="margin-top: 200px;"">
	<h2 style="text-align: center;">상품등록</h2>
	<form action="applyProductAction" method="post" enctype="multipart/form-data">
	<table style="margin-left: 8%;">
	<tr>
		<th>이름</th> 
		<td><input type="text"	name="pname"/ style=""></td>	
	</tr>
	<tr>
		<th>사진</th> 
			<td> 
			 <input type="file" name="multiparts" accept="image/*" onchange="setThumbnail(event);"/><br/>
		     <input type="file" name="multiparts" accept="image/*" onchange="setThumbnail(event);"/>
		    <div id="image_container"></div>
		    </td>

	</tr>
	<tr>
		<th>가격</th> 
			<td><input type="text" name="price"/></td>
	</tr>
	<tr>		
		<th>작성자</th>
		<td> <input type="text" value="${id }" name="ID" readonly/></td>
	</tr>
	<tr>
		<th>경매 종류</th> 
			<td id="radio">		
					<input type="radio" name="auctionmenu" value="일반" checked="checked" 
					style="width: 15px; height: 15px;">일반경매 <!-- 일반/블라인드 만 선택 가능하게  -->
					<input type="radio" name="auctionmenu" value="블라인드" style="width: 15px; height: 15px;">블라인드경매
			</td>
	</tr>
	<tr class="sptable">
		<th>응찰 단위</th>  
			<td>	
				<div class="spinner" style="margin-left: 30px; margin-top: 0px;">
						<button type="button" class="sp-sub-minus" onclick="optnQtyMinus($(this));" style="width: 40px; height: 32px;">
							<b>-</b>
						</button>
							<input style="font-weight: 100; width: 220px;margin-left: 0px;" type="tel" class="num" placeholder="0" value="" name="moneyup" id="btnQtyC3_1000020518522" data-max-qty="1000000" stoc-qty="3091">
							<button type="button" class="sp-sub-plus" onclick="optnQtyPlus($(this), '3091');" style="width: 40px; height: 32px;">
								<b>+</b>
							</button>
				</div>
			</td>
	</tr>	<!-- 플러그인 같은 걸로 가격 조정 -->
	<tr>
		<th>마감날</th> 
			<td> <input type="text" name="deadlinedate" autocomplete="off"/>	<!-- 달력 --></td>
	</tr>
	<tr>
		<th>카테고리</th> 
			<td>	
				<select class="category" name="category" style="margin-left: 30px; vertical-align: middle; text-align-last: center;">
					<option value="미술품">미술품</option>
					<option value="장난감">장난감</option>
					<option value="인형">인형</option>										
			</select>
			</td>
	</tr>
		</table>
		<input title="수정/철회 불가" id="apply" type="submit" value="승인 요청" style="width: 260px;height: 60px;margin-top: 20px;margin-left: 22%;">
	</form>
</div>
</body>
<script>
function setThumbnail(event) { 
	var reader = new FileReader(); 
	reader.onload = function(event) {
		var img = document.createElement("img"); 
		img.setAttribute("src", event.target.result); 
		document.querySelector("div#image_container").appendChild(img); 
		}; 
		reader.readAsDataURL(event.target.files[0]); 
	}
$(document).ready(function(){
	$("input[name=auctionmenu]").change(function() {
		var radioValue = $(this).val();
		if(radioValue == "블라인드"){
				$(".sptable").hide();
			} else if(radioValue == "일반"){
					$(".sptable").show();
				}
	});
	$(document).tooltip();
});
	


</script>
</html>