<%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용약관</title>
	<%
		String pageChange;
	%>
	<script type="text/javascript"> 
		function agree() { 
			var chkbox = document.getElementsByName('agree');
			var chk = false; 
			for(var i=0 ; i<chkbox.length ; i++){ 
				if(chkbox[i].checked) {
					chk = true;
				} else {
					chk = false; 
				}
			} 
			//체크 박스를 모두 체크 했을 경우
			if(chk) {
				location.href="?pageChange=WTMemberJoin.jsp"
			//체크 박스가 하나라도 체크가 안돼어있을 경우
			} else { 
				alert("모든 약관에 동의해 주세요.") 
				} 
		} 
	</script>
	<link href = "style.css" rel = "stylesheet" type = "text/css">
</head>
<body>
	<h2>이용약관</h2>
	<textarea readonly="readonly" cols="150" rows="15">

	</textarea>
	<br><br><br>
	<input type="checkbox" name = "agree" id="chk1"/> 이용약관 동의합니다.<br><br><br>
	
	<textarea readonly="readonly" cols="150" rows="15">

	</textarea>
	<br><br><br>
	<input type="checkbox" name = "agree" id="chk2"/> 이용약관 동의합니다.
	<br><br><br>
		<input type="button" class = "sv_button" value="동의" onclick="javascript:agree()" >
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<input type = "button" class = "sv_button" value = "취소"/>
</body>
</html>