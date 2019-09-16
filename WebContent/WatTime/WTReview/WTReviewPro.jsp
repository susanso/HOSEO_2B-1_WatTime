<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*,java.util.* , WatTimePack.*" %>
<%@ page import = "java.sql.Timestamp" %>
<%request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="memberDTO" class = "WatTimePack.WatTimeMemberDTO" scope="page">
	<jsp:setProperty name="memberDTO" property="*"/>
</jsp:useBean>
<jsp:useBean id="productDTO" class = "WatTimePack.WatTimeProductDTO" scope="page">
	<jsp:setProperty name="productDTO" property="*"/>
</jsp:useBean>
<jsp:useBean id="reviewDTO" class = "WatTimePack.WatTimeReviewDTO" scope="page">
	<jsp:setProperty name="reviewDTO" property="*"/>
</jsp:useBean>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


</head>
<body>
<%
	
	String reviewText = request.getParameter("productReview");
	String url = request.getParameter("backURL");
	String memId = request.getParameter("memId");
	String memName = request.getParameter("memName");
	int score = Integer.parseInt(request.getParameter("score"));
	String productCode = request.getParameter("productCode");
	String productName = request.getParameter("productNameHidden");
	String productFileName = request.getParameter("productFileNameHidden");
	
	reviewDTO.setProductCode(productCode);
	reviewDTO.setMemId(memId);
	reviewDTO.setMemName(memName);
	reviewDTO.setReviewScore(score);
	reviewDTO.setReg_date(new Timestamp(System.currentTimeMillis())); //작성일 넣기
	reviewDTO.setReviewContent(reviewText);
	reviewDTO.setRef(0);
	reviewDTO.setRe_step(0);
	reviewDTO.setRe_level(0);
	reviewDTO.setProductName(productName);
	reviewDTO.setProductSimpleImgFileName(productFileName);
	
	WatTimeReviewDAO reviewDAO = new WatTimeReviewDAO();
	
	reviewDAO.setReview(reviewDTO);
%>
	<input type="hidden" id="backURL" name="backURL" value=<%=url %>>
	<input type="hidden" id="productCode" name="productCode" value=<%=productCode %>>
	<script type="text/javascript">
		var productCode = document.getElementById("productCode").value;
		var form = document.createElement("form");
		form.setAttribute("charset", "utf-8");
		form.setAttribute("method", "Post"); // Get 또는 Post 입력
		form.setAttribute("action", "../WTMain.jsp?pageChange=WTProduct/WTProductSpec.jsp?pageNum=1");
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "productCode");
		hiddenField.setAttribute("value", productCode);
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
</html>