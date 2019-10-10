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
<title>Insert title here</title>
</head>
<%
	if(session.getAttribute("member") != null){
	    memberDTO = (WatTimeMemberDTO)session.getAttribute("member");
	}
	String memPass = request.getParameter("memPass");
	
	String memBirth = request.getParameter("memBirth");
	if(memBirth == memberDTO.getMemBirth()){
		memBirth = memberDTO.getMemBirth();
	}
	String memEmail = request.getParameter("memEmail");
	if(memEmail == memberDTO.getMemEmail()){
		memEmail = memberDTO.getMemEmail();
	}
	String memPhone = request.getParameter("memPhone");
	if(memPhone == memberDTO.getMemPhone()){
		memPhone = memberDTO.getMemPhone();
	}
	String memPostcode = request.getParameter("memPostcode");
	if(memPostcode == memberDTO.getMemPostcode()){
		memPostcode = memberDTO.getMemPostcode();
	}
	String memRoadAddress = request.getParameter("memRoadAddress");
	if(memRoadAddress == memberDTO.getMemRoadAddress()){
		memRoadAddress = memberDTO.getMemRoadAddress();
	}
	String memDetailAddress = request.getParameter("memDetailAddress");
	if(memDetailAddress == memberDTO.getMemDetailAddress()){
		memDetailAddress = memberDTO.getMemDetailAddress();
	}
	
	WatTimeMemberDAO memberDAO = new WatTimeMemberDAO();
	
	int phoneCount = memberDAO.getMemPhoneCheck(memPhone);
	int emailCount = memberDAO.getMemEmailCheck(memEmail);
	
	if(phoneCount != 0 && !memPhone.equals(memberDTO.getMemPhone())){
%>
		<script>
			alert("해당 전화번호는 가입된 전화번호입니다.");
			history.go(-1);
		</script>	
<%
	}
	else if(emailCount != 0 && !memEmail.equals(memberDTO.getMemEmail())){
%>
		<script>
			alert("해당 이메일은 가입된 이메일입니다.");
			history.go(-1);
		</script>
<%
	}
	else{
		//패스워드를 변경 안할 때
		if(memPass == null || memPass==""){
			memberDTO.setMemId(memberDTO.getMemId());
			memberDTO.setMemBirth(memBirth);
			memberDTO.setMemPhone(memPhone);
			memberDTO.setMemEmail(memEmail);
			memberDTO.setMemPostcode(memPostcode);
			memberDTO.setMemRoadAddress(memRoadAddress);
			memberDTO.setMemDetailAddress(memDetailAddress);
			
			memberDAO.setMemberInfoUpdateNoPass(memberDTO);
		}else{
			memberDTO.setMemId(memberDTO.getMemId());
			memberDTO.setMemPass(memPass);
			memberDTO.setMemBirth(memBirth);
			memberDTO.setMemPhone(memPhone);
			memberDTO.setMemEmail(memEmail);
			memberDTO.setMemPostcode(memPostcode);
			memberDTO.setMemRoadAddress(memRoadAddress);
			memberDTO.setMemDetailAddress(memDetailAddress);
			
			memberDAO.setMemberInfoUpdate(memberDTO);
		}
		
		session.setAttribute("member", memberDTO);
%>
		<script>
			alert("회원 정보를 수정했습니다.");
			location.href="../WTMain.jsp";
		</script>
<%
	}
%>
<body>
</body>
</html>