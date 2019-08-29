<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*,java.util.* , WatTimePack.*" %>
<jsp:useBean id="memMgr" class = "WatTimePack.MemberMgr" scope="page"></jsp:useBean>    
<!DOCTYPE html>
<html>
<head>
	<link href = "style.css" rel = "stylesheet" type = "text/css">
	<script src="script.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<%
		String pageChange;
	%>
</head>
<body>
	<%
	//로그인 X
	if(session.getAttribute("member") == null){
	%>
		<jsp:include page="WTLoginBefore.jsp" flush="false"/>
	<%
		//로그인 O
	}else{	
	%>
		<jsp:include page="WTLoginAfter.jsp" flush="false"/>
	<%} %>
</body>
</html>