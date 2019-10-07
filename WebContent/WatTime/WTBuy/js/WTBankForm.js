function cancle(){
	window.close();
}

function buy(){
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
	}
	else{
		var serialNumber = card1+""+card2+""+card3+""+card4;
		opener.document.getElementById("serialNumber").value = serialNumber;
		opener.document.getElementById("installments").value = document.getElementById("installments").value;
		opener.document.getElementById("bank").value = document.getElementById("bank").textContent;
		opener.document.getElementById("paymentMethod").value = document.getElementById("paymentMethod").value;
		opener.document.BuyForm.submit();
		window.close();
	}
	
	
	
}