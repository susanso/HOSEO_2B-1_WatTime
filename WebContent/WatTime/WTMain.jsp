<%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href = "style.css	" rel = "stylesheet" type = "text/css">
<title>WatTime</title>
</head>
<body>
<%
	//컨텐트 부분에 바뀔 jsp을 넣는 변수
       String content = request.getParameter("pageChange");
		//메인 초기화면
       if (content == null) {
			content = "WTContent.jsp";
       }
	String top="WTTop.jsp";
	String bottom="WTBottom.jsp";
%>
	<div>
		<jsp:include page="<%=top%>" flush="false"/>
		<jsp:include page="<%=content%>" flush="false"/>
		<jsp:include page="<%=bottom%>" flush="false"/>
	</div>
</body>
</html>