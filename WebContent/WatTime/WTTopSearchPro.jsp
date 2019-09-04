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
%>
</head>
<body>
	<ul>
<%
		try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
			PreparedStatement pstmt = con.prepareStatement("select * from productTbl where productName like '%"+unText+"%' or brandEng like '%"+unText+"%' or brandKor like '%"+unText+"%' or productType like '%"+unText+"%'");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String productCode=rs.getString("productCode");
				String productName=rs.getString("productName");
				int productPrice=Integer.parseInt(rs.getString("productPrice"));
%>
				<li class="productLi">
					<div><img src="img/<%=productCode %>.jpg" name="<%=productCode %>" onclick="test(this.name)"></div>
					<div><%=productPrice %></div>
				</li>
<%
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}

%>
	</ul>
</body>
</html>