<%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
<link href = "style.css" rel = "stylesheet" type = "text/css">
<script language = "JavaScript" src = "script.js"></script>
</head>
<body>
	<input type="button" value="아이디 찾기">
	<input type="button" value="패스워드 찾기" onclick="passFind()">
	<form method="post" id="idFindForm" name="idFindForm" action="WTMemberIdFindPro.jsp">
		<input type="text" id="memName" name="memName" placeholder="이름"><br>
		<input type="text" id="memEmail" name="memEmail" placeholder="이메일"><br>
		<input type="text" id="memPhone" name="memPhone" placeholder="전화번호"><br>
		<input type="button" id="idFind" name="idFind" value="아이디 찾기" onclick="idFindNullCheck()">
		<input type="button" value="돌아가기" onclick="mainBack()">
	</form>
</body>
</html>