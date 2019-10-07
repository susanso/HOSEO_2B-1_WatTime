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
	if(orderStatus == null){
		orderStatus=" ";
	}else{
		orderStatus = new String(orderStatus.getBytes("8859_1"), "utf-8");
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
	<!-- 날짜 버튼 -->
	<div>
		<input id="dateStart" type="date"> ~ <input id="dateEnd" type="date">
		<input type="button" value="검색" onclick="dateCheck(dateStart.value,dateEnd.value)">
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
%>
			</select>
<%
		}
%>
		<br>
		<input type="button" value="3개월" onclick="monthSearch('3')">
		<input type="button" value="6개월" onclick="monthSearch('6')">
		<input type="button" value="1년" onclick="monthSearch('12')">
	</div>
<%
	if(count==0){
%>
	<div>
		주문 내역이 없습니다.
	</div>
<%
	}else{
%>
		<div>
			<table border="1">
				<tr>
					<th>주문번호</th>
					<th>주문 상품명</th>
					<th>주문자 아이디</th>
					<th>주문자 이름</th>
					<th>주문 날짜</th>
					<th>우편번호</th>
					<th>배송 주소</th>
					<th>주문상태</th>
				</tr>
<%
				for(int i = 0 ; i < orderList.size() ; i++){
					orderDTO = orderList.get(i);
%>	
					<tr>
						<!-- 주문번호 -->
						<td>
							<%=orderDTO.getOrderNum() %>
						</td>
						<!-- 주문 상품 명-->
						<td>
							<a href="#" onclick="orderProductList('<%=orderDTO.getOrderNum() %>')">
								<%=orderDTO.getProductName() %>
							</a>
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
							<%=orderDTO.getOrderDate() %>
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
								//라디오 버튼 체크
								if(orderDTO.getOrderStatus().equals("결제 확인")){
%>
									<input type="radio"
										   id="<%=orderDTO.getOrderNum() %>"
										   name="<%=orderDTO.getOrderNum() %>status"
										   value="결제 확인"
										   onclick="radioclick(this.value,this.id,'<%=pageNum%>','<%=startDateFormat%>','<%=endDateFormat%>')"
										   checked
									>결제확인
<%
								}else{
%>
									<input type="radio"
										   id="<%=orderDTO.getOrderNum() %>"
										   name="<%=orderDTO.getOrderNum() %>status"
										   value="결제 확인"
										   onclick="radioclick(this.value,this.id,'<%=pageNum%>','<%=startDateFormat%>','<%=endDateFormat%>')"
									>결제확인
<%
								}
								//결제 완료
								if(orderDTO.getOrderStatus().equals("결제 완료")){
%>
									<input type="radio"
										   id="<%=orderDTO.getOrderNum() %>"
										   name="<%=orderDTO.getOrderNum() %>status"
										   value="결제 완료" 
										   onclick="radioclick(this.value,this.id,'<%=pageNum%>','<%=startDateFormat%>','<%=endDateFormat%>')"
										   checked
									>결제완료
<%
								}else{
%>
									<input type="radio"
										   id="<%=orderDTO.getOrderNum() %>"
										   name="<%=orderDTO.getOrderNum() %>status"
										   value="결제 완료"
										   onclick="radioclick(this.value,this.id,'<%=pageNum%>','<%=startDateFormat%>','<%=endDateFormat%>')"
									>결제완료
<%
								}
								//배송 준비
								if(orderDTO.getOrderStatus().equals("배송 준비")){
%>
									<input type="radio" 
										   id="<%=orderDTO.getOrderNum() %>"
										   name="<%=orderDTO.getOrderNum() %>status"
										   value="배송 준비"
										   onclick="radioclick(this.value,this.id,'<%=pageNum%>','<%=startDateFormat%>','<%=endDateFormat%>')"
										   checked
									>배송준비
<%
								}else{
%>
									<input type="radio" 
										   id="<%=orderDTO.getOrderNum() %>"
										   name="<%=orderDTO.getOrderNum() %>status"
										   value="배송 준비"
										   onclick="radioclick(this.value,this.id,'<%=pageNum%>','<%=startDateFormat%>','<%=endDateFormat%>')"
									>배송준비
<%
								}
								//배송중
								if(orderDTO.getOrderStatus().equals("배송 중")){
%>
									<input type="radio"
										   id="<%=orderDTO.getOrderNum() %>"
										   name="<%=orderDTO.getOrderNum() %>status"
										   value="배송 중" 
										   onclick="radioclick(this.value,this.id,'<%=pageNum%>','<%=startDateFormat%>','<%=endDateFormat%>')"
										   checked
									>배송중
<%
								}else{
%>
									<input type="radio"
										   id="<%=orderDTO.getOrderNum() %>"
										   name="<%=orderDTO.getOrderNum() %>status"
										   value="배송 중"
										   onclick="radioclick(this.value,this.id,'<%=pageNum%>','<%=startDateFormat%>','<%=endDateFormat%>')"
									>배송중
<%
								}
								//배송 완료
								if(orderDTO.getOrderStatus().equals("배송 완료")){
%>
									<input type="radio"
										   id="<%=orderDTO.getOrderNum() %>"
										   name="<%=orderDTO.getOrderNum() %>status"
										   value="배송 완료"
										   onclick="radioclick(this.value,this.id,'<%=pageNum%>','<%=startDateFormat%>','<%=endDateFormat%>')"
										   checked
									>배송완료
<%
								}else{
%>
									<input type="radio"
										   id="<%=orderDTO.getOrderNum() %>"
										   name="<%=orderDTO.getOrderNum() %>status"
										   value="배송 완료"
										   onclick="radioclick(this.value,this.id,'<%=pageNum%>','<%=startDateFormat%>','<%=endDateFormat%>')"
									>배송완료
<%
								}
								//결제 취소
								if(orderDTO.getOrderStatus().equals("결제 취소")){
%>
									<input type="radio"
										   id="<%=orderDTO.getOrderNum() %>"
										   name="<%=orderDTO.getOrderNum() %>status"
										   value="결제 취소"
										   onclick="radioclick(this.value,this.id,'<%=pageNum%>','<%=startDateFormat%>','<%=endDateFormat%>')"
										   checked
									>결제 취소
<%
								}else{
%>
									<input type="radio"
										   id="<%=orderDTO.getOrderNum() %>"
										   name="<%=orderDTO.getOrderNum() %>status"
										   value="결제 취소"
										   onclick="radioclick(this.value,this.id,'<%=pageNum%>','<%=startDateFormat%>','<%=endDateFormat%>')"
									>결제 취소
<%
								}
							}
							//일반 유저
							else{
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
											   onclick="radioclick(this.value,this.id,'<%=pageNum%>','<%=startDateFormat%>','<%=endDateFormat%>')">
<%						
								}
								//배송 중일때 배송 위치 버튼
								else if(orderDTO.getOrderStatus().equals("배송 중")){
%>
									<br><input type="button" value="배송 위치 추적">
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
				<input type="button"  id="PageNum" name="back" value="이전" onclick="back('<%=startPage - 5%>','<%=startDateFormat%>','<%=endDateFormat%>')">
<%      
			}
			for (int i = startPage ; i <= endPage ; i++) { 
				if(i==pageNum){
%>
					<input type="button" id="nowPageNum" name="nowPageNum" value="<%=i %>" onclick="pageNum(this.value,'<%=startDateFormat%>','<%=endDateFormat%>')">
<%
				}else{
%>
					<input type="button" id="PageNum" name="pageNum" value="<%=i %>" onclick="pageNum(this.value,'<%=startDateFormat%>','<%=endDateFormat%>')">
<%      
				}
			}
			if (endPage < pageCount) {
%>
				<input type="button" id="PageNum" name="back" value="다음" onclick="next('<%=startPage + 5%>','<%=startDateFormat%>','<%=endDateFormat%>')">
<%
			}
		}
%>
	</div>
</body>
</html>