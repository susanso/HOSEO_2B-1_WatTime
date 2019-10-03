<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*, java.io.*" %>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="basketDTO" class = "WatTimePack.WatTimeBasketDTO" scope="page">
	<jsp:setProperty name="basketDTO" property="*"/>
</jsp:useBean>
<jsp:useBean id="productDTO" class = "WatTimePack.WatTimeProductDTO" scope="page">
	<jsp:setProperty name="productDTO" property="*"/>
</jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
	//회원 아이디
	String memId = request.getParameter("memId");
	//basketTbl primarykey num
	int num = Integer.parseInt(request.getParameter("num"));
	//수량
	int productCount = Integer.parseInt(request.getParameter("productCount"));
	String productCode = request.getParameter("productCode");
	
	int productVolum = 0;
	int count = 0;
 	WatTimeBasketDAO basketDAO = new WatTimeBasketDAO();
 	WatTimeProductDAO productDAO = new WatTimeProductDAO();
 	
 	//수량 변경 전 초기 개수
 	productVolum = basketDAO.getBasketCount(memId,num);
 	
 	//수량이 감소했을 때
 	if(productVolum>productCount){
 		count = productVolum-productCount;
 		//수정한 개수가 0일때
 		if(productCount==0){
 			out.println("<script>alert('최소 개수는 1개입니다.');</script>");
 		}else{
	 		basketDAO.setProductCountModify(memId, num, productCount);
	 		productDAO.setBasketProductVolume(productCode,count);
	 		out.println("<script>alert('상품 개수 수정을 완료했습니다.');</script>");
 		}
 	//수량이 증가했을 때
 	}else if(productVolum<productCount){
 		count = productVolum-productCount;
 		//productTbl에 해당 상품의 수량 가져오기
 		productDTO = productDAO.getProductSpec(productCode);
 		//재고량보다 수정한 개수가 클 때
 		if(productDTO.getProductVolume()<(count*-1)){
 			out.println("<script>alert('상품 개수 보다 입력 개수가 큽니다.');</script>");
 		}else if(productCount>100){
 			out.println("<script>alert('장바구니에 담을 수 있는 최대 개수는 100개입니다.');</script>");
 		}else{
 			basketDAO.setProductCountModify(memId, num, productCount);
 	 		productDAO.setBasketProductVolume(productCode,count);
 	 		out.println("<script>alert('상품 개수 수정을 완료했습니다.');</script>");
 		}	
 	//수량이 같을 때
 	}else if(productVolum==productCount){
 		out.println("<script>alert('상품 개수와 수정 개수가 같습니다.');</script>");	
 	}
		
	  
%>
<body>
	<input type="hidden" id="memId" value="<%=memId %>">
	<script>
		var memId = document.getElementById("memId").value;
		
		var form = document.createElement("form");
		form.setAttribute("charset", "utf-8");
		form.setAttribute("method", "Post"); // Get 또는 Post 입력
		form.setAttribute("action", "WTMain.jsp?pageChange=WTBasket/WTBasketList.jsp?pageNum=1");
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "memId");
		hiddenField.setAttribute("value", memId);
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "pageNum");
		hiddenField.setAttribute("value", "1");
		form.appendChild(hiddenField);
		
		
		document.body.appendChild(form);
		
		form.submit();
	</script>
</body>
</html>