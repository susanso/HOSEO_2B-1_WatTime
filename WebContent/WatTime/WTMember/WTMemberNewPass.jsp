<%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link href = "style.css" rel = "stylesheet" type = "text/css">
<meta charset="UTF-8">
<script language = "JavaScript" src = "WTMember/js/WTMemberPassFind.js"></script>
<title>Insert title here</title>
<%
	String memId = request.getParameter("memId");
%>
</head>
<body>
	<div class="newPassForm">
			<div class="btnContain">
				<input class="btn" type="button" value="아이디 찾기" onclick="idFind()">
				<input class="btn" type="button" value="패스워드 찾기" onclick="passFind()">
			</div>
			<div class="inputContain">
				<form method="post" id="newPassForm" name="newPassForm" action="WTMember/WTMemberNewPassPro.jsp">
					<div>
						<!-- 새 패스워드 -->
						<div>
							<input class="newPassInputText" type="password" id="memPass" name="memPass" placeholder="새 패스워드"><br>
						</div>
						<!-- 새 패스워드 확인-->
						<div>
							<input class="newPassInputText" type="password" id="memPassCheck" name="memPassCheck" placeholder="새 패스워드 확인"><br>
						</div>
						<!-- 다음 페이지로 memId를 넘기기 위한 input -->
						<div>
							<input class="newPassInputText"type="hidden" id="memId" name="memId" value=<%=memId %>>
						</div>
					</div>
					<div>
						<div class="newPassContain">
							<input class="newPassBtn" type="button" id="newPass" name="newPass" value = "패스워드 변경" onclick="newPassCheck()">
						</div>
					</div>
				</form>
			</div>
		</div>
</body>
</html>