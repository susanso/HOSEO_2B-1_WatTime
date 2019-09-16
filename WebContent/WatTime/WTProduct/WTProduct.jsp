<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.text.*,java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*" %>
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
<script src="WTProduct/js/WTProduct.js"></script>
<title>WatTime</title>
</head>
<body>
	<ul>
<%
	DecimalFormat df = new DecimalFormat("#,###");
	String brand = request.getParameter("brandEng");
	String type = request.getParameter("type");
	String sort = request.getParameter("sort");
	int pageNum = Integer.parseInt(request.getParameter("pageNum"));

	//WatTimeProductDAO 연결
	WatTimeProductDAO productDAO = new WatTimeProductDAO();
	//초기 배열을 빈 배열로 선언
	List<WatTimeProductDTO> productList = null;
	
	//화면에 표시할 게시물 갯수
	int pageSize = 10;
	//URL에서 가져온 페이지 번호를 int 형으로 변환 시키고 넣음
	int currentPage = pageNum;
	int startRow = (currentPage - 1) * pageSize + 1;
	//처음 초기 페이지 번호 (최대 페이지를 10으로 설정하면 1, 11, 21)
    int brandstartRow = (currentPage - 1) * pageSize + 1;
	//끝 페이지 번호 (최대 페이지를 10으로 설정하면 10, 20, 30)
    int endRow = currentPage * pageSize;
	//테이블에 조건에 맞는 행이 몇개인지 알아낼려는 변수
    int count = 0;
	//???
    int number = 0;
	if(brand.equals("all")){
		count = productDAO.getProductAllCount();
		number = count-(currentPage-1)*pageSize;
	  	//getProductList()메소드에 brand, type, startRow, pageSize넘겨 sql문 실행
	    productList = productDAO.getProductAllList(startRow, pageSize, sort);
	}else if(brand.equals("") && (type.equals("man") || type.equals("woman")||type.equals("couple"))){
		count = productDAO.getProductTypeCount(type);
		number = count-(currentPage-1)*pageSize;
	  	//getProductList()메소드에 brand, type, startRow, pageSize넘겨 sql문 실행
	    productList = productDAO.getProductTypeList(type,startRow, pageSize, sort);
	}else{
		count = productDAO.getProductCount(brand, type);
	    number = count-(currentPage-1)*pageSize;
	  	//getProductList()메소드에 brand, type, startRow, pageSize넘겨 sql문 실행
	    productList = productDAO.getProductList(brand, type, startRow, pageSize, sort);
	}
    
    
    
    
    if(session.getAttribute("member")!=null){
    	memberDTO = (WatTimeMemberDTO)session.getAttribute("member");
    }else{
    	
    }
 %>
 	<input type="hidden" name="brandHidden" value="<%=brand %>">
 	<input type="hidden" name="typeHidden" value="<%=type %>">
 	<input type="hidden" name="sortHidden" value="<%=sort %>">
	<input type="button" id="hotProduct" name="hotProduct" value="인기상품순" onclick="sort(this.name,'<%=brand%>','<%=type%>')">
	<input type="button" id="highPrice" name="highPrice" value="높은가격순" onclick="sort(this.name,'<%=brand%>','<%=type%>')">
	<input type="button" id="rowPrice" name="rowPrice" value="낮은가격순" onclick="sort(this.name,'<%=brand%>','<%=type%>')">
	<input type="button" id="newProduct" name="newProduct" value="신상품순" onclick="sort(this.name,'<%=brand%>','<%=type%>')">
	
<%
	if(memberDTO.getMemAdmin()==1){
%>
	<input type="button" id="productAddButton" name="productAddButton" value="상품등록" onclick="productInsertForm()">
<%
	}else{}
	//productList에 넣은 것을 화면에 1개씩 출력
	for(int i = 0 ; i < productList.size() ; i++){
		productDTO = productList.get(i);
%>		
		<li class="productLi" id="<%=productDTO.getProductCode()%>" onclick="productSpec(this.id)">
			<div><img src="..\img\brand\<%=productDTO.getProductSimpleImgFileName() %>" width="200" height="250"></div>
			<div><%=productDTO.getProductName() %></div>
			<div><font color="#ccc" ><b><STRIKE><%=df.format(productDTO.getProductOriginalPrice()) %>원</b></STRIKE></font>&nbsp;&nbsp;&nbsp;<%=productDTO.getProductSale() %>%할인</div>
			<div><%=df.format(productDTO.getProductPrice()) %>원</div>
		</li>
<%
	}
	//테이블의 행이 0 초과일 경우
	if (count > 0) {
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		int startPage = 1 ;
		
		if(currentPage % 10 != 0){
			startPage = (int)(currentPage/10)*2 + 1;
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
			<input type="button" name="back" value="이전" onclick="back('<%=startPage - 10%>','<%=brand%>','<%=type%>','<%=sort%>')">
<%      
		}
        for (int i = startPage ; i <= endPage ; i++) {  
%>
        	<input type="button" name="pageNum" value="<%=i %>" onclick="pageNum(this.value,'<%=brand%>','<%=type%>','<%=sort%>')">
<%      
		}
        
        if (endPage < pageCount) {  %>
        	<input type="button" name="back" value="다음" onclick="next('<%=startPage + 10%>','<%=brand%>','<%=type%>','<%=sort%>')">
<%
        }
    }
%>
</ul>
</body>
</html>