<%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*" %>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="memberDTO" class = "WatTimePack.WatTimeMemberDTO" scope="page">
	<jsp:setProperty name="memberDTO" property="*"/>
</jsp:useBean>
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
		//memId 값 가져옴
		String memId = request.getParameter("memId");
		//새로 입력한 패스워드 가져옴
		String memPass = request.getParameter("memPass");
		//새 패스워드를 테이블에 넣기 위해 setMemberNewPass 메소드를 실행
		WatTimeMemberDAO memberDAO = new WatTimeMemberDAO();
		memberDTO = memberDAO.setMemberNewPass(memPass, memId);
		
		//패스워드는 보안으로 post 방식으로 보내기 위해 dispatcher를 이용
		RequestDispatcher rd = request.getRequestDispatcher("WTMain.jsp?pageChange=WTMemberNewPassSuccess.jsp");
		//같이 보낼 객체
		request.setAttribute("memId", memId);
		//권한을 넘겨줌
	    rd.forward(request, response);
%>
</body>
</html>