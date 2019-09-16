<%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link href = "style.css" rel = "stylesheet" type = "text/css">
<script language = "JavaScript" src = "WTMember/js/WTMemberIdFind.js"></script>
</head>
<body>	
	<%
		//WTMemberIdFindPro.jsp에서 request한 값을 utf-8로 변환
		request.setCharacterEncoding("utf-8");
		//WTMemberIdFindPro.jsp에서 request한 memId를 가져옴
		String memId = request.getParameter("memId");
	%>
	<div class="resultForm">
			<div class="btnContain">
				<input class="btn" type="button" value="아이디 찾기" onclick="idFind()">
				<input class="btn" type="button" value="패스워드 찾기"onclick="passFind()">
		</div>
		<div class="resultContain">
			<!-- 찾은 아이디 텍스트  -->
			<font class="resultText">ID: <b><%=memId %></b></font>
		</div>
		<div class="resultBtn">
			<input class="nextBtn" type="button" value="로그인하기" onclick="loginPage()">
		</div>
	</div>
</body>
</html>