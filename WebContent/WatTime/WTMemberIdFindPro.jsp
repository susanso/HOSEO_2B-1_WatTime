<%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*" %>
<jsp:useBean id="memMgr" class = "WatTimePack.WatTimeMemberDAO" scope="page">
	<jsp:getProperty name="memMgr" property="*"/>
</jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link href = "style.css" rel = "stylesheet" type = "text/css">
<script language = "JavaScript" src = "script.js"></script>
</head>
<body>
	<%
		String pageChange;
			//utf-8로 텍스트 설정
			request.setCharacterEncoding("utf-8");
			//작성한 이름 가져오기
			String memName = request.getParameter("memName");
			//작성한 이메일 가져오기
			String memEmail = request.getParameter("memEmail");
			//작성한 전화번호 가져오기
			String memPhone = request.getParameter("memPhone");
			//WatTimeMemberDTO.java에 가서 getMemberId()메소드를 호출해 값을 넣어 해당 아이디를 가져옴
			WatTimeMemberDTO member = memMgr.getMemberFindId(memName, memEmail, memPhone);
			String memId = member.getMemId();
			//아이디가 없을 때
			if(member.getMemId()==null || member.getMemId()== "" ){
	%>		
		<script>
			alert("일치하는 정보의 아이디가 없습니다.");
			//include를 이용하기 위에 WTMain.jsp에 pageChange 변수에 WTMemberIdFind.jsp를 넣는다.
			location.href="WTMain.jsp?pageChange=WTMemberIdFind.jsp"
		</script>
	<% 
		//아이디가 있을 때
		}else{
			//다음 페이지에 memId를 전달하기 위해 URL에 sql로 찾은 memId 값을 넣음
			response.sendRedirect("WTMain.jsp?pageChange=WTMemberIdFindForm.jsp?memId="+memId);	
		}
	%>
		
	
</body>
</html>