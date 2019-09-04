<%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용약관</title>
<script type="text/javascript"> 
	function agree() { 
		var chkbox = document.getElementsByName('agree');
		var chk = false; 
		for(var i=0 ; i<chkbox.length ; i++){ 
			if(chkbox[i].checked) {
				chk = true;
			}else{
				chk = false; 
			}
		} 
		//체크 박스를 모두 체크 했을 경우
		if(chk) {
			location.href="?pageChange=WTMemberJoin.jsp"
		//체크 박스가 하나라도 체크가 안돼어있을 경우
		}else{ 
			alert("모든 약관에 동의해 주세요.") 
		} 
	} 
</script>
<link href = "style.css" rel = "stylesheet" type = "text/css">
</head>
<body>
	<div id="agreeMain">
		<h1>이용약관</h1>
		<div>
			<textarea readonly="readonly" cols="150" rows="15" style="resize: none;"></textarea>
		</div>
		
		<div>
			<input type="checkbox" name = "agree" id="chk1"/> 이용약관 동의합니다.<br><br><br>
		</div>
		
		<div>
			<textarea readonly="readonly" cols="150" rows="15" style="resize: none;"></textarea>
		</div>
		
		<div>
			<input type="checkbox" name = "agree" id="chk2"/> 이용약관 동의합니다.
		</div>
		
		<div>
			<input type="button" class = "sv_button" value="동의" onclick="javascript:agree()" >
			<input type = "button" class = "sv_button" value = "취소"/>
		</div>
	</div>
</body>
</html>