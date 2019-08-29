<%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*" %>
<jsp:useBean id="memMgr" class = "WatTimePack.MemberMgr" scope="page"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href = "style.css" rel = "stylesheet" type = "text/css">
	<script language = "JavaScript" src = "script.js"></script>
	<%
		request.setCharacterEncoding("utf-8");
		RegisterBean member = (RegisterBean)session.getAttribute("member");
	%>
</head>
<body>
	
	<div class="frame">
		
	
	<!-- //header -->
	<div class="container">
		<div class="nav">
			<ul class="nav-list">
			<li class="nav-item"><a href="" class="nav-link">Menu-1</a></li>
			<li class="nav-item"><a href="" class="nav-link">Menu-2</a></li>
			<li class="nav-item"><a href="" class="nav-link">Menu-3</a></li>
			</ul>
		</div>
	    <!-- //nav -->
		<div class="content">
			<table class="memInfo" cellspacing = "0" cellpadding = "0">
				<tr>
					<th>이름</th>
					<td><%=member.getMemName() %></td>
				</tr>
				<tr>
					<th>아이디</th>
					<td><%=member.getMemId() %></td>
				</tr>
				<tr>
					<th>패스워드</th>
					<td><input  type="password" id="memPass" name="memPass" placeholder="패스워드(영문,숫자,특수문자 조합 8~25자)" onblur="passCheck()"></td>
				</tr>
				<tr>
					<th>패스워드 확인</th>
					<td><input  type="password" id="memPassCheck" name="memPassCheck" placeholder="패스워드 확인" onblur="passCheck()"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input  type="text" id="memEmail" name="memEmail" placeholder="이메일" onblur="emailCheck()" required></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="number" id="memPhone" name="memPhone" placeholder="전화번호" onblur="phoneCheck()" required></td>
				</tr>
				<tr>
					<th rowspan="5">주소</th>
					<td><input  type="text" id="memPostcode" name="memPostcode" size = "10" placeholder="우편번호" readonly>
						<input  type="button" onclick="postcode()" value="우편번호 찾기"></td>
				</tr>
				<tr>
					<td><input  type="text" id="memRoadAddress" name="memRoadAddress" placeholder="도로명주소" readonly></td>
				</tr>
				<tr>
					<td><input  type="text" id="memJibunAddress" name="memJibunAddress" placeholder="지번주소" readonly></td>
				</tr>
				<tr>
					<td><input  type="text" id="memEtcAddress" name="memEtcAddress" placeholder="기타주소" readonly></td>
				</tr>
				<tr>
					<td><input  type="text" id="memDetailAddress" name="memDetailAddress" placeholder="상세주소" onblur="addressCheck()"></td>
				</tr>
				<tr>
					<td colspan="2"><input class="memInfoChange" type="button" value="회원정보수정"></td>
				</tr>
			</table>
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