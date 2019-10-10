function memberInfoChangeCheck(){
	var memId = document.getElementById("memId").textContent;
	var memPass = document.getElementById("memPass").value;
	var memPassCheck = document.getElementById("memPassCheck").value;
	var passCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
	var email = document.getElementById("memEmail").value;
	var emailCheck = /^[_a-zA-Z0-9]+([-+.][_a-zA-Z0-9]+)*@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/i;
	var phone = document.getElementById("memPhone").value;
	var phoneCheck = /(01[0|1|6|9|7])(\d{3}|\d{4})(\d{4}$)/g;
	var birth = document.getElementById("memBirth").value;
	var birthCheck = /^[0-9]+$/;
    var year = Number(birth.substr(0,4)); 
    var month = Number(birth.substr(4,2));
    var day = Number(birth.substr(6,2));
    var today = new Date(); // 날짜 변수 선언
    var yearNow = today.getFullYear();
    var adultYear = yearNow-14;
    var detailAddress = document.getElementById("memDetailAddress").value;
    var form = document.getElementById("memberInfoForm");
	if(memPass != memPassCheck){
		alert("비밀번호가 일치하지 않습니다.");
	}else if(passCheck.test(memPass)){
		alert("영문,숫자,특수문자 조합 8~25자로 작성해야합니다.");
	}else if(/(\w)\1\1\1/.test(memPass)){
		alert("같은 문자를 4번 이상 사용하실 수 없습니다.");
	}else if(memId != null && memPass.search(memId) > -1){
		alert("비밀번호에 아이디가 포함되었습니다.");
	}else if(email == ""){
		alert("이메일을 입력해 주세요.");
	}else if(emailCheck.test(email)==false){
		alert("이메일 형식이 아닙니다.");
	}else if(phone == ""){
		alert("전화번호를 적어주세요.");
	}else if(phone.length != 11){
		alert("전화번호 형식이 아닙니다.");
	}else if(phoneCheck.test(phone)==false){
		alert("전화번호 형식이 아닙니다.");
	}else if(birth == ""){
		alert("생년월일을 적어주세요.");
    }else if(birthCheck.test(birth)==false){
    	alert("숫자만 적어주세요.");
    }else if(birth.length < 4){
    	alert("년도를 적어주세요.");
    }else if(birth.length < 6){
    	alert("월을 적어주세요.");
    }else if(birth.length < 8){
    	alert("일을 적어주세요.");
	}else if(birth.length >= 9){
		alert("날짜 형식이 아닙니다.");
	}else if (year < 1900 || year > adultYear){
		alert("년도를 확인하세요. "+adultYear+"년생 이전 출생자만 등록 가능합니다.");
    }else if (month < 1 || month > 12) {
    	alert("월은 1월부터 12월까지 입력 가능합니다.");
	}else if(day < 1 || day > 31) {
		alert("일은 1일부터 31일까지 입력가능합니다.");
	}else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
		alert(month+"월은 31일이 존재하지 않습니다.");
	}else if (month == 2) {
		var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
		if (day>29 || (day==29 && !isleap)) {
			alert(year + "년 2월은  " + day + "일이 없습니다.");
		}
	}else if(detailAddress == "" || detailAddress == null){
		alert("주소를 입력해주세요.");
	}else{
		form.submit();
	}
	
}
//우편번호찾기 팝업창 띄우기
function postcode(){
	url = "WTMember/WTPostcode.jsp";
	var ret = window.open(url,"_blank","toolbar=no, scrollbars=yes",false);
}
//우편번호찾기 버튼
function addressSearch(){
	if(document.getElementById("memAddress").value=""){
		alert("검색할 주소를 넣어주세요.");
	}else{
		document.addressSearchForm.submit();
	}
}
