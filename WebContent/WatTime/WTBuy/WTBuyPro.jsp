<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.text.*,java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*" %>
<%@ page import = "java.sql.Timestamp" %>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="memberDTO" class = "WatTimePack.WatTimeMemberDTO" scope="page">
   <jsp:setProperty name="memberDTO" property="*"/>
</jsp:useBean>
<jsp:useBean id="orderDTO" class = "WatTimePack.WatTimeOrderDTO" scope="page">
   <jsp:setProperty name="orderDTO" property="*"/>
</jsp:useBean>
<jsp:useBean id="orderProductDTO" class = "WatTimePack.WatTimeOrderProductDTO" scope="page">
   <jsp:setProperty name="orderProductDTO" property="*"/>
</jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
	//세션을 다시 부여하기 전 상태를 가져옴(세션을 새로 부여하여 적립 포인트 등 새로고침을 위해)
	memberDTO = (WatTimeMemberDTO)session.getAttribute("member");
	DecimalFormat df = new DecimalFormat("#,###");

	//결제한 상품 목록의 배열
	String[] productImg = request.getParameterValues("productImg");
	String[] product = request.getParameterValues("product");
	String[] productPrice = request.getParameterValues("productPrice");
	String[] productCount = request.getParameterValues("productCount");
	String[] TicToks = request.getParameterValues("TicTok");
	//결제 날짜
	Timestamp now = new Timestamp(System.currentTimeMillis());
	//사용한 포인트
	int useTicTok = Integer.parseInt(request.getParameter("useTicTok"));
	//시리얼 번호
	String serialNumber = request.getParameter("serialNumber");
	//할부 기간
	int installments = Integer.parseInt(request.getParameter("installments"));
	//은행
	String bank = request.getParameter("bank");
	bank = new String(bank.getBytes("8859_1"), "utf-8");
	//배송 주소
	String orderAddress = request.getParameter("memRoadAddress");
	orderAddress = new String(orderAddress.getBytes("8859_1"), "utf-8");
	//배송 우편번호
	String orderPostCode = request.getParameter("memPostcode");
	//배송 메세지
	String orderMessage = request.getParameter("deliveryMessage");
	orderMessage = new String(orderMessage.getBytes("8859_1"), "utf-8");
	//결제 방법
	String paymentMethod = request.getParameter("paymentMethod");
	paymentMethod = new String(paymentMethod.getBytes("8859_1"), "utf-8");
	//orderTbl에 넣을 productName
	String productName = request.getParameter("productTitle");
	productName = new String(productName.getBytes("8859_1"), "utf-8");
	//최종 가격
	int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
	int TicTok = Integer.parseInt(request.getParameter("TicTok"));
	
	WatTimeOrderDAO orderDAO = new WatTimeOrderDAO();
	WatTimeOrderProductDAO orderProductDAO = new WatTimeOrderProductDAO();
	
	//orderDTO 값 넣기
	orderDTO.setMemId(memberDTO.getMemId());
	orderDTO.setMemName(memberDTO.getMemName());
	orderDTO.setProductName(productName);
	orderDTO.setTotalPrice(totalPrice);
	orderDTO.setUseTicTok(useTicTok);
	orderDTO.setTicTok(TicTok);
	orderDTO.setOrderDate(now);
	orderDTO.setPaymentMethod(paymentMethod);
	orderDTO.setSerialNumber(serialNumber);
	orderDTO.setInstallments(installments);
	if(paymentMethod.equals("card")){
		orderDTO.setOrderStatus("결제 완료");
	}else{
		orderDTO.setOrderStatus("결제 확인 중");
	}
	orderDTO.setOrderMessage(orderMessage);
	orderDTO.setOrderAddress(orderAddress);
	orderDTO.setOrderPostCode(orderPostCode);
	
	orderDAO.setOrder(orderDTO);
%>
	<%=orderDTO.getMemName() %><br>
	<%=orderDTO.getMemId() %><br>
	<%=now %>
<%
	//넣은 번호 찾아오기
	int orderNum = orderDAO.getOrderNum(orderDTO);

	/* //orderProductTbldp 넣기
	for(int i = 0 ; i < product.length ; i++){
		orderProductDTO.setMemId(memberDTO.getMemId());
		orderProductDTO.setMemName(memberDTO.getMemName());
		orderProductDTO.setOrderDate(now);
		orderProductDTO.setProductName(product[i]);
		orderProductDTO.setProductCount(Integer.parseInt(productCount[i]));
		orderProductDTO.setProductPrice(Integer.parseInt(productPrice[i]));
		orderProductDTO.setTicTok(Integer.parseInt(TicToks[i]));
		orderProductDTO.setOrderNum(orderNum);
		
		orderProductDAO.setProduct(orderProductDTO);
	} */
	
	
%>
<%=orderNum %><br>
<%=orderDTO.getMemId() %>
<body>
	주문 완료<br>
	주문한 항목을 확인해주세요.
	<table>
<%
		int total = 0;
		int totalTicTok = 0;
		for ( int i = 0 ; i < product.length ; i++ ) {
			total = total + Integer.parseInt(productPrice[i]);
			totalTicTok = totalTicTok + Integer.parseInt(TicToks[i]);
%>
			<tr>
				<td>
					<img src="../WatTime/img/brand/<%=productImg[i] %>" 
						 width="150px" height="150px">
				</td>
				<td>
					<%=product[i] %>
				</td>
				<td>
					<%=df.format(Integer.parseInt(productPrice[i])) %>
				</td>
				<td>
					<%=df.format(Integer.parseInt(productCount[i])) %>
				</td>
				<td>
					<%=df.format(Integer.parseInt(TicToks[i])) %>
				</td>
			</tr>
<%
		}
%>
		<tr>
			<td>
				결제한 금액 : <%=df.format(total) %><br>
				사용한 TicTok : <%=df.format(useTicTok) %><br>
				적립한 TicTok : <%=df.format(TicTok) %>
			</td>
		</tr>
	</table>
	
	
</body>
</html>