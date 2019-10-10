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
	if(0<TicTok<1000){
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
	}else if(0<tictok.value && tictok.value<1000){
		alert("TicTok은 1,000부터 사용이 가능합니다.");
		tictok.focus();
	}
	//결제 방법 유효성 검사
	else if(card==false && bankDeposit==false && accountTransfer==false){
		alert("결제 방법을 선택해주세요.");
	}else if(card==true){
		var card1 = document.getElementById("cardNum1").value;
		var card2 = document.getElementById("cardNum2").value;
		var card3 = document.getElementById("cardNum3").value;
		var card4 = document.getElementById("cardNum4").value;
		var check = document.getElementById("buyAgreed");
		var year = document.getElementById("cardYear").value;
		var month = document.getElementById("cardMonth").value;
		year = "20"+year;
		
		var today = new Date();
		var mm = today.getMonth()+1; //January is 0!
		var yyyy = today.getFullYear();

		//카드 번호 유효성
		if(card1==""||card2==""||card3==""||card4==""){
			alert("카드 번호를 작성해주세요.");
			document.getElementById("cardNum1").focus();
		}
		//숫자가 아닐 때
		else if(isNaN(card1)==true||isNaN(card2)==true||isNaN(card3)==true||isNaN(card4)==true){
			alert("카드 번호를 다시 작성해주세요.");
			document.getElementById("cardNum1").value="";
			document.getElementById("cardNum2").value="";
			document.getElementById("cardNum3").value="";
			document.getElementById("cardNum4").value="";
		}
		//길이가 안맞을 때
		else if(card1.length!=4||card2.length!=4||card3.length!=4||card4.length!=4){
			alert("카드 번호를 다시 작성해주세요.");
			document.getElementById("cardNum1").value="";
			document.getElementById("cardNum2").value="";
			document.getElementById("cardNum3").value="";
			document.getElementById("cardNum4").value="";
		}
		else if(year == "" || month == ""){
			alert("카드 유효기간을 작성해주세요.");
		}
		//월이 1~12가 아닐경우
		else if(parseInt(month)<0 || parseInt(month)>12){
			alert("카드 유효기간 중 월을 다시 입력해주세요.");
			document.getElementById("cardMonth").value="";
		}
		//유효기간이 지났을 때
		else if(year+"-"+month<yyyy+"-"+mm){
			alert("유효 기간이 지났습니다.");
			document.getElementById("cardYear").value = "";
			document.getElementById("cardMonth").value = "";
		}
		//결제 동의 체크 안했을 때
		else if(check.checked==false){
			alert("결제 동의에 체크해주세요.");
		}else{
			document.BuyForm.submit();
		}
	}else if(accountTransfer==true){
	
	}else if(bankDeposit==true){
		
	}
}

//위 정보와 동일
function contentSame(memName,memPhone,memPostcode,memRoadAddress,memDetailAddress){
	document.getElementById("deliveryMemName").value = memName;
	document.getElementById("deliveryMemPhone").value = memPhone;
	document.getElementById("memPostcode").value = memPostcode;
	document.getElementById("memRoadAddress").value = memRoadAddress+" "+memDetailAddress;
}
//폼 보이기
function buyForm(value){
	//카드 폼
	if(value=="card"){
		document.getElementById("cardForm").style.display = "block";
		document.getElementById("accountTransfer").style.display = "none";
		document.getElementById("phoneForm").style.display = "none";
		documnet.getElementById("paymentMethod").value="card";
	}
	//휴대폰
	else if(value=="bankDeposit"){
		document.getElementById("cardForm").style.display = "none";
		document.getElementById("accountTransfer").style.display = "none";
		document.getElementById("phoneForm").style.display = "block";
		documnet.getElementById("paymentMethod").value="bankDeposit";
	}
	//실시간 계좌
	else if(value=="accountTransfer"){
		document.getElementById("cardForm").style.display = "none";
		document.getElementById("accountTransfer").style.display = "block";
		document.getElementById("phoneForm").style.display = "none";
		documnet.getElementById("paymentMethod").value="accountTransfer";
	}
}
//최대 길이
function maxLengthCheck(object){
    if (object.value.length >= object.maxLength){
    	object.value = object.value.slice(0, object.maxLength);
    }    
}