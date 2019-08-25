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
		//utf-8로 텍스트 설정
		request.setCharacterEncoding("utf-8");
		//작성한 아이디 가져오기
		String memId = request.getParameter("memId");
		//작성한 이메일 가져오기
		String memEmail = request.getParameter("memEmail");
		//작성한 전화번호 가져오기
		String memPhone = request.getParameter("memPhone");
		//MemberMgr.java에 가서 getMemberId()메소드를 호출해 값을 넣어 해당 아이디를 가져옴
		RegisterBean member = memMgr.getMemberFindPass(memId, memEmail, memPhone);
		
		//아이디가 없을 때
		if(member.getMemId()==null){
	%>
		<script>
			alert("일치하는 정보의 아이디가 없습니다.");
			location.href="../WatTime/WTMemberPassFind.jsp"
		</script>
	<%
		}else{
	%>
		<div class="newPassForm">
			<div class="btnContain">
				<input class="btn" type="button" value="아이디 찾기" onclick="idFind()">
				<input class="btn" type="button" value="패스워드 찾기" onclick="passFind()">
			</div>
			<div class="inputContain">
				<form method="post" id="newPassForm" name="newPassForm" action="WTMemberNewPassPro.jsp">
					<div>
						<div>
							<input class="newPassInputText" type="password" id="memPass" name="memPass" placeholder="새 패스워드"><br>
						</div>
						<div>
							<input class="newPassInputText" type="password" id="memPassCheck" name="memPassCheck" placeholder="새 패스워드 확인"><br>
						</div>
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
	<%
		}
	%>
</body>
</html>