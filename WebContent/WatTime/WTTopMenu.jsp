<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href = "style.css" rel = "stylesheet" type = "text/css">
<script src="WTTop.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Insert title here</title>
</head>
<body>
	<div id="subTopBar">
		  <div id="brand" class="dropdownBtn">
		    <button id="brandDropBtn" class="dropBtn" onclick="allBrand()">BRAND</button>
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
		        <a href="#" onclick="brand(this.name, this.title)" title="" name="LUMINOX">루미녹스</a>
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
		        <a href="#" onclick="brand(this.name, this.title)" title="" name="GUCCI">구찌</a>
		        <a href="#" onclick="brand(this.name, this.title)" title="" name="Daniel Wellington">다니엘웰링턴</a>
		      </div>
		      
		    </div>
		  </div>
		
		  <div id="man" class="dropdownBtn">
		    <button id="manDropBtn" class="dropBtn" name="man" onclick="typeBrand(this.name)">MAN</button>
		    <div id="manMenu" class="dropdownContent" >
		      <div>
		        <a href="#">가이거</a>
		        <a href="#" onclick="brand(this.name, this.title)" title="man" name="Daniel Wellington">다니엘웰링턴</a>
		        <a href="#">디젤</a>
				<a href="#" onclick="brand(this.name, this.title)" title="" name="LUMINOX">루미녹스</a>
		        <a href="#">몬데인</a>
		      </div>
		      
		      <div>
		     	<a href="#">벨렌티노루디</a>
		        <a href="#">보일런던</a>
		        <a href="#">알렉산더크리스티</a>
		        <a href="#">오메가</a>
		        <a href="#">오베론</a>
		      </div>
		      
		      <div>
		     	<a href="#">태그호이어</a>
		        <a href="#">티쏘1</a>
		        <a href="#">포체 토트넘</a>
		        <a href="#">포테 밀라노</a>
		        <a href="#">헤밀턴</a>
		     </div>
		 
		    </div>
		  </div>
		
		  <div id="woman" class="dropdownBtn">
		    <button id="womanDropBtn" class="dropBtn" name="woman" onclick="typeBrand(this.name)">WOMAN</button>
		    <div id="womanMenu" class="dropdownContent">
		      <div>
		        <a href="#">DKNY</a>
		        <a href="#">TID2</a>
		        <a href="#">디즈니</a>
		        <a href="#" onclick="brand(this.name, this.title)" title="" name="LUMINOX">루미녹스</a>
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
		    <button id="coupleDropBtn" class="dropBtn" name="couple" onclick="typeBrand(this.name)">COUPLE</button>
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