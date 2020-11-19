<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!doctype html>
<head>
<meta charset="UTF-8">
<title>main page</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<style type="text/css">
.swiper-slide {
   text-align: center;
   display: flex;
   align-items: center;
   justify-content: center;
}

.swiper1 {
   width:900px;
   height:800px;
}

#content {
   margin:0 80px 80px 80px;
}

h2, small {
   display:inline-block;
}

h2 {
    color: #000;
    font-size: 20px;
    font-weight: 700;
    line-height: 1;
    vertical-align: middle;
    font-family: "Nanum Barun Gothic", sans-serif;
    letter-spacing: 1px;
    text-transform: uppercase;
    margin-top:80px;
    margin-bottom:50px;
}

small {
   color: gray;
    font-size: 15px;
    line-height: 1;
    vertical-align: middle;
    font-family: "Nanum Barun Gothic", sans-serif;
    letter-spacing: 1px;
    text-transform: uppercase;
    margin:80px 0 50px 30px;
}
img{
	width: 200px;
	height: 200px;
}
</style>

<script>
$(document).ready(function(){
   show_all_times();
   tid = setInterval('show_all_times()',1000);
//     msg_time();
 //    tid=setInterval('msg_time()',1000); // 타이머 1초간격으로 수행
   });
   
var stDate = new Date("2020-11-09").getTime();
var edDate = new Array();
var RemainDate;
<c:forEach var="i" begin="0" end="14"  varStatus = "status">
edDate[i] = new Date('2020-11-11').getTime(); // 종료날짜
</c:forEach>

//console.log(edDate);
var showHurrySize = ${showHurry.size()};
//alert("showHurrySize : " + showHurrySize);

function show_all_times() {
   for(var i=0; i<=showHurrySize-1; i++) {
      show_time(i);
   }
}
function show_time(index) {
   stDate = new Date().getTime();
   RemainDate = edDate[index]-stDate;
   //console.log("["+index+"] RemainDate = ... : " + RemainDate);
   // 86400000 ==>24시간
   //if(index<3) console.log("#spanDday"+index+",str:"+make_time_str(index, RemainDate));
   $("#spanDday"+index).text(make_time_str(index, RemainDate));
}

function make_time_str(index, Remain) {
  days = Math.floor(Remain / (1000 * 60 * 60 * 24)) +1;
  hours = Math.floor((Remain % (1000 * 60 * 60 * 24)) / (1000*60*60));
  minutes = Math.floor((Remain % (1000 * 60 * 60)) / (1000*60));
  seconds = Math.floor((Remain % (1000 * 60)) / 1000);
  if(hours <10){
   hours = '0'+hours;
     }
  if(minutes < 10){
     minutes = '0'+minutes;
   }
  if(seconds <10){
   seconds = '0'+seconds;
   }
//  console.log("days:"+days+",hours:"+hours+",minutes:"+minutes+",seconds:"+seconds);
   var m;
   if(days<=1)
      m = hours + ":" +  minutes + ":" + seconds ;
   else
      m = days; 
  //document.all.timer.innerHTML = m;   
  return m;
  /* if (Remain <= 0) {      //시간 종료
    clearInterval(tid);   // 타이머 해제
  }else{
     Remain = Remain - 1000; // 남은시간 -1초
  } */
}

/*
function msg_time() {
     var hours = Math.floor((RemainDate % (1000 * 60 * 60 * 24)) / (1000*60*60));
     var miniutes = Math.floor((RemainDate % (1000 * 60 * 60)) / (1000*60));
     var seconds = Math.floor((RemainDate % (1000 * 60)) / 1000);
     if(hours <10){
      hours = '0'+hours;
        }
     if(miniutes < 10){
        miniutes = '0'+miniutes;
      }
     if(seconds <10){
      seconds = '0'+seconds;
      }
     m = hours + ":" +  miniutes + ":" + seconds ; 
     //document.all.timer.innerHTML = m;   
     return m;
      if (RemainDate <= 0) {      //시간 종료
       clearInterval(tid);   // 타이머 해제
     }else{
       RemainDate = RemainDate - 1000; // 남은시간 -1초
     } 
   }
   */
</script>
</head>
<body>
   <div id="content">
      <h2>촉박 경매</h2>
      <small>옥션이 선정한 경매 작품들을 소개합니다.</small>
      <div class="swiper-container swiper2" style="height: 500px;">
         <div class="swiper-wrapper">
            <div class="swiper-slide">
               <img src="http://oldmidi.cdn3.cafe24.com/p/0429.jpg">
               
                  <div>
	                	<span>D-day</span> 
	                	<c:out value='15:10:11'/>
	               		<span id="spanDday<c:out value='15:10:11'/>"></span> 
	               </div>
            </div>
            <div class="swiper-slide">
               <img src="http://oldmidi.cdn3.cafe24.com/p/0549.jpg">
                  <div>
	                	<span>D-day</span> 
	                	<c:out value='15:10:11'/>
	               		<span id="spanDday<c:out value='15:10:11'/>"></span>
	               </div>
            </div>
            <div class="swiper-slide">
               <img src="http://ktsmemo.cdn3.cafe24.com/p/0011.jpg">
                  <div>
	                	<span>D-day</span> 
	                	<c:out value='15:10:11'/>
	               		<span id="spanDday<c:out value='15:10:11'/>"></span>
	               </div>
            </div>
            <div class="swiper-slide">
               <img src="http://ktsmemo.cdn3.cafe24.com/p/0724.jpg">
                  <div>
	                	<span>D-day</span> 
	                	<c:out value='15:10:11'/>
	               		<span id="spanDday<c:out value='15:10:11'/>"></span>
	               </div>
            </div>
            <div class="swiper-slide">
               <img src="http://ktsmemo.cdn3.cafe24.com/p/0064.jpg">
                  <div>
	                	<span>D-day</span> 
	                	<c:out value='15:10:11'/>
	               		<span id="spanDday<c:out value='15:10:11'/>"></span>
	               </div>
            </div>
            <div class="swiper-slide">
               <img src="http://ktsmemo.cdn3.cafe24.com/p/0287.jpg">
                  <div>
	                	<span>D-day</span> 
	                	<c:out value='15:10:11'/>
	               		<span id="spanDday<c:out value='15:10:11'/>"></span>
	               </div>
            </div>
            <div class="swiper-slide">
               <img src="https://ktsmemo.cafe24.com/p/0751.jpg">
                  <div>
	                	<span>D-day</span> 
	                	<c:out value='15:10:11'/>
	               		<span id="spanDday<c:out value='15:10:11'/>"></span>
	               </div>
            </div>
            <div class="swiper-slide">
               <img src="https://ktsmemo.cafe24.com/p/0053.jpg">
                  <div>
	                	<span>D-day</span> 
	                	<c:out value='15:10:11'/>
	               		<span id="spanDday<c:out value='15:10:11'/>"></span>
	               </div>
            </div>
            <div class="swiper-slide">
               <img src="https://ktsmemo.cafe24.com/p/0540.jpg">
                  <div>
	                	<span>D-day</span> 
	                	<c:out value='15:10:11'/>
	               		<span id="spanDday<c:out value='15:10:11'/>"></span>
	               </div>
            </div>
            <div class="swiper-slide">
               <img src="http://oldmidi.cdn3.cafe24.com/p/0678.jpg">
                  <div>
	                	<span>D-day</span> 
	                	<c:out value='15:10:11'/>
	               		<span id="spanDday<c:out value='15:10:11'/>"></span>
	               </div>
            </div>
            <div class="swiper-slide">
               <img src="http://oldmidi.cdn3.cafe24.com/p/0166.jpg">
                  <div>
	                	<span>D-day</span> 
	                	<c:out value='15:10:11'/>
	               		<span id="spanDday<c:out value='15:10:11'/>"></span>
	               </div>
            </div>
            <div class="swiper-slide">
               <img src="http://ktsmemo.cdn3.cafe24.com/p/0484.jpg">
                  <div>
	                	<span>D-day</span> 
	                	<c:out value='15:10:11'/>
	               		<span id="spanDday<c:out value='15:10:11'/>"></span>
	               </div>
            </div>
            <div class="swiper-slide">
               <img src="https://ktsmemo.cafe24.com/p/0600.jpg">
                  <div>
	                	<span>D-day</span> 
	                	<c:out value='15:10:11'/>
	               		<span id="spanDday<c:out value='15:10:11'/>"></span>
	               </div>
            </div>
            <div class="swiper-slide">
               <img src="http://ktsmemo.cdn3.cafe24.com/p/0785.jpg">
                  <div>
	                	<span>D-day</span> 
	                	<c:out value='15:10:11'/>
	               		<span id="spanDday<c:out value='15:10:11'/>"></span>
	               </div>
            </div>
            <div class="swiper-slide">
               <img src="https://ktsmemo.cafe24.com/p/0526.jpg">
                  <div>
	                	<span>D-day</span> 
	                	<c:out value='15:10:11'/>
	               		<span id="spanDday<c:out value='15:10:11'/>"></span>
	               </div>
            </div>
         </div>
         

         <!-- 네비게이션 -->
         <div class="swiper-button-next"></div>
         <!-- 다음 버튼 (오른쪽에 있는 버튼) -->
         <div class="swiper-button-prev"></div>
         <!-- 이전 버튼 -->

         <!-- 페이징 -->
         <div class="swiper-pagination"></div>
      </div>
      <script>
         new Swiper('.swiper2', {

            slidesPerView : 5, // 동시에 보여줄 슬라이드 갯수
            spaceBetween : 30, // 슬라이드간 간격
            slidesPerGroup : 5, // 그룹으로 묶을 수, slidesPerView 와 같은 값을 지정하는게 좋음

            // 그룹수가 맞지 않을 경우 빈칸으로 메우기
            // 3개가 나와야 되는데 1개만 있다면 2개는 빈칸으로 채워서 3개를 만듬
            loopFillGroupWithBlank : true,

            loop : true, // 무한 반복

            pagination : { // 페이징
               el : '.swiper-pagination',
               clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
            },
            navigation : { // 네비게이션
               nextEl : '.swiper-button-next', // 다음 버튼 클래스명
               prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
            },
         });

         new Swiper('.swiper1', {
            loop : true,
            pagination : { // 페이징 설정
               el : '.swiper-pagination',
               clickable : true, // 페이징을 클릭하면 해당 영역으로 이동, 필요시 지정해 줘야 기능 작동
            },
            navigation : { // 네비게이션 설정
               nextEl : '.swiper-button-next', // 다음 버튼 클래스명
               prevEl : '.swiper-button-prev', // 이번 버튼 클래스명
            },
         });
      </script>
   </div>
</body>
</html>
   <%@ include file="footer.jsp" %>