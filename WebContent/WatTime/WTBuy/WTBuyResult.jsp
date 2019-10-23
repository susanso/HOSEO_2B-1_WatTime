<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
	<div style="width:1300px; text-align:center; margin: 200px auto;">
		<font size="5px">상품 주문을 완료 했습니다. 주문 내역은 마이페이지 > 주문 내역에서 확인해 주시기 바랍니다.</font>
		
		<br><br><br><br>
		<input type="button"
			   class="specBtn"
			   value="주문 내역"
			   onclick="location.href='WTMain.jsp?pageChange=WTMypage/WTOrderList.jsp?pageNum=1'"
		>
	</div>
</body>
</html>