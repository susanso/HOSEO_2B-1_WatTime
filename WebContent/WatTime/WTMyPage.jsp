<%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*" %>
<jsp:useBean id="memberDTO" class = "WatTimePack.WatTimeMemberDTO" scope="page">
	<jsp:setProperty name="memberDTO" property="*"/>
</jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href = "style.css" rel = "stylesheet" type = "text/css">
	<script language = "JavaScript" src = "script.js"></script>
	<%
		request.setCharacterEncoding("utf-8");
		memberDTO = (WatTimeMemberDTO)session.getAttribute("member");
	%>
</head>
<body>
	
	<div class="frame">
		
	
	<!-- //header -->
	<div class="container">
		<div class="nav">
			<ul class="nav-list">
			<li class="nav-item"><a href="" class="nav-link">회원 정보</a></li>
			<li class="nav-item"><a href="" class="nav-link">주문내역</a></li>
			<li class="nav-item"><a href="" class="nav-link">TicTok</a></li>
			<li class="nav-item"><a href="" class="nav-link">TicTok</a></li>
			</ul>
		</div>
	    <!-- //nav -->
		<div class="content">
			<form id="memberInfoForm" name="memberInfoForm" method="post" action="WTMemberInfoChange.jsp">
				<table class="memInfo" cellspacing = "0" cellpadding = "0">
					<tr>
						<th>이름</th>
						<td><%=memberDTO.getMemName() %></td>
						<input type="hidden" id="memId" name="memId" value=<%=memberDTO.getMemId() %>/>
					</tr>
					<tr>
						<th>아이디</th>
						<td><%=memberDTO.getMemId() %></td>
					</tr>
					<tr>
						<th>패스워드</th>
						<td><input type="password" id="memPass" name="memPass" placeholder="패스워드(영문,숫자,특수문자 조합 8~25자)" ></td>
					</tr>
					<tr>
						<th>패스워드 확인</th>
						<td><input type="password" id="memPassCheck" name="memPassCheck" placeholder="패스워드 확인" ></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input  type="text" id="memEmail" name="memEmail" placeholder="이메일" value=<%=memberDTO.getMemEmail() %> required></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><input type="number" id="memPhone" name="memPhone" placeholder="전화번호" value=<%=memberDTO.getMemPhone() %> required></td>
					</tr>
					<tr>
						<th rowspan="4">주소</th>
						<td><input  type="text" id="memPostcode" name="memPostcode" size = "10" placeholder="우편번호" value=<%=memberDTO.getMemPostcode() %> readonly>
							<input  type="button" value="우편번호 찾기" onclick="postcode()"></td>
					</tr>
					<tr>
						<td><input  type="text" id="memRoadAddress" name="memRoadAddress" placeholder="도로명주소" value=<%=memberDTO.getMemRoadAddress() %> readonly></td>
					</tr>
					<tr>
						<td><input  type="text" id="memEtcAddress" name="memEtcAddress" placeholder="기타주소" value=<%=memberDTO.getMemEtcAddress() %> readonly></td>
					</tr>
					<tr>
						<td><input  type="text" id="memDetailAddress" name="memDetailAddress" placeholder="상세주소" value=<%=memberDTO.getMemDetailAddress() %>></td>
					</tr>
					<tr>
						<td colspan="2"><input type="button"  class="memInfoChange" value="회원정보수정" onclick="memberInfoChange()"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	  <!-- //container -->
	  <div class="footer">
	    <p class="copyright">&copy;copy</p>
	  </div>
	  <!-- //footer -->
	</div>
	<!-- //frame -->
	</div>
</body>
</html>