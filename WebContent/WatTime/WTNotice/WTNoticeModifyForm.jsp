<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<jsp:useBean id="noticeDTO" class = "WatTimePack.WatTimeNoticeDTO" scope="page">
	<jsp:setProperty name="noticeDTO" property="*"/>
</jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	request.setCharacterEncoding("utf-8");
	int noticeNum =Integer.parseInt(request.getParameter("noticeNum"));
	
	WatTimeNoticeDAO noticeDAO = new WatTimeNoticeDAO();
	noticeDTO = noticeDAO.getNoticeModifyContent(noticeNum);
%>
</head>
<body>
	<form method="post" action="WTNotice/WTNoticeModifyPro.jsp" id="noticeForm" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<td>제목</td>
				<td><input type="text" id="noticeTitle" name="noticeTitle" value="<%=noticeDTO.getTitle() %>"></td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea id="noticeContent" name="noticeContent" required><%=noticeDTO.getContent() %></textarea>
				</td>
			</tr>
			<tr>
				<td>이미지 업로드</td>
				<td>
					<input type="file" id="filename1" name="filename1" size=40 ><br>
					<input type="checkbox" name="imgCheck" value="no">사진 사용 X
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="hidden" name="noticeNum" value="<%=noticeNum%>">
					<input type="submit" name="imgButton" id="imgButton" value="글수정">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>