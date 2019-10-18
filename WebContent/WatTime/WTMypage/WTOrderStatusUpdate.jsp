<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.text.*,java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*" %>
<%@ page import = "java.sql.Timestamp" %>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="orderDTO" class = "WatTimePack.WatTimeOrderDTO" scope="page">
   <jsp:setProperty name="orderDTO" property="*"/>
</jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
	Timestamp deliverySuccessDate = new Timestamp(System.currentTimeMillis());
	String dateFormatString = "";
	Timestamp nowFormat = null;
	String orderStatus = request.getParameter("orderStatus");
	orderStatus = new String(orderStatus.getBytes("8859_1"), "utf-8");
	
	int orderNum = Integer.parseInt(request.getParameter("orderNum"));
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	String startDate = request.getParameter("startDate");
	String endDate = request.getParameter("endDate");
	String orderStatusRadio = request.getParameter("orderStatusRadio");
	orderStatusRadio = new String(orderStatusRadio.getBytes("8859_1"), "utf-8");
	
	WatTimeOrderDAO orderDAO = new WatTimeOrderDAO();
	if(orderStatus.equals("배송 완료")){
		orderDAO.setOrderStatusUpdate(orderNum,orderStatus,deliverySuccessDate);
	}else{
		orderDAO.setOrderStatusUpdate(orderNum,orderStatus);
	}
	
%>

<body>
	<input type="hidden" id="pageNum" value="<%=pageNum%>">
	<input type="hidden" id="startDate" value="<%=startDate%>">
	<input type="hidden" id="endDate" value="<%=endDate%>">
	<input type="hidden" id="orderStatusRadio" value="<%=orderStatusRadio%>">
	<script>
		var pageNum = document.getElementById("pageNum").value;
		var startDate = document.getElementById("startDate").value;
		var endDate = document.getElementById("endDate").value;
		var orderStatusRadio = document.getElementById("orderStatusRadio").value;
		
		var form = document.createElement("form");
		form.setAttribute("charset", "utf-8");
		form.setAttribute("method", "Post"); // Get 또는 Post 입력
		form.setAttribute("action", "WTMain.jsp?pageChange=WTMypage/WTOrderList.jsp?pageNum="+pageNum);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "startDate");
		hiddenField.setAttribute("value", startDate);
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "endDate");
		hiddenField.setAttribute("value", endDate);
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "orderStatus");
		hiddenField.setAttribute("value", orderStatusRadio);
		form.appendChild(hiddenField);
		
		document.body.appendChild(form);
		
		form.submit();
	</script>
</body>
</html>