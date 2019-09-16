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
%>
	<script>
		alert("새 패스워드로 설정됬습니다.");
		var form = document.createElement("form");
		form.setAttribute("charset", "UTF-8");
		form.setAttribute("method", "Post"); // Get 또는 Post 입력
		form.setAttribute("action", "../WTMain.jsp?pageChange=WTMember/WTMemberPassFind.jsp");
		
		document.body.appendChild(form);
		form.submit();
	</script>
</body>
</html>