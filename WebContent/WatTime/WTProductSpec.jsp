<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*" %>
<jsp:useBean id="productDTO" class = "WatTimePack.WatTimeProductDTO" scope="page">
	<jsp:setProperty name="productDTO" property="*"/>
</jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String url = request.getRequestURL().toString();
		if(request.getQueryString() != null)
			url = url +"?"+request.getQueryString();
		//url의 전체 길이
		int urlLength = url.length();
		//"Code"표시의 위치를 찾음
		int urlIndex = url.indexOf("Code");
		//substring쪽에서 = 표시까지 출력되서 5 더함
		String productCode = url.substring(urlIndex+5,urlLength);
		
		WatTimeProductDAO productDAO = new WatTimeProductDAO();
		productDTO = productDAO.getProductSpec(productCode);
	%>
	
	<table border=1>
		<!-- 이미지 및 가격 -->
		<tr>
			<td rowspan="2"><img src="img/<%=productCode%>.jpg"></td>
			<td>
				제품명 : <%=productDTO.getProductName() %><br>
				브랜드 : <%=productDTO.getBrandEng() %><br>
				가격 : <%=productDTO.getProductPrice() %><br>
				TicTok : <%=productDTO.getTictok() %>
				제조국 : <%=productDTO.getProductCountry() %>
				
			</td>
		</tr>
		<!-- 구매하기, 장바구니 버튼 -->
		<tr>
			<td>
				<input type = "button" value="구매하기">
				<input type = "button" value="장바구니">
			</td>
		</tr>
		<!-- 버튼구역 -->
		<tr>
			<td colspan="2">
				<input type = "button" value="상품 상세정보">
				<input type = "button" value="배송/교환/환불">
				<input type = "button" value="구매후기">
				<input type = "button" value="구매문의">
			</td>
		</tr>
		<!-- 상세 이미지 -->
		<tr>
			<td colspan="2"><img src="img/<%=productCode%>상세.jpg"></td>
		</tr>
	</table>
</body>
</html>