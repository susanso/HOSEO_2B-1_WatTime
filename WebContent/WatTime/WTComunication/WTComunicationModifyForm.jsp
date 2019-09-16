<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*,java.text.*" %>
<%@ page import = "java.sql.Timestamp" %>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="comunicationDTO" class = "WatTimePack.WatTimeComunicationDTO" scope="page">
	<jsp:setProperty name="comunicationDTO" property="*"/>
</jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
	int boardNum = Integer.parseInt(request.getParameter("boradNum"));
	int pageNum = Integer.parseInt(request.getParameter("formPageNum"));
	int listPageNum = Integer.parseInt(request.getParameter("listPageNum"));
	int listCount = Integer.parseInt(request.getParameter("listCount"));
	
	WatTimeComunicationDAO comunicationDAO = new WatTimeComunicationDAO();
	
	comunicationDTO = comunicationDAO.getComunicationForm(boardNum);
%>
<body>
	<form method="post" action="WTComunication/WTComunicationModifyPro.jsp" id="comunicationForm" enctype="multipart/form-data">
		<!-- WTComunicationModifyPro.jsp로 전달할 값 -->
		<input type="hidden" id="boardNum" name="boardNum" value="<%=boardNum %>">
		<input type="hidden" id="formPageNum" name="formPageNum" value="<%=pageNum %>">
		<input type="hidden" id="listPageNum" name="listPageNum" value="<%=listPageNum %>">
		<input type="hidden" id="listCount" name="listCount" value="<%=listCount %>">
		<!-- 글쓰기 폼 -->
		<table border="1">
			<tr>
				<td>제목</td>
				<td><input type="text" id="comunicationTitle" name="comunicationTitle" value="<%=comunicationDTO.getTitle() %>" required></td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea id="comunicationContent" name="comunicationContent" required><%=comunicationDTO.getContent() %></textarea>
				</td>
			</tr>
			<tr >
				<td rowspan="6">
					이미지 업로드<br>
					(사진은 최대 5개까지만 됩니다.<br>수정 시 사진을 사용하실려면 다시 올려주세요.)
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
				<td colspan="2">
					<input type="submit" name="imgButton" id="imgButton" value="글수정">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>