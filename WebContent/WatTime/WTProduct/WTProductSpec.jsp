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
<title>Insert title here</title>
<script language = "JavaScript" src="WTProduct/js/WTProductSpec.js"></script>
</head>
<body>
	<form id="reviewForm" name="reviewForm" method="post" action="WTReview/WTReviewPro.jsp">
<%
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		DecimalFormat df = new DecimalFormat("#,###");
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		String productCode = request.getParameter("productCode");
		productCode = new String(productCode.getBytes("8859_1"), "utf-8");
		int modify = Integer.parseInt(request.getParameter("modify"));
		String sort = request.getParameter("sort");
      
		WatTimeProductDAO productDAO = new WatTimeProductDAO();
		productDTO = productDAO.getProductSpec(productCode);
      
		//초기 배열을 빈 배열로 선언
		List<WatTimeProductDTO> productList = null;
		int pageSize = 10;
		//URL에서 가져온 페이지 번호를 int 형으로 변환 시키고 넣음
		int currentPage = pageNum;
		//처음 초기 페이지 번호 (최대 페이지를 10으로 설정하면 1, 11, 21)
		int startRow = (currentPage - 1) * pageSize + 1;
		//끝 페이지 번호 (최대 페이지를 10으로 설정하면 10, 20, 30)
		int endRow = pageSize;
		//테이블에 조건에 맞는 행이 몇개인지 알아낼려는 변수
		int count = 0;
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
		<table   class="spec">
         	<!-- 이미지 및 가격 -->
	         <tr>
	            <td rowspan="2" width="100px">
	               <img src="../WatTime/img/brand/<%=productDTO.getProductSimpleImgFileName()%>"
	               		width="600px" height="600px">
	               <input type="hidden" id="productCode" name="productCode" value="<%=productCode%>">
	            </td>
	            <td width="200px" class="productInfo">
<%
					if(memberDTO.getMemAdmin()==1){
%>
						<input type="button" id="productModify" class="specBtn" value="수정하기" 
                  			   onclick="productModifyForm('<%=productDTO.getProductCode()%>')">
						<input type="button" id="productDelete" class="specBtn" value="삭제하기"
							   onclick="productDeleteForm('<%=productDTO.getProductCode()%>')"><br>
<%               
					}
%>
					<p>
						<font size="6">
							<%=productDTO.getProductName() %>
						</font>
					</p>
					<p>
						브랜드 : <%=productDTO.getBrandEng() %>
					</p>
					<p>
						판매가 : <font color="red"><STRIKE><%=df.format(productDTO.getProductOriginalPrice()) %></STRIKE></font>(<font size="4pt"><%=productDTO.getProductSale() %>%↓</font>)
					</p>
					<p>
						회원가 : <%=df.format(productDTO.getProductPrice()) %>원
					</p>
					<p>
						적립 포인트 :<b>&nbsp;<%=productDTO.getTictok() %> </b>&nbsp;TicTok
					</p>
					<p>
						제조국 : <%=productDTO.getProductCountry() %>
					</p>
					<p>
						수량: <input type="number" id="productCount" name="productCount" value="1" min="1" max="2147483648" onkeyup="countChange('<%=productDTO.getProductPrice() %>',this.value)">
					</p>
	               <input type="button" name="plus" class="productCountBtn" value="+" 
						  onclick="countPlus('<%=productDTO.getProductPrice() %>',productCount.value)">
	               <input type="button" name="minus" class="productCountBtn" value="-"
						  onclick="countMinus('<%=productDTO.getProductPrice() %>',productCount.value)">
					<p>
						<b>
							<font size="6" color="#FE2E2E">
								총 금액 : <span id = "totalPrice"><%=df.format(productDTO.getProductPrice()) %>원</span>
							</font>
						</b>
					</p>
	            </td>
	         </tr>
	         <!-- 구매하기, 장바구니 버튼 -->
			<tr height="150px">
				<td class="productInfo">
					<input type = "button" id="gotcha" value="구매하기" onclick="buy('<%=productDTO.getProductCode() %>','<%=log%>',productCount.value)">
					<input type = "button" class="specBtn"value="장바구니" onclick="basketPro(logCheck.value,productCount.value,'<%=productDTO.getProductCode()%>','<%=productDTO.getProductName()%>','<%=productDTO.getProductPrice()%>','<%=memberDTO.getMemId()%>','<%=memberDTO.getMemName()%>','<%=productDTO.getProductSimpleImgFileName()%>','<%=productDTO.getTictok()%>')">
				</td>
			</tr>
	         <!-- 버튼구역 -->
			<tr id="productDetailImg" >
				<td colspan="2">
					<div class="autoMove">
						<input type = "button" class="specBtn" value="상품 상세정보" onclick="location.href='#productDetailImg'">
						<input type = "button" class="specBtn" value="배송/교환/환불" onclick="location.href='#howDelivery'">
						<input type = "button"  class="specBtn"value="구매후기<%=count%>개" onclick="location.href='#reviewAvgScore'">
					</div>
				</td>
			</tr>
	         <!-- 상세 이미지 -->
			<tr>
				<td colspan="2">
					<img src="../WatTime/img/brand/<%=productDTO.getProductDetailImgFileName() %>" width="1100px" >
				</td>
			</tr>
			<!-- 이동 버튼 -->
			<tr id="howDelivery">
				<td colspan="2">
					<div class="autoMove">
						<input type = "button" class="specBtn" value="상품 상세정보" onclick="location.href='#productDetailImg'">
						<input type = "button" class="specBtn" value="배송/교환/환불" onclick="location.href='#howDelivery'">
						<input type = "button"  class="specBtn"value="구매후기<%=count%>개" onclick="location.href='#reviewAvgScore'">
					</div>
				</td>
			</tr>
	         <!-- 배송/교환/환불 -->
			<tr>
				<td colspan="2">
					<table  id="howService" style="background-color:#F2F2F2">
						<tbody>
							<tr>
								<th>배송</th>
								<td>
									<div class="delivery_txt">
										<ul>
											<li>10만원 이상 구매시 무료배송 , 10만원 미만 3000원 배송비 청구 (군부대 및 제주도는 추가 비용 발생)</li>
											<li>결제 확인후 2~4일 이내 (주말 , 공휴일 제외) 발송 , 단 제주도 와 신간도시지역 은 1~2일이 추가 소요 될 수 있습니다.</li>
											<li>또한 물량이 급증하는 명절의 경우 택배사의 사정에 의해 추가 지연이 발생할 수 있습니다.<br>운송장 확인은 출고일 오후 10시 이후부터 확인이 가능합니다.</li>
											<li>A/S 배송시 자체 결함이 아닌 수리의 배송비는 고객님 부담 입니다.</li>
										</ul>
									</div>
								</td>
							</tr>
							<tr>
								<th>교환/환불</th>
								<td>
									<div class="delivery_txt">
										<strong><font color="blue">이런 경우 교환&amp;환불 가능</font></strong>
										<ul>
											<li>수령한 상품의 사이즈가 맞지 않거나 디자인,색상 등이 마음에 들지않아 교환 또는 환불을 원하시는 경우 (왕복 배송비 6000원 또는 편도 배송비 3000원 고객부담)</li>
											<li>상품 수령후 사용 전 명백한 상품의 하자가 발견된 경우 (모든비용 업체부담)</li>
											<li>주문한 상품과 전혀 다른 상품이 잘못 배송된 경우 (모든비용 업체부담)</li>
										</ul>
										<strong><font color="red">이런경우 교환&amp;환불 불가능</font></strong>
										<ul>
											<li>제품 수령 후 7일을 초과한 경우</li>
											<li>포장이 훼손되어 상품의 가치가 상실된 경우 또는 초기하자를 발견 하였음에도 불구하고 상품을 훼손하거나 사용하여 상품가치를 하락 시킨 경우</li>
											<li>상품의 택을 제거하거나 임의로 상품을 수선하신 경우 상품을 착용 및 사용 하셨던 흔적이 있을 경우</li>
											<li>정확한 업무처리를 위해 맞교환(오배송, 불량 포함) 은 불가능 합니다.</li>
											<li>리퍼 상품(중고샵) 은 교환 및 환불이 불가능 합니다.</li>
										</ul>
									</div>
								</td>
							</tr>
							<tr>
								<th>A/S</th>
								<td>
									<div class="delivery_txt">
										<ul>
											<li>전 제품 자체결함 1년 무상 A/S 진행 , 단 무상 A/S기간에 무관하게 고객님의 부주의로 인한 파손은 유상 A/S 진행됩니다.</li>
											<li>기본적인 고장 또는 배터리 교체는 자체적인 기술로 해결이 가능하며 부속품이나 전문적인 수리의 경우 각 브랜드 본사의 정식 A/S 센터에서 진행</li> 
											<li>직수입 상품의 경우 자체 A/S 센터에서 수리를 진행</li>
											<li>외부 업체에서 배터리 교체 진행시 1년 무상보증 무력화 및 교환 반품은 불가합니다.</li>
											<li>수리시 증상에 따라 수리 기간의 차이가 있을수 있으며 A/S 접수시 담당자를 통해 기간을 전달 받으실수 있습니다.</li>
										</ul>
									</div>
								</td>
							</tr>
							<tr>
								<th>구매 전 주의사항</th>
								<td>
									<div class="delivery_txt">
										<ul>
											<li>주문확인의 경우 오후 2시 이전에 결제완료 된 주문건에 한에서 확인됩니다.</li>
											<li>주문 취소의 경우 결제확인 이후 상품준비중 상태의 경우에만 처리진행이 가능합니다.</li>
										</ul>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
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
			<tr id="reviewAvgScore">
				<td colspan="2">
					<div class="autoMove">
						<input type = "button" class="specBtn" value="상품 상세정보" onclick="location.href='#productDetailImg'">
						<input type = "button" class="specBtn" value="배송/교환/환불" onclick="location.href='#howDelivery'">
						<input type = "button"  class="specBtn"value="구매후기<%=count%>개" onclick="location.href='#reviewAvgScore'">
					</div>
				</td>
			</tr>
			<tr class="reviewAvgScore" >
				<td rowspan="6">
					<div>
						평균 평점: <%=Math.round(scoreAvg*100)/100.0 %>점
					</div>
				</td>
			</tr>
			<tr class="reviewScore">
				<td>
					1점 : <%=Math.round(score1) %>명
				</td>
			</tr>
			<tr class="reviewScore">
				<td>
					2점 : <%=Math.round(score2) %>명
				</td>
			</tr>
			<tr class="reviewScore">
				<td>
					3점 : <%=Math.round(score3) %>명
				</td>
			</tr>
			<tr class="reviewScore">
				<td>
					4점 : <%=Math.round(score4) %>명
				</td>
			</tr>
			<tr class="reviewScore">
				<td>
					5점 : <%=Math.round(score5) %>명
				</td>
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
					<input type="button"  class="specBtn" id="reviewRegistration" value="구매후기 등록" onclick="reviewCheck()">
				</td>
			</tr>	
			<tr>
				<td colspan="2" style="border-top:1px solid gray">구매후기 <%=count %>개</td>
			</tr>
			<!-- 정렬 -->
			<tr>
				<td colspan="2">
					<input type="button"  id="reviewLastestSort" class="specBtn" name="reviewLastestSort" value="최신순" onclick="reviewLastest('<%=productCode%>','<%=modify%>','<%=pageNum%>')">
					<input type="button" id="reviewScoreSort" class="specBtn" name="reviewScoreSort" value="별점순" onclick="scoreSort('<%=productCode%>','<%=modify%>','<%=pageNum%>')">
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
					<td colspan="2" class="reviewComent">			
						작성자 : <%=reviewDTO.getMemName()%>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						작성일 : <%=sf.format(reviewDTO.getReg_date())+"      "%><br>
<%					
						//session.getAttribute("member") != null 이게 없으면 널 포인트 에러 뜸(memberDTO.getMemId() 이게 null 이기 때문)
						if(session.getAttribute("member") != null && (memberDTO.getMemId().equals(reviewDTO.getMemId()) ||memberDTO.getMemAdmin() == 1)){
%>						
							
							<input type="button" id="modify"   name="modify" value="수정" onclick="reviewModifyForm('<%=reviewDTO.getNum()%>','<%=reviewDTO.getProductCode()%>','<%=sort%>','<%=pageNum%>')">
							<input type="button" id="delete"   name="delete" value="삭제" onclick="reviewDelete('<%=memberDTO.getMemId() %>','<%=reviewDTO.getNum() %>','<%=sort%>','<%=pageNum%>','<%=reviewDTO.getProductCode()%>')"><br>
<%
						}
%>						
						<pre id="productReview"><p>별점 : <font color="red"><%=star %></font></p><br><%=reviewDTO.getReviewContent() %></pre><br>
					</td>
				</tr>
<%
            	}else{
%>
					<tr>
						<td>
							<textarea name = "productReviewRe" id="productReviewRe" onkeyup="productReviewLengthRe()" cols="40" rows="8" autofocus><%=reviewDTO.getReviewContent() %></textarea><br>
							<span id = "productReviewLengthRe" >현재 문자 길이 0/200</span><br>
							<select name = "scoreRe" id= "scoreRe">
								<option value="5" checked>★★★★★</option>
								<option value="4">★★★★</option>
								<option value="3">★★★</option>
								<option value="2">★★</option>
								<option value="1">★</option>
							</select><br>
							<input type="button" id="modify" class="specBtn" value = "수정하기" onclick="reviewModify('<%=reviewDTO.getProductCode()%>','<%=reviewDTO.getNum()%>','<%=sort%>')">
							<input type="button" id="modifycencle" class="specBtn" value = "취소" onclick="productSpec('<%=reviewDTO.getProductCode() %>')">
						</td>
					</tr>
<%      
				}
			}
%>                      
   			</table>
	</form>
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
				<input type="button"  id="PageNum" name="back" value="이전" onclick="back('<%=startPage - 5%>','<%=modify%>','<%=productCode%>','<%=sort%>')">
<%      
			}
			for (int i = startPage ; i <= endPage ; i++) { 
				if(i==pageNum){
%>
					<input type="button" id="nowPageNum" name="nowPageNum" value="<%=i %>" onclick="pageNum(this.value,'<%=modify%>','<%=productCode%>','<%=sort%>')">
<%
				}else{
%>
					<input type="button" id="PageNum" name="pageNum" value="<%=i %>" onclick="pageNum(this.value,'<%=modify%>','<%=productCode%>','<%=sort%>')">
<%      
				}
			}
			if (endPage < pageCount) {
%>
				<input type="button" id="PageNum" name="back" value="다음" onclick="next('<%=startPage + 5%>','<%=modify%>','<%=productCode%>','<%=sort%>')">
<%
			}
		}
%>
	</div>
</body>
</html>