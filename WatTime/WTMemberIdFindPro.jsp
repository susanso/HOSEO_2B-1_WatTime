<%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*,java.util.* , watTime.*" %>
<jsp:useBean id="memMgr" class = "watTime.MemberMgr" scope="page"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		찾으시는 아이디는 <%=member.getMemId() %>입니다.
		<input type="button" value="로그인하기" onclick="loginPage()">
		<input type="button" value="패스워드 찾기" onclick="passFind()">
	<%
		}
	%>
		
	
</body>
</html>