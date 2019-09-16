//메인으로
function mainBack(){
	location.href="../WatTime/WTMain.jsp"
}

//패스워드 찾기 공백 검사
function passFindNullCheck(){
	if(document.passFindForm.memId.value == ""){
		alert("아이디를 입력해주세요.");
		document.passFindForm.memId.focus();
	}else if(document.passFindForm.memEmail.value == ""){
		alert("이메일을 입력해주세요.");
		document.passFindForm.memEmail.focus();
	}else if(document.passFindForm.memPhone.value == ""){
		alert("전화번호를 입력해주세요.");
		document.passFindForm.memPhone.focus();
	}else{
		document.passFindForm.submit();
	}
}
//새 패스워드 공백 검사
function newPassCheck(){
	var check = !/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
	var memId = document.getElementById("memId").value;
	var memPass = document.getElementById("memPass").value;
	var memPassCheck = document.getElementById("memPassCheck").value;
	
	if(memPass == null || memPass == ""){
		alert("패스워드가 공백입니다.");
	}else if(memPassCheck == null || memPassCheck == ""){
		alert("패스워드 확인이 공백입니다.");
	}else if(memPass != memPassCheck){
		alert("비밀번호가 일치하지 않습니다.");
	}else if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(memPass)){
		alert("영문,숫자,특수문자 조합 8~25자로 작성해야합니다.");
	}else if(/(\w)\1\1\1/.test(memPass)){
		alert("같은 문자를 4번 이상 사용하실 수 없습니다.");
	}else if(memId != null && memPass.search(memId) > -1){
		alert("비밀번호에 아이디가 포함되었습니다.");
	}else{
		document.newPassForm.submit();
	}
}
//아이디 찾기
function idFind(){
	location.href="WTMain.jsp?pageChange=WTMember/WTMemberIdFind.jsp"
}
//패스워드 찾기
function passFind(){
	location.href="WTMain.jsp?pageChange=WTMember/WTMemberPassFind.jsp"
}