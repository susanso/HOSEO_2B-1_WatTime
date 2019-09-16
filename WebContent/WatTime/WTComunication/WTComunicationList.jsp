<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*,java.text.*" %>
<%@ page import = "java.sql.Timestamp" %>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="comunicationDTO" class = "WatTimePack.WatTimeComunicationDTO" scope="page">
	<jsp:setProperty name="comunicationDTO" property="*"/>
</jsp:useBean>
<jsp:useBean id="memberDTO" class = "WatTimePack.WatTimeMemberDTO" scope="page">
	<jsp:setProperty name="memberDTO" property="*"/>
</jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="WTComunication/js/WTComunicationList.js"></script>
<title>Insert title here</title>
</head>
<body>
<%
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	int listCount = Integer.parseInt(request.getParameter("listCount"));
	
	if(session.getAttribute("member") != null){
		memberDTO = (WatTimeMemberDTO)session.getAttribute("member");
	}
	
	List<WatTimeComunicationDTO> comunicationList = null;
	WatTimeComunicationDAO comunicationDAO = new WatTimeComunicationDAO();
	
	int pageSize = listCount;
	int currentPage = pageNum;
	int startRow = (currentPage - 1) * pageSize + 1;
    int brandstartRow = (currentPage - 1) * pageSize + 1;
    int endRow = pageSize;
    int count = 0;
    int number = 0;
	
    count = comunicationDAO.getComunicationListCount();
    number = count-(currentPage-1)*pageSize;
	if(count==0){
%>
		게시글이 없습니다.
		<input type="button" id="firstComunication" value="첫글쓰기" onclick="comunicationWriteForm()">
<%
  	}else{	
%>
		<select onchange="comunicationListCount(this.options[this.selectedIndex].value,'<%=pageNum%>')">
			<option value="" selected disabled required>선택</option>
			<option value="10">10개씩 보기</option>
			<option value="20">20개씩 보기</option>
			<option value="30">30개씩 보기</option>
		</select>
		<table border="1">
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
<%
			comunicationList = comunicationDAO.getComunicationRecommendationList();
			for (int i = 0 ; i < comunicationList.size() ; i++) {
			    comunicationDTO = comunicationList.get(i);
%>
				<tr onclick="comunicationForm('<%=comunicationDTO.getNum() %>','<%=comunicationDTO.getMemId()%>','<%=pageNum%>','<%=listCount%>')">
					
						<td><strong>추천</strong></td>
						<!-- 게시글 제목 -->
						<td>
			  				<strong><%=comunicationDTO.getTitle() %></strong>
		  				</td>
		  				<!-- 게시글 작성자 -->
						<td>
							<strong><%=comunicationDTO.getMemName() %></strong>
						</td>
						<!-- 게시글 작성일 -->
						<td>
							<strong><%=sf.format(comunicationDTO.getWriteDate()) %></strong>
						</td>
				</tr>
<%
			}
%>
<%
			comunicationList = comunicationDAO.getComunicationList(startRow, pageSize);
			for (int i = 0 ; i < comunicationList.size() ; i++) {
			    comunicationDTO = comunicationList.get(i);
%>
			<tr onclick="comunicationForm('<%=comunicationDTO.getNum() %>','<%=comunicationDTO.getMemId()%>','<%=pageNum%>','<%=listCount%>')">
				<!-- 게시글 번호 -->
				<td>
					<%=comunicationDTO.getNum() %>
				</td>
<%
				int wid=0; 
				if(comunicationDTO.getRe_level()>0){
				   wid=5*(comunicationDTO.getRe_level());
%>
					<!-- 게시글 제목 -->
					<td>
						<img src="img/comu/level.png" width="<%=wid%>" height="16">
		  				<img src="img/comu//re.png">
		  				<%=comunicationDTO.getTitle() %>
	  				</td>
<%
				}else{
%>
					<!-- 게시글 제목 -->
					<td>
		  				<%=comunicationDTO.getTitle() %>
	  				</td>
<%
				}
%>
				<!-- 게시글 작성자 -->
				<td>
					<%=comunicationDTO.getMemName() %>
				</td>
				<!-- 게시글 작성일 -->
				<td>
					<%=sf.format(comunicationDTO.getWriteDate()) %>
				</td>
			</tr>
<%			
			}//--for 
%>
		<tr>
<%
			if(memberDTO.getMemId()!=null){
%>
				<td colspan="4">
					<input type="button" name="newComunication" value="글쓰기" onclick="comunicationWriteForm()">
				</td>
<%
			}
%>
		</tr>
	</table>
<%
	}//--count !=0 else 

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
			<input type="button" name="back" value="이전" onclick="back('<%=startPage - 10%>','<%=listCount%>')">
<%      
	}
    	for (int i = startPage ; i <= endPage ; i++) {  
%>
    		<input type="button" name="pageNum" value="<%=i %>" onclick="pageNum(this.value,'<%=listCount %>')">
<%      
	}
    
       if (endPage < pageCount) {  %>
       		<input type="button" name="back" value="다음" onclick="next('<%=startPage + 10%>','<%=listCount %>')">
<%
        }
    }
%>
	<br>
	<select id="select">
		<option value="title">제목</option>
		<option value="titleContent">제목+내용</option>
		<option value="content">내용</option>
		<option value="memName">작성자</option>
	</select>
	<input type="text" id="comunicatoinSearchText" name="comunicatoinSearchText" onkeydown="textValue(this.value)" onkeyup="textValue(this.value)">
	<input type="button" id="searchButton" name="searchButton" value="검색" onclick="search()">
</body>
</html>