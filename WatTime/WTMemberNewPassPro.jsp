<%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*,java.util.* , watTime.*" %>
<jsp:useBean id="memMgr" class = "watTime.MemberMgr" scope="page"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script language = "JavaScript" src = "script.js"></script>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String memPass = request.getParameter("memPass");
		String memId = request.getParameter("memId");
		RegisterBean member = memMgr.setMemberNewPass(memPass, memId);
	%>
	새 패스워드로 변경됬습니다.<br>
	<input type="button" value="로그인하기" onclick="loginPage()">
</body>
</html>