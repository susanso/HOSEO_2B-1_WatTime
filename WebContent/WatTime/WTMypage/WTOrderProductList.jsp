<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.lang.*,java.text.*,java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*, java.io.*" %>
<%@ page import = "java.sql.Timestamp" %>
<jsp:useBean id="orderProductDTO" class = "WatTimePack.WatTimeOrderProductDTO" scope="page">
   <jsp:setProperty name="orderProductDTO" property="*"/>
</jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
	DecimalFormat df = new DecimalFormat("#,###");
	int orderNum = Integer.parseInt(request.getParameter("orderNum"));

	WatTimeOrderProductDAO orderProductDAO = new WatTimeOrderProductDAO();
	WatTimeProductDAO productDAO = new WatTimeProductDAO();
	List<WatTimeOrderProductDTO> orderProductList = null;


	orderProductList = orderProductDAO.getOrderProductList(orderNum);
%>
<body onresize="parent.resizeTo(500px,300px)" onload="parent.resizeTo(500px,300px)">
	<table border ="0"width="1300px" style="text-align:center; border: 2px solid #ccc;">
		<tr>
			<th>이미지</th>
			<th>상품명</th>
			<th>상품 개수</th>
			<th>상품 가격 </th>
			<th>TicTok</th>
		</tr>
<%
		for(int i = 0 ; i < orderProductList.size() ; i++){
			orderProductDTO = orderProductList.get(i);
			String productImg = productDAO.getProductImg(orderProductDTO);
			
%>
			<tr>
				
				<!-- 상품 이미지 -->
				<td width="300px">
					<img src="../../WatTime/img/brand/<%=productImg %>" width="200" height="200">
				</td>
				<!-- 상품명 -->
				<td width="200px">
					<font size="5px"><%=orderProductDTO.getProductName() %></font>
				</td>
				<!-- 상품 개수 -->
				<td width="100px">
					<font size="5px"><%=orderProductDTO.getProductCount()%>개</font>
				</td>
				<!-- 상품 가격 -->
				<td width="200px">
					<font size="5px"><%=df.format(orderProductDTO.getProductPrice()) %>원</font>
				</td>
				<!-- TicTok -->
				<td width="200px">
					<font size="5px"><%=df.format(orderProductDTO.getTicTok()) %>TicTok</font>
				</td>
				
			</tr>
<%
		}
%>
	</table>
</body>
</html>