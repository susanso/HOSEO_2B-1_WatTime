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
		String memDetailAddress =  request.getParameter("memDetailAddress");
		
		WatTimeMemberDAO memberDAO = new WatTimeMemberDAO();
		
		int phoneCount = memberDAO.getMemPhoneCheck(memPhone);
		int emailCount = memberDAO.getMemEmailCheck(memEmail);
		
		if(phoneCount != 0){
%>
			<script>
				alert("해당 전화번호는 가입된 전화번호입니다.");
				location.href="../WTMain.jsp?pageChange=WTMember/WTMemberJoin.jsp"
			</script>	
<%
		}
		else if(emailCount != 0){
%>
			<script>
				alert("해당 이메일은 가입된 이메일입니다.");
				location.href="../WTMain.jsp?pageChange=WTMember/WTMemberJoin.jsp"
			</script>
<%
		}
		else{
			memberDTO = memberDAO.setMemberJoin(memId, memPass, memName,  memEmail, memPhone, 
												memBirth,  memPostcode, memRoadAddress, memDetailAddress);
		}	
%>
</head>
<body>
	<script>
		//회원가입 성공 화면으로 넘어가는 부분
		location.href="../WTMain.jsp?pageChange=WTMember/WTMemberJoinSuccess.jsp"
	</script>	
</body>
</html>
	