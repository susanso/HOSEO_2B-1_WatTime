<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script language = "JavaScript" src="WTMypage/js/WTWithdrawalForm.js"></script>
</head>
<body>
	<div>
		<div class="frame">
		<!-- //header -->
			<div style="line-height: 90px;margin:30px auto;width:1300px;font-size:50px;height:90px;font-family: 'Roboto', sans-serif;/* border-top:1px solid gray; */border-bottom:1px solid gray;">
				<div id="faqMainBar">회원 탈퇴 </div>
				<div id="faqMainBar" class="faqBar">
					<input type="button" id="faq" name="faq" value="회원정보" onclick="location.href='WTMain.jsp?pageChange=WTMypage/WTMyPage.jsp'">
					<input type="button" id="notice" name="notice" value="주문내역" onclick="location.href='WTMain.jsp?pageChange=WTMypage/WTOrderList.jsp?pageNum=1'">
					<input type="button" id="review" name="review" value="TicTok" onclick="location.href='WTMain.jsp?pageChange=WTMypage/WTTicTokList.jsp?pageNum=1'">
					<input type="button" id="notice" name="notice" value="회원탈퇴" onclick="location.href='WTMain.jsp?pageChange=WTMypage/WTWithdrawalForm.jsp'">
				</div>
			</div>    
		</div>
		<form id="withdrawalForm" method="post" action="WTMypage/WTWithdrawal.jsp">
			<div>
				회원탈퇴를 진행하면 다시 복구하실수 없습니다.<br>
				회원탈퇴를 진행하시려면 "<font color="red"><b>회원탈퇴</b></font>" 를 입력해주시기 바랍니다.<br>
				<input type="text" id="checkText">
			</div>
			<div>
				비밀번호를 입력해주세요.<br>
				<input type="password" name="withdrawalPass" id="withdrawalPass">
			</div>
			<input type="button" value="확인" onclick="withdrawalSubmit()">
		</div>
	</form>
</body>
</html>