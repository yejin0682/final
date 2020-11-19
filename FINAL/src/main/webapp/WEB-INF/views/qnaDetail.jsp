<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
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
<script>
   function ajax_write(ref,level,step,comment,userid){
      var commentData={
            qbno : $("#qbno").val(),
            comment : comment,
            /*ref : $("#ref").val(),*/
            ref : ref,
            level :level,
            step: step,
            userid : $("#userid").val()
      };
      
      $.ajax({
         url:'rest/writecomment',
         type:'post',
         data :JSON.stringify(commentData),
         //dataType:'json', 200에러일때 빼야함.. 400에러 url 405에러 post/get 415에러 contentType 필수속성
         contentType :'application/json',
         success : function(response){
            //alert("성공");
            //comment = response;
            if(response.level==0){
               var str="<li class='topLi'>";
               str+="<div class='commentDiv' style='margin-left: 330px;'>";
               str+="<span style='float: left;'>"+response.userid+"</span><br/>"
               str+="<span style='float: left; font-size: 12px; color: #cccccc;'>"+response.date+"</span><br/>";
               str+="<span style='float: left;'>"+response.comment+"</span><br/></div>";
               str+="<div class='reCommentWrite' style='margin-top: 5px; margin-left :330px;'><span id='more' class='more'>답글작성</span></div><br/>";
               str+="<div class='openReComment' style='margin-left: 330px;'>";
               str+="<div class='reCommentMenu"+response.ref+"'></div>";
               str+="<textarea rows='5' cols='50' id='comment' class='comment' style='margin-left: 20px; width:780px; height:50px;'></textarea>";
               str+="<input type='button' value='등록' id='commentBtn' class='commentBtn'/>";
               str+="<input type='hidden' value='"+response.ref+"' id='ref'/>";
               str+="<input type='hidden' value='"+(response.level+1)+"' id='level'/>";
               str+="<input type='hidden' value='1' id='step'/>";
               str+="</div>";
               str+="</li>";
               $(".topUl").append(str);
            }else if(response.level==1){
               var str="<div class='reComment'>"
              		str+="<span style='margin-left: 20px;'>"+response.userid+"</span>";
                   str+="<span style='font-size: 12px; color: #cccccc; margin-left: 20px;'>"+response.date+"</span><br/>";
              		str+="<span style='margin-left: 20px;'>"+response.comment+"</span></div><br/>";
               $(".reCommentMenu"+response.ref).append(str);
            }
         },
         error :function(xhr, status, error) {
                alert("에러!");
                alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
            }
      });
   }
   
   $(document).ready(function(){
      /*$('.commentBtn').click(function(){
         //alert(commentData["qbno"]);
         //alert($("#qbno").val()+","+$("#comment").val());//잘뜬다....
         var ref= $(this).parent().find("input#ref").val();
         var   level =$(this).parent().find("input#level").val();
         var   step= $(this).parent().find("input#step").val();
         var comment = $(this).parent().find("textarea#comment").val();
         ajax_write(ref,level,step,comment);
      });*/
/*       $(".more").click(function(){
         //$("#reCommentTable").toggle();
         //alert($(this).parent().parent().attr("class"));
         $(this).parent().parent().find("div.openReComment").toggle();
      });
       */
       /*
      $(".comment").keydown(function(key) {
           //키의 코드가 13번일 경우 (13번은 엔터키)
           if (key.keyCode == 13) {
             var ref= $(this).parent().find("input#ref").val();
            var ref= $(this).parent().find("input#ref").val();
            var   level =$(this).parent().find("input#level").val();
            var   step= $(this).parent().find("input#step").val();
            var comment = $(this).parent().find("textarea#comment").val();
            ajax_write(ref,level,step,comment);
           }
       });
       */
   });

   
    $(document).on("click","span.more",function(){
        $(this).parent().parent().find("div.openReComment").toggle();
   });
    $(document).on("click","input[class='commentBtn']",function(){
         var ref= $(this).parent().find("input#ref").val();
         var   level =$(this).parent().find("input#level").val();
         var   step= $(this).parent().find("input#step").val();
         var comment = $(this).parent().find("textarea#comment").val();
         ajax_write(ref,level,step,comment,userid);
         $('.comment').val('');
   });
    $(document).on("keydown","textarea.comment",function(key){
       if (key.keyCode == 13) {
             var ref= $(this).parent().find("input#ref").val();
            var ref= $(this).parent().find("input#ref").val();
            var   level =$(this).parent().find("input#level").val();
            var   step= $(this).parent().find("input#step").val();
            var comment = $(this).parent().find("textarea#comment").val();
            ajax_write(ref,level,step,comment,userid);
         $('.comment').val('');
       }
   });
</script>
<style>
   #submenu{
      /*visibility: hidden;*/
   }
   #opensubmenu >td{
   }
   #reComment{
      display: none;
   }
   #more > a{
      text-decoration: none;
      
   }
   ul{
      list-style: none;
   }
   .openReComment{
      display : none;
   }
   table{
      margin-left: 25%;
      margin-top: 200px;
      width: 1000px;
      padding: 10px;
   }
   th{
      border-top: 1px solid black;
      border-bottom: 1px solid black;
      padding: 10px;
   }
   td{
      padding: 10px;
      text-align: center;
      padding-bottom: 20px;
      height: 100px;
   }
</style>
</head>
<body>
   <table>
      <tr>
      <th style="width: 100px;">${detail.qbno}</th>   
      <th style="">${detail.title}</th>
      <th style="width: 200px;">${detail.writedate}</th>
      </tr>

      <tr>
      <td style="width: 100px;"></td>                                             
      <td style=" text-align: left;">${detail.content}</td>      
      <td style="">조회수 : ${detail.hitcount}</td>
      </tr>
   </table>
   <div style="float: right;  margin-right: 25%;">
      <input type="button" value="삭제" onclick="location.href='deleteBoard?qbno=${detail.qbno}&id=${member.ID}'"/>
      <input type="button" value="수정" onclick="location.href='modifyBoard?qbno=${detail.qbno}&id=${member.ID}'"/>
      <input type="button" value="목록" id="board" onclick="location.href='qnaBoard?offset=0'"/>
      </div>
   <br/>
   
   <div class='dd' style="margin-left: 30%; margin-top: 5%;">
      <textarea rows="5" cols="50" id="comment" class="comment" style="width: 800px; height: 50px;
      vertical-align: middle;"></textarea>
      <input type="button" value="등록" id="commentBtn" class="commentBtn"/>   <!-- level=0 -->
      <input type="hidden" value="0" id="ref"/>
      <input type="hidden" value="0" id="level"/>
      <input type="hidden" value="0" id="step"/>
      
   </div>
   
   <ul class="topUl" style="margin-left: 12%;">
      <c:forEach items="${comment}" var="comment">
         <li class="topLi">
            <c:if test="${comment.level eq 0 }">
               <div class="commentDiv" style="margin-left: 330px;">
                  <span style="float: left;">${comment.userid}</span><br/>         
                  <span style="float: left; font-size: 12px; color: #cccccc;">${comment.date }</span><br/>
                  <span style="float: left;">${comment.comment}</span><br/>         
               </div>
               <div class="reCommentWrite" style="margin-top: 5px; margin-left: 330px;"><span id="more" class="more">답글작성</span></div>
               <br/>
            
               <div class="openReComment" style="margin-left: 330px;">
                  <div class="reCommentMenu${comment.ref}">
                     <c:forEach items="${reComment}" var="reComment">
                        <c:if test="${comment.cno eq reComment.ref}">
                           <div class="reComment"><!--  → -->
                           <span style="margin-left: 20px;">${reComment.userid}</span><br/>
                           <span style="font-size: 12px; color: #cccccc; margin-left: 20px;">${reComment.date}</span><br/>
                           <span style="margin-left: 20px;">${reComment.comment}</span>
                           </div><br/>
                        </c:if>
                     </c:forEach>
                  </div>
                  <textarea rows="5" cols="50" id="comment" class="comment" style="margin-left: 20px;
                  width: 780px; height: 50px;"></textarea>
                  <input type="button" value="등록" id="commentBtn" class="commentBtn"
                  style="margin-top: -20px;"/>
                  <input type="hidden" value="${comment.cno}" id="ref"/>
                  <input type="hidden" value="${comment.level+1}" id="level"/>
                  <input type="hidden" value="1" id="step"/>
               </div>
            </c:if>
         </li>
      </c:forEach>
   </ul>
   	<input type="hidden" value="${member.ID}" id="userid"/>
    <input type="hidden" value="${detail.qbno}" id="qbno"/>
</body>
<%@ include file="footer.jsp" %>
</html>