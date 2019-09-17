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
<jsp:useBean id="commentsDTO" class = "WatTimePack.WatTimeComunicationCommentsDTO" scope="page">
	<jsp:setProperty name="commentsDTO" property="*"/>
</jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script language = "JavaScript" src = "WTComunication/js/WTComunicationForm.js"></script>
<link href = "style.css" rel = "stylesheet" type = "text/css">
<title>Insert title here</title>
</head>
<%
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	int num = Integer.parseInt(request.getParameter("num"));
	int pageNum = Integer.parseInt(request.getParameter("formPageNum"));
	int listPageNum = Integer.parseInt(request.getParameter("listPageNum"));
	int listCount = Integer.parseInt(request.getParameter("listCount"));
	//댓글 수정 번호
	int modify = Integer.parseInt(request.getParameter("modify"));
	

	String log = "";
	if(session.getAttribute("member") != null){
		memberDTO = (WatTimeMemberDTO)session.getAttribute("member");
	}else{
		log = "no";
	}
	
	WatTimeComunicationDAO comunicationDAO = new WatTimeComunicationDAO();
	
	comunicationDTO = comunicationDAO.getComunicationForm(num);
%>
</head>
<body>
	<div id="comunicationForm">
		<table border="0">
			<tr >
				<td width="150px" style="text-align:center;">제목</td>
				<td colspan="6" style="text-align:center;"><%=comunicationDTO.getTitle() %></td>
			</tr>
			<tr>
				<td width="150px" style="text-align:center;">작성자</td>
				<td style="text-align:center;"><%=comunicationDTO.getMemName() %></td>
				<td width="150px" style="text-align:center;">작성일</td>
				<td colspan="1" style="text-align:center;"><%=comunicationDTO.getWriteDate() %></td>
				<td width="150px" style="text-align:center;">조회수</td>
				<td colspan="2" style="text-align:center;"><%=comunicationDTO.getReadCount() %></td>
			</tr>
			<tr>
				<td id="comunicationContent" colspan="7" height="500px" width="300px">
					<%=comunicationDTO.getContent()%>
				</td>
			</tr>
			<tr>
<%
				if(comunicationDTO.getPhoto1()!=null &&(comunicationDTO.getPhoto1().indexOf(".png")!=-1||comunicationDTO.getPhoto1().indexOf(".jpg")!=-1)){
%>
					<td colspan="6">
						사진<br>
						(사진을 클릭하면 원본 크기로 볼 수 있습니다.)
					</td>
					<td>
						<img src="..\img\comunication\<%=comunicationDTO.getPhoto1() %>" width="100" height="100"  onclick="fnImgPop(this.src)">
<%
				}
				if(comunicationDTO.getPhoto2()!=null &&(comunicationDTO.getPhoto2().indexOf(".png")!=-1||comunicationDTO.getPhoto2().indexOf(".jpg")!=-1)){
%>
						<img src="..\img\comunication\<%=comunicationDTO.getPhoto2() %>" width="100" height="100" onclick="fnImgPop(this.src)">
<%
				}
				if(comunicationDTO.getPhoto3()!=null &&(comunicationDTO.getPhoto3().indexOf(".png")!=-1||comunicationDTO.getPhoto3().indexOf(".jpg")!=-1)){
%>
						<img src="..\img\comunication\<%=comunicationDTO.getPhoto3() %>" width="100" height="100" onclick="fnImgPop(this.src)">
	<%
				}
				if(comunicationDTO.getPhoto4()!=null &&(comunicationDTO.getPhoto4().indexOf(".png")!=-1||comunicationDTO.getPhoto4().indexOf(".jpg")!=-1)){
	%>
						<img src="..\img\comunication\<%=comunicationDTO.getPhoto4() %>" width="100" height="100" onclick="fnImgPop(this.src)">
	<%
				}
				if(comunicationDTO.getPhoto5()!=null &&(comunicationDTO.getPhoto5().indexOf(".png")!=-1||comunicationDTO.getPhoto5().indexOf(".jpg")!=-1)){
	%>
						<img src="..\img\comunication\<%=comunicationDTO.getPhoto5() %>" width="100" height="100" onclick="fnImgPop(this.src)">
	<%
				}
	%>				
					</td>
			</tr>
			<tr>
				<td colspan="7">
	<%
					if(log!="no"&&memberDTO.getMemId().equals(comunicationDTO.getMemId())){
	%>					<!--  -->
						<input type="button" value="글수정" onclick="comunicationModifyForm('<%=num%>','<%=pageNum%>','<%=listPageNum%>','<%=listCount%>')">
						<input type="button" value="글삭제" onclick="comunicationDelete('<%=num%>','<%=pageNum%>','<%=listPageNum%>','<%=listCount%>')">
						
	<%
					}
					if(session.getAttribute("member") != null){
	%>
						<input type="button" value="답글" onclick="replyPage('<%=comunicationDTO.getNum()%>','<%=comunicationDTO.getRef() %>','<%=comunicationDTO.getRe_step()%>','<%=comunicationDTO.getRe_level()%>')">
	<%			
					}
	%>
					<input type="button" value="목록" onclick="listBack('<%=pageNum%>','<%=listCount%>')">
				</td>
			</tr>
			
	<%
			//댓글의 댓글 번호
			int commentNum = Integer.parseInt(request.getParameter("commentNum"));
			int ref = Integer.parseInt(request.getParameter("ref"));
			int re_step = Integer.parseInt(request.getParameter("re_step"));
			int re_level = Integer.parseInt(request.getParameter("re_level"));
			int pageSize = 10;
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
			int boardNum = num;
		    WatTimeComunicationCommentsDAO commentsDAO = new WatTimeComunicationCommentsDAO();
		    //해당 상품 구매후기 갯수 가져오기
		    count = commentsDAO.getCommentsCount(boardNum);
		    number = count-(currentPage-1)*pageSize;
		    
		    List<WatTimeComunicationCommentsDTO> commentsList = null;
		    
		    commentsList = commentsDAO.getCommentsList(boardNum, startRow, pageSize);
	%>
			<tr>
				<td colspan="7">
					댓글 : <%=count %>개
					<input type="button" name="recommend" value="추천   <%=comunicationDTO.getRecommend()%>" onclick="recommend('<%=log %>','<%=num%>','<%=pageNum%>','<%=listPageNum%>','<%=listCount%>')">
					<input type="button" name="unrecommend" value="비추천   <%=comunicationDTO.getUnrecommend()%>" onclick="unrecommend('<%=log %>','<%=num%>','<%=pageNum%>','<%=listPageNum%>','<%=listCount%>')">
				</td>
			</tr>
			<tr>
				<td colspan="6">
					<textarea name = "comment" id="comment" class="text1"></textarea><br>
				</td>
				<td>
					<input type="button" name="commentSubmit" value="등록" onclick="commentSubmit('<%=boardNum%>',comment.value,'<%=memberDTO.getMemId()%>','<%=memberDTO.getMemName()%>','<%=log%>','<%=ref%>','<%=re_step%>','<%=re_level%>','<%=commentNum%>','<%=listPageNum%>','<%=listCount%>','<%=commentNum%>','<%=pageNum%>')">
				</td>
			</tr>
	<%
		    for(int i = 0 ; i < commentsList.size() ; i++){
		    	commentsDTO = commentsList.get(i);
		    	//수정할 댓글 번호가 일치하지 않을 때 화면에 출력
				if(modify != commentsDTO.getNum()){
					int wid=0; 
					if(commentsDTO.getRe_level()>0){
					   wid=30*(commentsDTO.getRe_level());
	%>
					<tr>
					
						<td colspan="7" class="textarea" style="padding-left:<%=wid%>px;">
							<img src="img/comu/level.png" height="16">
			  				<img src="img/comu//re.png" class="reContentImg">
							<br>
							작성자 : <%=commentsDTO.getMemName()+"      "%>작성일 : <%=sf.format(commentsDTO.getWriteDate())+"      "%><br>
	<%						
							//session.getAttribute("member") != null 이게 없으면 널 포인트 에러 뜸(memberDTO.getMemId() 이게 null 이기 때문)
							if(session.getAttribute("member") != null && (memberDTO.getMemId().equals(commentsDTO.getMemId()) ||memberDTO.getMemAdmin() == 1)){
	%>						
								<input type="button" id="modify" name="modify" value="수정" onclick="commentModifyForm('<%=commentsDTO.getNum()%>','<%=commentsDTO.getRef()%>','<%=commentsDTO.getRe_step()%>','<%=commentsDTO.getRe_level()%>','<%=num%>','<%=pageNum%>','<%=listPageNum%>','<%=listCount%>')">
								<input type="button" id="delete" name="delete" value="삭제" onclick="commentDelete('<%=commentsDTO.getNum()%>','<%=comunicationDTO.getNum()%>','<%=pageNum%>','<%=listPageNum%>','<%=listCount%>')">
	<%
							}
							if(session.getAttribute("member") != null){
	%>						
								<input type="button" id="delete" name="delete" value="답글" onclick="replyComment('<%=commentsDTO.getNum()%>','<%=commentsDTO.getRef()%>','<%=commentsDTO.getRe_step()%>','<%=commentsDTO.getRe_level()%>','<%=num%>','<%=pageNum%>','<%=listPageNum%>','<%=listCount%>')">
	<%
							}
	%>
							<div>
								<pre class="commentPre"><%=commentsDTO.getComment() %></pre>
							</div>
							</td>
	<%
							if(commentNum==commentsDTO.getNum()){
							 	wid=30*(commentsDTO.getRe_level()+1);
	%>				
								<tr>
									<td colspan="6" style="padding-left:<%=wid%>px;">
										<img src="img/comu/level.png" height="16">
			  							<img src="img/comu//re.png" class="reContentImg">
										<textarea class="text1" name = "commentReply" id="commentReply"></textarea><br>
									</td>
									<td>
										<input type="button" name="commentSubmit" value="등록" onclick="commentSubmit('<%=boardNum%>',commentReply.value,'<%=memberDTO.getMemId()%>','<%=memberDTO.getMemName()%>','<%=log%>','<%=ref%>','<%=re_step%>','<%=re_level%>','<%=commentNum%>','<%=listPageNum%>','<%=listCount%>','<%=commentNum%>','<%=pageNum%>')">
									</td>
								</tr>
							
							</tr>
	
	<%
							}
					}else{
	%>
						<tr>
							<td colspan="7" class="textarea" style="padding-left:<%=wid%>px;">
								<br>
								작성자 : <%=commentsDTO.getMemName()+"      "%>작성일 : <%=sf.format(commentsDTO.getWriteDate())+"      "%><br>
	<%							
								//session.getAttribute("member") != null 이게 없으면 널 포인트 에러 뜸(memberDTO.getMemId() 이게 null 이기 때문)
								if(session.getAttribute("member") != null && (memberDTO.getMemId().equals(commentsDTO.getMemId()) ||memberDTO.getMemAdmin() == 1)){
	%>						
									<input type="button" id="modify" name="modify" value="수정" onclick="commentModifyForm('<%=commentsDTO.getNum()%>','<%=commentsDTO.getRef()%>','<%=commentsDTO.getRe_step()%>','<%=commentsDTO.getRe_level()%>','<%=num%>','<%=pageNum%>','<%=listPageNum%>','<%=listCount%>')">
									<input type="button" id="delete" name="delete" value="삭제" onclick="commentDelete('<%=commentsDTO.getNum()%>','<%=comunicationDTO.getNum()%>','<%=pageNum%>','<%=listPageNum%>','<%=listCount%>')">
	<%
								}
								if(session.getAttribute("member") != null){
	%>						
									<input type="button" id="delete" name="delete" value="답글" onclick="replyComment('<%=commentsDTO.getNum()%>','<%=commentsDTO.getRef()%>','<%=commentsDTO.getRe_step()%>','<%=commentsDTO.getRe_level()%>','<%=num%>','<%=pageNum%>','<%=listPageNum%>','<%=listCount%>')">
	<%
								}
	%>
							<div>
								<pre class="commentPre"><%=commentsDTO.getComment() %></pre>
							</div>
							</td>
						</tr>
	<%
						if(commentNum==commentsDTO.getNum()){
							 wid=20*(commentsDTO.getRe_level()+1);
	%>		
							<tr>
								<td rowspan="1" id="reComment" style="padding-left:<%=wid%>px;">
									<img src="img/comu/level.png"height="16">
			  						<img src="img/comu//re.png" class="reContentImg">
								</td>
								<td colspan="6">
									<textarea class="text1" name = "commentReply" id="commentReply"></textarea><br>
								</td>
								<td>
									<input type="button" name="commentSubmit" value="등록" onclick="commentSubmit('<%=boardNum%>',commentReply.value,'<%=memberDTO.getMemId()%>','<%=memberDTO.getMemName()%>','<%=log%>','<%=ref%>','<%=re_step%>','<%=re_level%>','<%=commentNum%>','<%=listPageNum%>','<%=listCount%>','<%=commentNum%>','<%=pageNum%>')">
								</td>
							</tr>
		<%				}
					}
				//수정할 댓글 번호가 일치 할 때 수정 폼이 나옴
				}else{
					if(commentsDTO.getRe_level()>0){
						int wid=0; 
					 	wid=20*(commentsDTO.getRe_level());
	
	%>
					<tr>
						<td colspan="6" style="padding-left:<%=wid%>px;">
							<img src="img/comu/level.png" height="16">
			  				<img src="img/comu//re.png" class="reContentImg">
							<textarea class="textarea" name = "commentModify" id="commentModify"><%=commentsDTO.getComment() %></textarea>	
						</td>
						<td>
							<input type="button" id="modify" value = "수정하기" onclick="commentModify('<%=commentsDTO.getNum()%>','<%=num%>','<%=pageNum%>','<%=listPageNum%>','<%=listCount%>')"><br>
							<input type="button" id="modifycencle" value = "취소" onclick="commentModifyCencle('<%=num%>','<%=pageNum%>','<%=listPageNum%>','<%=listCount%>')">
						</td>
					</tr>
	<%				
					}else{
	%>					
					<tr>
						<td colspan="6">
							<textarea class="text1" name = "commentModify" id="commentModify"><%=commentsDTO.getComment() %></textarea>	
						</td>
						<td>
							<input type="button" id="modify" value = "수정하기" onclick="commentModify('<%=commentsDTO.getNum()%>','<%=num%>','<%=pageNum%>','<%=listPageNum%>','<%=listCount%>')"><br>
							<input type="button" id="modifycencle" value = "취소" onclick="commentModifyCencle('<%=num%>','<%=pageNum%>','<%=listPageNum%>','<%=listCount%>')">
						</td>
					</tr>
	<%				}
				}
		    }
	%>
		</table>
	
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
			<input type="button" name="back" value="이전" onclick="back('<%=startPage - 10%>','<%=listCount%>','<%=num%>','<%=listPageNum%>')">
<%      

	}
    	for (int i = startPage ; i <= endPage ; i++) { 
    		if(pageNum==i){
%>
				<input type="button" name="nowPageNum" id="nowPageNum" value="<%=i %>" onclick="pageNum(this.value,'<%=listCount%>','<%=num%>','<%=listPageNum%>')">
<%
			}else{
%>
    			<input type="button" name="pageNum" id="pageNum" value="<%=i %>" onclick="pageNum(this.value,'<%=listCount%>','<%=num%>','<%=listPageNum%>')">
<%      
			}
    	}
       if (endPage < pageCount) {  %>
       		<input type="button" name="back" value="다음" onclick="next('<%=startPage + 10%>','<%=listCount%>','<%=num%>','<%=listPageNum%>')">
<%
        }
    }
%>

</div>
<script type="text/javascript">

 function fnImgPop(url){
  var img=new Image();
  img.src=url;
  var img_width=img.width;
  var win_width=img.width+25;
  var img_height=img.height;
  var win=img.height+30;
  var OpenWindow=window.open('','_blank', 'width='+img_width+', height='+img_height+', menubars=no, scrollbars=auto');
  OpenWindow.document.write("<style>body{margin:0px;}</style><img src='"+url+"' width='"+win_width+"'>");
 }

</script>