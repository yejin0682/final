<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
   function ajax_write(ref,level,step,comment){
      var commentData={
            qbno : $("#qbno").val(),
            comment : comment,
            /*ref : $("#ref").val(),*/
            ref : ref,
            level :level,
            step: step
      };
      
      $.ajax({
         url:'http://localhost:9091/final/rest/writecomment',
         type:'post',
         data :JSON.stringify(commentData),
         //dataType:'json', 200에러일때 빼야함.. 400에러 url 405에러 post/get 415에러 contentType 필수속성
         contentType :'application/json',
         success : function(response){
            //alert("성공");
            //comment = response;
            var str="";
            str+="<tr>";
            str+="<td>"+response.comment+"</td>";
            str+="</tr>";
            $("#commentTable").append(str);
         },
         error :function(xhr, status, error) {
                alert("에러!");
                alert("code:"+xhr.status+"\n"+"message:"+xhr.responseText+"\n"+"error:"+error);
            }
      });
   }

   $(document).ready(function(){
      $('.commentBtn').click(function(){
         //alert(commentData["qbno"]);
         //alert($("#qbno").val()+","+$("#comment").val());//잘뜬다....
         //alert($(this).parent().find("input#ref").val());
         var ref= $(this).parent().find("input#ref").val();
         var   level =$(this).parent().find("input#level").val();
         var   step= $(this).parent().find("input#step").val();
         var comment = $(this).parent().find("textarea#comment").val();
         ajax_write(ref,level,step,comment);
      })

   });
</script>

<style>
  
   #opensubmenu >td{
   }
   #reComment{
      display: none;
   }
</style>
<script>
	$(function(){
			$("#more").click(function(){
					$("#reCommentTable").toggle();
				});
		});
	$('.commentBtn').click(function(){
		alert("성공")
	});
	$('#textarea').keydown(function(event){
	     if ( event.keyCode == 13 ) {
	         $('.commentBtn').click();
	         return true;	
	     }
	});

    //모든 페이지가 요청이 되었을 때
    $(document).ready(function() {
        $("#comment").keydown(function(key) {
            //키의 코드가 13번일 경우 (13번은 엔터키)
            if (key.keyCode == 13) {
                //경고창을 출력한다.
                alert("엔터키를 눌렀습니다.");
            }
        });
    });
</script>
</head>
<body>
  
   <br/>
   <table id="commentTable">
      <tr>        
         <td id="opensubmenu">
         <span id="more" style="CURSOR:hand">답글작성</span>
         </td>
      </tr>      
      <div id="reComment">
         <table id="reCommentTable">
            <tr>
            <td id="submenu">
               <textarea rows="5" cols="50" id="comment"></textarea>
               <input type="button" value="등록" id="commentBtn" class="commentBtn"/>
               <input type="hidden" value="${comment.ref}" id="ref"/>
               <input type="hidden" value="${comment.level+1}" id="level"/>
               <input type="hidden" value="1" id="step"/>
               
               
               <form action="">
               		<p>1</p>
               </form>
            </td></tr>
         </table>
      </div>
   </table>
   <div id='dd'>
      <textarea rows="5" cols="50" id="comment"></textarea>
      <input type="button" value="등록" id="commentBtn" class="commentBtn"/>   <!-- level=0 -->
      <input type="hidden" value="0" id="ref"/>
      <input type="hidden" value="0" id="level"/>
      <input type="hidden" value="0" id="step"/>
   </div>
      <input type="hidden" value="${detail.qbno}" id="qbno"/>
</body>
</html>