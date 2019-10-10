<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.text.*,java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*" %>
<%@ page import = "java.sql.Timestamp" %>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="memberDTO" class = "WatTimePack.WatTimeMemberDTO" scope="page">
   <jsp:setProperty name="memberDTO" property="*"/>
</jsp:useBean>
<jsp:useBean id="productDTO" class = "WatTimePack.WatTimeProductDTO" scope="page">
   <jsp:setProperty name="productDTO" property="*"/>
</jsp:useBean>
<jsp:useBean id="basketDTO" class = "WatTimePack.WatTimeBasketDTO" scope="page">
	<jsp:setProperty name="basketDTO" property="*"/>
</jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="WTBuy/js/WTBuyForm.js"></script>
</head>
<%
	DecimalFormat df = new DecimalFormat("#,###");
	String productCode = request.getParameter("productCode");
	String productCount = request.getParameter("productCount");
	
	if(session.getAttribute("member") != null){
	    memberDTO = (WatTimeMemberDTO)session.getAttribute("member");
	}
	
	List<WatTimeBasketDTO> basketList = null;
	WatTimeBasketDAO basketDAO = new WatTimeBasketDAO();
	WatTimeProductDAO productDAO = new WatTimeProductDAO();
	
	//장바구니에 항목이 있는지 검사할 변수
	int count = 0;
	//장바구니 화면에서 구매를 눌렀을 때
	if(productCode == null&&productCount==null){
		productCode = "";
		productCount = "";
		basketList = basketDAO.getMemberBasketList(memberDTO.getMemId());
	}else{
		count = basketDAO.getBasketOverlapCheck(memberDTO.getMemId(),productCode);
		
		//상품 상세보기에서 구매하기를 눌렀는데 해당 상품이 장바구니 테이블에 있을 때
		if(count!=0){
			basketList = basketDAO.getMemberBasketList(memberDTO.getMemId());
		//상품 상세보기에서 구매하기를 눌렀는데 해당 상품이 장바구니 테이블에 없을 때
		}else{
			productDTO = productDAO.getProductSpec(productCode);
			basketDTO.setMemId(memberDTO.getMemId());
			basketDTO.setMemName(memberDTO.getMemName());
			basketDTO.setProductCode(productCode);
			basketDTO.setProductCount(Integer.parseInt(productCount));
			basketDTO.setProductName(productDTO.getProductName());
			basketDTO.setProductPrice(Integer.parseInt(productCount)*productDTO.getProductPrice());
			basketDTO.setProductSimpleImgFileName(productDTO.getProductSimpleImgFileName());
			basketDTO.setTictok(Integer.parseInt(productCount)*productDTO.getTictok());
			basketDTO.setBasketAddDate(new Timestamp(System.currentTimeMillis()));
			
			//장바구니 테이블에 먼저 insert
			basketDAO.setBasket(basketDTO);
			//insert 한 후 select
			basketList = basketDAO.getMemberBasketList(memberDTO.getMemId());
			
			productDAO.setProductVolumeChange(productCode,Integer.parseInt(productCount));
		}
	}
%>
<body>
	
	<form method="post" action="WTBuy/WTBuyPro.jsp" id="BuyForm" name="BuyForm">
		<table width="1300px" border="1">
			<th width="150px">
				이미지
			</th>
			<th width="650px">
				상품명
			</th>
			<th width="200px">
				가격
			</th>
			<th width="100px">
				수량
			</th>
			<th width="200px">
				적립금
			</th>
<%	
			int total = 0;
			int TicTok = 0;
			String firstProductName="";
			for(int i = 0 ; i < basketList.size() ; i++){
				if(i==0){
					basketDTO = basketList.get(i);
					firstProductName = basketDTO.getProductName();
				}
				basketDTO = basketList.get(i);
				total = total + basketDTO.getProductPrice();
				TicTok = TicTok + basketDTO.getTictok();
%>
				<tr>
					<!-- 상품 이미지 -->
					<td>
						<img src="../WatTime/img/brand/<%=basketDTO.getProductSimpleImgFileName() %>" 
							 width="150px"
							 height="150px"
						>
						<input type="hidden" name="productImg" value="<%=basketDTO.getProductSimpleImgFileName() %>">
					</td>
					<!-- 상품명 -->
					<td>
						<%=basketDTO.getProductName() %>
						<input type="hidden" name="product" value="<%=basketDTO.getProductName() %>">
						<input type="hidden" name="productCode" value="<%=basketDTO.getProductCode() %>">
					</td>
					<!-- 상품 가격 -->
					<td>
						<%=df.format(basketDTO.getProductPrice()) %>
						<input type="hidden" name="productPrice" value="<%=basketDTO.getProductPrice() %>">
					</td>
					<!-- 상품 갯수 -->
					<td>
						<%=basketDTO.getProductCount() %>
						<input type="hidden" name="productCount" value="<%=basketDTO.getProductCount() %>">
					</td>
					<!-- 적립금 -->
					<td>
						<%=df.format(basketDTO.getTictok()) %>
						<input type="hidden" name="TicTok" value="<%=basketDTO.getTictok() %>">
					</td>
				</tr>
<%
			}
			//결제 페이지에서 결제하는 상품의 갯수가 1개 초과
			String productTitle="";
			if(basketList.size()>1){
				productTitle = firstProductName+" 외"+(basketList.size()-1)+"개";
			}else{
				productTitle = firstProductName;
			}
%>
			<tr>
				<td>
					<input type="button" value="장바구니 목록" onclick="basketList()">
				</td>
				<td>
					총 가격 : <%=df.format(total) %><br>
					총 적립 TicTok : <%=df.format(TicTok) %>
				</td>
			</tr>
		</table>
		<br><br><br>
		<!-- 주문자 정보 -->
		주문자 정보
		<div>
			<div>
				이름 <%=memberDTO.getMemName() %>
			</div>
			<div>
				이메일 <%=memberDTO.getMemEmail() %>
			</div>
			<div>
				전화번호 <%=memberDTO.getMemPhone() %>
			</div>
		</div>
		<br><br><br>
 		<!-- 배송정보 -->
		배송정보
		<div>
			<div>
				이름 <input type="text" id="deliveryMemName" name="deliveryMemName">
					<input type="button"
						   value="위 정보와 동일"
						   onclick="contentSame('<%=memberDTO.getMemName()%>',
						   						'<%=memberDTO.getMemPhone()%>',
						   						'<%=memberDTO.getMemPostcode()%>',
						   						'<%=memberDTO.getMemRoadAddress()%>',
						   						'<%=memberDTO.getMemDetailAddress()%>'
						   						)"
					 >
			</div>
			<div>
				전화번호 <input type="text"
							 id="deliveryMemPhone"
							 name="deliveryMemPhone"
							 placeholder="전화번호(-없이)"
					  >
			</div>
			<div>
				주소 <input type="text" id="memPostcode" name="memPostcode" placeholder="우편번호" readonly>
					<input type="button" value="우편번호 찾기" onclick="postcode()"><br>
					<input type="text" id="memRoadAddress" name="memRoadAddress" placeholder="주소">
			</div>
			<div>
				주문 메세지  <input type="text"
							    id="deliveryMessage"
							    name="deliveryMessage"
							    value="부재시 전화주세요."
						 >
			</div>
		</div>
		<br><br><br>
		상품명 : <%=productTitle %>
		<input type="hidden" name="productTitle" value="<%=productTitle %>">
		<!-- 포인트 사용 여부-->
		<div>
			<div>
				현재 가격 : <%=df.format(total) %>원
			</div>
			<div>
				보유 TicTok : <%=df.format(memberDTO.getMemPoint()) %><br>
				사용할 TicTok : <input type="number"
									 id="useTicTok"
									 name="useTicTok"
									 value="0" 
									 onchange="totalPriceCul(this.value,'<%=total%>','<%=memberDTO.getMemPoint()%>')"
							  >
				<input type="button" value="전부 사용" onclick="allTicTok('<%=memberDTO.getMemPoint()%>','<%=total%>')"><br>
				<font size="2px" color="gray">포인트는 1000TicTok부터 사용이 가능합니다.</font>
			</div>
			<div>
				최종가격 : <span id="totalPrice">
							<%=df.format(total) %>
						</span><br>
				<input type="hidden" name="totalPrice" value="<%=total%>"> 
				적립 TicTok : <%=df.format(TicTok) %>
				<input type="hidden" name="TicTok" value="<%=TicTok%>">
			</div>
		</div>
		<br><br><br>
		<!-- 결제방법 -->
		<div>
			<!-- 신용카드 -->
			<input type="radio" id="check1" name="check" value="card" onclick="buyForm(this.value)"> 신용카드<br>
			<input type="radio" id="check2" name="check" value="bankDeposit" onclick="buyForm(this.value)"> 휴대폰 결제<br>
			<input type="radio" id="check3" name="check" value="accountTransfer" onclick="buyForm(this.value)"> 실시간 계좌이체
			<input type="hidden" id="paymentMethod" name="paymentMethod">
		</div>
		<!-- 카드 -->
		<div id="cardForm" style="display:none;">
			<!-- 은행 선택 -->
			<div>
				은행 선택 : <select name="bank">
							 <option value="신한">신한</option>
							 <option value="우리">우리</option>
							 <option value="농협">농협</option>
							 <option value="국민">국민</option>
						 </select>
			</div>
			<!-- 카드 결제 폼 -->
			<div>
				<div>
					카드번호  <input type="number" id="cardNum1" name="serialNumber" maxlength="3" onkeydown="maxLengthCheck(this)">
						   <input type="password" id="cardNum2" name="serialNumber" maxlength="4" onkeydown="maxLengthCheck(this)">
						   <input type="password" id="cardNum3" name="serialNumber" maxlength="4" onkeydown="maxLengthCheck(this)">
						   <input type="number" id="cardNum4" name="serialNumber" maxlength="3" onkeydown="maxLengthCheck(this)">
				</div>
				<div>
					카드 유효기간 <input type="number"
									 id="cardMonth"
									 maxlength="1"
									 onkeydown="maxLengthCheck(this)"
									 placeholder="월(MM)"
							  >/
							  <input type="number"
							  		 id="cardYear"
							  		 name="cardYear"
							  		 maxlength="1"
							  		 onkeydown="maxLengthCheck(this)"
							  		 placeholder="년(YY)"
							  >
				</div>
				<div>
					카드 비밀번호 <input type="password" placeholder="**">**
				</div>
				<div>
					지불 방법 <select class="installments" id="installments" name="installments">
								<option value="0" selected>일시불</option>
								<option value="1">1개월</option>
								<option value="2">2개월</option>
								<option value="3">3개월</option>
								<option value="4">4개월</option>
								<option value="5">5개월</option>
								<option value="6">6개월</option>
								<option value="7">7개월</option>
								<option value="8">8개월</option>
								<option value="9">9개월</option>
								<option value="10">10개월</option>
								<option value="11">11개월</option>
								<option value="12">12개월</option>
							</select>
				</div>			
				<div>
					<input type="checkbox" id="buyAgreed">구매를 동의합니다.
				</div>
			</div>
		</div>
		<!-- 실시간 계좌이체 -->
		<div id="accountTransfer" style="display:none;">
			<!-- 은행 선택 -->
			<div>
				은행 선택 : <select name="bank">
							 <option value="신한">신한</option>
							 <option value="우리">우리</option>
							 <option value="농협">농협</option>
							 <option value="국민">국민</option>
						 </select>
			</div>
			<!-- 계좌 폼-->
			<div>
				<!-- 계좌번호 -->
				<div>
					계좌번호 <input type="number" placeholder="계좌번호(-없이)">
				</div>
				<div>
					계좌 비밀번호 <input type="password" placeholder="**">**
				</div>
			</div>
		</div>
		<!-- 휴대폰 결제 -->
		<div id="phoneForm" style="display:none;">
		</div>
		<!-- 결제 버튼 -->
		<input type="button" value="구매하기" onclick="order()">
		<input type="button" value="취소하기" onclick="">
	</form>
</body>
</html>