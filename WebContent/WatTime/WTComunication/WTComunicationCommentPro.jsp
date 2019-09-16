<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*,java.text.*" %>
<%@ page import = "java.sql.Timestamp" %>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="comunicationDTO" class = "WatTimePack.WatTimeComunicationDTO" scope="page">
	<jsp:setProperty name="comunicationDTO" property="*"/>
</jsp:useBean>
<jsp:useBean id="memberDTO" class = "WatTimePack.WatTimeMemberDTO" scope="page">
	<jsp:setProperty name="memberDTO" property="*"/>
</jsp:useBean>
<jsp:useBean id="commentsDTO" class = "WatTimePack.WatTimeComunicationCommentsDTO" scope="page">
	<jsp:setProperty name="commentsDTO" property="*"/>
</jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
	int boardNum = Integer.parseInt(request.getParameter("boardNum"));
	int commentNum = Integer.parseInt(request.getParameter("commentNum"));
	int ref = Integer.parseInt(request.getParameter("ref"));
	int re_step = Integer.parseInt(request.getParameter("re_step"));
	int re_level = Integer.parseInt(request.getParameter("re_level"));
	String memId = request.getParameter("memId");
	String memName = request.getParameter("memName");
	memName = new String(memName.getBytes("8859_1"), "utf-8");
	String comment = request.getParameter("comment");
	comment = new String(comment.getBytes("8859_1"), "utf-8");
	
	int listPageNum = Integer.parseInt(request.getParameter("listPageNum"));
	int listCount = Integer.parseInt(request.getParameter("listCount"));
	
	commentsDTO.setBoardNum(boardNum);
	commentsDTO.setNum(commentNum);
	commentsDTO.setComment(comment);
	commentsDTO.setMemId(memId);
	commentsDTO.setMemName(memName);
	commentsDTO.setRe_level(re_level);
	commentsDTO.setRe_step(re_step);
	commentsDTO.setRef(ref);
	commentsDTO.setWriteDate(new Timestamp(System.currentTimeMillis()));
	
	WatTimeComunicationCommentsDAO commentsDAO = new WatTimeComunicationCommentsDAO();
	commentsDAO.setCommentInsert(commentsDTO);
%>
<body>
	<input type="hidden" id="num" value="<%=boardNum %>">
	<input type="hidden" id="listPageNum" value="<%=listPageNum %>">
	<input type="hidden" id="listCount" value="<%=listCount %>">
	<script>
		var num = document.getElementById("num").value;
		var listPageNum = document.getElementById("listPageNum").value;
		var listCount = document.getElementById("listCount").value;
		alert("댓글 등록을 완료했습니다.");
		var form = document.createElement("form");
		form.setAttribute("charset", "utf-8");
		form.setAttribute("method", "Post"); // Get 또는 Post 입력
		form.setAttribute("action", "WTMain.jsp?pageChange=WTComunication/WTComunicationForm.jsp?pageNum=1");

		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "num");
		hiddenField.setAttribute("value", num);
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "listPageNum");
		hiddenField.setAttribute("value", listPageNum);
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "listCount");
		hiddenField.setAttribute("value", listCount);
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "commentNum");
		hiddenField.setAttribute("value", "0");
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "modify");
		hiddenField.setAttribute("value", "0");
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "ref");
		hiddenField.setAttribute("value", "0");
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "re_step");
		hiddenField.setAttribute("value", "0");
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "re_level");
		hiddenField.setAttribute("value", "0");
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "formPageNum");
		hiddenField.setAttribute("value", "1");
		form.appendChild(hiddenField);
		
		document.body.appendChild(form);
		
		form.submit();
	</script>
</body>
</html>