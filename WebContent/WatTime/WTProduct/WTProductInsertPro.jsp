<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%@ page import="java.io.File" %>
<%@page import="java.io.PrintWriter" %>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="productDTO" class = "WatTimePack.WatTimeProductDTO" scope="page">
	<jsp:setProperty name="productDTO" property="*"/>
</jsp:useBean>

<%
	String productCode = "";
	String productName = "";
	String brandEng = "";
	String brandKor = "";
	String type = "";
	String productOriginalPrice = "";
	String productSale = "";
	String productPrice = "";
	String tictok = "";
	String productCountry = "";
	String productSimpleImgFileName = "";
	String productSimpleImgFilePath = "";
	String productDetailImgFileName = "";
	String productDetailImgFilePath = "";
	int maxSize = 1024*1024*5;
	String encType = "UTF-8";
	//저장할 폴더
	String savefile = "img/brand";
	ServletContext scontext = getServletContext();
	//저장할 곳의 경로
	//String realFolder = scontext.getRealPath(savefile);
	String realFolder = scontext.getRealPath("/WatTime/img/brand");

	try{
		
		MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy()); 
		
		Enumeration<?> files = multi.getFileNames();
		String productSimpleImg  = (String)files.nextElement();
		String productDetailImg  = (String)files.nextElement();
		productSimpleImgFileName = multi.getFilesystemName(productSimpleImg);
		productDetailImgFileName = multi.getFilesystemName(productDetailImg);
		productCode = multi.getParameter("productCode");
		productName = multi.getParameter("productName");
		brandEng = multi.getParameter("brand");
		brandKor = multi.getParameter("brandKor");
		type = multi.getParameter("type");
		productOriginalPrice = multi.getParameter("productOriginalPrice");
		productSale = multi.getParameter("productSale");
		productPrice = multi.getParameter("productPrice");
		tictok = multi.getParameter("tictok");
		productCountry = multi.getParameter("productCountry");
	} catch(Exception e) {
		e.printStackTrace();
	}
	productSimpleImgFilePath = realFolder + "\\" + productSimpleImgFileName;
	productDetailImgFilePath = realFolder + "\\" + productDetailImgFileName;
	
	
	productDTO.setProductCode(productCode);
	productDTO.setBrandKor(brandKor);
	productDTO.setBrandEng(brandEng);
	productDTO.setProductName(productName);
	productDTO.setProductType(type);
	productDTO.setProductOriginalPrice(Integer.parseInt(productOriginalPrice));
	productDTO.setProductSale(Integer.parseInt(productSale));
	productDTO.setProductPrice(Integer.parseInt(productPrice));
	productDTO.setTictok(Integer.parseInt(tictok));
	productDTO.setProductCountry(productCountry);
	productDTO.setProductOrder(0);
	productDTO.setProductAddDate(new Timestamp(System.currentTimeMillis()));
	productDTO.setProductSimpleImgFileName(productSimpleImgFileName);
	productDTO.setProductDetailImgFileName(productDetailImgFileName);
	productDTO.setProductSimpleImgFilePath(productSimpleImgFilePath);
	productDTO.setProductDetailImgFilePath(productDetailImgFilePath);

	WatTimeProductDAO productDAO = new WatTimeProductDAO();
	productDAO.setProduct(productDTO);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<script>
		
		alert("등록 완료");
		var form = document.createElement("form");
		form.setAttribute("charset", "utf-8");
		form.setAttribute("method", "Post"); // Get 또는 Post 입력
		form.setAttribute("action", "../WTMain.jsp?pageChange=WTProduct/WTProduct.jsp?pageNum=1");
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "brandEng");
		hiddenField.setAttribute("value", "all");
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "type");
		hiddenField.setAttribute("value", "");
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "sort");
		hiddenField.setAttribute("value", "productOrder DESC");
		form.appendChild(hiddenField);
		
		document.body.appendChild(form);
		
		form.submit();
	</script>
</body>
</html>