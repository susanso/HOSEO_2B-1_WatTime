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
<jsp:useBean id="reviewDTO" class = "WatTimePack.WatTimeReviewDTO" scope="page">
	<jsp:setProperty name="reviewDTO" property="*"/>
</jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/WTProduct.js"></script>

<title>Insert title here</title>
</head>
<body>
	<form id="reviewForm" name="reviewForm" method="post" action="WTReviewPro.jsp">
	<%
		DecimalFormat df = new DecimalFormat("#,###");
		String pageNum = request.getParameter("pageNum");
		String productCode = request.getParameter("productCode");
		int modify = Integer.parseInt(request.getParameter("modify"));
		String sort = request.getParameter("sort");
		
		WatTimeProductDAO productDAO = new WatTimeProductDAO();
		productDTO = productDAO.getProductSpec(productCode);
		
		//초기 배열을 빈 배열로 선언
		List<WatTimeProductDTO> productList = null;
		
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
	    
	    if(session.getAttribute("member") == null){
	    	log = "logno";
	    }else{
	    	memberDTO = (WatTimeMemberDTO)session.getAttribute("member");
	    }
%>
		<!-- 히든 텍스트 -->
		<input type="hidden" id="logCheck" name="logCheck" value=<%=log %>>
		<input type="hidden" id="memId" name="memId" value=<%=memberDTO.getMemId() %>>
		<input type="hidden" id="memName" name="memName" value=<%=memberDTO.getMemName() %>>
		<table border="1">
			<!-- 이미지 및 가격 -->
			<tr>
				<td rowspan="3" width="100px">
					<img src="..\img\brand\<%=productDTO.getProductSimpleImgFileName() %>">
					<input type="hidden" id="productCode" name="productCode" value="<%=productCode%>">
				</td>
				<td width="200px">
					제품명 : <%=productDTO.getProductName() %><br>
					브랜드 : <%=productDTO.getBrandEng() %><br>
					원가격 : <STRIKE><%=df.format(productDTO.getProductOriginalPrice()) %></STRIKE>(<font size="4pt"><%=productDTO.getProductSale() %>%↓</font>)<br>
					소비자 가격 : <%=df.format(productDTO.getProductPrice()) %><br>
					TicTok : <%=productDTO.getTictok() %><br>
					제조국 : <%=productDTO.getProductCountry() %><br>
					수량: <input type="number" id="productCount" name="productCount" value="1" min="1" max="2147483648">
				</td>
			</tr>
			<tr>
<%
					if(memberDTO.getMemAdmin()==1){
%>
						<input type="button" id="productModify" value="수정하기" onclick="productModifyForm('<%=productDTO.getProductCode()%>')">
						<input type="button" id="productDelete" value="삭제하기" onclick="productDeleteForm('<%=productDTO.getProductCode()%>')">
<%					
					}
%>			
			</tr>
			<!-- 구매하기, 장바구니 버튼 -->
			<tr>
				<td>
					<input type = "button" value="구매하기" onclick="test()">
					<input type = "button" value="장바구니" onclick="basketPro(logCheck.value,productCount.value,'<%=productDTO.getProductCode()%>','<%=productDTO.getProductName()%>','<%=productDTO.getProductPrice()%>','<%=memberDTO.getMemId()%>','<%=memberDTO.getMemName()%>','<%=productDTO.getProductSimpleImgFileName()%>')">
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
				<td colspan="2"><img src="..\img\brand\<%=productDTO.getProductDetailImgFileName() %>"></td>
			</tr>
			<!-- 평점 종합 -->
<% 			
			//평점 구하기
			float score1 = 0;
			float score2 = 0;
			float score3 = 0;
			float score4 = 0;
			float score5 = 0;
			float reviewCount = 0;
			float scoreAvg = 0;
			List<WatTimeReviewDTO> reviewScore = null;
			reviewScore = reviewDAO.getProductReviewScore(productCode);
			for(int i = 0 ; i < reviewScore.size() ; i++){
				reviewDTO = reviewScore.get(i);
				if(reviewDTO.getReviewScore() == 1){
					score1 = score1+1;
					reviewCount= reviewCount+1;
				}else if(reviewDTO.getReviewScore() == 2){
					score2 = score2+1;
					reviewCount= reviewCount+1;
				}else if(reviewDTO.getReviewScore() == 3){
					score3 = score3+1;
					reviewCount= reviewCount+1;
				}else if(reviewDTO.getReviewScore() == 4){
					score4 = score4+1;
					reviewCount= reviewCount+1;
				}else if(reviewDTO.getReviewScore() == 5){
					score5 = score5+1;
					reviewCount= reviewCount+1;
				}
			}
			//평점 식
			if(score1==0 && score2==0 && score3==0 && score4==0 && score5==0){
				scoreAvg = 0;
			}else{
				scoreAvg = ((score1*1)+(score2*2)+(score3*3)+(score4*4)+(score5*5)) / reviewCount;
			}
%>
			
			<tr >
				<td rowspan="5">
					평점: <%=Math.round(scoreAvg*100)/100.0 %>점
				</td>
				<td>1점 : <%=Math.round(score1) %>명</td>
			</tr>
			<tr>
				<td>2점 : <%=Math.round(score2) %>명</td>
			</tr>
			<tr>
				<td>3점 : <%=Math.round(score3) %>명</td>
			</tr>
			<tr>
				<td>4점 : <%=Math.round(score4) %>명</td>
			</tr>
			<tr>
				<td>5점 : <%=Math.round(score5) %>명</td>
			</tr>
			<!-- 구매후기 작성 -->
			<tr>
				<td>
					<textarea name = "productReview" id="productReview" onkeyup="productReviewLength()" onfocus="logCheck()" cols="40" rows="8" ></textarea><br>
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
					<input type="hidden" id="productNameHidden" name="productNameHidden" value="<%=productDTO.getProductName()%>">
					<input type="hidden" id="productFileNameHidden" name="productFileNameHidden" value="<%=productDTO.getProductSimpleImgFileName()%>">
					<input type="button" id="reviewRegistration" value="구매후기 등록" onclick="reviewCheck()">
				</td>
			</tr>
				
			<tr>
				<a id="review"></a>
				<td colspan="2">구매후기 <%=count %>개</td>
			</tr>
			<!-- 정렬 -->
			<tr>
				<td>
					<input type="button" id="reviewLastestSort" name="reviewLastestSort" value="최신순" onclick="reviewLastest('<%=productCode%>','<%=modify%>','<%=pageNum%>')">
					<input type="button" id="reviewScoreSort" name="reviewScoreSort" value="별점순" onclick="scoreSort('<%=productCode%>','<%=modify%>','<%=pageNum%>')">
				</td>
			</tr>
			<!-- 구매후기 리스트 -->
<%			
			List<WatTimeReviewDTO> reviewList = null;
				//getProductList()메소드에 brand, type, startRow, pageSize넘겨 sql문 실행
			reviewList = reviewDAO.getReviewList(productCode, sort, startRow, pageSize);
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
							<br>
							작성자 : <%=reviewDTO.getMemName()+"      "%>작성일 : <%=reviewDTO.getReg_date()+"      "%><br>
<%					
							//session.getAttribute("member") != null 이게 없으면 널 포인트 에러 뜸(memberDTO.getMemId() 이게 null 이기 때문)
							if(session.getAttribute("member") != null && (memberDTO.getMemId().toString().equals(reviewDTO.getMemId().toString())||memberDTO.getMemAdmin()==1)){
%>						
							
								<input type="button" id="modify" name="modify" value="수정" onclick="reviewModifyForm('<%=reviewDTO.getNum()%>','<%=reviewDTO.getProductCode()%>','<%=sort%>','<%=pageNum%>')">
								<input type="button" id="delete" name="delete" value="삭제" onclick="reviewDelete('<%=memberDTO.getMemId() %>','<%=reviewDTO.getNum() %>','<%=sort%>','<%=pageNum%>','<%=reviewDTO.getProductCode()%>')"><br>
<%
							}
%>						
							별점 : <%=star %><br><pre><%=reviewDTO.getReviewContent() %></pre>
							<br>
						</td>
					</tr>
<%
				}else{
%>
					<tr>
						<td>
							<textarea name = "productReviewRe" id="productReviewRe" onkeyup="productReviewLengthRe()" cols="40" rows="8"><%=reviewDTO.getReviewContent() %></textarea><br>
							<span id = "productReviewLengthRe" >현재 문자 길이 0/200</span><br>
							<select name = "scoreRe" id= "scoreRe">
								<option value="5" checked>★★★★★</option>
								<option value="4">★★★★</option>
								<option value="3">★★★</option>
								<option value="2">★★</option>
								<option value="1">★</option>
							</select>
							<br>
							<input type="button" id="modify" value = "수정하기" onclick="reviewModify('<%=reviewDTO.getProductCode()%>','<%=reviewDTO.getNum()%>','<%=sort%>')">
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
						<input type="button" name="back" value="이전" onclick="back('<%=startPage - 10%>','<%=modify%>','<%=productCode%>','<%=sort%>')">
<%      
					}
        			for (int i = startPage ; i <= endPage ; i++) {  
%>
        				<input type="button" name="pageNum" value="<%=i %>" onclick="pageNum(this.value,'<%=modify%>','<%=productCode%>','<%=sort%>')">
<%      
					}
        
			        if (endPage < pageCount) {  %>
			        	<input type="button" name="back" value="다음" onclick="next('<%=startPage + 10%>','<%=modify%>','<%=productCode%>','<%=sort%>')">
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