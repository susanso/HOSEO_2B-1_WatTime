<%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*,java.util.* , WatTimePack.*" %>
<jsp:useBean id="memMgr" class = "WatTimePack.MemberMgr" scope="page"></jsp:useBean>  
<!DOCTYPE html>
<html>
<head>
<link href = "style.css" rel = "stylesheet" type = "text/css">
<script src="script.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	RegisterBean member = (RegisterBean)session.getAttribute("member");
%>
<body>
	<div id="top">
			<div class="topContent">
				<ul id="topMenu">
					<li><%=member.getMemName() %>님 </li>
					<li><a href="../WatTime/WTLogout.jsp">로그아웃</a> </li>
					<li><a href="WTMain.jsp?pageChange=WTMyPage.jsp">마이페이지</a></li>
					<li>구매후기</li>
					<li>장바구니</li>
					<li>고객센터</li>
				</ul>
			</div>
			
			<div class="topContent">
				<img id="Logo" alt="Logo" src="img/MainLogo.png"  width="auto" height="165px" onclick="mainBack()" >
			</div>
			
			<div class="topContent" >
				<div id="searchMenu">
					<form class="search" action="가야하는.php" style="margin:auto;max-width:300px">
					   <input type="text"  name="search2">
					   <button type="submit"><i class="fa fa-search"></i></button>
					</form>
				</div>
			</div>
		</div>
		
		<div id="subTopBar">
		  <div id="brand" class="dropdownBtn">
		    <button id="brandDropBtn" class="dropBtn">BRAND</button>
		    <div id="brandMenu" class="dropdownContent">
		      <div>
		        <a href="#">보이던런</a>
		        <a href="#">포체 밀라노</a>
		        <a href="#">보우드</a>
		        <a href="#">헤밀턴</a>
		        <a href="#">오베론</a>
		      </div>
		      
		      <div>
		        <a href="#">게스</a>
		          <a href="#">몽블랑</a>
		        <a href="#">카시오</a>
		        <a href="#">몬데인</a>
		        <a href="#">쥴리어스</a>
		      </div>
		      
		      <div>
		        <a href="#">알렉산더</a>
		        <a href="#">디즈니</a>
		        <a href="#">태그호이어</a>
		        <a href="#">가이거</a>
		        <a href="#">발렌티노루디</a>
		      </div>
		      
		      <div>
		        <a href="#">DKNY</a>
		        <a href="#">마크제이콥스</a>
		        <a href="#">샤넬</a>
		        <a href="#">티쏘</a>
		        <a href="#">루미녹스</a>
		      </div>
		      
		      <div>
		        <a href="#">디젤</a>
		        <a href="#">폴브리알</a>
		        <a href="#">캉골</a>
		        <a href="#">라코스테</a>
		        <a href="#">포테체</a>
		      </div>
		      
		      <div>
		        <a href="#">오리스</a>
		        <a href="#">스페라</a>
		        <a href="#">오메가</a>
		        <a href="#">구찌</a>
		        <a href="#">다니엘웰링턴</a>
		      </div>
		      
		    </div>
		  </div>
		
		  <div id="man" class="dropdownBtn">
		    <button id="manDropBtn" class="dropBtn">MAN</button>
		    <div id="manMenu" class="dropdownContent" >
		      <div>
		        <a href="#">가이거</a>
		        <a href="#">다니엘웰린턴</a>
		        <a href="#">디젤</a>
		        <a href="#">몬데인</a>
		        <a href="#">벨렌티노루디</a>
		      </div>
		      
		      <div>
		        <a href="#">보일런던</a>
		        <a href="#">알렉산더크리스티</a>
		        <a href="#">오메가</a>
		        <a href="#">오베론</a>
		        <a href="#">태그호이어</a>
		      </div>
		      
		      <div>
		        <a href="#">티쏘1</a>
		        <a href="#">포체 토트넘</a>
		        <a href="#">포테 밀라노</a>
		        <a href="#">헤밀턴</a>
		     </div>
		 
		    </div>
		  </div>
		
		  <div id="woman" class="dropdownBtn">
		    <button id="womanDropBtn" class="dropBtn">WOMAN</button>
		    <div id="womanMenu" class="dropdownContent">
		      <div>
		        <a href="#">DKNY</a>
		        <a href="#">TID2</a>
		        <a href="#">디즈니</a>
		        <a href="#">루미녹스</a>
		        <a href="#">몽블랑</a>
		      </div>
		      
		      <div>
		        <a href="#">보우드</a>
		        <a href="#">샤넬</a>
		        <a href="#">스페라</a>
		        <a href="#">쥴리어스</a>
		        <a href="#">폴브리알</a>
		      </div>
		      
		      
		    </div>
		  </div>
		
		  <div id="couple" class="dropdownBtn">
		    <button id="coupleDropBtn" class="dropBtn" >COUPLE</button>
		    <div id="coupleMenu" class="dropdownContent" >
		      <div>
		        <a href="#">게스</a>
		        <a href="#">구찌</a>
		        <a href="#">라코스테</a>
		        <a href="#">오리스</a>
		        <a href="#">카시오</a>
		      </div>
		      
		      <div>
		        <a href="#">캉골</a>
		      
		      </div>
		    </div>
		  </div>
	</div>
</body>
</html>