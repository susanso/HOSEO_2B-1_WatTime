<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*" %>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
	int noticeNum = Integer.parseInt(request.getParameter("noticeNum"));

	WatTimeNoticeDAO noticeDAO = new WatTimeNoticeDAO();
	noticeDAO.setNoticeDelete(noticeNum);
%>
<body>
	<script>
		alert("삭제 완료");
		var form = document.createElement("form");
		form.setAttribute("charset", "UTF-8");
		form.setAttribute("method", "Post"); // Get 또는 Post 입력
		form.setAttribute("action", "WTMain.jsp?pageChange=WTNotice/WTNoticeList.jsp");

		 
		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "pageNum");
		hiddenField.setAttribute("value", "1");
		form.appendChild(hiddenField);
		
		document.body.appendChild(form);

		form.submit();
	</script>
</body>
</html>