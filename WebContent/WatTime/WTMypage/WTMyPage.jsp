<%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*" %>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="memberDTO" class = "WatTimePack.WatTimeMemberDTO" scope="page">
	<jsp:setProperty name="memberDTO" property="*"/>
</jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href = "style.css" rel = "stylesheet" type = "text/css">
<%
		request.setCharacterEncoding("utf-8");
		memberDTO = (WatTimeMemberDTO)session.getAttribute("member");
%>
</head>
<body>
	
	<div class="frame">
	<!-- //header -->
		<div style="line-height: 90px;
					margin:30px auto;
					width:1300px;
					font-size:50px;
					height:90px;
					font-family: 'Roboto', sans-serif;
					border-bottom:1px solid gray;"
		>
			<div id="faqMainBar">MyPage </div>
			<div id="faqMainBar" class="faqBar">
				<input type="button"
					   value="회원정보"
					   onclick="location.href='WTMain.jsp?pageChange=WTMypage/WTMyPage.jsp'"
				>
				<input type="button"
					   value="주문내역"
					   onclick="location.href='WTMain.jsp?pageChange=WTMypage/WTOrderList.jsp?pageNum=1'"
				>
				<input type="button"
					   value="TicTok"
					   onclick="location.href='WTMain.jsp?pageChange=WTMypage/WTTicTokList.jsp?pageNum=1'"
				>
				<input type="button"
					   value="회원탈퇴"
					   onclick="location.href='WTMain.jsp?pageChange=WTMypage/WTWithdrawalForm.jsp'"
				>
			</div>
		</div>
		<div class="content">
			<table class="memInfo" cellspacing = "0" cellpadding = "0">
				<tr>
					<th>이름</th>
					<td><%=memberDTO.getMemName() %></td>
				</tr>
				<tr>
					<th>아이디</th>
					<td><%=memberDTO.getMemId() %></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><%=memberDTO.getMemEmail() %></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><%=memberDTO.getMemPhone() %></td>
				</tr>
				<tr>
					<th rowspan="3">주소</th>
					<td><%=memberDTO.getMemPostcode() %></td>
				</tr>
				<tr>
					<td><%=memberDTO.getMemRoadAddress() %><%=memberDTO.getMemDetailAddress() %></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button"
							   class="memInfoChange"
							   value="회원정보수정"
							   onclick="location.href='WTMain.jsp?pageChange=WTMypage/WTMemberPassCheck.jsp'"
						>
					</td>
				</tr>
			</table>
		</div>  
	</div>
</body>
</html>