function withdrawalSubmit(){
	var checkText = document.getElementById("checkText").value;
	var withdrawalPass = document.getElementById("withdrawalPass").value;
	if(checkText != "회원탈퇴"){
		alert("동의 단어가 틀렸습니다.");
	}else if(withdrawalPass == "" || withdrawalPass ==null){
		alert("비밀번호를 입력해주세요.");
	}else{
		var form = document.getElementById("withdrawalForm");
		form.submit();
	}
}