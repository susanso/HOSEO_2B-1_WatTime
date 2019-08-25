<%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*" %>
<jsp:useBean id="memMgr" class = "WatTimePack.MemberMgr" scope="page"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href = "style.css" rel = "stylesheet" type = "text/css">
<script language = "JavaScript" src = "script.js"></script>
</head>
<body>
	<%
		//utf-8로 텍스트 설정
		request.setCharacterEncoding("utf-8");
		//작성한 이름 가져오기
		String memName = request.getParameter("memName");
		//작성한 이메일 가져오기
		String memEmail = request.getParameter("memEmail");
		//작성한 전화번호 가져오기
		String memPhone = request.getParameter("memPhone");
		//MemberMgr.java에 가서 getMemberId()메소드를 호출해 값을 넣어 해당 아이디를 가져옴
		RegisterBean member = memMgr.getMemberFindId(memName, memEmail, memPhone);
		
		//아이디가 없을 때
		if(member.getMemId()==null){
	%>		
		<script>
			alert("일치하는 정보의 아이디가 없습니다.");
			location.href="../WatTime/WTMemberIdFind.jsp"
		</script>
	<% 
		//아이디가 있을 때
		}else{
	%>	
		<div class="resultForm">
			<div class="btnContain">
				<input class="btn" type="button" value="아이디 찾기" onclick="idFind()">
				<input class="btn" type="button" value="패스워드 찾기"onclick="passFind()">
			</div>
			<div class="resultContain">
					<font class="resultText">ID: <b><%=member.getMemId() %></b></font>
			</div>
			<div class="resultBtn">
				<input class="nextBtn" type="button" value="로그인하기" onclick="loginPage()">
			</div>
			
		</div>
	<%
		}
	%>
		
	
</body>
</html>