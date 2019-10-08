<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script language = "JavaScript" src="WTMypage/js/WTWithdrawal.js"></script>
</head>
<body>
<form id="withdrawalForm" method="post" action="WTMypage/WTWithdrawal.jsp">
<div>
회원탈퇴를 진행하면 다시 복구하실수 없습니다.
회원탈퇴를 진행하시려면 "<font color="red"><b>회원탈퇴</b></font>" 를 입력해주시기 바랍니다.
<input type="text" id="checkText">
비밀번호를 입력해주세요
<input type="password" name="withdrawalPass" id="withdrawalPass">
<input type="button" value="확인" onclick="withdrawalSubmit()">
</div>
</form>
</body>
</html>