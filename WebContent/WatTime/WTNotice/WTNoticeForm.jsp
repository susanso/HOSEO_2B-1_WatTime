<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*" %>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="noticeDTO" class = "WatTimePack.WatTimeNoticeDTO" scope="page">
	<jsp:setProperty name="noticeDTO" property="*"/>
</jsp:useBean>
<jsp:useBean id="memberDTO" class = "WatTimePack.WatTimeMemberDTO" scope="page">
	<jsp:setProperty name="memberDTO" property="*"/>
</jsp:useBean>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	int noticeNum = Integer.parseInt(request.getParameter("noticeNum"));
	String pageNum = request.getParameter("pageNum");

	WatTimeNoticeDAO noticeDAO = new WatTimeNoticeDAO();
	
	noticeDTO = noticeDAO.getNoticeContent(noticeNum);
%>
<script language = "JavaScript" src = "WTNotice/js/WTNoticeForm.js"></script>
</head>
<body>
	<table border=1>
		<tr>
			<td>제목</td>
			<td colspan=5><%=noticeDTO.getTitle() %></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><%=noticeDTO.getWriter() %></td>
			<td>작성일</td>
			<td><%=noticeDTO.getWriteDate() %></td>
			<td>조회수</td>
			<td><%=noticeDTO.getCount() %></td>
		</tr>
		<tr>
			<td colspan=6>
<%
				if(noticeDTO.getFileName()!=null){
%>
				<img src="..\img\notice\<%=noticeDTO.getFileName() %>">
<%
				}
%>
				<pre><%=noticeDTO.getContent() %></pre>
			</td>
		</tr>
	</table>
	<input type="button" value="목록" onclick="noticeListBack('<%=pageNum%>')">
<%
	if(session.getAttribute("member")!=null){
		memberDTO = (WatTimeMemberDTO)session.getAttribute("member");
	}
	
	if(memberDTO.getMemAdmin()==1){
%>
		<input type="button" value="글수정" onclick="noticeModify('<%=noticeDTO.getNum()%>')">
		<input type="button" value="글삭제" onclick="noticeDelete('<%=noticeDTO.getNum()%>')">
<%
	}
%>
</body>
</html>