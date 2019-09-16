//메인으로
function mainBack(){
	location.href="../WatTime/WTMain.jsp"
}
//아이디 찾기 공백 검사
function idFindNullCheck(){
	if(document.idFindForm.memName.value == ""){
		alert("이름을 입력해주세요.");
		document.idFindForm.memName.focus();
	}else if(document.idFindForm.memEmail.value == ""){
		alert("이메일을 입력해주세요.");
		document.idFindForm.memEmail.focus();
	}else if(document.idFindForm.memPhone.value == ""){
		alert("전화번호를 입력해주세요.");
		document.idFindForm.memPhone.focus();
	}else{
		document.idFindForm.submit();
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