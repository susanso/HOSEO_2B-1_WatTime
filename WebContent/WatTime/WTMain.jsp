<%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href = "style.css" rel = "stylesheet" type = "text/css">
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
	
	<TABLE border ="0" cellspacing = "0" cellpadding = "0" class="mainForm">
		<TR>
		   	  <TD><jsp:include page="<%=top%>" flush="false"/></TD>
		</TR>
		<TR>
		   	  <TD><jsp:include page="<%=content%>" flush="false"/></TD>
		</TR>
		<TR>
		   	  <TD><jsp:include page="<%=bottom%>" flush="false"/></TD>
		</TR>
	</TABLE>
</body>
</html>