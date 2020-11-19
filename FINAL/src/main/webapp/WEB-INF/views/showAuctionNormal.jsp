<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<style>
img {
   width: 300px;
   height: 300px;
}

li {
   display: inline-block;
   list-style: none;
}

.pname a {
   color: #000;
    cursor: pointer;
    font-size: 20px;
    display: block;
    font-family: Roboto,"Noto Sans KR",sans-serif;
}

.pname a:hover {
   text-decoration:underline;
}

.pname {
   margin-top:40px;
   margin-bottom:20px;
   width :300px; 
   height :22px;
}

.desc {
   color: #666;
    font-size: 13px;
    font-family: Roboto,"Malgun Gothic",sans-serif;
    margin: 2px 10px 2px 0;
}

#container>h2 {
   text-align:center;
   margin-top:40px;
   color: #000;
    font-family: Futura,"Trebuchet MS",Arial,sans-serif;
    font-size: 23px;
    font-weight: 500;
    text-transform: uppercase;
}

.list {
   width: 1100px; 
   margin: 0 auto;
    display: table-cell;
    position: relative;
}

.product_list {
   margin:70px;
   width: 200px; 
   display: block;
}

#container aside {
    display: table-cell;
    padding-right: 125px;
    position: relative;
    vertical-align: top;
    width: 300px;
}

#container aside fieldset {
   border:0px;
}

#container aside fieldset legend {
    color: #000;
    display: block;
    font-size: 12px;
    font-family: Roboto,"Malgun Gothic",sans-serif;
    font-weight: 700;
    letter-spacing: 1px;
    margin-left: 13px;
    text-transform: uppercase;
}

#container aside fieldset:before {
    background-color: #000;
    content: '';
    position: absolute;
    top: 25px;
    left: 0;
    width: 90%;
    height: 1px;
    margin-left:20px;
}
</style>
<script>
$(function(){
	  $("input[class=kraken]").change(function() {
	      var radioValue = $(this).val();
	      location.href ="showAuctionNormal?category="+radioValue;
	   });
	});

</script>
<body>
	<div id="container">
	   <h2>온라인 경매</h2>
		   <aside>
		   	   <fieldset>
		   	   	   <legend>Category</legend>
		   	   	   <ul>
		   	   	   	   <li>
		   	   	   	   	  <c:forEach var="categoryMenu" items="${categoryMenu}">
						   <c:choose>
						   <c:when test="${categoryMenu eq category }">
		   	   	   	   	   <input type="radio" checked="checked" value="${categoryMenu}" id="kraken" name="monster" class="kraken">
						   </c:when>
						   <c:otherwise>
		   	   	   	   	   <input type="radio" value="${categoryMenu}" id="kraken" name="monster" class="kraken">
						   </c:otherwise>
						   </c:choose>
    					   <label for="kraken" value="${categoryMenu}" id="category">${categoryMenu}</label><br/>
						      <!-- <a href="showAuctionBlind?category=${category}">${category}</a>
						      <br/>-->
						   </c:forEach>
					   </li>
				   </ul>
			   </fieldset>	
		   </aside>
	   <div class="list">
		   <ul>
			   <c:forEach var="vo" items="${list}">
				   <li>
					   <div class="product_list">
					   <c:if test="${vo.image ne null}">
					   		<a href="showDetail?pno=${vo.pno }"><img src="${vo.image }"/></a>   
					   </c:if>
					   <c:if test="${vo.image eq null }">
					   		<a href="showDetail?pno=${vo.pno }">
						        <c:choose>
						            <c:when test="${vo.img1 ne '(이름없음)' }">
						            	<img src="resources/images/${vo.img1 }"/>
						            </c:when>
						            <c:otherwise>
						            	<img src="resources/images/${vo.img2 }"/>
						            </c:otherwise>
						        </c:choose>
					        </a>
					        <br/>
					   </c:if>
					   <div class="pname">
					   		<c:set var="name" value="${vo.pname }"/>
						    <p>
							    	<a href="showDetail?pno=${vo.pno }">
								      	<c:choose>
							          		<c:when test="${fn:length(name) gt 17}">
							              		<c:out value="${fn:substring(name, 0, 16)}..."></c:out>
							           		</c:when>
								           	<c:otherwise>
								            	<c:out value="${vo.pname }"></c:out>
								          	</c:otherwise>
							   			</c:choose>
						      		</a>
					        </p>
					   </div>
					   <c:set var="dead" value="${vo.deadlinedate }"/>
					   <p class="desc">
					   		마감날 : ${fn:substring(dead,0,10) }<br/>
					   		조회수 : ${vo.hitcount }<br/>
					   		입찰수 : ${vo.count }<br/>
					   </p>
					   </div>
				   </li>
			   </c:forEach>
		   </ul>
	   </div>
	 </div>
</body>
</html>
<%@ include file="footer.jsp" %>   