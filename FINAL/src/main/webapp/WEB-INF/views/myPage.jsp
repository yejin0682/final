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
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>마이페이지</title>
<style>
   .myQna{
      display: none;
   }
   
   .like{
      display: none;
   }
</style>
<script type="text/javascript">
   $(function(){
      $(".myQnaButton").click(function(){
            $(".myQna").toggle();

         });
      $(".likeButton").click(function(){
            $(".like").toggle();

         });
      
      });

</script>
</head>
<body>
<div style="margin-top: 200px;">
   <!-- <input type="button" value="회원정보수정"/>
   <input type="button" value="거래내역"/>
   <input type="button" value="문의내역"/>
   <input type="button" value="관심상품"/>
   <input type="button" onclick="location.href='applyProduct'" value="상품등록"/> -->
   <main id="contents" class="wrapper-sub">
          <div id="pattern" class="pattern">
         <h1 style="text-align: center;">마이페이지</h1>       
      </div>
      
         <div id="" style="margin-left: 30%;margin-top: 100px;width: 850px;boader: 1px solid black;display: block;">
         <h2 style="font-weight: 700; font-size: 35px;">내정보</h2><hr>
         <img src="http://placehold.it/600x600" alt="Image Alt Text" style="width: 160px; height: 160px; float: left;">
         <div style="width: 400px;margin-left: 150px;">
         <p style="margin-left: 55px; font-weight: 700; font-size: 35px; float: left;"></p>
         <p style=" margin-left: 15px;font-weight: 700; font-size: 35px; float: left;"><span>${member.name}님</span></p>
         </div>
         <div style="width: 300px;margin-left: 600px;text-align: left;">
         
         <p style="font-size: 18px;">전화번호: ${member.phonenum}</p>
         <p style="font-size: 18px;">이메일: ${member.email}</p>
         <p style="font-size: 18px;">주소: ${member.addr}</p>
         </div>
      </div>
      </main>
     
      <div style=" width: 900px; margin-left: 30%;  margin-top: 100px; width: 600px; display: block;">
         <h2 style="font-weight: 700; font-size: 35px;">기본정보</h2>
         <p style="margin-top: 20px;">프로필사진, 이름, 이메일, 주소, 휴대전화 등의 정보를 수정합니다.
         <a href="memberupdate"><button style="float: right; hegiht: 40px;margin-right: -250px;" class="btn btn-link">수정</button></a>         
      </div>
      
      <div style=" width: 900px; margin-left: 30%;  margin-top: 100px; width: 600px; display: block;">
         <h2 style="font-weight: 700; font-size: 35px;">거래내역</h2>
         <a href="deallist"><button style="float: right; hegiht: 40px;margin-right: -250px; margin-top: -40px;" class="btn btn-link">이동</button></a>            
      </div>
      <div style=" width: 600px; margin-left: 30%;  margin-top: 100px; width: 600px; display: block;">
         <h2 style="font-weight: 700; font-size: 35px;" class="myQnaButton">문의내역</h2>
         <div style="margin-top: 20px; width: 700px;">
            <div class="myQna">
               <table style="width: 900px; text-align: center;">
                  <tr>
                     <td style="width: 150px; height: 100px; border-bottom: 1px solid black;">
                        <p style="font-size: 15px;"><b>제목</b></p>               
                     </td>
                     <td style="width: 420px; border-bottom: 1px solid black;"><p style="margin-left: 20px; font-size: 15px;"><b>내용</b></p></td>
                     <td style="border-bottom: 1px solid black;"><p style="margin-left: 20px; font-size: 15px;"><b>작성날짜 </b></p></td>                                 
                  </tr>
                  <c:forEach items="${list2}" var="list2">
                  <tr>
                     <td style="width: 150px; height: 100px; border-bottom: 1px solid black;">
                        <p style="font-size: 15px;">${list2.title}</p>               
                     </td>
                     <td style="width: 420px; border-bottom: 1px solid black;"><p style="margin-left: 20px; font-size: 15px;">
                     <a href="qnaDetail?qbno=${list2.qbno}">${list2.content}</a></p></td>
                     <td style="border-bottom: 1px solid black;"><p style="margin-left: 20px; font-size: 15px;">${list2.writedate}</p></td>                                 
                  </tr>
                  </c:forEach>
               </table>      
            </div>
         </div>            
      </div>
      <div style=" width: 600px; margin-left: 30%;  margin-top: 100px; width: 600px; display: block;">
			<h2 style="font-weight: 700; font-size: 35px;" class="likeButton">관심상품</h2>
			<div class="like" style="margin-top: 20px; width: 700px;">
				<div>
					<table style="width: 900px;">
					<c:choose>
						<c:when test="${!empty list1}">
						<c:forEach var="list1" items="${list1 }">
						<tr>
							<td style="width: 150px; height: 100px; border-bottom: 1px solid black;">
							<c:if test="${list1.image ne null }">
								<a href="showDetail?pno=${list1.pno }"><img src="${list1.image }" style="width: 100px; height: 100px; margin-left: 0px;  margin-top: 20px; margin-bottom: 20px;"/></a>	
							</c:if>
							<c:if test="${list1.image eq null }">
								<a href="showDetail?pno=${list1.pno }">
								<c:choose>
									<c:when test="${list1.img1 ne '(이름없음)' }">
									<img src="resources/images/${list1.img1 }" style="width: 100px; height: 100px; margin-left: 0px;  margin-top: 20px; margin-bottom: 20px;"/>
									</c:when>
									<c:otherwise>
									<img src="resources/images/${list1.img2 }" style="width: 100px; height: 100px; margin-left: 0px;  margin-top: 20px; margin-bottom: 20px;"/>
									</c:otherwise>
								</c:choose>
								</a> <br/>
							</c:if>
							</td>
							<td style="width: 420px; border-bottom: 1px solid black;"><p style="margin-left: 20px; font-size: 15px;"><a href="showDetail?pno=${list1.pno }"><b>${list1.pname }</b></a></p></td>
							<c:set var="dead" value="${list1.deadlinedate }"/>
							<td style="width: 420px; border-bottom: 1px solid black;"><p style="margin-left: 20px; font-size: 15px;"><b>${fn:substring(dead,0,10) }</b></p></td>
						</tr>
						</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td><a>관심상품을 등록하세요.</a></td>
							</tr>
						</c:otherwise>
					</c:choose>
					</table>		
				</div>
			</div>				
		</div>
		<div style=" width: 900px; margin-left: 30%;  margin-top: 100px; width: 600px; display: block;">
			<h2 style="font-weight: 700; font-size: 35px;">상품등록</h2>
			<p style="margin-top: 20px;">판매할 상품을 등록하세요.
			<a href="applyProduct"><button style="float: right; hegiht: 40px; margin-top: -30px; margin-right: -250px;" class="btn btn-link">등록</button></a>				
		</div>
		</div>
</body>
</html>
<%@ include file="footer.jsp" %>