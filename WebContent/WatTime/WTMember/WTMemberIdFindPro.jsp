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
<title>아이디 찾기</title>
</head>
<body>
<%
	//작성한 이름 가져오기
	String memName = request.getParameter("memName");
	//작성한 이메일 가져오기
	String memEmail = request.getParameter("memEmail");
	//작성한 전화번호 가져오기
	String memPhone = request.getParameter("memPhone");
	//WatTimeMemberDTO.java에 가서 getMemberId()메소드를 호출해 값을 넣어 해당 아이디를 가져옴
	WatTimeMemberDAO memberDAO = new WatTimeMemberDAO();
	memberDTO = memberDAO.getMemberFindId(memName, memEmail, memPhone);
	String memId = memberDTO.getMemId();
	//아이디가 없을 때
	if(memberDTO.getMemId()==null || memberDTO.getMemId()== "" ){
%>		
		<script>
			alert("일치하는 아이디가 없습니다.");
			var form = document.createElement("form");
			form.setAttribute("charset", "UTF-8");
			form.setAttribute("method", "Post"); // Get 또는 Post 입력
			form.setAttribute("action", "../WTMain.jsp?pageChange=WTMember/WTMemberIdFind.jsp");
			document.body.appendChild(form);
			
			form.submit();
		</script>
<% 
//아이디가 있을 때
	}else{
%>
		<input type="hidden" id="memId" value="<%=memId %>">
		<script>
			var memId = document.getElementById("memId").value;
			var form = document.createElement("form");
			form.setAttribute("charset", "UTF-8");
			form.setAttribute("method", "Post"); // Get 또는 Post 입력
			form.setAttribute("action", "../WTMain.jsp?pageChange=WTMember/WTMemberIdFindForm.jsp");
		
			var hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "memId");
			hiddenField.setAttribute("value", memId);
			form.appendChild(hiddenField);
			
			document.body.appendChild(form);
			form.submit();
		</script>
<%
	}
%>
		
	
</body>
</html>