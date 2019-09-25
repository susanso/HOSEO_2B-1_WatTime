<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%@ page import="java.io.File" %>
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
<title>Insert title here</title>
</head>
<%
	if(session.getAttribute("member") != null){
		memberDTO = (WatTimeMemberDTO)session.getAttribute("member");
	}
	String title = "";
	String content = "";
	String memId = memberDTO.getMemId();
	String memName = memberDTO.getMemName();
	String photo1 = "";
	String photo2 = "";
	String photo3 = "";
	String photo4 = "";
	String photo5 = "";
	int ref = 0;
	int re_step = 0;
	int re_level = 0;
	int num=0;
	int maxSize = 1024*1024*30;
	String encType = "UTF-8";
	//저장할 폴더
	String savefile = "img/comunication";
	ServletContext scontext = getServletContext();
	//저장할 곳의 경로
	String realFolder = scontext.getRealPath(savefile);
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
		num = Integer.parseInt(multi.getParameter("num"));
		ref = Integer.parseInt(multi.getParameter("ref"));
		re_step = Integer.parseInt(multi.getParameter("re_step"));
		re_level = Integer.parseInt(multi.getParameter("re_level"));
	} catch(Exception e) {
		e.printStackTrace();
	}
	//productSimpleImgFilePath = realFolder + "\\" + productSimpleImgFileName;
	//productDetailImgFilePath = realFolder + "\\" + productDetailImgFileName;
	
	comunicationDTO.setNum(num);
	comunicationDTO.setMemId(memId);
	comunicationDTO.setMemName(memName);
	comunicationDTO.setTitle(title);
	comunicationDTO.setContent(content);	
	comunicationDTO.setWriteDate(new Timestamp(System.currentTimeMillis()));
	comunicationDTO.setReadCount(0);
	comunicationDTO.setRe_level(re_level);
	comunicationDTO.setRe_step(re_step);
	comunicationDTO.setRef(ref);
	comunicationDTO.setPhoto1(photo1);
	comunicationDTO.setPhoto2(photo2);
	comunicationDTO.setPhoto3(photo3);
	comunicationDTO.setPhoto4(photo4);
	comunicationDTO.setPhoto5(photo5);
	comunicationDTO.setRecommend(0);
	comunicationDTO.setUnrecommend(0);

	WatTimeComunicationDAO comunicationDAO = new WatTimeComunicationDAO();
	comunicationDAO.setComunicationInsert(comunicationDTO);
%>
<body>
	<script>
		alert("게시글 작성을 완료했습니다.");
		var form = document.createElement("form");
		form.setAttribute("charset", "utf-8");
		form.setAttribute("method", "Post"); // Get 또는 Post 입력
		form.setAttribute("action", "../WTMain.jsp?pageChange=WTComunication/WTComunicationList.jsp?pageNum=1");

		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "pageNum");
		hiddenField.setAttribute("value", "1");
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "listCount");
		hiddenField.setAttribute("value", "10");
		form.appendChild(hiddenField);
		
		
		document.body.appendChild(form);
		
		form.submit();
	</script>
</body>
</html>