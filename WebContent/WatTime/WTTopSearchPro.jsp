<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*" %>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="productDTO" class = "WatTimePack.WatTimeProductDTO" scope="page">
	<jsp:setProperty name="productDTO" property="*"/>
</jsp:useBean>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="script.js"></script>
<script>
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>WatTime</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String url = request.getRequestURL().toString();
	if(request.getQueryString() != null)
	url = url + "?"+request.getQueryString();
	//url의 전체 길이
	int urlLength = url.length();
	//?text=표시의 위치를 찾음
	int urlIndex = url.indexOf("?text=");
	//?pageNum=표시의 위치를 찾는다
	int urlIndex2 = url.indexOf("?pageNum=");
	//?sort= 위치를 찾음
	int urlIndex3 = url.indexOf("?sort=");
	//?text=부터 ?pageNum=사이에 오는 텍스트 자르기
	String searchText = url.substring(urlIndex+6,urlIndex2);
	//?pageNum= 부터 ?sort= 사이에 오는 텍스트 자르기
	String pageNum = url.substring(urlIndex2+9,urlIndex3);
	//?sort=뒤에 오는 텍스트 자르기
	String sort = url.substring(urlIndex3+6,urlLength);
	//URL 중복을 막기 위해 정렬 전의 URL을 넣음
	String sortPageURL = url.substring(0,urlIndex3);
	//URL 중복을 막기 위해 페이지 번호 전의 URL을 넣음
	String pageNextURL = url.substring(0,urlIndex2);
	//언코드 시킨 텍스트
	String unText = java.net.URLDecoder.decode(searchText);
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
	
	count = productDAO.getSearchProductCount(unText);
    number = count-(currentPage-1)*pageSize;
	String sortText = "";
	
	if(sort.equals("") || sort.equals(null)){
		sortText = "productOrder DESC";
    }else if(sort.equals("highPrice")){
    	sortText = "productPrice DESC";
    }else if(sort.equals("rowPrice")){
    	sortText = "productPrice ASC";
    }else if(sort.equals("newProduct")){
    	sortText = "productAddDate DESC";
    }
    //getSearchProductList()메소드에 unText, startRow, pageSize넘겨 sql문 실행
	productList = productDAO.getSearchProductList(unText, startRow, pageSize, sortText);
%>
	<a href="<%=sortPageURL %>?sort=">인기상품순</a>
	<a href="<%=sortPageURL%>?sort=highPrice">높은가격순</a>
	<a href="<%=sortPageURL %>?sort=rowPrice">낮은가격순</a>
	<a href="<%=sortPageURL %>?sort=newProduct">신상품순</a>

<%
	for(int i = 0 ; i < productList.size() ; i++){
		productDTO = productList.get(i);
%>
	<ul>
	<li class="productLi">
		<div><img src="img/<%=productDTO.getProductCode() %>.jpg" name="<%=productDTO.getProductCode() %>" onclick="test(this.name)"></div>
		<div><%=productDTO.getProductPrice() %></div>
	</li>
	</ul>
<%
	}
	//테이블의 행이 0 초과일 경우
	if (count > 0) {
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = 1 ;
		
		if(currentPage % 10 != 0)
			startPage = (int)(currentPage/10)*10 + 1;
		else
			startPage = ((int)(currentPage/10)-1)*10 + 1;
		int pageBlock = 10;
		int endPage = startPage + pageBlock - 1;
		if (endPage > pageCount) endPage = pageCount;
        
        if (startPage > 10) { %>
          <a href="<%=pageNextURL %>?pageNum=<%= startPage - 10 %>?sort=<%=sort%>">[이전]</a>
<%      }
        
        for (int i = startPage ; i <= endPage ; i++) {  %>
        	<a href="<%=pageNextURL %>?pageNum=<%= i %>?sort=<%=sort%>">[<%= i %>]</a>
<%      }
        
        if (endPage < pageCount) {  %>
        	<a href="<%=pageNextURL %>?pageNum=<%= startPage + 10 %>?sort=<%=sort%>">[다음]</a>
<%
        }
    }
%>
</body>
</html>