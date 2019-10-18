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
	if(0<TicTok&&TicTok<1000){
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
	var paymentMethod = document.getElementById("paymentMethod").value;
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
	else if(paymentMethod==""){
		alert("결제 방법을 선택해주세요.");
	}else if(paymentMethod=="card"){
		var card1 = document.getElementById("cardNum1").value;
		var card2 = document.getElementById("cardNum2").value;
		var card3 = document.getElementById("cardNum3").value;
		var card4 = document.getElementById("cardNum4").value;
		var check = document.getElementById("buyAgreed");
		var cardPass = document.getElementById("cardPass").value;
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
			document.getElementById("cardMonth").focus();
		}
		//유효기간이 지났을 때
		else if(year+"-"+month<yyyy+"-"+mm){
			alert("유효 기간이 지났습니다.");
			document.getElementById("cardYear").value = "";
			document.getElementById("cardMonth").value = "";
		}
		//비밀번호
		else if(isNaN(cardPass)==true){
			alert("카드 비밀번호를 다시 입력해주세요.");
			document.getElementById("cardPass").focus();
		}
		//결제 동의 체크 안했을 때
		else if(check.checked==false){
			alert("결제 동의에 체크해주세요.");
		}else{
			document.BuyForm.submit();
		}
	}
	//실시간 계좌이체
	else if(paymentMethod=="accountTransfer"){
		var accountNumber = document.getElementById("accountNumber").value;
		var bank = document.getElementById("bank").value;
		var pass = document.getElementById("accountPass").value;
		var name = document.getElementById("accountName").value;
		//신한 계좌 (구)11자리 (신)12자리
		if((bank=="신한" && accountNumber.length != 11) && (bank=="신한" && accountNumber.length != 12)) {
			alert("계좌번호가 잘못되었습니다.");
			document.getElementById("accountNumber").focus();
		}
		//우리 13자리
		else if(bank=="우리" && accountNumber.length != 13){
			alert("계좌번호가 잘못되었습니다.");
			document.getElementById("accountNumber").focus();
		}
		//농협 13자리
		else if(bank=="농협" && accountNumber.length != 13){
			alert("계좌번호가 잘못되었습니다.");
			document.getElementById("accountNumber").focus();
		}
		//국민 (구) 12자리 (신) 14자리
		else if((bank=="국민" && accountNumber.length != 12) && (bank=="국민" && accountNumber.length != 14)) {
			alert("계좌번호가 잘못되었습니다.");
			document.getElementById("accountNumber").focus();
		}
		//패스워드 유효성 검사
		else if(isNaN(pass)==true){
			alert("비밀번호 형식이 아닙니다.");
			document.getElementById("accountPass").focus();
		}
		//예금주 유효성 검사
		else if(name==""||name==null){
			alert("이름을 입력해주세요.");
			document.getElementById("accountName").focus();
		}
		else{
			document.BuyForm.submit();
		}
	}
	//핸드폰 결제
	else if(paymentMethod=="phoneBank"){
		var phoneNum = document.getElementById("phoneNum").value;
		var phoneName = document.getElementById("phoneName").value;
		var phoneBirth = document.getElementById("phoneBirth").value;
		var nameCheck = /^[가-힣]+$/;
		var phoneCheck = /(01[0|1|6|9|7])(\d{3}|\d{4})(\d{4}$)/g;
		var birthCheck = /^[0-9]+$/;
	    
	    if(phoneBirth == ""){
	    	alert("생년월일을 입력해주세요.");
	    	document.getElementById("phoneBirth").focus();
	    }else if(birthCheck.test(phoneBirth)==false){
	    	alert("숫자만 적어주세요.");
	    	document.getElementById("phoneBirth").focus();
	    }else if(phoneBirth.length < 4){
	    	alert("년도를 적어주세요");
	    	document.getElementById("phoneBirth").focus();
	    }else if(phoneBirth.length < 6){
	    	alert("월을 적어주세요");
	    	document.getElementById("phoneBirth").focus();
	    }else if(phoneBirth.length < 8){
	    	alert("일을 적어주세요");
	    	document.getElementById("phoneBirth").focus();
		}else if(phoneBirth.length >= 9){
			alert("날짜 형식이 아닙니다.");
			document.getElementById("phoneBirth").focus();
		}else if(phoneNum == ""){
			alert("전화번호를 입력해주세요.");
			document.getElementById("phoneNum").focus();
		}else if(phoneCheck.test(phoneNum)){
			alert("전화번호 형식이 아닙니다.");
			document.getElementById("phoneNum").focus();
		}else if(phoneName == ""){
			alert("이름을 입력해주세요.");
			document.getElementById("phoneName").focus();
		}else if(nameCheck.test(phoneName)){
			alert("이름 형식이 아닙니다.");
			document.getElementById("phoneName").focus();
		}else{
			//document.BuyForm.submit();
		}
	    
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
		document.getElementById("paymentMethod").value="card";
	}
	//휴대폰
	else if(value=="phoneBank"){
		document.getElementById("cardForm").style.display = "none";
		document.getElementById("accountTransfer").style.display = "none";
		document.getElementById("phoneForm").style.display = "block";
		document.getElementById("paymentMethod").value="phoneBank";
	}
	//실시간 계좌
	else if(value=="accountTransfer"){
		document.getElementById("cardForm").style.display = "none";
		document.getElementById("accountTransfer").style.display = "block";
		document.getElementById("phoneForm").style.display = "none";
		document.getElementById("paymentMethod").value="accountTransfer";
	}
}
//최대 길이
function maxLengthCheck(object){
    if (object.value.length >= object.maxLength){
    	object.value = object.value.slice(0, object.maxLength);
    }    
}