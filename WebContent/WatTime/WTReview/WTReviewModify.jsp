<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*" %>

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
	request.setCharacterEncoding("UTF-8");
	String productReview = request.getParameter("productReview");
	int score = Integer.parseInt(request.getParameter("score"));
	int reviewNum = Integer.parseInt(request.getParameter("reviewNum"));
	String sort = request.getParameter("sort");
	String productCode = request.getParameter("productCode");
	
	reviewDTO.setProductCode(productCode);
	reviewDTO.setReviewScore(score);
	reviewDTO.setReviewContent(productReview);
	reviewDTO.setNum(reviewNum);
	WatTimeReviewDAO reviewDAO = new WatTimeReviewDAO();
	reviewDAO.setReviewModify(reviewDTO);
	
%>
	<input type="hidden" id="productCode" name="productCode" value=<%=productCode %>>
	<input type="hidden" id="sort" name="sort" value=<%=sort %>>
	<script>	
	var productCode = document.getElementById("productCode").value;
	var sort = document.getElementById("sort").value;
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
	hiddenField.setAttribute("value", sort);
	form.appendChild(hiddenField);

	document.body.appendChild(form);
	
	form.submit();
		
	</script>
</body>
</html>