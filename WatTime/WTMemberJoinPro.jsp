<%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%
	request.setCharacterEncoding("utf-8");
		String memId = "";
		String memName = "";
		String memPass = "";
		String memNickname = "";
		String memBirth = "";
		String memEmail = "";
		String memPhone = "";
		String memPostcode = "";
		String memRoadAddress = "";
		String memDetailAddressmemRoadAddress = "";
		String memJibunAddress = "";
		String memDetailAddress = "";
		
%>
</head>
<script language = "JavaScript" src = "script.js"></script>
<jsp:useBean id="regBean" class = "WatTimePack.RegisterBean" scope = "page"></jsp:useBean>
	<jsp:setProperty name = "regBean" property = "*"/>
<body>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String str = "";
	String sql = "";
	try{
		memId = request.getParameter("memId");
		memName = request.getParameter("memName");
		memPass = request.getParameter("memPass");
		memNickname = request.getParameter("memNickname");
		memBirth = request.getParameter("memBirth");
		memEmail = request.getParameter("memEmail");
		memPhone = request.getParameter("memPhone");
		memPostcode = request.getParameter("memPostcodehd");
		memRoadAddress = request.getParameter("memRoadAddresshd");
		memJibunAddress = request.getParameter("memJibunAddresshd");
		memDetailAddress = request.getParameter("memDetailAddress");
		int memGrant = 0;
	
		String jdbcUrl = "jdbc:mysql://localhost:3306/basicjsp";
		String dbId = "jspid";
		String dbPass = "jsppass";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);


		sql = "insert into memberTbl values(?,?,?,?,?,?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1,memId);
		pstmt.setString(2,memPass);
		pstmt.setString(3,memName);
		pstmt.setString(4,memNickname);
		pstmt.setString(5,memBirth);
		pstmt.setString(6,memEmail);
		pstmt.setString(7,memPhone);
		pstmt.setString(8,memPostcode);
		pstmt.setString(9,memRoadAddress);
		pstmt.setString(10,memJibunAddress);
		pstmt.setString(11,memDetailAddress);
		pstmt.setInt(12,memGrant);
		pstmt.executeUpdate();
		%>
		회원가입이 완료되었습니다.<br><br>
		<a href="memberJoin.jsp"><button>확인</button></a>
		
		<%
	}catch(Exception e){
		e.printStackTrace();
		str = "회원가입에 실패했습니다.";
	}finally{
		if(pstmt != null){
			try{pstmt.close();}catch(SQLException sqle){}
		}
		if(conn != null){
			try{conn.close();}catch(SQLException sqle){}
		}
	}
%>
</body>
</html>