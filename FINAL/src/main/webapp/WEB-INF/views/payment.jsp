<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
$(function(){
$("#check_module").click(function () {
   var IMP = window.IMP; // 생략가능
   IMP.init("imp42750488");
   // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
   // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
   IMP.request_pay({
   pg: 'inicis', // version 1.1.0부터 지원.
   /*
   'kakao':카카오페이,
   html5_inicis':이니시스(웹표준결제)
   'nice':나이스페이
   'jtnet':제이티넷
   'uplus':LG유플러스
   'danal':다날
   'payco':페이코
   'syrup':시럽페이
   'paypal':페이팔
   */
   pay_method: 'card',
   /*
   'samsung':삼성페이,
   'card':신용카드,
   'trans':실시간계좌이체,
   'vbank':가상계좌,
   'phone':휴대폰소액결제
   */
   merchant_uid: 'merchant_' + new Date().getTime(),
   /*
   merchant_uid에 경우
   https://docs.iamport.kr/implementation/payment
   위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
   참고하세요.
   나중에 포스팅 해볼게요.
   */
   name: "${vo.pname}",
   //결제창에서 보여질 이름
   amount: 1000 ,
   //가격
   buyer_email: '${member.email}',
   buyer_name: '${member.name}',
   buyer_tel: '${member.phonenum}',
   buyer_addr: "${member.addr}"+" ${member.addrdetail}",
   buyer_postcode: "${member.zonecode}",
   //m_redirect_url: 'paymentAction?pno=${vo.pno}'  모바일url
   /*
   모바일 결제시,
   결제가 끝나고 랜딩되는 URL을 지정
   (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
   */
   }, function (rsp) {
      console.log(rsp);
   if (rsp.success) {
	   /*
      var msg = '결제가 완료되었습니다.';
      msg += '고유ID : ' + rsp.imp_uid;
      msg += '상점 거래ID : ' + rsp.merchant_uid;
      msg += '결제 금액 : ' + rsp.paid_amount;
      msg += '카드 승인번호 : ' + rsp.apply_num;
      alert(msg);*/
      location.href="paymentResult?imp_uid="+rsp.imp_uid+"&mid="+rsp.merchant_uid+"&pno=${vo.pno}"; //?pno=${vo.pno}&imp_uid="+rsp.imp_uid
      /*
      jQuery.ajax({
          url: "rest/complete", // 가맹점 서버
          method: "POST",
          headers: { "Content-Type": "application/json" },
          data: {
              imp_uid: rsp.imp_uid,
              merchant_uid: rsp.merchant_uid
          }
      }).done(function (data) {
          alert(data);
        // 가맹점 서버 결제 API 성공시 로직
      })
          */
   } else {
      var msg = '결제에 실패하였습니다.';
      msg += '에러내용 : ' + rsp.error_msg;
      alert(msg);
   }
   });
   });
   
})
</script>
<style>
   img{
      width: 150px;
      height: 200px;
   }
   table{
      margin-left: 35%;
      margin-top: 10%;
      text-align: center;
   }
   td{
      padding: 10px;
      font-size: 20px;
   }
   input{
      width: 300px;
      height: 30px;
      text-align: center;
   }
   select{
      width: 310px;
      height: 35px;
      font-size: 16px;
      text-align-last: center;
   }
   #check_module{
      margin-left:45.5%;
      margin-top: 2%;
      height: 50px;
      margin-bottom: 3%;
   }
</style>
</head>
<body>
   <table>
   <tr>
   
   <th colspan="2">상품명</th>   
   <th>결제금액</th>
  </tr>
  <tr>
   		   <c:if test="${vo.image ne null}">
		   		<td><img src="${vo.image}"/></td> 
		   </c:if>
		   <c:if test="${vo.image eq null }">
			        <c:choose>
			            <c:when test="${vo.img1 ne '(이름없음)' }">
			            	<td><img src="resources/images/${vo.img1 }"/></td>
			            </c:when>
			            <c:otherwise>
			            	<td><img src="resources/images/${vo.img2 }"/></td>
			            </c:otherwise>
			        </c:choose>
		        <br/>
		   </c:if>
    <td>${vo.pname}</td>
      <td style="width: 30%;">${vo.bestmoney}</td></tr>
   </table>
   <div style="border-top: 1px solid #cccccc;">
   <table style=" margin-left: 38%; margin-top: 2%;">
   <tr>
   <th>받는사람</th> <td><input type="text" value="${member.name }"/></td>
   </tr>
   <tr>
   <th>우편번호</th> <td><input type="text" value="${member.zonecode}"/></td>
   </tr> 
   <tr>
   <th>주소</th> <td><input type="text" value="${member.addr}"/></td>
   </tr>
   <tr>
   <th>상세주소</th> <td><input type="text" value="${member.addrdetail}"/></td>
   </tr>
   <tr>
   <th>전화번호</th><td><input type="text" value="${member.phonenum}"/></td>
   </tr>
   <tr>
   <th>배송시 요청사항</th> 
   <td>
      <select>
              <option value="">배송 전 연락바랍니다.</option>
              <option value="">부재 시 문앞에 놔주세요</option>
              <option value="">무인택배햠에 넣어주세요</option>
              <option value="">경비실에 맡겨주세요</option>
              <option value="">부재 시 연락주세요</option>
        </select>
   </td>
   </tr>
   
   </table>
   </div>
   
   <input type="hidden" value="${vo.pno}"/>
   <input type="submit" value="결제" id="check_module"/>
</body>
</html>