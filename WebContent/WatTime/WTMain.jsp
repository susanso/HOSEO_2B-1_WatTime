<%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href = "style.css	" rel = "stylesheet" type = "text/css">
<script src="WTBuy/js/WTBuyForm.js"></script>
<title>WatTime</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>
<body id="modal">
<%
	//컨텐트 부분에 바뀔 jsp을 넣는 변수
       String content = request.getParameter("pageChange");
		//메인 초기
       if (content == null) {
			content = "WTContent.jsp";
       }
	String top="WTTop.jsp";
	String bottom="WTBottom.jsp";
%>
	<div class="mainTopFixed">
		<jsp:include page="<%=top%>" flush="false"/>
	</div>
	<div>
		<jsp:include page="<%=content%>" flush="false"/>
		<jsp:include page="<%=bottom%>" flush="false"/>
	</div>
	<div class="autoPageMove">
		<div class="pageTopBtn" >
			<a href="#"><img src="img/top.png" alt="top" width="60px" height="60px" ></a>
		</div>
		<div class="pageBottomBtn">
			<a href="#mainBottom"><img src="img/bottom.png" alt="bottom" width="60px" height="60px" ></a>
		</div>
		<div class="pageHomeBtn" >
			<a href="WTMain.jsp"><img src="img/home.png" alt="home" width="60px" height="60px" ></a>
		</div>
	</div>
	<!-- 챗봇 -->
	<div>
		<jsp:include page="chatbot.jsp" flush="false"/>
	</div>
	
	
	<script> 
       $( document ).ready( function() {
         var jbOffset = $( '.subTopBarBody' ).offset();
         $( window ).scroll( function() {
           if ( $( document ).scrollTop() > jbOffset.top ) {
             $( '.subTopBarBody' ).addClass( 'jbFixed' );

             
           }
           else {
             $( '.subTopBarBody' ).removeClass( 'jbFixed' );

           }
         });
       } );
 </script>



</body>

</html>