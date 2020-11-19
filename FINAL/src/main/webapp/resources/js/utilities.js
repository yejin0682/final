function checkUserId(ID) {

  var idRegExp = /^[a-zA-z0-9]{4,10}$/; 
  if (!idRegExp.test(ID)) {
      alert("아이디는 영문 대소문자와 숫자 4~10자리로 입력해야합니다!");
      return false;
  }	
  return true;
}

function checkPassword(pw) {

var password1RegExp = /^[a-zA-z0-9]{4,20}$/; //비밀번호 유효성 검사
if (!password1RegExp.test(pw)) {
    alert("비밀번호는 영문 대소문자와 숫자 4~20자리로 입력해야합니다!");
    return false;
}

return true; //확인이 완료되었을 때
}   

function checkMail(email) {

var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
if (!emailRegExp.test(email)) {
    alert("이메일 형식이 올바르지 않습니다!");
    return false;
}
return true; //확인이 완료되었을 때
}

function checkAll() {
if (!checkUserId($('form')[0].ID.value)) {
    return false;
} else if (!checkPassword($('form')[0].pw.value, $('form')[0].pw2.value)) {
    return false;
} else if (!checkMail($('form')[0].email.value)) {
    return false;
} 

handleData();
return true;
}

function searchPostcode(){
  $("input[name='zonecode']").click(function(){

    new daum.Postcode({
      oncomplete: function(data) {
      	$("input[name='zonecode']").val(data.zonecode);
        $("input[name='addr']").val(data.address);
      }
    }).open();
  });
}

  
