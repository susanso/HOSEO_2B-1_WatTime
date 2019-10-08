<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.text.*,java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*" %>
<%@ page import = "java.sql.Timestamp" %>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="memberDTO" class = "WatTimePack.WatTimeMemberDTO" scope="page">
   <jsp:setProperty name="memberDTO" property="*"/>
</jsp:useBean>
<jsp:useBean id="orderDTO" class = "WatTimePack.WatTimeOrderDTO" scope="page">
   <jsp:setProperty name="orderDTO" property="*"/>
</jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="WTMypage/js/WTTicTokList.js"></script>
<title>Insert title here</title>
</head>
<%
	DecimalFormat df = new DecimalFormat("#,###");
	SimpleDateFormat date_format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	if(session.getAttribute("member") != null){
	    memberDTO = (WatTimeMemberDTO)session.getAttribute("member");
	}
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	WatTimeOrderDAO orderDAO = new WatTimeOrderDAO();
	WatTimeOrderProductDAO orderProductDAO = new WatTimeOrderProductDAO();
	WatTimeProductDAO productDAO = new WatTimeProductDAO();
	List<WatTimeOrderDTO> tictokList = new ArrayList<>();
	
	int pageSize = 10;
	//URL에서 가져온 페이지 번호를 int 형으로 변환 시키고 넣음
	int currentPage = pageNum;
	//처음 초기 페이지 번호 (최대 페이지를 10으로 설정하면 1, 11, 21)
	int startRow = (currentPage - 1) * pageSize + 1;
	//끝 페이지 번호 (최대 페이지를 10으로 설정하면 10, 20, 30)
	int endRow = pageSize;
	
	int count = 0;
	int number = 0;
	//날짜 시작
	Timestamp startDateFormat = null;
	String startDate = request.getParameter("startDate");
	if(startDate == null){
		startDateFormat = Timestamp.valueOf("1900-01-01 00:00:00");
	}else{
		startDateFormat = Timestamp.valueOf(startDate);
	}
	//날짜 끝
	String endDate = request.getParameter("endDate");
	Timestamp endDateFormat = null;
	if(endDate == null){
		endDateFormat = new Timestamp(System.currentTimeMillis());
	}else{
		endDateFormat = Timestamp.valueOf(endDate);
	}
	
	if(memberDTO.getMemAdmin() != 0){
		count = orderDAO.getTicTokAllCount(startDateFormat,endDateFormat);
		tictokList = orderDAO.getTicTokAdminList(startRow,endRow,startDateFormat,endDateFormat);
	}else{
		count = orderDAO.getTicTokUserCount(startDateFormat,endDateFormat,memberDTO.getMemId());
		tictokList = orderDAO.getTicTokUserList(startRow,endRow,startDateFormat,endDateFormat,memberDTO.getMemId());
	}
	number = count-(currentPage-1)*pageSize;
%>
<body>
	<div class="frame">
	<!-- //header -->
		<div style="line-height: 90px;margin:30px auto;width:1300px;font-size:50px;height:90px;font-family: 'Roboto', sans-serif;/* border-top:1px solid gray; */border-bottom:1px solid gray;">
			<div id="faqMainBar">TicTok </div>
			<div id="faqMainBar" class="faqBar">
				<input type="button" id="faq" name="faq" value="회원정보" onclick="location.href='WTMain.jsp?pageChange=WTMypage/WTMyPage.jsp'">
				<input type="button" id="notice" name="notice" value="주문내역" onclick="location.href='WTMain.jsp?pageChange=WTMypage/WTOrderList.jsp?pageNum=1'">
				<input type="button" id="review" name="review" value="TicTok" onclick="location.href='WTMain.jsp?pageChange=WTMypage/WTTicTokList.jsp?pageNum=1'">
				<input type="button" id="notice" name="notice" value="회원탈퇴" onclick="location.href='WTMain.jsp?pageChange=WTMypage/WTWithdrawalForm.jsp'">
			</div>
		</div>    
	</div>
	<input id="dateStart" type="date"> ~ <input id="dateEnd" type="date">
	<input type="button" value="검색" onclick="dateCheck(dateStart.value,dateEnd.value)">
	<br>
	<input type="button" value="3개월" onclick="monthSearch('3')">
	<input type="button" value="6개월" onclick="monthSearch('6')">
	<input type="button" value="1년" onclick="monthSearch('12')">
	<br>
	보유 TicTok : <%=df.format(memberDTO.getMemPoint()) %>
<%
	if(count == 0){
%>
		<br>포인트 사용 내역이 없습니다.
<%
	}else{
		
%>
		<table border="1">
			<th>주문 번호</th>
			<th>상품 사진</th>
			<th>주문명 </th>
			<th>아이디</th>
			<th>이름</th>
			<th>사용한 TicTok</th>
			<th>적립한 TicTok</th>
			<th>주문 날짜</th>
<%
			for(int i = 0 ; i < tictokList.size() ; i++){
				orderDTO = tictokList.get(i);
				String productCode = orderProductDAO.getOrderProductName(orderDTO.getOrderNum());
				String productImg = productDAO.getProductImg(productCode);
			
%>
				<tr>
					<!-- 주문 번호 -->
					<td>
						<%=orderDTO.getOrderNum() %>
					</td>
					<!-- 상품 사진 -->
					<td>
						<img src="../WatTime/img/brand/<%=productImg %>"
							 width="100px"
							 height="100px"
						>
					</td>
					<!-- 상품명 -->
					<td>
						<a href="#" onclick="orderProductList('<%=orderDTO.getOrderNum() %>')">
								<%=orderDTO.getProductName() %>
							</a>
					</td>
					<!-- 아이디 -->
					<td>
						<%=orderDTO.getMemId() %>
					</td>
					<!-- 이름 -->
					<td>
						<%=orderDTO.getMemName() %>
					</td>
					<!-- 사용한 TicTok -->
					<td>
						<%=df.format(orderDTO.getUseTicTok()) %>
					</td>
					<!-- 적립한 TicTok -->
					<td>
						<%=df.format(orderDTO.getTicTok()) %>
					</td>
					<!-- 주문 날짜 -->
					<td>
						<%=date_format.format(orderDTO.getOrderDate()) %>
					</td>
				</tr>
<%
			}
	}
%>	
	</table>
	<div class="move">
<%
		if (count > 0) {
			int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
			int startPage = 1 ;
			
			if(currentPage % 5 != 0){
				startPage = (int)(currentPage/5)*5 + 1;
			}else{
				startPage = ((int)(currentPage/5)-1)*5 + 1;
			}
			int pageBlock = 5;
			int endPage = startPage + pageBlock - 1;
			if (endPage > pageCount){
				endPage = pageCount;
			}
			if (startPage > 5) {
%>
				<input type="button"
					   id="PageNum"
					   name="back"
					   value="이전"
					   onclick="back('<%=startPage - 5%>','<%=startDateFormat%>','<%=endDateFormat%>')">
<%      
			}
			for (int i = startPage ; i <= endPage ; i++) { 
				if(i==pageNum){
%>
					<input type="button"
						   id="nowPageNum"
						   name="nowPageNum"
						   value="<%=i %>"
						   onclick="pageNum(this.value,'<%=startDateFormat%>','<%=endDateFormat%>')">
<%
				}else{
%>
					<input type="button"
						   id="PageNum"
						   name="pageNum"
						   value="<%=i %>"
						   onclick="pageNum(this.value,'<%=startDateFormat%>','<%=endDateFormat%>')">
<%      
				}
			}
			if (endPage < pageCount) {
%>
				<input type="button"
					   id="PageNum"
					   name="back"
					   value="다음"
					   onclick="next('<%=startPage + 5%>','<%=startDateFormat%>','<%=endDateFormat%>')">
<%
			}
		}
%>
	</div>
</body>
</html>