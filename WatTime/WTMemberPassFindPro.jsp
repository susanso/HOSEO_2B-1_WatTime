<%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*" %>
<jsp:useBean id="memMgr" class = "WatTimePack.MemberMgr" scope="page"></jsp:useBean>
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
		//작성한 아이디 가져오기
		String memId = request.getParameter("memId");
		//작성한 이메일 가져오기
		String memEmail = request.getParameter("memEmail");
		//작성한 전화번호 가져오기
		String memPhone = request.getParameter("memPhone");
		//MemberMgr.java에 가서 getMemberId()메소드를 호출해 값을 넣어 해당 아이디를 가져옴
		RegisterBean member = memMgr.getMemberFindPass(memId, memEmail, memPhone);
		
		//아이디가 없을 때
		if(member.getMemId()==null){
	%>
		<script>
			alert("일치하는 정보의 아이디가 없습니다.");
			location.href="WTMain.jsp?pageChange=WTMemberPassFind.jsp"
		</script>
	<%
		}else{
			RequestDispatcher rd = request.getRequestDispatcher("WTMain.jsp?pageChange=WTMemberNewPass.jsp");
			request.setAttribute("memId", memId);
			
		    rd.forward(request, response);
	%>
		<input type="hidden" id="memId" name="memId" value="<%=memId%>">
	<%
		}
	%>
</body>
</html>