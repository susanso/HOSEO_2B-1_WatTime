<%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*" %>
<jsp:useBean id="memMgr" class = "WatTimePack.MemberMgr" scope="page"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script language = "JavaScript" src = "script.js"></script>
<link href = "style.css" rel = "stylesheet" type = "text/css">
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String memPass = request.getParameter("memPass");
		String memId = request.getParameter("memId");
		RegisterBean member = memMgr.setMemberNewPass(memPass, memId);
	%>
	<div class="resultForm">
		<div class="btnContain">
			<input class="btn" type="button" value="아이디 찾기" onclick="idFind()">
			<input class="btn" type="button" value="패스워드 찾기"onclick="passFind()">
		</div>
		<div class="resultContain">
				<font class="resultText">새 패스워드로 변경됬습니다.</font>
		</div>
		<div class="resultBtn">
			<input class="nextBtn" type="button" value="로그인하기" onclick="loginPage()">
		</div>
	</div>
	
	
</body>
</html>