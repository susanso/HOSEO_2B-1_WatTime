<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.text.*,java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*" %>
<%@ page import = "java.sql.Timestamp" %>
<%
	request.setCharacterEncoding("utf-8");
%>
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
	//세션을 다시 부여하기 전 상태를 가져옴(세션을 새로 부여하여 적립 포인트 등 새로고침을 위해)
	memberDTO = (WatTimeMemberDTO)session.getAttribute("member");
	DecimalFormat df = new DecimalFormat("#,###");
	//결제한 상품 목록의 배열
	String[] productImg = request.getParameterValues("productImg");
	String[] product = request.getParameterValues("product");
	String[] productPrice = request.getParameterValues("productPrice");
	String[] productCount = request.getParameterValues("productCount");
	String[] TicToks = request.getParameterValues("TicTok");
	int useTicTok = Integer.parseInt(request.getParameter("useTicTok"));
%>
<body>
	주문 완료<br>
	주문한 항목을 확인해주세요.
	<table>
<%
		int total = 0;
		int TicTok = 0;
		for ( int i = 0 ; i < product.length ; i++ ) {
			total = total + Integer.parseInt(productPrice[i]);
			TicTok = TicTok + Integer.parseInt(TicToks[i]);
%>
			<tr>
				<td>
					<img src="../WatTime/img/brand/<%=productImg[i] %>" 
						 width="150px" height="150px">
				</td>
				<td>
					<%=product[i] %>
				</td>
				<td>
					<%=df.format(Integer.parseInt(productPrice[i])) %>
				</td>
				<td>
					<%=df.format(Integer.parseInt(productCount[i])) %>
				</td>
				<td>
					<%=df.format(Integer.parseInt(TicToks[i])) %>
				</td>
			</tr>
<%
		}
%>
		<tr>
			<td>
				결제한 금액 : <%=df.format(total) %><br>
				사용한 TicTok : <%=df.format(useTicTok) %><br>
				적립한 TicTok : <%=df.format(TicTok) %>
			</td>
		</tr>
	</table>
	
	
</body>
</html>