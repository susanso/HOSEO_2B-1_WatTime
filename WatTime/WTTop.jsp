<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*,java.util.* , WatTimePack.*" %>
<jsp:useBean id="memMgr" class = "WatTimePack.MemberMgr" scope="page"></jsp:useBean>    
<!DOCTYPE html>
<html>
<head>
	<link href = "style.css" rel = "stylesheet" type = "text/css">
	<script src="script.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>

</style>
</head>
<body>
	<%
	//로그인 X
	if(session.getAttribute("member") == null){
	%>
		<div id="top">
			<div class="topContent">
				<ul id="topMenu">
					<li><b><a href="../WatTime/WTLogin.jsp">로그인</a></b></li>
					<li><a href="../WatTime/WTMemberJoin.jsp">회원가입</a></li>
					<li>구매후기</li>
					<li>장바구니</li>
					<li>고객센터</li>
				</ul>
			</div>
			
			<div class="topContent">
				<img id="Logo" alt="Logo" src="img/MainLogo.png"  width="auto" height="165px"  >
			</div>
			
			<div class="topContent" >
				<div id="searchMenu">
					<form class="search" action="가야하는.php" style="margin:auto;max-width:300px">
					   <input type="text"  name="search2">
					   <button type="submit"><i class="fa fa-search"></i></button>
					</form>
				</div>
			</div>
		</div>
		
		<div id="subTop" align ="center">
			<ul id="topMenu">
					<li>BRAND</li>
					<li>MAN</li>
					<li>WOMAN</li>
					<li>COUPLE</li>
				</ul>
		</div>
	
	<%
		//로그인 O
		}else{
			RegisterBean member = (RegisterBean)session.getAttribute("member");
	%>
		<div id="top">
			<div class="topContent">
				<ul id="topMenu">
					<li><%=member.getMemName() %>님 </li>
					<li><a href="../WatTime/WTLogout.jsp">로그아웃</a> </li>
					<li><a href="#">마이페이지</a></li>
					<li>구매후기</li>
					<li>장바구니</li>
					<li>고객센터</li>
				</ul>
			</div>
			
			<div class="topContent">
				<img id="Logo" alt="Logo" src="img/MainLogo.png"  width="auto" height="165px"  >
			</div>
			
			<div class="topContent" >
				<div id="searchMenu">
					<form class="search" action="가야하는.php" style="margin:auto;max-width:300px">
					   <input type="text"  name="search2">
					   <button type="submit"><i class="fa fa-search"></i></button>
					</form>
				</div>
			</div>
		</div>
		
		<div id="subTop" align ="center">
			<ul id="topMenu">
					<li>BRAND</li>
					<li>MAN</li>
					<li>WOMAN</li>
					<li>COUPLE</li>
				</ul>
		</div>
	<%} %>

<div id="mid">
 컨텐츠
</div>

<div id="bottom">
 고객센터 등등
</div>
</body>
</html>