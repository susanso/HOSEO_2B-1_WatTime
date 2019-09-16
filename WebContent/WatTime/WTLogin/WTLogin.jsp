<%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href = "style.css" rel = "stylesheet" type = "text/css">
<script language = "JavaScript" src = "WTLogin/js/WTLogin.js"></script>
<title>로그인 - Wat Time</title>
</head>
<body>
<div id="LoginContent">
   <form method="post" id="LoginForm" name="LoginForm" action="WTLogin/WTLoginPro.jsp">
      <div id="login">
         	<input type="hidden" id="referrer">
            <div><input placeholder="아이디" class="LoginId" type="text" id="memId" name="memId" maxlength="20"></div>
        
         
            <div><input placeholder="비밀번호"  class="LoginPass" type="password" id="memPass" name="memPass" maxlength="20"></div>
         
         
            <div><a id="signIn" href = "WTMain.jsp?pageChange=WTMember/WTAgreed.jsp">회원가입</a></div>
            <div><a id="findInfo" href = "WTMain.jsp?pageChange=WTMember/WTMemberIdFind.jsp">아이디/비밀번호 찾기</a></div>
         
            <div><input type="button" id="memLogin" name="memLogin" value="로그인" onclick="loginNullCheck()">
            	 <input type="hidden" id="backURL">
            </div>   
      </div>
   </form>
   </div>
</body>
</html>