<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*,java.util.* , WatTimePack.*" %>
<jsp:useBean id="memberDTO" class = "WatTimePack.WatTimeMemberDTO" scope="page">
	<jsp:setProperty name="memberDTO" property="*"/>
</jsp:useBean>    
<!DOCTYPE html>
<html>
<head>
<link href = "style.css" rel = "stylesheet" type = "text/css">
<script src="script.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<%
	//로그인 X
	if(session.getAttribute("member") == null){
%>
		<div id="top">
			<div class="topContent">
				<ul id="topMenu">
					<li><b><a href="WTMain.jsp?pageChange=WTLogin.jsp">로그인</a></b></li>
					<li><a href="WTMain.jsp?pageChange=WTAgreed.jsp">회원가입</a></li>
					<li>구매후기</li>
					<li>장바구니</li>
					<li>고객센터</li>
				</ul>
			</div>
			
			<div class="topContent" id="logoImg">
				<img id="Logo" alt="Logo" src="img/MainLogo.png"  width="266px" height="auto" onclick="mainBack()" >
			</div>
			<div class="topContent" >
				<jsp:include page="WTTopSearchForm.jsp" flush="false"/>
			</div>
		</div>
		<jsp:include page="WTTopMenu.jsp" flush="false"/>
<%
		//로그인 O
	}else{	
		memberDTO = (WatTimeMemberDTO)session.getAttribute("member");
%>
		<div id="top">
			<div class="topContent">
				<ul id="topMenu">
					<li><%=memberDTO.getMemName() %>님 </li>
					<li><a href="../WatTime/WTLogout.jsp">로그아웃</a> </li>
					<li><a href="WTMain.jsp?pageChange=WTMyPage.jsp">마이페이지</a></li>
					<li>구매후기</li>
					<li>장바구니</li>
					<li>고객센터</li>
				</ul>
			</div>
			
			<div class="topContent" id="logoImg">
				<img id="Logo" alt="Logo" src="img/MainLogo.png"  width="266px" height="auto" onclick="mainBack()" >
			</div>
			<div class="topContent" >
				<jsp:include page="WTTopSearchForm.jsp" flush="false"/>
			</div>
		</div>
		<jsp:include page="WTTopMenu.jsp" flush="false"/>
<%
	}
%>
</body>
</html>