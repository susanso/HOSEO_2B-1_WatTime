<%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" id="addressSearchForm" name="addressSearchForm" action="WTPostcodePro.jsp">
		<input type="text" id="memAddress" name="memAddress" placeholder="주소 입력 예 : 판교">
		<input type="button" value="우편번호 찾기" onclick="addressSearch()">	
	</form>
</body>
</html>