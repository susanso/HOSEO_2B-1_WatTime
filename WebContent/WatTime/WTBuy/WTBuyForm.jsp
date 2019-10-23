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
		<table class="finalBuy" border="1px solid #D8D8D8">
			<th width="150px" >
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
					<input type="button"  class ="gotoProductList"value="장바구니 목록" onclick="basketList()">
				</td>
				<td colspan="4">
					<b><color="red">총 가격</color> : <%=df.format(total) %> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					총 적립 TicTok : <%=df.format(TicTok) %></b>
				</td>
			</tr>
		</table>
		
		<!-- 주문자 정보 -->
		<div class="finalBuyForm">
			<div class="finalBuyUser">
			<h2>주문자 정보</h2>
			<hr>
				<div>
					<p>이름</p>  <%=memberDTO.getMemName() %>
				</div>
				<div>
					 <p>이메일 </p> <%=memberDTO.getMemEmail() %>
				</div>
				<div>
					<p>전화번호</p>  <%=memberDTO.getMemPhone() %>
				</div>
				<div>
					<p>우편 번호</p> 	<%=memberDTO.getMemPostcode() %>
				</div>
				<div>
					<p>주소</p> <%=memberDTO.getMemRoadAddress() %>
				</div>
				<!--  패드백#1 :주소,주소는 반드시 넣어야 뒤에꺼랑 비교할수 있을것 같음 -->
			</div>
	 		<!-- 배송정보 -->
			<div class="finalBuyUserInfo">
			<h2>배송정보</h2>
			<hr>
				<div>
					<p>이름</p> <input type="text" id="deliveryMemName" name="deliveryMemName">
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
					<p>전화번호</p> <input type="text"
								 id="deliveryMemPhone"
								 name="deliveryMemPhone"
								 placeholder="전화번호(-없이)"
						  >
				</div>
				<div>
					<p>주소</p> <input type="text" id="memPostcode" name="memPostcode" placeholder="우편번호" readonly>
						<input type="button" value="우편번호 찾기" onclick="postcode()"><br>
						<input type="text" id="memRoadAddress" name="memRoadAddress" placeholder="주소">
				</div>
				<div>
					<p>배송시 요구사항</p>  <input type="text"
								    id="deliveryMessage"
								    name="deliveryMessage"
								    value="부재시 전화주세요."
							 >
				</div>
			</div>
			
			<!-- 포인트 사용 여부-->
			<div class="fanalBuyProductInfo">
				
					<h2>구매 정보</h2>
					<hr>
					<div>
					<p>상품명</p> <%=productTitle %>
					</div>
				<input type="hidden" name="productTitle" value="<%=productTitle %>">
				
				<div>
					<p>현재 가격 </p> <font color="red"><%=df.format(total) %>원</font><br>
					<img alt="빼기" src="./img/minor.png" width="30px">
				</div>
				<div>
					<p>보유 TicTok</p>  <%=df.format(memberDTO.getMemPoint()) %> TicTok<br>
					<p>사용할 TicTok</p>  <input type="number"
										 id="useTicTok"
										 name="useTicTok"
										 value="0"
										 onkeyup="totalPriceCul(this.value,'<%=total%>','<%=memberDTO.getMemPoint()%>')"
										 onkeydown="totalPriceCul(this.value,'<%=total%>','<%=memberDTO.getMemPoint()%>')"
										 onchange="totalPriceCul(this.value,'<%=total%>','<%=memberDTO.getMemPoint()%>')"
								  >
					<!--피드백#3 사용한 포인트 넣기 [원래가격-사용한가격=최종가격]을 넣는게 좋을것 같아서 추천해봄 -->
					<input type="button" value="전부 사용" onclick="allTicTok('<%=memberDTO.getMemPoint()%>','<%=total%>')"><br>
						<!--피드백#4 포인트를 전부 사용시 원 표기가 사라짐-->
					<font size="2px" color="gray">포인트는 1000TicTok부터 사용이 가능합니다.</font>
					<br>
					<p>사용 TicTok</p> <font color="red"><span id="finalTicTok">0</span><span> TicTok</span></font>
					<img alt="빼기" src="./img/equers.png" width="30px">
				</div>
				<div>
					<font size="6" color="red"> <p>최종가격</p> <span id="totalPrice">
								<%=df.format(total) %>
								
							</span><span> 원</span></font><br>
					<input type="hidden" name="totalPrice" value="<%=total%>">
					<font size="6" color="red"> <p>적립 TicTok</p> <%=df.format(TicTok) %> TicTok</font>
					<input type="hidden" name="TicTok" value="<%=TicTok%>">
				</div>
			</div>
		</div>
		<div class="BuyWarning">
		<div>
			<textarea readonly="readonly" cols="50" rows="4" style="resize: none;">
			고객님께서는 아래 내용에 대하여 동의를 거부하실 수 있으며, 거부시 상품 배송, CS가 제한됩니다.제공받는자	[(주)다난기술]	목적	주문상품의 배송(예약), 고객상담 및 불만처리 항목, 성명, 주소, 연락처(안심번호 적용 시 연락처는 제외), 개인통관고유부호(선택시), 현관비밀번호(입력시)
			보유기간:구매확정 후 3개월까지
			</textarea>
			<p><input type="checkbox" id="agree1" name = "agree"> 개인정보 판매자 제공에 동의합니다.</p>
		</div>
		<div>
			<textarea readonly="readonly" cols="50" rows="4" style="resize: none;">
			고객님께서는 아래 내용에 대하여 동의를 거부하실 수 있으며, 거부 시 상품배송, 구매 및 결제, 일부 포인트 적립이 제한됩니다.
			수집이용목적	수집 항목	보유기간
			대금 결제/환불 서비스 제공, 주문/배송/거래 내역 조회 서비스 제공, 전자상거래법 준수 등	신용카드 정보, 계좌 정보, 주문/배송/거래 내역	회원탈퇴 시 까지
			단, 관계 법령의 규정에 따라 보존할 의무가 있으면 해당 기간 동안 보존
			상품 및 경품 배송(반품/환불/취소등), 배송지 확인, 최초 입력 후 불러오기 기능 제공	배송지 정보 (수령인,전화번호,주소), 현관비밀번호(입력시)	회원탈퇴 시 까지
			단, 관계 법령의 규정에 따라 보존할 의무가 있으면 해당 기간 동안 보존
			이용계약(이용약관)이 존속중인 탈퇴하지 않은 회원의 경우 보유기간은 보존의무기간 이상 보관할 수 있으며 이 기간이 경과된 기록에 대해서 파기요청이 있는 경우 파기함
			결제수단에 따른 개인정보 수집.이용 항목이 상이할 수 있음
			</textarea>
			<p><input type="checkbox" id="agree2" name = "agree"> 개인정보 수집 및 이용에 동의합니다.</p>
		</div>
		<div>
			<textarea readonly="readonly" cols="50" rows="4" style="resize: none;">
			주문 상품의 상품명, 가격, 배송정보에 동의합니다.단, 관계 법령의 규정에 따라 보존할 의무가 있으면 해당 기간 동안 보존
			이용계약(이용약관)이 존속중인 탈퇴하지 않은 회원의 경우 보유기간은 보존의무기간 이상 보관할 수 있으며 이 기간이 경과된 기록에 대해서 파기요청이 있는 경우 파기함
			결제수단에 따른 개인정보 수집.이용 항목이 상이할 수 있음
			</textarea>
			<p><input type="checkbox" id="agree3" name = "agree"> 주문 상품정보 확인 및 동의합니다.</p>
		</div>
		<center>
			<input type="checkbox" id="agreeAll" name = "agree" onclick="allCheck()"> 위 내용을 확인하였으며 모든 내용에 동의합니다.
		</center>
		</div>
			<!-- 결제방법 -->
			<div class="howToBuyProduct">
				<!-- 신용카드 -->
				<center><h2>결제 수단</h2></center>
				<br>
				<hr>
				<br>
				<ul>
					<li>
						<input type="radio" id="check1" name="check" value="card" onclick="buyForm(this.value)"> 신용카드<br>
					</li>
					<li>
						<input type="radio" id="check2" name="check" value="phoneBank" onclick="buyForm(this.value)"> 휴대폰 결제<br>
					</li>
					<li>
						<input type="radio" id="check3" name="check" value="accountTransfer" onclick="buyForm(this.value)"> 실시간 계좌이체
					</li>
					<input type="hidden" id="paymentMethod" name="paymentMethod" value="">
				</ul>
			</div>
		
			<!-- 카드 -->
			<div id="cardForm" class="cardForm">
				<!-- 은행 선택 -->
				<div>
					<p>은행 선택 </p> <select name="bank">
								 <option value="신한">신한</option>
								 <option value="우리">우리</option>
								 <option value="농협">농협</option>
								 <option value="국민">국민</option>
							 </select>
				</div>
				<!-- 카드 결제 폼 -->
				<div>
					<div>
						<p>카드번호</p>
							<input type="number" id="cardNum1" name="serialNumber" maxlength="3" onkeydown="maxLengthCheck(this)">
							<input type="password" id="cardNum2" name="serialNumber" maxlength="4" onkeydown="maxLengthCheck(this)">
							<input type="password" id="cardNum3" name="serialNumber" maxlength="4" onkeydown="maxLengthCheck(this)">
							<input type="number" id="cardNum4" name="serialNumber" maxlength="3" onkeydown="maxLengthCheck(this)">
					</div>
					<div>
						<p>카드 유효기간</p> <input type="number"
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
						<p>카드 비밀번호</p> <input type="password" id="cardPass" maxlength="2" placeholder="**">**
					</div>
					<div>
						<p>지불 방법</p> 
							<select class="installments" id="installments" name="installments">
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
					<!-- <div style="text-align:center; font-size:20px">
						 <input type="checkbox" id="buyAgreed">구매를 동의합니다.
					</div> -->
				</div>
			</div>
			<!-- 실시간 계좌이체 -->
			<div id="accountTransfer" class="accountTransfer">
				<!-- 은행 선택 -->
				<div>
					<p>은행 선택 </p> <select name="bank" id="bank">
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
					<p>	계좌번호</p> <input type="number" id="accountNumber" name="serialNumber" placeholder="계좌번호(-없이)">
					</div>
					<div>
						<p>계좌 비밀번호</p> <input type="password" id="accountPass" maxlength="2" placeholder="**">**
					</div>
					<div>
					<p>	예금주 </p><input type="text" id="accountName" value="<%=memberDTO.getMemName() %>">
					</div>
					<!-- <div style="text-align:center;">
						<font color="red" size="5px">입금 가능 계좌</font><br>
						<font color="red" size="4px">국민  111-25-8585-997</font><br>
						<font color="red" size="4px">신한  110-222-252525</font><br>
						<font color="red" size="4px">IBK 411-255-85-302</font><br>
					</div> -->
				</div>
			</div>
			<!-- 휴대폰 결제 -->
			<div id="phoneForm" class="phoneForm">
				<!-- 통신사 -->
				<div>
				<p>통신사</p>
					<select>
						<option selected>SKT</option>
						<option>KT</option>
						<option>U+</option>
						<option>알뜰폰</option>
					</select>
				</div>
				<!-- 전화번호 -->
				<div>
					<p>전화번호</p> <input type="number" id="phoneNum" name="phoneNum" placeholder="전화번호(-없이)">
				</div>
				<!-- 이름 -->
				<div>
					<p>이름</p> <input type="text" id="phoneName" name="phoneName" placeholder="이름">
				</div>
				<!-- 생년월일 -->
				<div>
					<p>생년월일</p> <input type="text" id="phoneBirth" name="phoneBirth" placeholder="생년월일(-없이 8자)">
				</div>
			</div>
			<!-- 결제 버튼 -->
			<div class="fanalSelectBuy">
				<input type="button" value="구매하기" onclick="order()">
				<input type="button" value="취소하기" onclick="location.href='WTMain.jsp?pageChange=WTBasket/WTBasketList.jsp?pageNum=1'">
			</div>
	
	</form>
</body>
</html>