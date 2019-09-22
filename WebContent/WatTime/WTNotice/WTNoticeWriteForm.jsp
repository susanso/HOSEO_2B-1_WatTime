<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="noticeDTO" class = "WatTimePack.WatTimeNoticeDTO" scope="page">
	<jsp:setProperty name="noticeDTO" property="*"/>
</jsp:useBean>
<%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="WTNotice/WTNoticeWritePro.jsp" id="noticeForm" enctype="multipart/form-data">
		<table border="0" class="noticeWriteForm">
			<tr>
				<td class="noticeWriteFormTdRight">제목</td>
				<td><input type="text" class="noticeWriteFormTdLeft" id="noticeTitle" name="noticeTitle" required></td>
			</tr>
			<tr>
				<td colspan="2" style="height:300px;">
					<textarea id="noticeContent" name="noticeContent" required></textarea>
				</td>
			</tr>
			<tr>
				<td class="noticeWriteFormTdImg">이미지 업로드</td>
				<td  style="border:1px solid black;">
					<input type="file" id="filename1" name="filename1" size=40>
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" class="noticeWriteBtn" name="imgButton" id="imgButton" value="글쓰기"></td>
			</tr>
		</table>
	</form>
</body>
</html>