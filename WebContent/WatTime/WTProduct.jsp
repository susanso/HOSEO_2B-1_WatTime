<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*" %>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="productDTO" class = "WatTimePack.WatTimeProductDTO" scope="page">
	<jsp:setProperty name="productDTO" property="*"/>
</jsp:useBean>
<jsp:useBean id="memberDTO" class = "WatTimePack.WatTimeMemberDTO" scope="page">
	<jsp:setProperty name="memberDTO" property="*"/>
</jsp:useBean>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language = "JavaScript" src = "script.js"></script>
<title>WatTime</title>
</head>
<body>
	<ul>
<%
	String url = request.getRequestURL().toString();
	//쿼리 문장이 있으면 "?"뒤에 쿼리 문장을 붙임
	if(request.getQueryString() != null)
		url = url +"?"+request.getQueryString();
	//url의 전체 길이
	int urlLength = url.length();
	int urlIndex = url.indexOf("brandEng");
	int urlIndex2 = url.indexOf("?type=");
	int urlIndex3 = url.indexOf("?pageNum=");
	int urlIndex4 = url.indexOf("?sort=");
	String brand = url.substring(urlIndex+9,urlIndex2);
	//URL에 ?type=뒤에 오는 메뉴의 종류 전체 브랜드, 남성, 여성, 커플의 title값을 넣음
	String type = url.substring(urlIndex2+6,urlIndex3);
	//URL 중복을 막기 위해 정렬 전의 URL을 넣음
	String nextURL = url.substring(0,urlIndex4);
	//URL 중복을 막기 위해 페이지 번호 전의 URL을 넣음
	String pageNextURL = url.substring(0,urlIndex3);
	//URL에 ?pageNum= 뒤에 페이지 숫자를 가져옴
	String pageNum = url.substring(urlIndex3+9,urlIndex4);
	String sort = url.substring(urlIndex4+6,urlLength);
	//WatTimeProductDAO 연결
	WatTimeProductDAO productDAO = new WatTimeProductDAO();
	//초기 배열을 빈 배열로 선언
	List<WatTimeProductDTO> productList = null;
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
	
    count = productDAO.getProductCount(brand, type);
    number = count-(currentPage-1)*pageSize;
    
    
    
    //getProductList()메소드에 brand, type, startRow, pageSize넘겨 sql문 실행
    productList = productDAO.getProductList(brand, type, startRow, pageSize, sortText);
    if(session.getAttribute("member")!=null){
    	memberDTO = (WatTimeMemberDTO)session.getAttribute("member");
    }else{
    	
    }
 %>
	<a href="<%=nextURL %>?sort=">인기상품순</a>
	<a href="<%=nextURL%>?sort=highPrice">높은가격순</a>
	<a href="<%=nextURL %>?sort=rowPrice">낮은가격순</a>
	<a href="<%=nextURL %>?sort=newProduct">신상품순</a>
	<%=memberDTO.getMemAdmin() %>
<%
	if(memberDTO.getMemAdmin()==1){
%>
	<input type="button" id="productAddButton" name="productAddButton" value="상품등록">
<%
	}else{}
	//productList에 넣은 것을 화면에 1개씩 출력
	for(int i = 0 ; i < productList.size() ; i++){
		productDTO = productList.get(i);
%>
		
		<li class="productLi">
			<div><img src="img/<%=productDTO.getProductCode() %>.jpg" name="<%=productDTO.getProductCode() %>" onclick="productSpec(this.name)"></div>
			<div><%=productDTO.getProductCode() %></div>
			<div><%=productDTO.getProductName() %></div>
			<div><%=productDTO.getProductPrice() %></div>
		</li>
<%
	}
	//테이블의 행이 0 초과일 경우
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
          <a href="<%=pageNextURL %>?pageNum=<%= startPage - 10 %>?sort=<%=sort%>">[이전]</a>
<%      
		}
        for (int i = startPage ; i <= endPage ; i++) {  
%>
        	<a href="<%=pageNextURL %>?pageNum=<%= i %>?sort=<%=sort%>">[<%= i %>]</a>
<%      
		}
        
        if (endPage < pageCount) {  %>
        	<a href="<%=pageNextURL %>?pageNum=<%= startPage + 10 %>?sort=<%=sort%>">[다음]</a>
<%
        }
    }
%>
</ul>
</body>
</html>