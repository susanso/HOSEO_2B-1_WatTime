<%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.text.*,java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*" %>
<%@ page import = "java.sql.Timestamp" %>
<jsp:useBean id="memberDTO" class = "WatTimePack.WatTimeMemberDTO" scope="page">
	<jsp:setProperty name="memberDTO" property="*"/>
</jsp:useBean>
<jsp:useBean id="basketDTO" class = "WatTimePack.WatTimeBasketDTO" scope="page">
	<jsp:setProperty name="basketDTO" property="*"/>
</jsp:useBean>
<%
	//현재 시간
	Timestamp date = new Timestamp(System.currentTimeMillis());
	SimpleDateFormat date_format = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
	String now = date_format.format(date);
	Timestamp nowFormat = Timestamp.valueOf(now);
	
	
	request.setCharacterEncoding("utf-8");
	String backURL = request.getParameter("backURL");
	String memId = request.getParameter("memId");
	String memPass = request.getParameter("memPass");
	String referrer = request.getParameter("referrer");
	WatTimeMemberDAO memberDAO = new WatTimeMemberDAO();
	memberDTO = memberDAO.getMember(memId, memPass);
	
  	
	if(memberDTO.getMemId() != null){
		//해당 아이디 장바구니 목록 가져오기
		List<WatTimeBasketDTO> basketList = null;
		WatTimeBasketDAO basketDAO = new WatTimeBasketDAO();
		basketList = basketDAO.getMemberBasketList(memberDTO.getMemId());
		String basketDate="";
		WatTimeProductDAO productDAO = new WatTimeProductDAO();
		for(int i = 0 ; i < basketList.size() ; i++){	
			basketDTO = basketList.get(i);
			basketDate = date_format.format(basketDTO.getBasketAddDate());
			Timestamp basketDateFormat = Timestamp.valueOf(basketDate);
			
			//일정 기간 지나면 장바구니 자동삭제
			if(((nowFormat.getTime()-basketDateFormat.getTime())/(1000*60*60*24))>=7){
				//장바구니 목록 삭제 전 재고량 늘리기
				productDAO.setBasketProductVolume(basketDTO.getProductCode(),basketDTO.getProductCount());
				//장바구니 목록 삭제
				basketDAO.setBasketOneDelete(memberDTO.getMemId(),basketDTO.getNum());
			}
		}

		session.setAttribute("member", memberDTO);
		response.sendRedirect("../WTMain.jsp"); 
		
		return;
	}else{
%>
		<!DOCTYPE html>
		<html>
		<head>
		<meta charset="UTF-8">
		<title>로그인 실패</title>
		</head>
		<body>
			<script type="text/javascript">
				alert("아이디/비밀번호를 확인하여 주십시오.");
				history.go(-1);
			</script>
		</body>
		</html>
<%		
	}
%>	