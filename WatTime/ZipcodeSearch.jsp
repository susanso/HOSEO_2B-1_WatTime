<%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편번호 찾기</title>
<script language = "JavaScript" src = "script.js"></script>
</head>
<body>
	<form method="post" id="zipcodeSearchForm" name="zipcodeSearchForm" action="zipcodeSearchPro.jsp" >
		<input type="text" id="address" name="address" placeholder="주소 검색">
		<input type="button" id="zipcodeSearch" name="zipcodeSearch" value="주소 검색" onclick="zipcodeSearch()" >
	</form>
</body>
</html>