////회원가입 화면
//아이디  관련
function idOnkey(){
	document.memJoinForm.idHidden.value = "no";
	document.getElementById("idCheckText").textContent="중복확인 해주세요.";
}
function idOverlapCheck(){
	//아이디 유효성 검사
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
//중복확인 팝업 안에서 실행 
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
		var ret = window.open(url,"_self","width=1, height=1, scrollbars=no, resizable=no, toolbars=no, menubar=no",false)
		w = window.outerWidth - window.innerWidth;
		h = window.outerHeight - window.innerHeight;
		ret.resizeTo(w,h)
	}	
}
//아이디 사용
function useMemId(){
	var memId = document.getElementById("useMemIdHD").value
	opener.document.getElementById("memId").value = memId;
	opener.document.getElementById("idHidden").value = "yes";
	opener.document.getElementById("idCheckText").textContent=""
	window.close();
	call(passCheck());
}
//패스워드 유효성 검사
function passCheck(){
	var check = !/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
	var memId = document.getElementById("memId").value;
	var memPass = document.getElementById("memPass").value;
	var memPassCheck = document.getElementById("memPassCheck").value;
	
	if(memPass == null || memPass == ""){
		document.getElementById("passCheckText").textContent = "패스워드가 공백입니다.";
		document.getElementById("passHidden").value = "no";
	}else if(memPassCheck == null || memPassCheck == ""){
		document.getElementById("passCheckText").textContent = "패스워드 확인이 공백입니다.";
		document.getElementById("passHidden").value = "no";
	}else if(memPass != memPassCheck){
		document.getElementById("passCheckText").textContent = "비밀번호가 일치하지 않습니다.";
		document.getElementById("passHidden").value = "no";
	}else if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(memPass)){
		document.getElementById("passCheckText").textContent = "영문,숫자,특수문자 조합 8~25자로 작성해야합니다.";
		document.getElementById("passHidden").value = "no";
	}else if(/(\w)\1\1\1/.test(memPass)){
		document.getElementById("passCheckText").textContent = "같은 문자를 4번 이상 사용하실 수 없습니다.";
		document.getElementById("passHidden").value = "no";
	}else if(memId != null && memPass.search(memId) > -1){
		document.getElementById("passCheckText").textContent = "비밀번호에 아이디가 포함되었습니다.";
		document.getElementById("passHidden").value = "no";
	}else{
		document.getElementById("passCheckText").textContent = "";
		document.getElementById("passHidden").value = "yes";
	}
}
//이름 유효성 검사
function nameCheck(){
	var check = /^[가-힣]+$/;
	var name = document.getElementById("memName").value;
	if(name == ""){
		document.getElementById("nameCheckText").textContent="이름이 공백입니다.";
		document.getElementById("nameHidden").value="no";
	}else{
		if(check.test(name)==false){
			document.getElementById("nameCheckText").textContent="이름을 다시 입력해주세요.";
			document.getElementById("nameHidden").value="no";
		}else{
			document.getElementById("nameCheckText").textContent="";
			document.getElementById("nameHidden").value="yes";
		}
	}
	
}
//이메일 유효성
function emailCheck(){
	var email = document.getElementById("memEmail").value;
	var check = /^[_a-zA-Z0-9]+([-+.][_a-zA-Z0-9]+)*@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/i;
	if(email == ""){
		document.getElementById("emailCheckText").textContent="이메일을 입력해 주세요.";
		document.getElementById("emailHidden").value="no";
	}else{
		if(check.test(email)==false){
			document.getElementById("emailCheckText").textContent="이메일 형식이 아닙니다.";
			document.getElementById("emailHidden").value="no";
		}else{
			document.getElementById("emailCheckText").textContent="";
			document.getElementById("emailHidden").value="yes";
		}
	}
}
//전화번호 유효성
function phoneCheck(){
	var phone = document.getElementById("memPhone").value;
	var check = /(01[0|1|6|9|7])(\d{3}|\d{4})(\d{4}$)/g;
	if(phone == ""){
		document.getElementById("phoneCheckText").textContent="전화번호를 적어주세요.";
		document.getElementById("phoneHidden").value="no";
	}else if(phone.length != 11){
		document.getElementById("phoneCheckText").textContent="전화번호 형식이 아닙니다.";
		document.getElementById("phoneHidden").value="no";
	}else{
		if(check.test(phone)==false){
			document.getElementById("phoneCheckText").textContent="전화번호 형식이 아닙니다.";
			document.getElementById("phoneHidden").value="no";
		}else{
			document.getElementById("phoneCheckText").textContent="";
			document.getElementById("phoneHidden").value="yes";
		}
	}
}

//생년월일 유효성 검사
function birthCheck() {
	var birth = document.getElementById("memBirth").value
	var check = /^[0-9]+$/;
    var year = Number(birth.substr(0,4)); 
    var month = Number(birth.substr(4,2));
    var day = Number(birth.substr(6,2));
    var today = new Date(); // 날짜 변수 선언
    var yearNow = today.getFullYear();
    var adultYear = yearNow-14;
    if(birth == ""){
    	document.getElementById("birthCheckText").textContent="생년월일을 적어주세요.";
    	document.getElementById("birthHidden").value="no";
    }else if(check.test(birth)==false){
    	document.getElementById("birthCheckText").textContent="숫자만 적어주세요.";
    	document.getElementById("birthHidden").value="no";
    }else if(birth.length < 4){
    	document.getElementById("birthCheckText").textContent="년도를 적어주세요.";
    	document.getElementById("birthHidden").value="no";
    }else if(birth.length < 6){
    	document.getElementById("birthCheckText").textContent="월을 적어주세요.";
    	document.getElementById("birthHidden").value="no";
    }else if(birth.length < 8){
    	document.getElementById("birthCheckText").textContent="일을 적어주세요.";
    	document.getElementById("birthHidden").value="no";
	}else if(birth.length >= 9){
		document.getElementById("birthCheckText").textContent="날짜 형식이 아닙니다.";
    	document.getElementById("birthHidden").value="no";
	}else if (year < 1900 || year > adultYear){
    	document.getElementById("birthCheckText").textContent="년도를 확인하세요. "+adultYear+"년생 이전 출생자만 등록 가능합니다.";
    	document.getElementById("birthHidden").value="no";
    }else if (month < 1 || month > 12) { 
    	document.getElementById("birthCheckText").textContent="월은 1월부터 12월까지 입력 가능합니다.";
    	document.getElementById("birthHidden").value="no";
	}else if(day < 1 || day > 31) {
		document.getElementById("birthCheckText").textContent="일은 1일부터 31일까지 입력가능합니다.";
		document.getElementById("birthHidden").value="no";
	}else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
		document.getElementById("birthCheckText").textContent= month+"월은 31일이 존재하지 않습니다.";
		document.getElementById("birthHidden").value="no";
	}else if (month == 2) {
	         var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
	         if (day>29 || (day==29 && !isleap)) {
	        	 document.getElementById("birthCheckText").textContent=year + "년 2월은  " + day + "일이 없습니다.";
	        	 document.getElementById("birthHidden").value="no";
	         }
	}else{
		document.getElementById("birthCheckText").textContent= "";
		document.getElementById("birthHidden").value="yes";}
    
}
//우편번호찾기 팝업창 띄우기
function postcode(){
	url = "WTPostcode.jsp"
	var ret = window.open(url,"_blank","toolbar=no, scrollbars=yes",false)
}
//우편번호찾기 버튼
function addressSearch(){
	if(document.getElementById("memAddress").value=""){
		alert("검색할 주소를 넣어주세요.");
	}else{
		document.addressSearchForm.submit();
	}
	
}
//주소 유효성 검사
function addressCheck(){
	var detailAddress = document.getElementById("memDetailAddress").value
	
	if(detailAddress == "" || detailAddress == null){
		document.getElementById("addressHidden").value="no";
	}else{
		document.getElementById("addressHidden").value="yes";
	}
	
}
//회원가입 버튼
function joinMember(){
	var idHiddenText = document.getElementById("idHidden").value;
	var passHiddenText = document.getElementById("passHidden").value;
	var nameHiddenText = document.getElementById("nameHidden").value;
	var emailHiddenText = document.getElementById("emailHidden").value;
	var birthHiddenText = document.getElementById("birthHidden").value;
	var phoneHiddenText = document.getElementById("phoneHidden").value;
	var addressHiddenText = document.getElementById("addressHidden").value;
	
	if(idHiddenText == "no" || passHiddenText == "no" || 
	   nameHiddenText == "no"|| emailHiddenText == "no"||
	   birthHiddenText == "no"|| phoneHiddenText == "no"|| addressHiddenText == "no"){
		alert("항목을 모두 채워주세요.");
	}else if(idHiddenText == "yes" && passHiddenText == "yes" && 
			 nameHiddenText == "yes"&& emailHiddenText == "yes"&&
			 birthHiddenText == "yes"&& phoneHiddenText == "yes"&& addressHiddenText == "yes"){
		document.memJoinForm.submit();
		
	}
	
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
		document.getElementById("backURL").value=document.referrer;
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
////마이페이지
//회원정보 변경
function memberInfoChange(){
	//패스워드 유효성 검사
	var check = !/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
	var memId = document.memberInfoForm.memId.value;
	var memPass = document.memberInfoForm.memPass.value;
	var memPassCheck = document.memberInfoForm.memPassCheck.value;
	
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
		alert("fdfdf");
	}
	
}
////상품 관련 페이지
//상품 누르기
function brand(brandEng, type){
	location.href="WTMain.jsp?pageChange=WTProduct.jsp?brandEng="+brandEng+"?type="+type+"?pageNum=1?sort=";
}
//상품 상세보기
function productSpec(productCode){
	location.href="WTMain.jsp?pageChange=WTProductSpec.jsp?Code="+productCode+"?pageNum=1?sort=?modify=0";
}
//상품 검색
function productSearch(){
	var text = decodeURI(document.getElementById("searchText").value);
	location.href="WTMain.jsp?pageChange=WTTopSearchPro.jsp?text="+text+"?pageNum=1?sort=";
}
////상품 상세 페이지
//구매 후기 텍스트 길이
function productReviewLength(){
	var productReview = document.getElementById("productReview").value;
	document.getElementById("productReviewLength").textContent= "현재 문자 길이 "+productReview.length+"/200";
}
//유효성 검사
function reviewCheck(){
	if(document.getElementById("logCheck").value =="logno"){
		alert("로그인 해주세요");
	}else if(document.getElementById("productReview").value ==""){
		alert("내용을 입력해주세요");
	}else{
		document.getElementById("reviewForm").submit();
	}
}
//구매후기 삭제
function reviewDelete(memId, reviewNum){
	location.href="WTMain.jsp?pageChange=WTReviewDelete.jsp?memId="+memId+"?reviewNum="+reviewNum;
}
//구매후기 수정 폼
function reviewModifyForm(url,reviewNum){
	location.href=url+reviewNum;
}
//구매후기 수정 액션
function reviewModify(modify, modifyURL,productCode){
	//location.href="WTMain.jsp?pageChange=WTReviewModify.jsp?modifyNum="+modify;
	
	var obj1 = document.getElementsByName('productReviewRe')[0].value;
	var obj2 = document.getElementsByName('scoreRe')[0].value;
	
	var form = document.createElement("form");
	form.setAttribute("charset", "UTF-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTReviewModify.jsp");

	 
	var hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "productReview");
	hiddenField.setAttribute("value", obj1);
	form.appendChild(hiddenField);

	 
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "score");
	hiddenField.setAttribute("value", obj2);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "reviewNum");
	hiddenField.setAttribute("value", modify);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "modifyURL");
	hiddenField.setAttribute("value", modifyURL);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "productCode");
	hiddenField.setAttribute("value", productCode);
	form.appendChild(hiddenField);
	
	document.body.appendChild(form);

	 
	 
	form.submit();
	
}
////상품 등록 페이지
//상품 할인율 적용
function productSalePrice(){
	var priceText = document.getElementById("productPrice").value;
	var saleText = document.getElementById("productSale").value;
	
	if(priceText.eqals("")||priceText.eqals(null)){
		var price = 0
		alert(price);
	}else{
		var price = parseInt(priceText);
		alert(price);
	}
	
	if(saleText.eqals("")||saleText.eqals(null)){
		var sale = 0
		alert(sale);
	}else{
		var sale = parseFloat(saleText);
		alert(sale);
	}

}
//메인으로
function mainBack(){
	location.href="../WatTime/WTMain.jsp"
}
//아이디 찾기
function idFind(){
	location.href="WTMain.jsp?pageChange=WTMemberIdFind.jsp"
}
//패스워드 찾기
function passFind(){
	location.href="WTMain.jsp?pageChange=WTMemberPassFind.jsp"
}
//로그인
function loginPage(){
	location.href="WTMain.jsp?pageChange=WTLogin.jsp"
}
