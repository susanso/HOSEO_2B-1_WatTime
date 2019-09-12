<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*" %>
<jsp:useBean id="productDTO" class = "WatTimePack.WatTimeProductDTO" scope="page">
	<jsp:setProperty name="productDTO" property="*"/>
</jsp:useBean>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script language = "JavaScript" src = "js/WTSearch.js" charset="UTF-8"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WatTime</title>
</head>
<body>
<%
	String url = request.getRequestURL().toString();
	if(request.getQueryString() != null)
	url = url + "?"+request.getQueryString();
	//url의 전체 길이
	int urlLength = url.length();
	int urlIndex = url.indexOf("?pageNum=");

	String pageNum = url.substring(urlIndex+9,urlLength);
	String pageNextURL = url.substring(0,urlIndex+9);
	String searchText = request.getParameter("searchText");
	//텍스트 변환
	searchText = new String(searchText.getBytes("8859_1"), "utf-8");
	String sort = request.getParameter("sort");
	//WatTimeProductDAO 연결
	WatTimeProductDAO productDAO = new WatTimeProductDAO();
	//초기 배열을 빈 배열로 선언
	List<WatTimeProductDTO> productList = null;
	//화면에 표시할 게시물 갯수
	int pageSize = 12;
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
	
	count = productDAO.getSearchProductCount(searchText);
    number = count-(currentPage-1)*pageSize;
	
    //getSearchProductList()메소드에 unText, startRow, pageSize넘겨 sql문 실행
	productList = productDAO.getSearchProductList(searchText, startRow, pageSize, sort);
%>
	<%=searchText %>
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
			<input type="button" name="back" value="이전" onclick="back('<%=startPage - 5%>','<%=pageNextURL %>','<%=searchText%>','<%=sort%>')">
<%      
		}
        for (int i = startPage ; i <= endPage ; i++) {  
%>
        	<input type="button" name="pageNum" value="<%=i %>" onclick="pageNum(this.value,'<%=pageNextURL %>','<%=searchText%>','<%=sort%>')">
<%      
		}
        
        if (endPage < pageCount) {  %>
        	<input type="button" name="back" value="다음" onclick="next('<%=startPage + 5%>','<%=pageNextURL %>','<%=searchText%>','<%=sort%>')">
<%
        }
}
%>
</body>
</html>