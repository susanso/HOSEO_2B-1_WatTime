<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href = "style.css" rel = "stylesheet" type = "text/css">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<script language = "JavaScript" src = "WTMember/js/WTMemberJoin.js"></script>
	<title>회원가입</title>

</head>
<body>
	<div class = "member">
		<div class="title">
		  <h2>회원가입</h2>
		</div>
		<div class="memberForm">
			<form class="w3-container" method = "post" id = "memJoinForm" name = "memJoinForm" action = "../WatTime/WTMember/WTMemberJoinPro.jsp">
				<!-- 아이디 -->
				<div class="memList">
					<div>
						<input class="idText" type="text" id="memId" name="memId" placeholder="아이디(영문,숫자 6자~15자) " onkeydown="idOnkey()" required>
						<input class="checkBtn" type="button" id="idCheck" name="idCheck" value="중복확인" onclick="idOverlapCheck()">
					</div>
					<div><span class="checkText"id = "idCheckText" style="display:hidden;"></span></div>
					<div><input type="hidden" id="idHidden" name="idHidden" value="no"></div>
				</div>
				<!-- 패스워드 -->
				<div class="memList">
					<div><input class="passInputText" type="password" id="memPass" name="memPass" value="" placeholder="패스워드(영문,숫자,특수문자 조합 8~25자)" onblur="passCheck()" required></div>
				<!-- 패스워드 확인 -->
					<div><input class="passInputText" type="password" id="memPassCheck" name="memPassCheck" value=""  placeholder="패스워드 확인" onblur="passCheck()" required></div>
					<div><input class="inputText" type="hidden" id="passHidden" name="passHidden" value="no"></div>
					<div><span class="checkText" id = "passCheckText" style="display:hidden;"></span></div>
				</div>
				<!-- 이름 -->
				<div class="memList">
					<div><input class="singleText" type="text" id="memName" name="memName" placeholder="이름" value="" onblur="nameCheck()" required></div>
					<div><input class="singleText" type="hidden" id="nameHidden" name="nameHidden" value="no"></div>
					<div><span class="checkText" id = "nameCheckText" style="display:hidden;"></span></div>
				</div>
				<!-- 이메일 -->
				<div class="memList">
					<div><input class="singleText" type="text" id="memEmail" name="memEmail" placeholder="이메일" value="" onblur="emailCheck()" required></div>
					<div><input class="singleText" type="hidden" id="emailHidden" name="emailHidden" value="no"></div>
					<div><span class="checkText" id = "emailCheckText" style="display:hidden;"></span></div>
				</div>
				<!-- 전화번호-->
				<div class="memList">
					<div><input class="singleText" type="number" id="memPhone" name="memPhone" placeholder="전화번호" value="" onblur="phoneCheck()" required></div>
					<div><input class="singleText" type="hidden" id="phoneHidden" name="phoneHidden" value="no"></div>
					<div><span class="checkText" id = "phoneCheckText" style="display:hidden;"></span></div>
				</div>
				<!-- 생년월일 -->
				<div class="memList">
					<div><input class="singleText" type="number" id="memBirth" name="memBirth" placeholder="생년월일(00000000)" value="" onblur="birthCheck()" required></div>
					<div><input class="singleText" type="hidden" id="birthHidden" name="birthHidden" value="no"></div>
					<div><span class="checkText" id = "birthCheckText" style="display:hidden;"></span></div>
				</div>
				<!-- 주소 -->
				<div class="memList">
					<div class="addressForm">
						<input class="postText" type="text" id="memPostcode" name="memPostcode" size = "10" placeholder="우편번호" value="" readonly>
						<input class="checkBtn" type="button" onclick="postcode()" value="우편번호 찾기">
					</div>
					
					<div class="addressForm">
						<input class="inputText" type="text" id="memRoadAddress" name="memRoadAddress" placeholder="도로명주소" value="" readonly>
					</div>
					<div class="addressForm">
						<input class="inputText" type="text" id="memJibunAddress" name="memJibunAddress" placeholder="지번주소" value="" readonly>
					</div>
					<div class="addressForm">
						<input class="inputText" type="text" id="memEtcAddress" name="memEtcAddress" placeholder="기타주소" value="" readonly>
					</div>
					<div class="addressForm">
						<input class="singleText" type="text" id="memDetailAddress" name="memDetailAddress" placeholder="상세주소" value="" onblur="addressCheck()">
					</div>
					<div class="addressForm">
						<input type="hidden" id="addressHidden" name="addressHidden" value="no">
					</div>
				</div>
				<!-- 생성 및 취소 -->
				<div class="join">
					<input type="button" class="btn" id="join" name="join" value="회원가입" onclick="joinMember()">
					<input type="button" class="btn" id="cancel" name="cancel" value="취소" onclick="mainBack()">
				</div>
				
			</form>
		</div>
	</div>
</body>
</html>