function cancle(){
	window.close();
}

function buy(){
	var card1 = document.getElementById("cardNum1").value;
	var card2 = document.getElementById("cardNum2").value;
	var card3 = document.getElementById("cardNum3").value;
	var card4 = document.getElementById("cardNum4").value;
	
	var serialNumber = card1+""+card2+""+card3+""+card4;
	
	opener.document.getElementById("serialNumber").value = serialNumber;
	opener.document.getElementById("installments").value = document.getElementById("installments").value;
	opener.document.getElementById("bank").value = document.getElementById("bank").textContent;
	opener.document.getElementById("paymentMethod").value = document.getElementById("paymentMethod").value;
	opener.document.BuyForm.submit();
}