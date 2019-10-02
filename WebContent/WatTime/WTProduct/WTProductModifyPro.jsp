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
	int productVolume=0;
	String productSimpleImgHidden = "";
	String productDetailImgHidden = "";
	int maxSize = 1024*1024*5;
	String encType = "UTF-8";
	
	ServletContext scontext = getServletContext();
	//저장할 곳의 경로
	String realFolder = scontext.getRealPath("/WatTime/img/brand");
	try{
		
		MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy()); 
		
		Enumeration<?> files = multi.getFileNames();
		String productSimpleImg  = (String)files.nextElement();
		String productDetailImg  = (String)files.nextElement();
		productSimpleImgFileName = multi.getFilesystemName(productSimpleImg);
		productDetailImgFileName = multi.getFilesystemName(productDetailImg);

		if(productSimpleImgFileName==""||productSimpleImgFileName==null){
			productSimpleImgFileName = multi.getParameter("productSimpleImgHidden");
		}
		if(productDetailImgFileName==""||productDetailImgFileName==null){
			productDetailImgFileName = multi.getParameter("productDetailImgHidden");
		}
		
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
		productVolume = Integer.parseInt(multi.getParameter("productVolume"));
		
	} catch(Exception e) {
		e.printStackTrace();
	}
	productSimpleImgFilePath = realFolder + "\\" + productSimpleImgFileName;
	productDetailImgFilePath = realFolder + "\\" + productDetailImgFileName;
	
	WatTimeProductDAO productDAO = new WatTimeProductDAO();
	
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
	productDTO.setProductSimpleImgFileName(productSimpleImgFileName);
	productDTO.setProductDetailImgFileName(productDetailImgFileName);
	productDTO.setProductVolume(productVolume);

	productDAO.setProductModify(productDTO);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language = "JavaScript" src = "js/WTNotice.js"></script>
<title>Insert title here</title>
</head>
<body>
	<input type="hidden" id="productCode" value="<%=productCode %>">
	<script>
		alert("상품 수정 완료");
		
		var productCode = document.getElementById("productCode").value
		var form = document.createElement("form");
		form.setAttribute("charset", "UTF-8");
		form.setAttribute("method", "Post"); // Get 또는 Post 입력
		form.setAttribute("action", "../WTMain.jsp?pageChange=WTProduct/WTProductSpec.jsp?pageNum=1");

		 
		var hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "productCode");
		hiddenField.setAttribute("value", productCode);
		form.appendChild(hiddenField);

		 
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "modify");
		hiddenField.setAttribute("value", "0");
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "sort");
		hiddenField.setAttribute("value", "reg_date DESC");
		form.appendChild(hiddenField);
		
		
		document.body.appendChild(form);
		
		form.submit();
	</script>
</body>
</html>