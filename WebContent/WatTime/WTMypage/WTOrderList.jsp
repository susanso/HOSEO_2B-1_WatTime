<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.lang.*,java.text.*,java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*, java.io.*" %>
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
<title>Insert title here</title>
<script src="WTMypage/js/WTOrderList.js"></script>
</head>
<%
	SimpleDateFormat date_format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	if(session.getAttribute("member") != null){
	    memberDTO = (WatTimeMemberDTO)session.getAttribute("member");
	}
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	WatTimeOrderDAO orderDAO = new WatTimeOrderDAO();
	WatTimeOrderProductDAO orderProductDAO = new WatTimeOrderProductDAO();
	WatTimeProductDAO productDAO = new WatTimeProductDAO();
	List<WatTimeOrderDTO> orderList = new ArrayList<>();
	
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
	//주문 상태
	String orderStatus = request.getParameter("orderStatus");
	//현재 페이지가 처음 불러왔을 때
	if(orderStatus == null){
		orderStatus=" ";
	}else{
		orderStatus = new String(orderStatus.getBytes("8859_1"), "utf-8");
	}
	//구매확정 (배송 완료에서 1주일이 지나면 자동으로 바뀜)
	Timestamp date = new Timestamp(System.currentTimeMillis());
	String now = date_format.format(date);
	Timestamp nowFormat = Timestamp.valueOf(now);
	List<WatTimeOrderDTO> deliverySuccessList = new ArrayList<>();
	deliverySuccessList = orderDAO.getDeliverySuccessCount();
	for(int i=0;i<deliverySuccessList.size();i++){
		orderDTO = deliverySuccessList.get(i);
		String deliverySuccessDate = date_format.format(orderDTO.getDeliverySuccessDate());
		Timestamp deliverySuccessDateFormat = Timestamp.valueOf(deliverySuccessDate);
		if((nowFormat.getTime()-deliverySuccessDateFormat.getTime())/(1000*60*60*24)>=7){
			orderDAO.setProductBuySuccess(orderDTO.getOrderNum());
		}
	}
	
	//관리자
	if(memberDTO.getMemAdmin()!=0){
		count = orderDAO.getProductAllCount(startDateFormat,endDateFormat,orderStatus);
		orderList = orderDAO.getProductAdminList(startRow,endRow,startDateFormat,endDateFormat,orderStatus);
	}
	//일반 사용자
	else{
		count = orderDAO.getProductUserCount(memberDTO.getMemId(),startDateFormat,endDateFormat);
		orderList = orderDAO.getProductUserList(startRow,endRow,startDateFormat,endDateFormat,memberDTO.getMemId());
	}
	
	number = count-(currentPage-1)*pageSize;

%>
<body>
	<div class="frame">
	<!-- //header -->
		<div style="line-height: 90px;margin:30px auto;width:1300px;font-size:50px;height:90px;font-family: 'Roboto', sans-serif;/* border-top:1px solid gray; */border-bottom:1px solid gray;">
			<div id="faqMainBar">주문 내역 </div>
			<div id="faqMainBar" class="faqBar">
				<input type="button" id="faq" name="faq" value="회원정보" onclick="location.href='WTMain.jsp?pageChange=WTMypage/WTMyPage.jsp'">
				<input type="button" id="notice" name="notice" value="주문내역" onclick="location.href='WTMain.jsp?pageChange=WTMypage/WTOrderList.jsp?pageNum=1'">
				<input type="button" id="review" name="review" value="TicTok" onclick="location.href='WTMain.jsp?pageChange=WTMypage/WTTicTokList.jsp?pageNum=1'">
				<input type="button" id="notice" name="notice" value="회원탈퇴" onclick="location.href='WTMain.jsp?pageChange=WTMypage/WTWithdrawalForm.jsp'">
			</div>
		</div>    
	</div>
	<!-- 날짜 버튼 -->
	<div class="dateSearchBuyList">
		<input id="dateStart" type="date"> <h1>~</h1> <input id="dateEnd" type="date">
		<img  src="img/search.png" width="48px" height="48px"alt="검색" onclick="dateCheck(dateStart.value,dateEnd.value)"><br>
<%
		if(memberDTO.getMemAdmin() != 0){ 
%>
			<select id="orderStatusSelect" onchange="selectOrderStatus(this.value,'<%=startDateFormat%>','<%=endDateFormat%>')">
<%
				if(orderStatus.equals(" ")){
%>
					<option value="" selected>모두</option>
<%
				}else{
%>
					<option value="">모두</option>
<%
				}
				if(orderStatus.equals("결제 확인")){
%>
					<option value="결제 확인" selected>결제 확인</option>
<%
				}else{
%>
					<option value="결제 확인">결제 확인</option>
<%
				}
				if(orderStatus.equals("결제 완료")){
%>
					<option value="결제 완료" selected>결제 완료</option>
<%
				}else{
%>
					<option value="결제 완료">결제 완료</option>
<%
				}
				if(orderStatus.equals("배송 준비")){
%>
					<option value="배송 준비" selected>배송 준비</option>
<%
				}else{
%>
					<option value="배송 준비">배송 준비</option>
<%
				}
				if(orderStatus.equals("배송 중")){
%>
					<option value="배송 중" selected>배송 중</option>
<%
				}else{
%>
					<option value="배송 중">배송 중</option>
<%
				}
				if(orderStatus.equals("배송 완료")){
%>
					<option value="배송 완료" selected>배송 완료</option>
<%
				}else{
%>
					<option value="배송 완료">배송 완료</option>
<%
				}
				if(orderStatus.equals("결제 취소")){
%>
					<option value="결제 취소" selected>결제 취소</option>
<%
				}else{
%>
					<option value="결제 취소">결제 취소</option>
<%
				}
				if(orderStatus.equals("구매 확정")){
%>
					<option value="구매 확정" selected>구매 확정</option>
<%
				}else{
%>
					<option value="구매 확정">구매 확정</option>
<%
				}
%>
			</select>
<%
		}
%>
		<input class="monthSearch" type="button" value="3개월" onclick="monthSearch('3')">
		<input class="monthSearch" type="button" value="6개월" onclick="monthSearch('6')">
		<input class="monthSearch" type="button" value="1년" onclick="monthSearch('12')">
	</div>
<%
	if(count==0){
%>
	<div>
		<center><h2>주문 내역이 없습니다.</h2></center>
	</div>
<%
	}else{
%>
		<div class="oderListDivTable">
			<table class="oderListTable" border="1px">
				<tr>
					<th>주문번호</th>
					<th>상품</th>
					<th style="width:10px;">상품명</th>
					<th>아이디</th>
					<th> 이름</th>
					<th style="width:100px;">주문 날짜</th>
					<th style="width:77px;">우편번호</th>
					<th>배송 주소</th>
					<th>상태</th>
				</tr>
<%
				for(int i = 0 ; i < orderList.size() ; i++){
					orderDTO = orderList.get(i);
					String productCode = orderProductDAO.getOrderProductName(orderDTO.getOrderNum());
					String productImg = productDAO.getProductImg(productCode);
%>	
					<tr>
						<!-- 주문번호 -->
						<td>
							<%=orderDTO.getOrderNum() %>
						</td>
						<td>
							<img src="../WatTime/img/brand/<%=productImg %>"
								 width="100px"
								 height="100px"
							>
						</td>
						<!-- 주문 상품 명-->
						<td>
							<font color="#000"><a onclick="orderProductList('<%=orderDTO.getOrderNum() %>')">
								<%=orderDTO.getProductName() %>
							</a></font>
						</td>
						<!-- 주문자 아이디 -->
						<td>
							<%=orderDTO.getMemId() %>
						</td>
						<!-- 주문자 이름 -->
						<td>
							<%=orderDTO.getMemName() %>
						</td>
						<!-- 주문 날짜 -->
						<td>
							<%=date_format.format(orderDTO.getOrderDate()) %>
						</td>
						<!-- 우편번호 -->
						<td>
							<%=orderDTO.getOrderPostCode() %>
						</td>
						<!-- 배송 주소 -->
						<td>
							<%=orderDTO.getOrderAddress() %>
						</td>
						<!-- 주문 상태 -->
						<td>
<%
							//관리자
							if(memberDTO.getMemAdmin()!= 0){
%>
								<!-- 주문 상태 -->
								<select id="<%=orderDTO.getOrderNum() %>" 
										onchange="radioclick(this.value,this.id,'<%=pageNum%>','<%=startDateFormat%>','<%=endDateFormat%>')"
								>
<%
								//주문 상태가 결제 확인인 경우
								if(orderDTO.getOrderStatus().equals("결제 확인")){
%>
									<option value="결제 확인" selected>결제 확인</option>
<%
								}else{
%>
									<option value="결제 확인">결제 확인</option>
<%
								}
								//주문 상태가 결제 완료인 경우
								if(orderDTO.getOrderStatus().equals("결제 완료")){
%>
									<option value="결제 완료" selected>결제 완료</option>
<%
								}else{
%>
									<option value="결제 완료">결제 완료</option>
<%
								}
								//주문 상태가 배송 준비인 경우
								if(orderDTO.getOrderStatus().equals("배송 준비")){
%>
									<option value="배송 준비" selected>배송 준비</option>
<%
								}else{
%>
									<option value="배송 준비">배송 준비</option>
<%
								}
								//주문 상태가 배송 중인 경우
								if(orderDTO.getOrderStatus().equals("배송 중")){
%>
									<option value="배송 중" selected>배송 중</option>
<%
								}else{
%>
									<option value="배송 중">배송 중</option>
<%
								}
								//주문 상태가  배송 완료인 경우
								if(orderDTO.getOrderStatus().equals("배송 완료")){
%>
									<option value="배송 완료" selected>배송 완료</option>
<%
								}else{
%>
									<option value="배송 완료">배송 완료</option>
<%
								}
								//주문 상태가  결제 취소인 경우
								if(orderDTO.getOrderStatus().equals("결제 취소")){
%>
									<option value="결제 취소" selected>결제 취소</option>
<%
								}else{
%>
									<option value="결제 취소">결제 취소</option>
<%
								}//주문 상태가  구매 확정인 경우
								if(orderDTO.getOrderStatus().equals("구매 확정")){
%>
									<option value="구매 확정" selected>구매 확정</option>
<%
								}else{
%>
									<option value="구매 확정">구매 확정</option>
<%
								}
%>
								</select>
<%
							//일반 유저
							}else{
%>
								<%=orderDTO.getOrderStatus() %>
<%								
								//결제 취소 버튼(배송 준비 전에만 나옴)
								if(orderDTO.getOrderStatus().equals("결제 확인")
								   ||orderDTO.getOrderStatus().equals("결제 완료")){
%>
									<br><input type="button"
											   id="<%=orderDTO.getOrderNum() %>"
											   value="결제 취소"
											   onclick="orderCancle(this.value,this.id,'<%=pageNum%>','<%=startDateFormat%>','<%=endDateFormat%>')">
<%						
								}
								//배송 중일때 배송 위치 버튼
								else if(orderDTO.getOrderStatus().equals("배송 중")){
%>
									<br><input type="button" value="배송 위치 추적">
<%
								}else if(orderDTO.getOrderStatus().equals("배송 완료")){
%>
									<br><input type="button" 
											   value="구매 확정"
											   onclick="radioclick(this.value,
											   					   this.id,
											   					   '<%=pageNum%>',
											   					   '<%=startDateFormat%>',
											   					   '<%=endDateFormat%>')"
										>
<%
								}
							}
%>
						</td>
					</tr>
<%	
				}
	}
%>
		</table>
	</div>
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
					   onclick="back('<%=startPage - 5%>','<%=startDateFormat%>','<%=endDateFormat%>','<%=orderStatus%>')">
<%      
			}
			for (int i = startPage ; i <= endPage ; i++) { 
				if(i==pageNum){
%>
					<input type="button"
						   id="nowPageNum"
						   name="nowPageNum"
						   value="<%=i %>"
						   onclick="pageNum(this.value,'<%=startDateFormat%>','<%=endDateFormat%>','<%=orderStatus%>')">
<%
				}else{
%>
					<input type="button"
						   id="PageNum"
						   name="pageNum"
						   value="<%=i %>"
						   onclick="pageNum(this.value,'<%=startDateFormat%>','<%=endDateFormat%>','<%=orderStatus%>')">
<%      
				}
			}
			if (endPage < pageCount) {
%>
				<input type="button"
					   id="PageNum"
					   name="back"
					   value="다음"
					   onclick="next('<%=startPage + 5%>','<%=startDateFormat%>','<%=endDateFormat%>','<%=orderStatus%>')">
<%
			}
		}
%>
	</div>
</body>
</html>