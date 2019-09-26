<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%@ page import="java.io.File" %>
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
	String title = "";
	String content = "";
	String photo1 = "";
	String photo2 = "";
	String photo3 = "";
	String photo4 = "";
	String photo5 = "";
	int boardNum= 0;
	int formPageNum = 0;
	int listPageNum = 0;
	int listCount = 0;
	int maxSize = 1024*1024*30;
	String encType = "UTF-8";
	//저장할 폴더
	String savefile = "img/comunication";
	ServletContext scontext = getServletContext();
	//저장할 곳의 경로
	String realFolder = scontext.getRealPath("/WatTime/img/comunication");
	try{
		
		MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy()); 
		
		Enumeration<?> files = multi.getFileNames();
		photo5 = (String)files.nextElement();
		photo4 = (String)files.nextElement();
		photo3 = (String)files.nextElement();
		photo2 = (String)files.nextElement();
		photo1 = (String)files.nextElement();
		photo1 = multi.getFilesystemName(photo1);
		photo2 = multi.getFilesystemName(photo2);
		photo3 = multi.getFilesystemName(photo3);
		photo4 = multi.getFilesystemName(photo4);
		photo5 = multi.getFilesystemName(photo5);
	
		title = multi.getParameter("comunicationTitle");
		content = multi.getParameter("comunicationContent");
		boardNum = Integer.parseInt(multi.getParameter("boardNum"));
		formPageNum = Integer.parseInt(multi.getParameter("formPageNum"));
		listPageNum = Integer.parseInt(multi.getParameter("listPageNum"));
		listCount = Integer.parseInt(multi.getParameter("listCount"));
	} catch(Exception e) {
		e.printStackTrace();
	}
	//productSimpleImgFilePath = realFolder + "\\" + productSimpleImgFileName;
	//productDetailImgFilePath = realFolder + "\\" + productDetailImgFileName;
	
	comunicationDTO.setNum(boardNum);
	comunicationDTO.setTitle(title);
	comunicationDTO.setContent(content);	
	comunicationDTO.setPhoto1(photo1);
	comunicationDTO.setPhoto2(photo2);
	comunicationDTO.setPhoto3(photo3);
	comunicationDTO.setPhoto4(photo4);
	comunicationDTO.setPhoto5(photo5);

	
	WatTimeComunicationDAO comunicationDAO = new WatTimeComunicationDAO();
	comunicationDAO.setComunicationUpdate(comunicationDTO);
%>
<body>
	<input type="hidden" id="num" value="<%=boardNum %>">
	<input type="hidden" id="formPageNum" value="<%=formPageNum %>">
	<input type="hidden" id="listPageNum" value="<%=listPageNum %>">
	<input type="hidden" id="listCount" value="<%=listCount %>">
	
	<script>
		alert("글 수정을 완료했습니다.");
		var num = document.getElementById("num").value;
		var formPageNum = document.getElementById("formPageNum").value;
		var listPageNum = document.getElementById("listPageNum").value;
		var listCount = document.getElementById("listCount").value;
		
		var form = document.createElement("form");
		form.setAttribute("charset", "utf-8");
		form.setAttribute("method", "Post"); // Get 또는 Post 입력
		form.setAttribute("action", "../WTMain.jsp?pageChange=WTComunication/WTComunicationForm.jsp?pageNum="+formPageNum);
	
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "num");
		hiddenField.setAttribute("value", num);
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "formPageNum");
		hiddenField.setAttribute("value", formPageNum);
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
		hiddenField.setAttribute("name", "commentNum");
		hiddenField.setAttribute("value", "0");
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "modify");
		hiddenField.setAttribute("value", "0");
		form.appendChild(hiddenField);
		
		document.body.appendChild(form);
		
		form.submit();
	</script>
</body>
</html>