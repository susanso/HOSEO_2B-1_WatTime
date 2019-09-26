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
		}
	}
%>
<body>
	<form method="post" action="">
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
			for(int i = 0 ; i < basketList.size() ; i++){
				basketDTO = basketList.get(i);
				total = total + basketDTO.getProductPrice();
%>
				<tr>
					<!-- 상품 이미지 -->
					<td>
						<img src="../WatTime/img/brand/<%=basketDTO.getProductSimpleImgFileName() %>" 
							 width="150px" height="150px">
					</td>
					<!-- 상품명 -->
					<td>
						<%=basketDTO.getProductName() %>
					</td>
					<!-- 상품 가격 -->
					<td>
						<%=df.format(basketDTO.getProductPrice()) %>
					</td>
					<!-- 상품 갯수 -->
					<td>
						<%=basketDTO.getProductCount() %>
					</td>
					<!-- 적립금 -->
					<td>
						<%=df.format(basketDTO.getTictok()) %>
					</td>
				</tr>
<%
			}
%>
			<tr>
				<td>
					<input type="button" value="장바구니 목록" onclick="basketList()">
				</td>
				<td>
					총 가격 : <%=df.format(total) %>
				</td>
			</tr>
		</table>
		<!-- 주문자 정보 -->
		주문자 정보
		<table border="1">
			<tr>
				<td>
					이름
				</td>
				<td>
					<%=memberDTO.getMemName() %>
				</td>
			</tr>
			<tr>
				<td>
					이메일
				</td>
				<td>
					<input type="text" name="orderMemEmail" value="<%=memberDTO.getMemEmail() %>">
				</td>
			</tr>
			<tr>
				<td>
					전화번호
				</td>
				<td>
					<input type="text" name="orderMemPhone" value="<%=memberDTO.getMemPhone() %>">
				</td>
			</tr>
		</table>
		
		<!-- 배송정보 -->
		배송정보
		<table border="1">
			<tr>
				<td>
					이름
				</td>
				<td>
					<input type="text" name="deliveryMemName">
				</td>
			</tr>
			<tr>
				<td>
					전화번호
				</td>
				<td>
					<input type="text" name="deliveryMemPhone">
				</td>
			</tr>
			<tr>
				<td>
					주소
				</td>
				<td>
					<input type="text" name="deliveryMemName">
				</td>
			</tr>
			<tr>
				<td>
					주문 메세지
				</td>
				<td>
					<input type="text" name="deliveryMemName">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>