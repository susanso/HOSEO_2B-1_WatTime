////회원가입 화면
//아이디  관련
function idOnkey(){
	document.memJoinForm.idHidden.value = "no";
	document.getElementById("idCheckText").textContent="중복확인 해주세요."
}
function idOverlapCheck(){
	//아이디 공백 확인
	var memId =document.memJoinForm.memId.value;
	var check = /^[A-za-z0-9]/g;
	var space = " ";
	if(memId == null || memId == ""){
		alert("아이디를 입력해주세요.");
	}else if(memId.indexOf(" ") != -1){
		alert("아이디에 공백이 있습니다.");
	}else if(memId.length < 6 || memId.length > 15){
		alert("아이디는 최소 6자 최대 15자 입니다.");
	}else if(check.test(memId) == false){
		alert("아이디는 영문과 숫자만 사용 가능합니다.");
	}else{
		url = "WTMemberIdOverlapCheck.jsp?id="+document.memJoinForm.memId.value
		var ret = window.open(url,"_blank","toolbar=no",false)
	}
}

function idReOverlapCheck(){
	var memId = document.getElementById("memId").value;
	var check = /^[A-za-z0-9]/g;
	var space = " ";
	if(memId == null || memId == ""){
		alert("아이디를 입력해주세요.");
	}else if(memId.indexOf(" ") != -1){
		alert("아이디에 공백이 있습니다.");
	}else if(memId.length < 6 || memId.length > 15){
		alert("아이디는 최소 6자 최대 15자 입니다.");
	}else if(check.test(memId) == false){
		alert("아이디는 영문과 숫자만 사용 가능합니다.");
	}else{
		url = "WTMemberIdOverlapCheck.jsp?id="+document.getElementById("memId").value
		var ret = window.open(url,"_self","toolbar=no",false)
	}
}
//아이디 사용
function useMemId(){
	var memId = document.getElementById("useMemIdHD").value
	opener.document.getElementById("memId").value = memId;
	opener.document.getElementById("idHidden").value = "yes";
	opener.document.getElementById("idCheckText").textContent=""
	window.close();
}
//비밀번호
function passSameCheck(){
	var memPass = document.memJoinForm.memPass.value;
	var memPassCheck = document.memJoinForm.memPassCheck.value;
	
	if(memPass == null || memPass == ""){
		document.getElementById("passCheckText").textContent = "패스워드가 공백입니다."
	}else if(memPassCheck == null || memPassCheck == ""){
		document.getElementById("passCheckText").textContent = "패스워드 확인이 공백입니다."
	}else if(memPass != memPassCheck){
		document.getElementById("passCheckText").textContent = "비밀번호가 일치하지 않습니다."
	}else{
		document.getElementById("passCheckText").textContent = ""
	}
}
/*이름 유효성 검사*/
function nameCheck(){
	var check = /^[가-힣]+$/;
	var name = document.getElementById("userName").value;
	if(name == ""){
		document.getElementById("nameCheckText").textContent="이름을 입력해주세요.";
		document.getElementById("userNameResult").value="";
	}else{
		if(check.test(name)==false){
			document.getElementById("nameCheckText").textContent="이름을 다시 입력해주세요.";
			document.getElementById("userNameResult").value="";
		}else{
			document.getElementById("nameCheckText").textContent="";
			document.getElementById("userNameResult").value="check";
		}
	}
	
}

/*비밀번호 유효성 검사*/
function passCheck(){
	var id = document.getElementById("userId").value;
	var pass = document.getElementById("userPass").value;
	var passCheck = document.getElementById("userPassCheck").value;
	if(pass ==""){
		document.getElementById("passCheckText").textContent="비밀번호를 입력해주세요.";
	}else if(passCheck==""){
		document.getElementById("passCheckText").textContent="비밀번호 확인을 입력해주세요.";
	}else{
		if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/.test(pass)){            
			document.getElementById("passCheckText").textContent="숫자, 영문자, 특수문자 조합으로 8자리 이상 사용해야 합니다.";
	        return false;
	    }  
	
	    var checkNumber = pass.search(/[0-9]/g);
	    var checkEnglish = pass.search(/[a-z]/ig);
	    if(checkNumber <0 || checkEnglish <0){
	    	document.getElementById("passCheckText").textContent="숫자와 영문자를 혼용하여야 합니다.";
	        return false;
	    }
	    if(/(\w)\1\1\1/.test(pass)){
	    	document.getElementById("passCheckText").textContent="같은 문자를 4번 이상 사용하실 수 없습니다.";
	        return false;
	    }
	    if(id != ""){
		    if(pass.search(id) > -1){
		    	document.getElementById("passCheckText").textContent="비밀번호에 아이디가 포함되었습니다.";
		        return false;
		    }
	    }
	    
	    if(pass == passCheck){
	    	document.getElementById("passCheckText").textContent="";
	    	document.getElementById("userPassResult").value="check";
	    }else if(pass != passCheck){
	    	document.getElementById("passCheckText").textContent="비밀번호가 일치하지 않습니다.";
	    }
	}
    return true;
}
/*생년월일 유효성 검사*/
function birthCheck() {
	var birth = document.getElementById("userBirth").value
	var check = /^[0-9]+$/;
    var year = Number(birth.substr(0,4)); 
    var month = Number(birth.substr(4,2));
    var day = Number(birth.substr(6,2));
    var today = new Date(); // 날자 변수 선언
    var yearNow = today.getFullYear();
    var adultYear = yearNow-14;
    if(birth == ""){
    	document.getElementById("birthCheckText").textContent="생년월일을 적어주세요.";
    }else if(check.test(birth)==false){
    	document.getElementById("birthCheckText").textContent="숫자만 적어주세요.";
    }else{
	    if (year < 1900 || year > adultYear){
	    	document.getElementById("birthCheckText").textContent="년도를 확인하세요. "+adultYear+"년생 이전 출생자만 등록 가능합니다.";
	         return false;
	    }
	    if (month < 1 || month > 12) { 
	    	document.getElementById("birthCheckText").textContent="달은 1월부터 12월까지 입력 가능합니다.";
	         return false;
	    }
	   if (day < 1 || day > 31) {
		    document.getElementById("birthCheckText").textContent="일은 1일부터 31일까지 입력가능합니다.";
	         return false;
	    }
	    if ((month==4 || month==6 || month==9 || month==11) && day==31) {
	    	document.getElementById("birthCheckText").textContent= month+"월은 31일이 존재하지 않습니다.";
	         return false;
	    }
	    if (month == 2) {
	         var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
	         if (day>29 || (day==29 && !isleap)) {
	        	 document.getElementById("birthCheckText").textContent=year + "년 2월은  " + day + "일이 없습니다.";
	              return false;
	         }
	    }
	    return true;
    }
}
/*이메일 유효성 검사*/
function emailCheck(){
	var email = document.getElementById("userEmail").value;
	var check = /^[_a-zA-Z0-9]+([-+.][_a-zA-Z0-9]+)*@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/i;
	if(email == ""){
		document.getElementById("emailCheckText").textContent="이메일을 입력해 주세요.";
	}else{
		if(check.test(email)==false){
			document.getElementById("emailCheckText").textContent="이메일 형식이 아닙니다.";
		}else{
			document.getElementById("emailCheckText").textContent="";
		}
	}
}
/*전화번호 유효성 검사*/
function phoneCheck(){
	var phone = document.getElementById("userPhone").value;
	var check = /(01[0|1|6|9|7])(\d{3}|\d{4})(\d{4}$)/g;
	if(phone == ""){
		document.getElementById("phoneCheckText").textContent="전화번호를 적어주세요.";
	}else{
		if(check.test(phone)==false){
			document.getElementById("phoneCheckText").textContent="전화번호 형식이 아닙니다.";
		}else{
			document.getElementById("phoneCheckText").textContent="";
		}
	}
}
//회원가입 버튼
function joinMember(){
	ducument.memJoinForm.submit();
}

////로그인 화면
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
		document.LoginForm.submit();
	}
}
////아이디 찾기 화면
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
////패스워드 찾기 화면
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
function newPassNullCheck(){
	if(document.newPassForm.memPass.value == ""){
		alert("새 패스워드를 입력해주세요.");
		document.newPassForm.memPass.focus();
	}else if(document.newPassForm.memPassCheck.value == ""){
		alert("새 패스워드 확인을 입력해주세요.");
		document.newPassForm.memPassCheck.focus();
	}else if(document.newPassForm.memPassCheck.value != document.newPassForm.memPass.value){
		alert("패스워드가 일치하지 않습니다.");
		document.newPassForm.memPassCheck.focus();
	}else{
		document.newPassForm.submit();
	}
}
//메인으로 가는 메소드
function mainBack(){
	location.href="../WatTime/WTMain.jsp"
}
//아이디 찾기
function idFind(){
	location.href="../WatTime/WTMemberIdFind.jsp"
}
//패스워드 찾기
function passFind(){
	location.href="../WatTime/WTMemberPassFind.jsp"
}
//로그인
function loginPage(){
	location.href="../WatTime/WTLogin.jsp"
}
