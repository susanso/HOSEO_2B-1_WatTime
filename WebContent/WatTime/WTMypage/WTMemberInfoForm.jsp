<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.text.*,java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*" %>
<%@ page import = "java.sql.Timestamp" %>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="memberDTO" class = "WatTimePack.WatTimeMemberDTO" scope="page">
   <jsp:setProperty name="memberDTO" property="*"/>
</jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script language = "JavaScript" src="WTMypage/js/WTMemberInfoForm.js"></script>
</head>
<link href = "style.css" rel = "stylesheet" type = "text/css">
<%
	String passText = request.getParameter("passText");
	WatTimeMemberDAO memberDAO = new WatTimeMemberDAO();
	memberDTO = (WatTimeMemberDTO)session.getAttribute("member");
		
	int count = memberDAO.getMemCheck(memberDTO.getMemId(),passText);
		
	if(count == 0){
%>
		<script>
			alert("패스워드가 일치하지 않습니다.");
			location.href="WTMain.jsp?pageChange=WTMypage/WTMemberPassCheck.jsp";
		</script>
<%
	}
%>
<body>
	<div class="content">
		<form id="memberInfoForm" name="memberInfoForm" method="post" action="WTMypage/WTMemberInfoPro.jsp">
			<table class="memInfo" cellspacing = "0" cellpadding = "0">
				<tr>
					<th>이름</th>
					<td>
						<%=memberDTO.getMemName() %>
					</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td>
						<span id="memId"><%=memberDTO.getMemId() %></span>
					</td>
				</tr>
				<tr>
					<th>패스워드</th>
					<td>
						<input type="password"
							   id="memPass"
							   name="memPass"
							   placeholder="패스워드(영문,숫자,특수문자 조합 8~25자)"
						>
					</td>
				</tr>
				<tr>
					<th>패스워드 확인</th>
					<td>
						<input type="password"
							   id="memPassCheck"
							   name="memPassCheck"
							   placeholder="패스워드 확인"
						>
					</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>
						<input type="number"
							   id="memBirth"
							   name="memBirth"
							   placeholder="생년월일(-없이 8자)"
							   value="<%=memberDTO.getMemBirth() %>"
						>
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="text"
							   id="memEmail"
							   name="memEmail"
							   placeholder="이메일"
							   value="<%=memberDTO.getMemEmail() %>"
							   required
						>
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<input type="number"
							   id="memPhone"
							   name="memPhone"
							   placeholder="전화번호"
							   value="<%=memberDTO.getMemPhone() %>"
							   required
						>
					</td>
				</tr>
				<tr>
					<th rowspan="4">주소</th>
					<td>
						<input type="text"
							   id="memPostcode"
							   name="memPostcode"
							   size = "10"
							   placeholder="우편번호"
							   value="<%=memberDTO.getMemPostcode() %>"
							   readonly
						>
						<input type="button" value="우편번호 찾기" onclick="postcode()">
					</td>
				</tr>
				<tr>
					<td>
						<input type="text"
							   id="memRoadAddress"
							   name="memRoadAddress"
							   placeholder="도로명주소"
							   value="<%=memberDTO.getMemRoadAddress() %>"
							   readonly
						>
					</td>
				</tr>
				<tr>
					<td>
						<input type="text"
							   id="memDetailAddress"
							   name="memDetailAddress"
							   placeholder="상세주소"
							   value="<%=memberDTO.getMemDetailAddress() %>"
						>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button"
							   class="memInfoChange"
							   value="회원정보 수정"
							   onclick="memberInfoChangeCheck()"
						>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>