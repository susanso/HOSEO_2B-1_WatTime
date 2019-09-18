<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*,java.text.*,java.util.* ,WatTimePack.*" %>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="reviewDTO" class = "WatTimePack.WatTimeReviewDTO" scope="page">
	<jsp:setProperty name="reviewDTO" property="*"/>
</jsp:useBean>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="WTReview/js/WTReview.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	String sort = request.getParameter("sort");
	String listCount = request.getParameter("listCount");
	
	int pageSize = Integer.parseInt(listCount);
	//URL에서 가져온 페이지 번호를 int 형으로 변환 시키고 넣음
	int currentPage = pageNum;
	//처음 초기 페이지 번호 (최대 페이지를 10으로 설정하면 1, 11, 21)
	int startRow = (currentPage - 1) * pageSize + 1;
	//끝 페이지 번호 (최대 페이지를 10으로 설정하면 10, 20, 30)
	int endRow = pageSize;
	//테이블에 조건에 맞는 행이 몇개인지 알아낼려는 변수
	int count = 0;
	//???
	int number = 0;
	
	WatTimeReviewDAO reviewDAO = new WatTimeReviewDAO();
	
	count = reviewDAO.getReviewAllCount();
	number = count-(currentPage-1)*pageSize;

	List<WatTimeReviewDTO> reviewList = null;
  	//getReviewAllList()메소드에 sort,startRow, pageSize넘겨 sql문 실행
    reviewList = reviewDAO.getReviewAllList(sort,startRow, pageSize);
%>
<body>
	<div id="productReview">
	<table border="1" id="productReviewTable">
		<tr>
			<td>
				<select onchange="reviewListCount(this.options[this.selectedIndex].value,'<%=sort%>')">
					<option value="" selected disabled required>선택</option>
					<option value="10">10개씩 보기</option>
					<option value="20">20개씩 보기</option>
					<option value="30">30개씩 보기</option>
				</select>	
			</td>
			<td colspan="2">
				<input type="button" id="reviewLastestSort" name="reviewLastestSort" value="최신순" onclick="reviewLastest('<%=pageNum%>','<%=listCount%>')">
				<input type="button" id="reviewScoreSort" name="reviewScoreSort" value="별점순" onclick="scoreSort('<%=pageNum%>','<%=listCount%>')">
			</td>
		</tr>
		
<%
		for(int i = 0 ; i < reviewList.size() ; i++){
			reviewDTO = reviewList.get(i);
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
%>
			<tr id = "<%=reviewDTO.getProductCode()%>"onclick="productSpecPage(this.id)">
				<td>
					<img src="..\img\brand\<%=reviewDTO.getProductSimpleImgFileName()%>" width="200px" height="200px">
				</td>
				<td>
					<%=reviewDTO.getProductName() %><br>
					<%=star %><br>
					<%=reviewDTO.getReviewContent() %>
				</td>
				<td>
					<%=reviewDTO.getMemName() %><br>
					<%=sf.format(reviewDTO.getReg_date()) %>
				</td>
			</tr>
<%
		}
%>
	</table>
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
		<input type="button" name="back" value="이전" onclick="back('<%=startPage - 5%>','<%=listCount%>','<%=sort%>')">
<%      
	}
    	for (int i = startPage ; i <= endPage ; i++) { 
    		if(i==pageNum){
%>
				<input type="button" name="pageNum" value="<%=i %>" onclick="pageNum(this.value,'<%=listCount %>','<%=sort%>')">
<%
			}else{
%>
    		<input type="button" name="pageNum" value="<%=i %>" onclick="pageNum(this.value,'<%=listCount %>','<%=sort%>')">
<%      
			}
    	}
       if (endPage < pageCount) {  %>
       	<input type="button" name="back" value="다음" onclick="next('<%=startPage + 5%>','<%=listCount %>','<%=sort%>')">
<%
        }
    }
%>
</div>
</body>
</html>