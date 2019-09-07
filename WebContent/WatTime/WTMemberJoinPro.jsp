<%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*" %>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="memberDTO" class = "WatTimePack.WatTimeMemberDTO" scope="page">
	<jsp:setProperty name="memberDTO" property="*"/>
</jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<script language = "JavaScript" src = "script.js"></script>
<link href = "style.css" rel = "stylesheet" type = "text/css">
<%
		//입력한 회원 정보를 가져옴
		String memId = request.getParameter("memId");
		String memPass = request.getParameter("memPass");
		String memName = request.getParameter("memName");
		String memBirth = request.getParameter("memBirth");
		String memEmail = request.getParameter("memEmail");
		String memPhone = request.getParameter("memPhone");
		String memPostcode = request.getParameter("memPostcode");
		String memRoadAddress = request.getParameter("memRoadAddress");
		String memJibunAddress = request.getParameter("memJibunAddress");
		String memEtcAddress= request.getParameter("memEtcAddress");
		String memDetailAddress =  request.getParameter("memDetailAddress");
		//정보를 테이블에 넣기 위해 setMemberJoin메소드 실행
		WatTimeMemberDAO memberDAO = new WatTimeMemberDAO();
		memberDTO = memberDAO.setMemberJoin(memId, memPass, memName,  memEmail, memPhone, memBirth,  memPostcode, memRoadAddress, memJibunAddress, memEtcAddress, memDetailAddress);
%>
</head>
<body>
	<script>
		//회원가입 성공 화면으로 넘어가는 부분
		location.href="WTMain.jsp?pageChange=WTMemberJoinSuccess.jsp"
	</script>	
</body>
</html>
	