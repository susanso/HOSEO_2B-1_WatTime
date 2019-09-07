<%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*,java.util.* , WatTimePack.*" %>
<jsp:useBean id="memberDTO" class = "WatTimePack.WatTimeMemberDTO" scope="page">
	<jsp:setProperty name="memberDTO" property="*"/>
</jsp:useBean>
<%
	String pageChange;
	request.setCharacterEncoding("utf-8");
	String backURL = request.getParameter("backURL");
	String memId = request.getParameter("memId");
	String memPass = request.getParameter("memPass");
	String referrer = request.getParameter("referrer");
	WatTimeMemberDAO memberDAO = new WatTimeMemberDAO();
	memberDTO = memberDAO.getMember(memId, memPass);
		
	if(memberDTO.getMemId() != null){
		session.setAttribute("member", memberDTO);
		response.sendRedirect("../WatTime/WTMain.jsp");
		//response.sendRedirect("../WatTime/WTMain.jsp");
		return;
	}else{
%>
		<!DOCTYPE html>
		<html>
		<head>
		<meta charset="UTF-8">
		<title>로그인 실패</title>
		</head>
		<body>
			<script type="text/javascript">
				alert("아이디/비밀번호를 확인하여 주십시오.");
				history.go(-1);
			</script>
		</body>
		</html>
<%		
	}
%>	