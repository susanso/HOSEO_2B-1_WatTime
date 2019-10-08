<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.text.*,java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*" %>
<%@ page import = "java.sql.Timestamp" %>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="memberDTO" class = "WatTimePack.WatTimeMemberDTO" scope="page">
   <jsp:setProperty name="memberDTO" property="*"/>
</jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<%
	String pass = request.getParameter("withdrawalPass");

	if(session.getAttribute("member") != null){
    	memberDTO = (WatTimeMemberDTO)session.getAttribute("member");
	}
	WatTimeMemberDAO memberDAO = new WatTimeMemberDAO();
	
	int count = memberDAO.getOutMember(memberDTO.getMemId(),pass);
	
	if(count == 1){
		memberDAO.setOutMember(memberDTO.getMemId());
		session.removeAttribute("member");
		session.invalidate();
		response.sendRedirect("../WTMain.jsp?pageChange=WTMypage/WTWithdrawalResult.jsp");
	}else{
%>
	<script>
		alert("회원 정보가 일치하지 않습니다.");
		history.go(-1);
	</script>
<%
	}
%>
<body>
	
</body>
</html>