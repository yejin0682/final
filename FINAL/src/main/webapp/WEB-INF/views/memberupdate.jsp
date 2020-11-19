<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">   
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="resources/js/jquery-3.5.1.min.js"></script>
  <script src="resources/js/jquery-ui.min.js"></script>
  <script src="resources/js/memberupdate/data.js"></script>
<script src="resources/js/memberupdate/jquery-custom-ui.js"></script>
<script src="resources/js/memberupdate/main.js"></script>
<script src="resources/js/memberupdate/utilities.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>회원정보 수정</title>
</head>
   <script type="text/javascript">
      $(document).ready(function(){
         // 취소
         $(".cencle").on("click", function(){
            
            location.href = "myPage";
                      
         })
      
         $("#submit").on("click", function(){
            if($("#pw").val()==""){
               alert("비밀번호를 입력해주세요.");
               $("#pw").focus();
               return false;
            }
            if($("#name").val()==""){
               alert("성명을 입력해주세요.");
               $("#name").focus();
               return false;
            }
         });
         
            
         
      })
      searchPostcode();
   </script>
<style>
   th{
      padding: 10px;
      font-size: 20px;
   }
   input{
      width: 300px;
      height: 30px;
   }
   
</style>
<body>

	<button onclick="location.href='myPage'" class="btn btn-link">뒤로가기</button>
   <form action = "memberaction" style="margin-left: 43%; margin-top: 200px;">
   <table>
  
      <div class="form-group has-feedback">
       <tr>
               <th><label class="control-label" for="ID">아이디</label></th>
               <td><input class="form-control" type="text" id="ID" name="ID" value="${member.ID}" readonly="readonly"/></td>
      </div>  
    <tr>
       
            <div class="form-group has-feedback">
               <th><label class="control-label" for="pw">패스워드</label></th>
             <td> <input class="form-control" type="password" id="pw" name="pw" /></td>
            </div>
    </tr>
    <tr>
            <div class="form-group has-feedback">
               <th><label class="control-label" for="name">성명</label></th>
               <td><input class="form-control" type="text" id="name" name="name" value="${member.name}"/></td>
            </div>
    </tr>
    <tr>
            <div class="form-group has-feedback">
               <th><label class="control-label" for="zonecode">우편번호</label></th>
               <td><input class="form-control" type="text" id="zonecode" name="zonecode" value="${member.zonecode}"/></td>
            </div>
    </tr>
    <tr>
            <div class="form-group has-feedback">
               <th><label class="control-label" for="addr">주소</label></th>
               <td><input class="form-control" type="text" id="addr" name="addr" value="${member.addr}"/></td>
            </div>
    </tr>
    <tr>
            <div class="form-group has-feedback">
               <th><label class="control-label" for="addrdetail">상세주소</label></th>
               <td><input class="form-control" type="text" id="addrdetail" name="addrdetail" value="${member.addrdetail}"/></td>
            </div>
    </tr>
    <tr>
            <div class="form-group has-feedback">
               <th><label class="control-label" for="phonenum">전화번호</label></th>
               <td><input class="form-control" type="text" id="phonenum" name="phonenum" value="${member.phonenum}"/></td>
            </div>
    </tr>
    <tr>
            <div class="form-group has-feedback">
               <th><label class="control-label" for="email">이메일</label></th>
               <td><input class="form-control" type="text" id="email" name="email" value="${member.email}"/></td>
            </div>
    </tr>        
    </table>
            <div class="form-group has-feedback">
               <button class="btn btn-success" type="submit" id="submit" 
               style=" margin-top: 10px; margin-left: 10px; width: 140px; height: 50px;">회원정보수정</button>
               <button class="cencle btn btn-danger" type="button" style=" margin-top: 10px; margin-left: 10px; width: 140px; height: 50px;">취소</button>
            </div>
    
       
   </form>
</body>
</html>