//로그인 공백 검사
function loginNullCheck(){
	//입력한 아이디
	memId = document.LoginForm.memId
	//입력한 패스워드
	memPass =  document.LoginForm.memPass
	
	//입력한 아이디나 패스워드가 공백일 경우
	if(document.LoginForm.memId.value == ""){
		alert("아이디를 입력해주세요.");
		document.LoginForm.memId.focus();	
	}else if(document.LoginForm.memPass.value == ""){
		alert("패스워드를 입력해주세요.");
		document.LoginForm.memPass.focus();
	}else{
		document.getElementById("backURL").value=document.referrer;
		document.LoginForm.submit();
	}
}