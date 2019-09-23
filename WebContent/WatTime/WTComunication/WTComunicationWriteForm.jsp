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

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	int ref = Integer.parseInt(request.getParameter("ref"));
	int re_step = Integer.parseInt(request.getParameter("re_step"));
	int re_level = Integer.parseInt(request.getParameter("re_level"));
%>
<body>
	<form method="post" action="WTComunication/WTComunicationWritePro.jsp" id="comunicationForm" enctype="multipart/form-data">
		<!-- WTComunicationWritePro.jsp로 전달할 값 -->
		<input type="hidden" name="num" value="<%=num%>">
		<input type="hidden" name="ref" value="<%=ref%>">
		<input type="hidden" name="re_step" value="<%=re_step%>">
		<input type="hidden" name="re_level" value="<%=re_level%>">
		<!-- 글쓰기 폼 -->
		<table border="1" style="width: 900px;margin:10px auto;border-collapse: collapse;">
			<tr>
				<td style="text-align-last: center;">제목</td>
				<td><input type="text" id="comunicationTitle" name="comunicationTitle" required></td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea id="comunicationContent" class="text1" style="width:'100%';" name="comunicationContent" required></textarea>
				</td>
			</tr>
			<tr >
				<td rowspan="6" style="text-align: center;">
					이미지 업로드<br>
					(사진은 최대 5개까지만 됩니다.)
				</td>
			</tr>
			<tr>
				<td>
					<input type="file" id="filename1" name="filename1" size=40>
				</td>
			</tr>
			<tr>
				<td >
					<input type="file" id="filename2" name="filename2" size=40>
				</td>
			</tr>
			<tr>
				<td >
					<input type="file" id="filename3" name="filename3" size=40>
				</td>
			</tr>
			<tr>
				<td>
					<input type="file" id="filename4" name="filename4" size=40>
				</td>
			</tr>
			<tr>
				<td>
					<input type="file" id="filename5" name="filename5" size=40>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center;">
					<input type="submit" name="imgButton" id="imgButton" value="글쓰기">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>