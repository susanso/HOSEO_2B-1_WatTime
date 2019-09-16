<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*" %>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="reviewDTO" class = "WatTimePack.WatTimeReviewDTO" scope="page">
	<jsp:setProperty name="reviewDTO" property="*"/>
</jsp:useBean>
<%
	
	String memId = request.getParameter("memId");
	int reviewNum = Integer.parseInt(request.getParameter("reviewNum"));
	String productCode = request.getParameter("productCode");
	String sort = request.getParameter("sort");
	String pageNum = request.getParameter("pageNum");
	WatTimeReviewDAO reviewDAO = new WatTimeReviewDAO();
	reviewDAO.setReviewDelete(reviewNum,memId);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="hidden" id="productCode" value="<%=productCode%>">
	<input type="hidden" id="sort" value="<%=sort%>">
	<input type="hidden" id="pageNum" value="<%=pageNum%>">
	<script>
		alert("구매후기 삭제를 완료했습니다.");
		var productCode = document.getElementById("productCode").value;
		var sort = document.getElementById("sort").value;
		var pageNum = document.getElementById("pageNum").value;
		var form = document.createElement("form");
		form.setAttribute("charset", "UTF-8");
		form.setAttribute("method", "Post"); // Get 또는 Post 입력
		form.setAttribute("action", "WTMain.jsp?pageChange=WTProduct/WTProductSpec.jsp?pageNum="+pageNum+"");
	
		 
		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "productCode");
		hiddenField.setAttribute("value", productCode);
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "sort");
		hiddenField.setAttribute("value", sort);
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "modify");
		hiddenField.setAttribute("value", 0);
		form.appendChild(hiddenField);
		
		document.body.appendChild(form);
		
		form.submit();
	</script>
</body>
</html>