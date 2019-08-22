<%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script language = "JavaScript" src = "script.js"></script>
<title>로그인</title>
</head>
<body>
	<form method="post" id="LoginForm" name="LoginForm" action="WTLoginPro.jsp">
		<div>
			<div><input type="text" id="memId" name="memId" maxlength="20"></div>
		</div>
		<div>
			<div><input type="password" id="memPass" name="memPass" maxlength="20"></div>
		</div>
		<div>
			<div><a href = "WTAgreed.jsp">회원가입</a></div>
			<div><a href = "WTMemberIdFind.jsp">아이디/비밀번호 찾기</a></div>
		</div>
		<div>
			<div><input type="button" id="memLogin" name="memLogin" value="LogIn" onclick="loginNullCheck()"></div>
		</div>
	</form>
</body>
</html>