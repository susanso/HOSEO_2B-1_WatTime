<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*" %>
<%@ page import = "java.sql.Timestamp" %>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="memberDTO" class = "WatTimePack.WatTimeMemberDTO" scope="page">
	<jsp:setProperty name="memberDTO" property="*"/>
</jsp:useBean>
<jsp:useBean id="productDTO" class = "WatTimePack.WatTimeProductDTO" scope="page">
	<jsp:setProperty name="productDTO" property="*"/>
</jsp:useBean>
<jsp:useBean id="reviewDTO" class = "WatTimePack.WatTimeReviewDTO" scope="page">
	<jsp:setProperty name="reviewDTO" property="*"/>
</jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="script.js"></script>

<title>Insert title here</title>
</head>
<body>
	<form id="reviewForm" name="reviewForm" method="post" action="WTReviewPro.jsp">
	<%
		String url = request.getRequestURL().toString();
		if(request.getQueryString() != null)
			url = url +"?"+request.getQueryString();
		//url의 전체 길이
		int urlLength = url.length();
		//"Code"표시의 위치를 찾음
		int urlIndex = url.indexOf("?Code=");
		int urlIndex2 = url.indexOf("?pageNum=");
		int urlIndex3 = url.indexOf("?sort=");
		int urlIndex4 = url.indexOf("?modify=");
		//substring쪽에서 = 표시까지 출력되서 5 더함
		String productCode = url.substring(urlIndex+6,urlIndex2);
		String pageNum = url.substring(urlIndex2+9,urlIndex3);
		String sort = url.substring(urlIndex3+6,urlIndex4);
		int modify = Integer.parseInt(url.substring(urlIndex4+8,urlLength));
		String modifyURL =url.substring(0,urlIndex4+8);
		String pageNextURL = url.substring(0,urlIndex2);
		String nextURL = url.substring(0,urlIndex3);
		
		
		WatTimeProductDAO productDAO = new WatTimeProductDAO();
		productDTO = productDAO.getProductSpec(productCode);
		
		//초기 배열을 빈 배열로 선언
		List<WatTimeProductDTO> productList = null;
		String sortText = "";
		int modifyNum = 0;
		if(sort.equals("") || sort.equals(null)){
			sortText = "reg_date DESC";
	    }else if(sort.equals("highPrice")){
	    	sortText = "reviewScore DESC";
	    }
		
		int pageSize = 10;
		//URL에서 가져온 페이지 번호를 int 형으로 변환 시키고 넣음
		int currentPage = Integer.parseInt(pageNum);
		//처음 초기 페이지 번호 (최대 페이지를 10으로 설정하면 1, 11, 21)
	    int startRow = (currentPage - 1) * pageSize + 1;
		//끝 페이지 번호 (최대 페이지를 10으로 설정하면 10, 20, 30)
	    int endRow = currentPage * pageSize;
		//테이블에 조건에 맞는 행이 몇개인지 알아낼려는 변수
	    int count = 0;
		//???
	    int number = 0;
	    WatTimeReviewDAO reviewDAO = new WatTimeReviewDAO();
	    //해당 상품 구매후기 갯수 가져오기
	    count = reviewDAO.getReviewCount(productCode);
	    number = count-(currentPage-1)*pageSize;
	    String log = "";
	    List<WatTimeReviewDTO> reviewList = null;
	  	//getProductList()메소드에 brand, type, startRow, pageSize넘겨 sql문 실행
	    reviewList = reviewDAO.getReviewList(productCode, sortText, startRow, pageSize);
	    if(session.getAttribute("member") == null){
	    	log = "logno";
	    }else{
	    	memberDTO = (WatTimeMemberDTO)session.getAttribute("member");
	    }
%>		
		<!-- 히든 텍스트 -->
		<input type="hidden" id="backURL" name="backURL" value=<%=url %>>
		<input type="hidden" id="logCheck" name="logCheck" value=<%=log %>>
		<input type="hidden" id="memId" name="memId" value=<%=memberDTO.getMemId() %>>
		<input type="hidden" id="memName" name="memName" value=<%=memberDTO.getMemName() %>>
		<table border=1>
			<!-- 이미지 및 가격 -->
			<tr>
				<td rowspan="2" width="100px">
					<img src="img/<%=productCode%>.jpg">
					<input type="hidden" id="productCode" name="productCode" value="<%=productCode%>">
				</td>
				<td width="200px">
					제품명 : <%=productDTO.getProductName() %><br>
					브랜드 : <%=productDTO.getBrandEng() %><br>
					가격 : <%=productDTO.getProductPrice() %><br>
					TicTok : <%=productDTO.getTictok() %>
					제조국 : <%=productDTO.getProductCountry() %>
					
				</td>
			</tr>
			<!-- 구매하기, 장바구니 버튼 -->
			<tr>
				<td>
					<input type = "button" value="구매하기">
					<input type = "button" value="장바구니">
				</td>
			</tr>
			<!-- 버튼구역 -->
			<tr>
				<td colspan="2">
					<input type = "button" value="상품 상세정보">
					<input type = "button" value="배송/교환/환불">
					<a href="#review"><input type = "button" value="구매후기<%=count%>개"></a>
					<input type = "button" value="구매문의">
				</td>
			</tr>
			<!-- 상세 이미지 -->
			<tr>
				<td colspan="2"><img src="img/<%=productCode%>상세.jpg"></td>
			</tr>
			<!-- 평점 종합 -->
			<tr>
				테스트<br>
				코드 : <%=productCode %><br>
				정렬 : <%=sortText %><br>
				카운트 : <%=count %>
			</tr>
			<!-- 구매후기 작성 -->
			<tr>
				<td>
					<input type="text" name = "productReview" id="productReview" onkeyup="productReviewLength()" onfocus="logCheck()"maxlength="200"><br>
					<span id = "productReviewLength" >현재 문자 길이 0/200</span>
					<select name = "score" id= "score">
						<option value="5" checked>★★★★★</option>
						<option value="4">★★★★</option>
						<option value="3">★★★</option>
						<option value="2">★★</option>
						<option value="1">★</option>
					</select>
				</td>
				<td>
					<input type="button" id="reviewRegistration" value="구매후기 등록" onclick="reviewCheck()">
				</td>
			</tr>
				
			<tr>
				<a id="review"></a>
				<td colspan="2">구매후기 <%=count %>개</td>
			</tr>
			<!-- 구매후기 리스트 -->
<%
			for(int i = 0 ; i < reviewList.size() ; i++){
				reviewDTO = reviewList.get(i);
				//별점 숫자를 텍스트로 바꾸기
				String star = "";
				if(reviewDTO.getReviewScore() == 1){
					star="★";
				}else if(reviewDTO.getReviewScore() == 2){
					star="★★";
				}else if(reviewDTO.getReviewScore() == 3){
					star="★★★";
				}else if(reviewDTO.getReviewScore() == 4){
					star="★★★★";
				}else{
					star="★★★★★";
				}
				if(modify != reviewDTO.getNum()){
%>
					<tr>
						<td colspan="2">
							작성자 : <%=reviewDTO.getMemName()+"      "%>작성일 : <%=reviewDTO.getReg_date()+"      "%><br>
<%					
							//session.getAttribute("member") != null 이게 없으면 널 포인트 에러 뜸(memberDTO.getMemId() 이게 null 이기 때문)
							if(session.getAttribute("member") != null && memberDTO.getMemId().toString().equals(reviewDTO.getMemId().toString())){
%>						
							
								<input type="button" id="modify" name="modify" value="수정" onclick="reviewModifyForm('<%=modifyURL %>','<%=reviewDTO.getNum() %>')">
								<input type="button" id="delete" name="delete" value="삭제" onclick="reviewDelete('<%=memberDTO.getMemId() %>','<%=reviewDTO.getNum() %>')"><br>
<%
							}
%>						
							별점 : <%=star %><br>
							<%=reviewDTO.getReviewContent() %>
						</td>
					</tr>
<%
				}else{
%>
					<tr>
						<td>
							<input type="text" name = "productReviewRe" id="productReviewRe" onkeyup="productReviewLength()" maxlength="200"><br>
							<span id = "productReviewLengthRe" >현재 문자 길이 0/200</span><br>
							<select name = "scoreRe" id= "scoreRe">
								<option value="5" checked>★★★★★</option>
								<option value="4">★★★★</option>
								<option value="3">★★★</option>
								<option value="2">★★</option>
								<option value="1">★</option>
							</select>
							<br>
							<input type="button" id="modify" value = "수정하기" onclick="reviewModify('<%=modify%>','<%=modifyURL%>','<%=reviewDTO.getProductCode()%>')">
							<input type="button" id="modifycencle" value = "취소" onclick="productSpec('<%=reviewDTO.getProductCode() %>')">
						</td>
					<tr>
<%		
				}
			}
%>					
				

			<tr>
				<td colspan="2">
<%
					if (count > 0) {
						int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
						int startPage = 1 ;
						
						if(currentPage % 10 != 0){
							startPage = (int)(currentPage/10)*10 + 1;
						}else{
							startPage = ((int)(currentPage/10)-1)*10 + 1;
						}
						int pageBlock = 10;
						int endPage = startPage + pageBlock - 1;
						if (endPage > pageCount){
							endPage = pageCount;
						}
				        if (startPage > 10) { 
%>
				          <a href="<%=pageNextURL %>?pageNum=<%= startPage - 10 %>?sort=<%=sort%>?modify=<%=modify %>">[이전]</a>
<%      
						}
				        for (int i = startPage ; i <= endPage ; i++) {  
%>
				        	<a href="<%=pageNextURL %>?pageNum=<%= i %>?sort=<%=sort%>?modify=<%=modify %>">[<%= i %>]</a>
<%      
						}
				        
				        if (endPage < pageCount) {  %>
				        	<a href="<%=pageNextURL %>?pageNum=<%= startPage + 10 %>?sort=<%=sort%>?modify=<%=modify %>">[다음]</a>
<%
				        }
				    }
%>
				</td>
			</tr>
		
		</table>
	</form>
</body>
</html>