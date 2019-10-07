<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*,java.text.*" %>
<%@ page import = "java.sql.Timestamp" %>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="basketDTO" class = "WatTimePack.WatTimeBasketDTO" scope="page">
	<jsp:setProperty name="basketDTO" property="*"/>
</jsp:useBean>
<jsp:useBean id="memberDTO" class = "WatTimePack.WatTimeMemberDTO" scope="page">
   <jsp:setProperty name="memberDTO" property="*"/>
</jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="WTBasket/js/WTBasket.js"></script>
</head>
<%
	DecimalFormat df = new DecimalFormat("#,###");
	if(session.getAttribute("member") != null){
	    memberDTO = (WatTimeMemberDTO)session.getAttribute("member");
	}
	
	List<WatTimeBasketDTO> basketList = null;
	WatTimeBasketDAO basketDAO = new WatTimeBasketDAO();

  	basketList = basketDAO.getMemberBasketList(memberDTO.getMemId());
	
%>
<body>
	<table border="1" class="basketListTable">
		<th>이미지</th>
		<th>상품명</th>
		<th>상품 가격</th>
		<th>상품 수량</th>
		<th>Tictok</th>
		<th>합계</th>
<%
	if(basketList.size() == 0){
%>
		<tr>
			<td colspan="6">장바구니에 넣은 상품이 없습니다.</td>
		</tr>
<%
	}else{
		int totalPrice=0;
		for(int i = 0 ; i < basketList.size() ; i++){
			basketDTO = basketList.get(i);
			totalPrice = totalPrice + basketDTO.getProductPrice()*basketDTO.getProductCount();
%>
		<tr>
			<!-- 이미지 -->
			<td onclick="goProduct('<%=basketDTO.getProductCode() %>')"><img src="../WatTime/img/brand/<%=basketDTO.getProductSimpleImgFileName() %>" width="300px" height="300px"></td>
			<!-- 상품명 -->
			<td onclick="goProduct('<%=basketDTO.getProductCode() %>')">
				<%=basketDTO.getProductName() %>
				<input type="hidden" id="productCode" name="productCode" value="<%=basketDTO.getProductCode() %>">
			</td>
			<!-- 상품 가격 -->
			<td><%=df.format(basketDTO.getProductPrice()*basketDTO.getProductCount()) %></td>
			<td>
				<!-- 상품 개수 -->
				<input type="number" style="text-align:center;" id="productCountNum" name="productCountNum"
					   min="1" max="2147483647" value=<%=basketDTO.getProductCount() %> onchange="productCountChange(this.value)"><br>
				<!-- 수정 버튼 -->
				<input type="button" id="productBasketModify" value="수정" class="basketBtn"
					   onclick="productCountModify('<%=basketDTO.getMemId()%>','<%=basketDTO.getNum()%>','<%=basketDTO.getProductCode()%>')">
			
			</td>
			<!-- 개수*해당 상품 TicTok -->
			<td>
				<%=df.format(basketDTO.getTictok()*basketDTO.getProductCount()) %>
			</td>
			<!-- 삭제 -->
			<td>
				<input type="button" class="basketBtn" id="<%=basketDTO.getNum() %>" value="삭제" 
					   onclick="basketOneDelete(this.id,'<%=basketDTO.getMemId()%>','<%=basketDTO.getProductCode()%>')"><br>
				<br>
			</td>
		</tr>
<%
		}
%>
		<tr>
			<td colspan="6" style="text-align:right;">
			
			<font size="5">	합계 : <%=df.format(totalPrice) %></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
		<tr>
			<td colspan="6">
				<input type="button" id="basketAllDelete" value="모두 삭제" class="basketBtn" 
					   onclick="basketAllDelete('<%=basketDTO.getMemId()%>')">
				<input type="button" value="모두 구매" class="basketBtn" onclick="buy()">
			</td>
		</tr>
<%
	}
%>
	</table>
</body>
</html>