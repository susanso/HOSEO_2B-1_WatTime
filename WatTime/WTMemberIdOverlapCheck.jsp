<%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*" %>
<jsp:useBean id="memMgr" class = "WatTimePack.MemberMgr" scope="page"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script language = "JavaScript" src = "script.js"></script>
</head>
<body>
	<%
		//아이디 중복 확인 눌렀을 때 url 가져오는 부분
		String url = request.getRequestURL().toString();
		if(request.getQueryString() != null)
			url = url + "?"+request.getQueryString();
		//url의 전체 길이(아이디 포함)
		int urlLength = url.length();
		//=표시의 위치를 찾는다
		int urlIndex = url.indexOf("=");
		//substring쪽에서 = 표시까지 출력되서 1 더함
		String memId = url.substring(urlIndex+1,urlLength);
		//아이디 중복 확인 찾는 메소드
		RegisterBean member = memMgr.getMemberIdOverlapCheck(memId);
		//아이디 중복이 아닐 경우
		if(member.getMemId() == null){
	%>
		<%=memId %>는 사용이 가능합니다.<br>
		<input type="hidden" id="useMemIdHD" name="useMemIdHD" value=<%=memId %>>
		<input type="button" id="useMemId" name="useMemId" value="사용하기" onclick="useMemId()">
	<%	
		//중복일 경우
		}else{
	%>	
		<%=memId %>는 중복된 아이디입니다.<br>
		<input type="text" id="memId" name="memId" >
		<input type="button" id="memIdReCheck" name="memIdReCheck" value="중복확인" onclick="idReOverlapCheck()">	
	<% 
		}
	%>
		
		
		
	
</body>
</html>