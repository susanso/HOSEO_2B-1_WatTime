<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*" %>
<%@ page import = "java.sql.Timestamp" %>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="basketDTO" class = "WatTimePack.WatTimeBasketDTO" scope="page">
	<jsp:setProperty name="basketDTO" property="*"/>
</jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="js/WTProduct.js"></script>
</head>
<%
	int productCount = Integer.parseInt(request.getParameter("productCount"));
	String productCode = request.getParameter("productCode");
	String productName = request.getParameter("productName");
	int productPrice = Integer.parseInt(request.getParameter("productPrice"));
	String memId = request.getParameter("memId");
	String memName = request.getParameter("memName");
	memName = new String(memName.getBytes("8859_1"), "utf-8");
	String productSimpleImgFileName = request.getParameter("fileName");
	productSimpleImgFileName = new String(productSimpleImgFileName.getBytes("8859_1"), "utf-8");
	int tictok =Integer.parseInt(request.getParameter("tictok"));
	basketDTO.setMemId(memId);
	basketDTO.setMemName(memName);
	basketDTO.setProductCode(productCode);
	basketDTO.setProductCount(productCount);
	basketDTO.setProductName(productName);
	basketDTO.setProductPrice(productPrice);
	basketDTO.setProductSimpleImgFileName(productSimpleImgFileName);
	basketDTO.setTictok(tictok);
	basketDTO.setBasketAddDate(new Timestamp(System.currentTimeMillis()));
	
	WatTimeBasketDAO basketDAO = new WatTimeBasketDAO();
	int count = basketDAO.getBasketOverlapCheck(memId,productCode);
	
	if(count != 0){
%>
		<input type="hidden" id="productCode" name="productCode" value=<%=productCode %>>
		<script>
			var productCode = document.getElementById("productCode").value;
			alert("장바구니에 있는 항목입니다. 수량을 늘리실려면 장바구니에 가셔서 늘려주시기 바랍니다.");
			
			var form = document.createElement("form");
			form.setAttribute("charset", "UTF-8");
			form.setAttribute("method", "Post"); // Get 또는 Post 입력
			form.setAttribute("action", "WTMain.jsp?pageChange=WTProduct/WTProductSpec.jsp?pageNum=1");
	
			 
			var hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "productCode");
			hiddenField.setAttribute("value", productCode);
			form.appendChild(hiddenField);
	
			var hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "pageNum");
			hiddenField.setAttribute("value", "1");
			form.appendChild(hiddenField);
			
			hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "modify");
			hiddenField.setAttribute("value", 0);
			form.appendChild(hiddenField);
			
			hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "sort");
			hiddenField.setAttribute("value", "reg_date DESC");
			form.appendChild(hiddenField);
			
			document.body.appendChild(form);
			
			form.submit();
		</script>
<%
	}else{
		basketDAO.setBasket(basketDTO);
	
%>
		<body>
			<input type="hidden" id="productCode" name="productCode" value=<%=productCode %>>
			<script>
				var productCode = document.getElementById("productCode").value;
				alert("장바구니에 담았습니다.");
				
				var form = document.createElement("form");
				form.setAttribute("charset", "UTF-8");
				form.setAttribute("method", "Post"); // Get 또는 Post 입력
				form.setAttribute("action", "WTMain.jsp?pageChange=WTProduct/WTProductSpec.jsp?pageNum=1");
		
				 
				var hiddenField = document.createElement("input");
				hiddenField.setAttribute("type", "hidden");
				hiddenField.setAttribute("name", "productCode");
				hiddenField.setAttribute("value", productCode);
				form.appendChild(hiddenField);
		
				var hiddenField = document.createElement("input");
				hiddenField.setAttribute("type", "hidden");
				hiddenField.setAttribute("name", "pageNum");
				hiddenField.setAttribute("value", "1");
				form.appendChild(hiddenField);
				
				hiddenField = document.createElement("input");
				hiddenField.setAttribute("type", "hidden");
				hiddenField.setAttribute("name", "modify");
				hiddenField.setAttribute("value", 0);
				form.appendChild(hiddenField);
				
				hiddenField = document.createElement("input");
				hiddenField.setAttribute("type", "hidden");
				hiddenField.setAttribute("name", "sort");
				hiddenField.setAttribute("value", "reg_date DESC");
				form.appendChild(hiddenField);
				
				document.body.appendChild(form);
				
				form.submit();
			</script>
		</body>
<%
	}
%>
</html>