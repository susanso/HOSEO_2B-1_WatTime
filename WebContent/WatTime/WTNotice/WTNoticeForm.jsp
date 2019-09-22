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
<link href = "style.css	" rel = "stylesheet" type = "text/css">
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
	<div id="noticeForm">
		<table border="0" id="noticeFormTable">
			<tr class="noticeFormTr">
				<td class="noticeFormTd">제목</td>
				<td class="noticeFormTd" colspan=5><%=noticeDTO.getTitle() %></td>
			</tr>
			<tr class="noticeFormTr">
				<td class="noticeFormTd">작성자</td>
				<td class="noticeFormTd"><%=noticeDTO.getWriter() %></td>
				<td class="noticeFormTd">작성일</td>
				<td class="noticeFormTd"><%=noticeDTO.getWriteDate() %></td>
				<td class="noticeFormTd">조회수</td>
				<td class="noticeFormTd"><%=noticeDTO.getCount() %></td>
			</tr>
			<tr class="noticeFormTr">
				<td class="noticeFormTd" colspan=6>
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
		<div style="margin:10px auto; width:1300px; text-align:center;">
		<input class="noticeFormButton" type="button" value="목록" onclick="noticeListBack('<%=pageNum%>')">
<%
		if(session.getAttribute("member")!=null){
			memberDTO = (WatTimeMemberDTO)session.getAttribute("member");
		}
		
		if(memberDTO.getMemAdmin()==1){
%>
			<input class="noticeFormButton" type="button" value="글수정" onclick="noticeModify('<%=noticeDTO.getNum()%>')">
			<input class="noticeFormButton" type="button" value="글삭제" onclick="noticeDelete('<%=noticeDTO.getNum()%>')">
<%
		}
%>
		</div>
	</div>
</body>
</html>