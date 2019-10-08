<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.text.*,java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*" %>
<%@ page import = "java.sql.Timestamp" %>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="memberDTO" class = "WatTimePack.WatTimeMemberDTO" scope="page">
   <jsp:setProperty name="memberDTO" property="*"/>
</jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<%
	String pass = request.getParameter("withdrawalPass");

	if(session.getAttribute("member") != null){
    	memberDTO = (WatTimeMemberDTO)session.getAttribute("member");
	}
	WatTimeMemberDAO memberDAO = new WatTimeMemberDAO();
	
	int count = memberDAO.getOutMember(memberDTO.getMemId(),pass);
	//랜덤 문자 담을 변수
	
	String[] randomArray = new String[3];
	if(count == 1){
		//반복
		for(int j=0; j<3; j++){
			String randomValue= "";
			//랜덤문자 생성 16자
			for(int i=0; i<16; i++) {
				int rndVal = (int)(Math.random() * 62);
				//랜덤 값이 10미만이면 숫자
				if(rndVal < 10) {
					randomValue += rndVal;
				}
				//소문자
				else if(rndVal > 35){
					randomValue += (char)(rndVal + 61);
				}
				//대문자
				else{
					randomValue += (char)(rndVal + 55);
				}
			}
			randomArray[j] = randomValue;
		}
		memberDAO.setOutMember(memberDTO.getMemId(),randomArray);
		session.removeAttribute("member");
		session.invalidate();
		response.sendRedirect("../WTMain.jsp?pageChange=WTMypage/WTWithdrawalResult.jsp");  
	}else{
%>
	<script>
		alert("회원 정보가 일치하지 않습니다.");
		history.go(-1);
	</script>
<%
	}
%>
<body>
<%=randomArray[0] %><br>
<%=randomArray[1] %><br>
<%=randomArray[2] %><br>
</body>
</html>