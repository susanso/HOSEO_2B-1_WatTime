<%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link href = "style.css" rel = "stylesheet" type = "text/css">
	<script language = "JavaScript" src = "script.js"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<title>회원가입</title>

</head>
<body>
	<div class = "">
		<h1>회원가입 양식</h1>
		<form method = "post" id = "memJoinForm" name = "memJoinForm" action = "#">
			<!-- 아이디 -->
			<div>
				<div><input type="text" id="memId" name="memId" placeholder="아이디(영문,숫자 6자~15자) " onkeydown="idOnkey()" required></div>
				<div><input type="button" id="idCheck" name="idCheck" value="중복확인" onclick="idOverlapCheck()"></div>
				<div><span id = "idCheckText" style="display:hidden;"></span></div>
				<div><input type="hidden" id="idHidden" name="idHidden" value="no"></div>
			</div>
			<!-- 비밀번호 -->
			<div>
				<div><input type="password" id="memPass" name="memPass" placeholder="패스워드(영문,숫자,특수문자 조합 8자 이상)" onblur="passCheck()" required></div>
				<div><input type="hidden" id="passHidden" name="passHidden" value="no"></div>
			</div>
			<!-- 비밀번호 찾기 -->
			<div>
				<div><input type="password" id="memPassCheck" name="memPassCheck" placeholder="패스워드 확인" onblur="passCheck()" required></div>
				<div><input type="hidden" id="idHidden" name="idHidden" value="no"></div>
				<div><span id = "passCheckText" style="display:hidden;"></span></div>
			</div>
			<!-- 이름 -->
			<div>
				<div><input type="text" id="memName" name="memName" placeholder="이름" required></div>
				<div><input type="hidden" id="nameHidden" name="idHidden" value="no"></div>
			</div>
			<!-- 이메일 -->
			<div>
				<div><input type="text" id="memEmail" name="memEmail" placeholder="이메일" required></div>
				<div><input type="hidden" id="emailHidden" name="idHidden" value="no"></div>
			</div>
			<!-- 전화번호-->
			<div>
				<div><input type="number" id="memPhone" name="memPhone" placeholder="전화번호" required></div>
				<div><input type="hidden" id="phoneHidden" name="idHidden" value="no"></div>
			</div>
			<!-- 생년월일 -->
			<div>
				<div><input type="number" id="memBirth" name="memBirth" placeholder="생년월일" required></div>
				<div><input type="hidden" id="birthHidden" name="idHidden" value="no"></div>
			</div>
			<!-- 주소 -->
			<input type="text" id="memPostcode" placeholder="우편번호">
			<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
			<input type="text" id="memRoadAddress" placeholder="도로명주소">
			<input type="text" id="memJibunAddress" placeholder="지번주소">
			<span id="guide" style="color:#999;display:none"></span>
			<input type="text" id="memDetailAddress" placeholder="상세주소">
			<input type="text" id="memExtraAddress" placeholder="참고항목">
			<!-- 생성 및 취소 -->
			<input type="button" id="submit" name="submit" value="회원가입" onclick="joinMember()">
		</form>
	</div>
</body>
</html>