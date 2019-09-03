<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language = "JavaScript" src = "script.js"></script>
<title>WatTime</title>
</head>
<body>
	<ul>
<%
	String brandEng = request.getParameter("brandEng");
	String url = request.getRequestURL().toString();
	//쿼리 문장이 있으면 "?"뒤에 쿼리 문장을 붙임
	if(request.getQueryString() != null)
		url = url +"?"+request.getQueryString();
	//url의 전체 길이
	int urlLength = url.length();
	//brandEng표시의 위치를 찾는다
	int urlIndex = url.indexOf("brandEng");
	//substring쪽에서 = 표시까지 출력되서 9 더함
	String brand = url.substring(urlIndex+9,urlLength);
	
	WatTimeProductDTO rslt = new WatTimeProductDTO();
	try(Connection con = WatTimeDBConnection.getInstance().getConnection()){
		PreparedStatement pstmt = con.prepareStatement("select * from productTbl where brandEng = ?");
		pstmt.setString(1, brandEng);
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