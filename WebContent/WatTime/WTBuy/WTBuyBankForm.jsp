<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date, java.text.SimpleDateFormat" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/WTBankForm.js"></script>
<script>
	function maxLengthCheck(object){
	    if (object.value.length >= object.maxLength){
	    	object.value = object.value.slice(0, object.maxLength);
	    }    
	}
</script>
</head>
<body onresize="parent.resizeTo(500,400)" onload="parent.resizeTo(500,400)">
<%
	Date nowTime = new Date();
	SimpleDateFormat year = new SimpleDateFormat("yy");
	String bank = request.getParameter("bank");
	String totalPrice = request.getParameter("totalPriceHidden");
	String productTitle = request.getParameter("productTitleHidden");
	String paymentMethod = request.getParameter("paymentMethod");
%>
	<input type="hidden" id="paymentMethod" name="paymentMethod" value="<%=paymentMethod%>">
<%
	//카드 결제
	if(paymentMethod.equals("card")){
%>
		상품 명 : <span id="productTitle"><%=productTitle %></span><br>
		결제 가격 : <span id="totalPrice"><%=totalPrice %></span><br>
		선택 은행 : <span id="bank"><%=bank %></span>
		<table>
			<tr>
				<td>
					카드번호
				</td>
				<td>
					<input type="number" id="cardNum1" name="cardNum1" maxlength="3" onkeydown="maxLengthCheck(this)">
					<input type="password" id="cardNum2" name="cardNum2" maxlength="4" onkeydown="maxLengthCheck(this)">
					<input type="password" id="cardNum3" name="cardNum3" maxlength="4" onkeydown="maxLengthCheck(this)">
					<input type="number" id="cardNum4" name="cardNum4" maxlength="3" onkeydown="maxLengthCheck(this)">
				</td>
			</tr>
			<tr>
				<td>
					카드 유효기간
				</td>
				<td>
					<input type="number" id="cardMonth" name="cardMonth" maxlength="1" onkeydown="maxLengthCheck(this)" placeholder="월(00)">/
					<input type="number" id="cardYear" name="cardYear" maxlength="1" onkeydown="maxLengthCheck(this)" placeholder="년(00)">
				</td>
			</tr>
			<tr>
				<td>
					지불 방법
				</td>
				<td>
					<select class="installments" id="installments" name="installments">
						<option value="0" selected>일시불</option>
						<option value="1">1개월</option>
						<option value="2">2개월</option>
						<option value="3">3개월</option>
						<option value="4">4개월</option>
						<option value="5">5개월</option>
						<option value="6">6개월</option>
						<option value="7">7개월</option>
						<option value="8">8개월</option>
						<option value="9">9개월</option>
						<option value="10">10개월</option>
						<option value="11">11개월</option>
						<option value="12">12개월</option>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="checkbox" id="buyAgreed">구매를 동의합니다.
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="결제" onclick="buy()">
					<input type="button" value="취소" onclick="cancle()">
				</td>
			</tr>
		</table>
<%
	//실시간 계좌 이체
	}else if(paymentMethod.equals("accountTransfer")){
%>
		결제 가격 : <span><%=totalPrice %></span><br>
<%	
	}
%>
</body>
</html>