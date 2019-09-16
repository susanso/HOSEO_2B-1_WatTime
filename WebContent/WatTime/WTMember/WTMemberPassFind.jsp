<%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
<link href = "style.css" rel = "stylesheet" type = "text/css">
<script language = "JavaScript" src = "WTMember/js/WTMemberPassFind.js"></script>
</head>
<body>
	<div class="findForm">
		<div class="btnContain">
			<input class="btn" type="button" value="아이디 찾기" onclick="idFind()">
			<input class="btn" type="button" value="패스워드 찾기" onclick="passFind()">
		</div>
		<div class="inputContain">
			<form method="post" id="passFindForm" name="passFindForm" action="WTMember/WTMemberPassFindPro.jsp">
				<div>
					<input class="findInputText" type="text" id="memId" name="memId" placeholder="아이디"><br>
				</div>
				<div>
					<input class="findInputText" type="text" id="memEmail" name="memEmail" placeholder="이메일"><br>
				</div>
				<div>
					<input class="findInputText" type="text" id="memPhone" name="memPhone" placeholder="전화번호"><br>
				</div>
				<div class="findContain">
					<input class="findBtn" type="button" id="passFind" name="passFind" value="패스워드 찾기" onclick="passFindNullCheck()">
					<input class="findBtn" type="button" value="돌아가기" onclick="mainBack()">
				</div>
			</form>
		</div>
	</div>
</body>
</html>