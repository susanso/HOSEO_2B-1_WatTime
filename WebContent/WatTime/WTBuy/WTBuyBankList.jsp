<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
	String paymentMethod = request.getParameter("paymentMethod");
%>
<body onresize="parent.resizeTo(500,400)" onload="parent.resizeTo(500,400)">
	<form method="post" action="WTBuyBankForm.jsp">
		상품 명 : <span id="productTitle"></span><br>
		결제 가격 : <span id="totalPrice"></span><br>
		<input type="submit" name="bank" value="신한">
		<input type="submit" name="bank" value="국민">
		<input type="submit" name="bank" value="우리">
		<input type="submit" name="bank" value="농협">
		<input type="submit" name="bank" value="IBK">
		<input type="hidden" id="paymentMethod" name="paymentMethod" value="<%=paymentMethod %>">
		<input type="hidden" id="productTitleHidden" name="productTitleHidden">
		<input type="hidden" id="totalPriceHidden" name="totalPriceHidden">
	</form>
	<script>
		var productTitle = opener.document.getElementById("productTitle").value;
		var total = opener.document.getElementById("totalPrice").textContent;
		document.getElementById("productTitle").textContent = productTitle;
		document.getElementById("productTitleHidden").value = productTitle;
		document.getElementById("totalPrice").textContent = total;
		document.getElementById("totalPriceHidden").value = total;
	</script>
</body>
</html>