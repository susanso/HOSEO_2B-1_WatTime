<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*,java.text.*" %>
<%@ page import = "java.sql.Timestamp" %>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="basketDTO" class = "WatTimePack.WatTimeBasketDTO" scope="page">
	<jsp:setProperty name="basketDTO" property="*"/>
</jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="WTBasket/js/WTBasket.js"></script>
</head>
<%
	DecimalFormat df = new DecimalFormat("#,###");
	String memId = request.getParameter("memId");
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	
	List<WatTimeBasketDTO> basketList = null;
	WatTimeBasketDAO basketDAO = new WatTimeBasketDAO();
	
	
	//화면에 표시할 게시물 갯수
	int pageSize = 5;
	//URL에서 가져온 페이지 번호를 int 형으로 변환 시키고 넣음
	int currentPage = pageNum;
	int startRow = (currentPage - 1) * pageSize + 1;
	//처음 초기 페이지 번호 (최대 페이지를 10으로 설정하면 1, 11, 21)
    int brandstartRow = (currentPage - 1) * pageSize + 1;
	//끝 페이지 번호 (최대 페이지를 10으로 설정하면 10, 20, 30)
    int endRow = pageSize;
	//테이블에 조건에 맞는 행이 몇개인지 알아낼려는 변수
    int count = 0;
	//???
    int number = 0;
	
    count = basketDAO.getBasketListCount(memId);
    number = count-(currentPage-1)*pageSize;
  	//getProductList()메소드에 brand, type, startRow, pageSize넘겨 sql문 실행
  	basketList = basketDAO.getMemberBasketList(memId,startRow, pageSize);
	
%>
<body>
	<table border="1" class="basketListTable">
		<th>이미지</th>
		<th>상품명</th>
		<th>상품 가격</th>
		<th>상품 수량</th>
		<th>Tictok</th>
		<th>합계</th>
<%
	if(basketList.size() == 0){
%>
		<tr>
			<td colspan="6">장바구니에 넣은 상품이 없습니다.</td>
		</tr>
<%
	}else{
		int totalPrice=0;
		for(int i = 0 ; i < basketList.size() ; i++){
			basketDTO = basketList.get(i);
			totalPrice = totalPrice + basketDTO.getProductPrice()*basketDTO.getProductCount();
%>
		<tr>
			<td onclick="goProduct('<%=basketDTO.getProductCode() %>')"><img src="..\img\brand\<%=basketDTO.getProductSimpleImgFileName() %>" width="300px" height="300px"></td>
			<td onclick="goProduct('<%=basketDTO.getProductCode() %>')"><%=basketDTO.getProductName() %></td>
			<td><%=df.format(basketDTO.getProductPrice()*basketDTO.getProductCount()) %></td>
			<td>
				<input type="number" style="text-align:center;" id="productCountNum" name="productCountNum"  min="1" max="2147483647" value=<%=basketDTO.getProductCount() %> onchange="productCountChange(this.value)"><br>
				<!-- , -->
				<input type="button" id="productBasketModify" value="수정" class="basketBtn" onclick="productCountModify('<%=basketDTO.getMemId()%>','<%=basketDTO.getNum()%>')">
			
			</td>
			<td>
				<%=df.format(basketDTO.getTictok()*basketDTO.getProductCount()) %>
			</td>

			<td>
				<input type="button" class="basketBtn" id="<%=basketDTO.getNum() %>" value="삭제" onclick="basketOneDelete(this.id,'<%=basketDTO.getMemId()%>')"><br>
				<br>
			</td>
		</tr>
<%
		}
%>
		<tr>
			<td colspan="6" style="text-align:right;">
			
			<font size="5">	합계 : <%=df.format(totalPrice) %></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</td>
		</tr>
		<tr>
			<td colspan="6">
				<input type="button" id="basketAllDelete" value="모두 삭제" class="basketBtn" onclick="basketAllDelete('<%=basketDTO.getMemId()%>')">
				<input type="button" value="모두 구매" class="basketBtn">
			</td>
		</tr>
<%
	}
%>
	</table>
</body>
</html>