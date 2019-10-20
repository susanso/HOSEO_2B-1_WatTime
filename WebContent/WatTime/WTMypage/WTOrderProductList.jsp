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
	int orderNum = Integer.parseInt(request.getParameter("orderNum"));

	WatTimeOrderProductDAO orderProductDAO = new WatTimeOrderProductDAO();
	WatTimeProductDAO productDAO = new WatTimeProductDAO();
	List<WatTimeOrderProductDTO> orderProductList = null;


	orderProductList = orderProductDAO.getOrderProductList(orderNum);
%>
<body onresize="parent.resizeTo(800,600)" onload="parent.resizeTo(800,600)">
	<table>
<%
		for(int i = 0 ; i < orderProductList.size() ; i++){
			orderProductDTO = orderProductList.get(i);
			String productImg = productDAO.getProductImg(orderProductDTO);
			
%>
			<tr>
				<!-- 상품 이미지 -->
				<td>
					<img src="../../WatTime/img/brand/<%=productImg %>" width="200" height="200">
				</td>
				<!-- 상품명 -->
				<td>
					<%=orderProductDTO.getProductName() %>
				</td>
				<!-- 상품 개수 -->
				<td>
					<%=orderProductDTO.getProductCount()%>개<br>
				<td>
				<!-- 상품 가격 -->
				<td>
					<%=orderProductDTO.getProductPrice() %>
				</td>
				<!-- TicTok -->
				<td>
					<%=orderProductDTO.getTicTok() %>
				</td>
			</tr>
<%
		}
%>
	</table>
</body>
</html>