<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*,java.text.*" %>
<%@ page import = "java.sql.Timestamp" %>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="comunicationDTO" class = "WatTimePack.WatTimeComunicationDTO" scope="page">
	<jsp:setProperty name="comunicationDTO" property="*"/>
</jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
	int boardNum = Integer.parseInt(request.getParameter("boradNum"));
	int listPageNum = Integer.parseInt(request.getParameter("listPageNum"));
	int listCount = Integer.parseInt(request.getParameter("listCount"));
	
	WatTimeComunicationDAO comunicationDAO = new WatTimeComunicationDAO();
	comunicationDAO.setComunicationDelete(boardNum);
%>
<body>
	<input type="hidden" id="listPageNum" value="<%=listPageNum %>">
	<input type="hidden" id="listCount" value="<%=listCount %>">
	
	<script>
		alert("글 삭제를 완료했습니다.");
		var listPageNum = document.getElementById("listPageNum").value;
		var listCount = document.getElementById("listCount").value;
		
		var form = document.createElement("form");
		form.setAttribute("charset", "utf-8");
		form.setAttribute("method", "Post"); // Get 또는 Post 입력
		form.setAttribute("action", "WTMain.jsp?pageChange=WTComunication/WTComunicationList.jsp?pageNum="+listPageNum);
	
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "listPageNum");
		hiddenField.setAttribute("value", listPageNum);
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "listCount");
		hiddenField.setAttribute("value", listCount);
		form.appendChild(hiddenField);
		
		document.body.appendChild(form);
		
		form.submit();
	</script>
</body>
</html>