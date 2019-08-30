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
	<div class="findForm">
		<div class="btnContain">
			<input class="btn" type="button" value="아이디 찾기" onclick="idFind()">
			<input class="btn" type="button" value="패스워드 찾기" onclick="passFind()">
		</div>
		<div class="inputContain">
			<!-- 아이디 찾기 폼 -->
			<form method="post" id="idFindForm" name="idFindForm" action="WTMemberIdFindPro.jsp">
				<!-- 이름 -->
				<div>
					<input class="findInputText" type="text" id="memName" name="memName" placeholder="이름">
				</div>
				<!-- 이메일 -->
				<div>
					<input class="findInputText" type="text" id="memEmail" name="memEmail" placeholder="이메일">
				</div>
				<!-- 전화번호 -->
				<div>
					<input class="findInputText" type="text" id="memPhone" name="memPhone" placeholder="전화번호">
				</div>
				<!-- 버튼 -->
				<div class="findContain">
					<!-- 아이디 찾기 버튼 -->
					<input class="findBtn" type="button" id="idFind" name="idFind" value="아이디 찾기" onclick="idFindNullCheck()">
					<!-- 메인으로 돌아가는 버튼-->
					<input class="findBtn" type="button" value="돌아가기" onclick="mainBack()">
				</div>
			</form>
		</div>
	</div>
</body>
</html>