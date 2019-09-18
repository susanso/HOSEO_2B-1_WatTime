<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*" %>
<jsp:useBean id="productDTO" class = "WatTimePack.WatTimeProductDTO" scope="page">
	<jsp:setProperty name="productDTO" property="*"/>
</jsp:useBean>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script language = "JavaScript" src = "WTSearch/js/WTSearch.js" charset="UTF-8"></script>
<link href = "style.css" rel = "stylesheet" type = "text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WatTime</title>
</head>
<body>
<%
	//WTTopSearchForm에서 보낸 pageNum을 requst
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	//WTTopSearchForm에서 보낸 searchText을 requst
	String searchText = request.getParameter("searchText");
	//한글 깨짐 문제로 텍스트 변환
	searchText = new String(searchText.getBytes("8859_1"), "utf-8");
	//WTTopSearchForm에서 보낸 sort을 requst
	String sort = request.getParameter("sort");
	//productDAO 생성
	WatTimeProductDAO productDAO = new WatTimeProductDAO();
	//productList 배열 생성
	List<WatTimeProductDTO> productList = null;
	//화면에 표시할 갯수
	int pageSize = 12;
	//페이지 그룹 표시 번호
	int currentPage = pageNum;
	//테이블 시작 행
	int startRow = (currentPage - 1) * pageSize + 1;
	//몇개 불러올지 정하는 행
	int endRow = pageSize;
	int count = 0;
	int number = 0;
	
	count = productDAO.getSearchProductCount(searchText);
    number = count-(currentPage-1)*pageSize;
	
    //getSearchProductList()메소드에 unText, startRow, pageSize넘겨 sql문 실행
	productList = productDAO.getSearchProductList(searchText, startRow, pageSize, sort);
%>
	<input type="button" id="hotProduct" name="hotProduct" value="인기상품순" onclick="sort(this.name,'<%=searchText%>','<%=pageNum%>')">
	<input type="button" id="highPrice" name="highPrice" value="높은가격순" onclick="sort(this.name,'<%=searchText%>','<%=pageNum%>')">
	<input type="button" id="rowPrice" name="rowPrice" value="낮은가격순" onclick="sort(this.name,'<%=searchText%>','<%=pageNum%>')">
	<input type="button" id="newProduct" name="newProduct" value="신상품순" onclick="sort(this.name,'<%=searchText%>','<%=pageNum%>')">
	<ul>
<%
		for(int i = 0 ; i < productList.size() ; i++){
			productDTO = productList.get(i);
%>
			<li class="productLi" id="<%=productDTO.getProductCode()%>" onclick="productSpec(this.id)">
				<div><img src="..\img\brand\<%=productDTO.getProductSimpleImgFileName() %>" ></div>
				<div><%=productDTO.getProductName() %></div>
				<div><font color="#ccc" ><b><STRIKE><%=productDTO.getProductOriginalPrice() %>원</b></STRIKE></font>&nbsp;&nbsp;&nbsp;<%=productDTO.getProductSale() %>%할인</div>
				<div><%=productDTO.getProductPrice() %>원</div>
			</li>
<%
	}
%>
	</ul>
<%
//테이블의 행이 0 초과일 경우
if (count > 0) {
	int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
	int startPage = 1 ;
	
	if(currentPage % 5 != 0){
		startPage = (int)(currentPage/5)*2 + 1;
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
			<input type="button" name="back" value="이전" onclick="back('<%=startPage - 5%>','<%=searchText%>','<%=sort%>')">
<%      
		}
	for (int i = startPage ; i <= endPage ; i++) { 
		if(i==pageNum){
%>
			<input type="button" name="nowPageNum" value="<%=i %>" onclick="pageNum(this.value,'<%=searchText%>','<%=sort%>')">
<%
		}else{
%>
			<input type="button" name="pageNum" value="<%=i %>" onclick="pageNum(this.value,'<%=searchText%>','<%=sort%>')">
<%      
		}
	}
        
        if (endPage < pageCount) {  %>
        	<input type="button" name="back" value="다음" onclick="next('<%=startPage + 5%>','<%=searchText%>','<%=sort%>')">
<%
        }
}
%>
</body>
</html>