<%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href = "style.css" rel = "stylesheet" type = "text/css">
<title>Insert title here</title>
</head>
<body>
	<%
		String top="WTTop.jsp";
		String content="WTContent.jsp";
		String bottom="WTBottom.jsp";
	%>
	
	<TABLE border ="0" cellspacing = "0" cellpadding = "0">
		<TR align = "top">
		   	  <TD><jsp:include page="<%=top%>" flush="false"/></TD>
		</TR>
		<TR align = "center">
		   	  <TD><jsp:include page="<%=content%>" flush="false"/></TD>
		</TR>
		<TR align = "bottom">
		   	  <TD><jsp:include page="<%=bottom%>" flush="false"/></TD>
		</TR>
	</TABLE>
</body>
</html>