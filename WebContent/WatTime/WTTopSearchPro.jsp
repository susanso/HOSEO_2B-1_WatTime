<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*" %>

<jsp:useBean id="productDTO" class = "WatTimePack.WatTimeProductDTO" scope="page">
	<jsp:setProperty name="productDTO" property="*"/>
</jsp:useBean>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="script.js"></script>
<script>
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WatTime</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String url = request.getRequestURL().toString();
	if(request.getQueryString() != null)
	url = url + "?"+request.getQueryString();
	//url의 전체 길이
	int urlLength = url.length();
	//text표시의 위치를 찾는다
	int urlIndex = url.indexOf("text");
	//substring쪽에서 = 표시까지 출력되서 5 더함
	String searchText = url.substring(urlIndex+5,urlLength);
	//언코드 시킨 텍스트
	String unText = java.net.URLDecoder.decode(searchText);
	
	WatTimeProductDAO productDAO = new WatTimeProductDAO();
	List<WatTimeProductDTO> productList = null;
	
	productList = productDAO.getSearchProduct(unText);
	
	for(int i = 0 ; i < productList.size() ; i++){
		productDTO = productList.get(i);
%>

	<ul>
	<li class="productLi">
		<div><img src="img/<%=productDTO.getProductCode() %>.jpg" name="<%=productDTO.getProductCode() %>" onclick="test(this.name)"></div>
		<div><%=productDTO.getProductPrice() %></div>
	</li>
	</ul>
<%
	}		
%>
</body>
</html>