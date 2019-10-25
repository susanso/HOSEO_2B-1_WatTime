<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="width:1300px; text-align:center; margin: 200px auto;">
		<form method="post" action="WTMain.jsp?pageChange=WTMypage/WTMemberInfoForm.jsp">
			<font size="5px">패스워드를 입력해주세요.</font><br><br>
			<input type="password"
				   name="passText"
				   style="width:300px;
				   		  height:25px;
				   		  font-size:20px;
				   		  text-align:center;
				   		  padding:0 5px 0 5px;
				   		 "
			><br>
			<input type="submit" value="패스워드 확인" class="specBtn">
		</form>
	</div>
</body>
</html>