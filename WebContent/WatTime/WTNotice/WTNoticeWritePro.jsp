<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="noticeDTO" class = "WatTimePack.WatTimeNoticeDTO" scope="page">
	<jsp:setProperty name="noticeDTO" property="*"/>
</jsp:useBean>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%@ page import="java.io.File" %>
<%@page import="java.io.PrintWriter" %>
<%
	String realFolder = "";
	String filename1 = "";
	int maxSize = 1024*1024*5;
	String encType = "UTF-8";

	ServletContext scontext = getServletContext();
	//저장할 곳의 경로
	realFolder = scontext.getRealPath("/WatTime/img/notice");
	String file1="";
	String noticeTitle = "";
	String noticeContent = "";
	try{
		MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

		Enumeration<?> files = multi.getFileNames();
		file1  = (String)files.nextElement();
		filename1 = multi.getFilesystemName(file1);
		noticeTitle = multi.getParameter("noticeTitle");
		noticeContent = multi.getParameter("noticeContent");
	} catch(Exception e) {
		e.printStackTrace();
	}
	String fullPath = realFolder + "\\" + filename1;
	String fileName = filename1;
	//noticeDTO에 공지사항 입력값 및 기본값 넣기
	noticeDTO.setTitle(noticeTitle);
	noticeDTO.setContent(noticeContent);
	noticeDTO.setWriter("WatTime");
	noticeDTO.setWriteDate(new Timestamp(System.currentTimeMillis()));
	noticeDTO.setCount(0);
	noticeDTO.setFilePath(fullPath);
	noticeDTO.setFileName(fileName);
	//insert실행
	WatTimeNoticeDAO noticeDAO = new WatTimeNoticeDAO();
	noticeDAO.setNotice(noticeDTO);
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		alert("등록완료");
		var form = document.createElement("form");
		form.setAttribute("charset", "UTF-8");
		form.setAttribute("method", "Post"); // Get 또는 Post 입력
		form.setAttribute("action", "../WTMain.jsp?pageChange=WTNotice/WTNoticeList.jsp?pageNum=1");

		 
		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "pageNum");
		hiddenField.setAttribute("value", "1");
		form.appendChild(hiddenField);
		
		document.body.appendChild(form);

		form.submit();
	</script>
</body>
</html>