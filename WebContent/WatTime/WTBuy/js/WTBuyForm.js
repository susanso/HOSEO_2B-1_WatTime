function basketList(){
	var form = document.createElement("form");
	form.setAttribute("charset", "utf-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTBasket/WTBasketList.jsp");
	
	document.body.appendChild(form);
	form.submit();
}

//우편번호찾기 팝업창 띄우기
function postcode(){
	url = "WTMember/WTPostcode.jsp"
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
//보유 포인트 전부 사용
function allTicTok(TicTok,total){
	//보유 TicTok이 1000 미만일 때
	if(TicTok<1000){
		alert("포인트는 1,000 TicTok부터 사용이 가능합니다.");
	}else if(parseInt(TicTok)>=parseInt(total)){
		document.getElementById("useTicTok").value=total;
		document.getElementById("totalPrice").textContent= "0";
	}else{
		var totalPrice = total - TicTok;
		document.getElementById("useTicTok").value=TicTok;
		document.getElementById("totalPrice").textContent= totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
}

//총 가격 구하기
function totalPriceCul(TicTok,total,Retention){
	var RetentionFormat = parseInt(Retention);
	var totalPrice = total - TicTok;
	document.getElementById("totalPrice").textContent = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	if(TicTok>RetentionFormat){
		alert("입력한 수치가 보유 TicTok보다 큽니다.");
		document.getElementById("useTicTok").value=0;
	}else if(parseInt(TicTok)>=parseInt(total)){
		alert("입력한 수치가 상품 가격보다 큽니다.");
		document.getElementById("useTicTok").value=0;
		document.getElementById("totalPrice").textContent = total;
	}else{
		document.getElementById("totalPrice").textContent = totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
}

function order(){
	var card = $(check1).is(":checked");
	var bankDeposit = $(check2).is(":checked");
	var accountTransfer = $(check3).is(":checked");
	var ret;
	
	var nameCheck = /^[가-힣]+$/;
	var name = document.getElementById("deliveryMemName");
	var phone = document.getElementById("deliveryMemPhone");
	var phoneCheck = /(01[0|1|6|9|7])(\d{3}|\d{4})(\d{4}$)/g;
	var postCode= document.getElementById("memPostcode");
	var roadAddress = document.getElementById("memRoadAddress");
	var message = document.getElementById("deliveryMessage");
	var tictok = document.getElementById("useTicTok");
	//배송정보 이름 유효성 검사
	if(name.value==""){
		alert("배송정보의 이름을 입력해주세요.");
		name.focus();
	}else if(nameCheck.test(name.value)==false){
		alert("배송정보의 이름을 다시 입력해주세요.");
		name.focus();
	}
	//배송정보 전화번호 유효성 검사
	else if(phone.value==""){
		alert("배송정보의 전화번호를 입력해주세요.");
		phone.focus();
	}else if(phoneCheck.test(phone.value)==false){
		alert("배송정보의 전화번호를 다시 입력해주세요.");
		phone.focus();
	}
	//배송정보 주소 유효성 검사
	else if(postCode.value == ""){
		alert("배송정보의 우편번호가 없습니다.");
	}else if(roadAddress.value==""){
		alert("배송정보의 주소가 없습니다.");
		roadAddress.focus();
	}else if(message.value==""){
		alert("주문 메세지를 작성해주세요.");
		message.focus();
	}else if(tictok.value<1000){
		alert("TicTok은 1,000부터 사용이 가능합니다.");
		tictok.focus();
	}
	//결제 방법 유효성 검사
	else if(card==false && bankDeposit==false && accountTransfer==false){
		alert("결제 방법을 선택해주세요.");
	}else if(card==true){
		var paymentMethod = document.getElementById("check1").value;
		url = "WTBuy/WTBuyBankList.jsp?paymentMethod="+paymentMethod;
		ret = window.open(url,"_blank","toolbar=no, scrollbars=yes",false);
		var modal = document.getElementById("Modal");
		modal.style.display = "block";
	}else if(accountTransfer==true){
		var paymentMethod = document.getElementById("check3").value;
		url = "WTBuy/WTBuyBankList.jsp?paymentMethod="+paymentMethod;
		ret = window.open(url,"_blank","toolbar=no, scrollbars=yes",false);
	}else if(bankDeposit==true){
		alert("무통장 입금");
	}
}

//위 정보와 동일
function contentSame(){
	document.getElementById("deliveryMemName").value = document.getElementById("memName").value;
	document.getElementById("deliveryMemPhone").value = document.getElementById("memPhone").value;
	document.getElementById("memPostcode").value = document.getElementById("postCode").value;
	document.getElementById("memRoadAddress").value = document.getElementById("roadAddress").value+" "
													+document.getElementById("detailAddress").value;
}