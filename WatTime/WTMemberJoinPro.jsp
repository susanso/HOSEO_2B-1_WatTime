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

	<%
		request.setCharacterEncoding("utf-8");
		String memId = request.getParameter("memId");
		String memPass = request.getParameter("memPass");
		String memName = request.getParameter("memName");
		String memBirth = request.getParameter("memBirth");
		String memEmail = request.getParameter("memEmail");
		String memPhone = request.getParameter("memPhone");
		String memPostcode = request.getParameter("memPostcode");
		String memRoadAddress = request.getParameter("memRoadAddress");
		String memJibunAddress = request.getParameter("memJibunAddress");
		String memEtcAddress= request.getParameter("memEtcAddress");
		String memDetailAddress =  request.getParameter("memDetailAddress");
		RegisterBean member = memMgr.setMemberJoin(memId, memPass, memName,  memEmail, memPhone, memBirth,  memPostcode, memRoadAddress, memJibunAddress, memEtcAddress, memDetailAddress);
	%>
</head>
<body>
	<div class="joinForm">
		<div class="joinTextContain">
			<center>
				<font class="joinText">회원가입이 완료됬습니다.</font><br>
				<font class="joinText">첫 가입으로 2000TicTok을 받으셨습니다.</font>
			</center>
		</div>
		<div class="joinBtnContain">
			<input class="joinBtn" type="button" value="로그인하기" onclick="loginPage()">
		</div>
	</div>
</body>
</html>