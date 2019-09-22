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
<div class="subTopBarBody">
	<div id="subTopBar">
		  <div id="brand" class="dropdownBtn">
		    <button id="brandDropBtn" class="dropBtn" onclick="allBrand()">BRAND</button>
		    <div id="brandMenu" class="dropdownContent">
		      <div>
				<a href="#" onclick="brand(this.name, this.title)" title="" name="GEIGER">가이거</a>
				<a href="#" onclick="brand(this.name, this.title)" title="" name="GUESS">게스</a>
				<a href="#" onclick="brand(this.name, this.title)" title="" name="GUCCI">구찌</a>
				<a href="#" onclick="brand(this.name, this.title)" title="" name="Daniel Wellington">다니엘 웰링턴</a>
				<a href="#" onclick="brand(this.name, this.title)" title="" name="DKNY">도나캐런뉴욕</a>
		      </div>
		      <div>
				<a href="#" onclick="brand(this.name, this.title)" title="" name="DIESEL">디젤</a>
				<a href="#" onclick="brand(this.name, this.title)" title="" name="DISNEY">디즈니</a>
				<a href="#" onclick="brand(this.name, this.title)" title="" name="LACOSTE">라코스테</a>
				<a href="#" onclick="brand(this.name, this.title)" title="" name="LUMINOX">루미녹스</a>
				<a href="#" onclick="brand(this.name, this.title)" title="" name="MONDAINE">몬데인</a>
		      </div>
		      <div>
				<a href="#" onclick="brand(this.name, this.title)" title="" name="MONTBLANC">몽블랑</a>
				<a href="#" onclick="brand(this.name, this.title)" title="" name="VALENTINO RUDY">발랜티노루디</a>
				<a href="#" onclick="brand(this.name, this.title)" title="" name="VOWOOD">보우드</a>
				<a href="#" onclick="brand(this.name, this.title)" title="" name="BOYLONDON">보이런던</a>
				<a href="#" onclick="brand(this.name, this.title)" title="" name="CHANEL">샤넬</a>
		      </div>
		      <div>
		      	<a href="#" onclick="brand(this.name, this.title)" title="" name="SPERA">스페라</a>
				<a href="#" onclick="brand(this.name, this.title)" title="" name="Alexandre Christie">알렉산더 크리스티</a>
				<a href="#" onclick="brand(this.name, this.title)" title="" name="ORIS">오리스</a>
				<a href="#" onclick="brand(this.name, this.title)" title="" name="OMEGA">오메가</a>
				<a href="#" onclick="brand(this.name, this.title)" title="" name="OBERON">오베론</a>
		      </div>
		      <div>
		      	<a href="#" onclick="brand(this.name, this.title)" title="" name="JULIUS">쥴리어스</a>
				<a href="#" onclick="brand(this.name, this.title)" title="" name="CASIO">카시오</a>
				<a href="#" onclick="brand(this.name, this.title)" title="" name="KANGOL">캉골</a>
				<a href="#" onclick="brand(this.name, this.title)" title="" name="TAG HEUER">태그호이어</a>
				<a href="#" onclick="brand(this.name, this.title)" title="" name="TISSOT">티쏘</a>
		      </div>
		      <div>
				<a href="#" onclick="brand(this.name, this.title)" title="" name="TID">티아이디</a>
				<a href="#" onclick="brand(this.name, this.title)" title="" name="FOCE">포체</a>
				<a href="#" onclick="brand(this.name, this.title)" title="" name="PAULBRIAL">폴브리알</a>
				<a href="#" onclick="brand(this.name, this.title)" title="" name="HAMILTON">해밀턴</a>
		      </div>
		    </div>
		  </div>
		
		  <div id="man" class="dropdownBtn">
		    <button id="manDropBtn" class="dropBtn" name="man" onclick="typeBrand(this.name)">MAN</button>
		    <div id="manMenu" class="dropdownContent" >
		      <div>
		        <a href="#" onclick="brand(this.name, this.title)" title="man" name="GEIGER">가이거</a>
		        <a href="#" onclick="brand(this.name, this.title)" title="man" name="GUESS">게스</a>
		        <a href="#" onclick="brand(this.name, this.title)" title="man" name="GUCCI">구찌</a>
		        <a href="#" onclick="brand(this.name, this.title)" title="man" name="Daniel Wellington">다니엘웰링턴</a>
		        <a href="#" onclick="brand(this.name, this.title)" title="man" name="DKNY">도나캐런뉴욕</a>
		      </div>
		      
		      <div>
		     	<a href="#" onclick="brand(this.name, this.title)" title="man" name="DIESEL">디젤</a>
		        <a href="#" onclick="brand(this.name, this.title)" title="man" name="DISNEY">디즈니</a>
		        <a href="#" onclick="brand(this.name, this.title)" title="man" name="LACOSTE">라코스테</a>
		        <a href="#" onclick="brand(this.name, this.title)" title="man" name="LUMINOX">루미녹스</a>
		        <a href="#" onclick="brand(this.name, this.title)" title="man" name="MONTBLANC">몽블랑</a>
		      </div>
		      
		      <div>
		        <a href="#" onclick="brand(this.name, this.title)" title="man" name="VALENTINO RUDY">발렌티노루디</a>
		        <a href="#" onclick="brand(this.name, this.title)" title="man" name="VOWOOD">보우드</a>
		        <a href="#" onclick="brand(this.name, this.title)" title="man" name="BOYLONDON">보이런던</a>
		        <a href="#" onclick="brand(this.name, this.title)" title="man" name="CHANEL">샤넬</a>
		        <a href="#" onclick="brand(this.name, this.title)" title="man" name="SPERA">스페라</a>
		     </div>
		 	 <div>
		 	 	<a href="#" onclick="brand(this.name, this.title)" title="man" name="Alexandre Christie">알렉산더크리스티</a>
		        <a href="#" onclick="brand(this.name, this.title)" title="man" name="ORIS">오리스</a>
		        <a href="#" onclick="brand(this.name, this.title)" title="man" name="OMEGA">오메가</a>
		        <a href="#" onclick="brand(this.name, this.title)" title="man" name="OBERON">오베론</a>
		        <a href="#" onclick="brand(this.name, this.title)" title="man" name="JULIUS">쥴리어스</a>
		 	 </div>
		 	 <div>
		 	 	<a href="#" onclick="brand(this.name, this.title)" title="man" name="CASIO">카시오</a>
		        <a href="#" onclick="brand(this.name, this.title)" title="man" name="KANGOL">캉골</a>
		        <a href="#" onclick="brand(this.name, this.title)" title="man" name="TAG HEUER">태그호이어</a>
		        <a href="#" onclick="brand(this.name, this.title)" title="man" name="TISSOT">티쏘</a>
		        <a href="#" onclick="brand(this.name, this.title)" title="man" name="FOCE">포체</a>
		 	 </div>
		 	 <div>
		 	 	<a href="#" onclick="brand(this.name, this.title)" title="man" name="HAMILTON">헤밀턴</a>
		 	 </div>
		    </div>
		  </div>
		
		  <div id="woman" class="dropdownBtn">
		    <button id="womanDropBtn" class="dropBtn" name="woman" onclick="typeBrand(this.name)">WOMAN</button>
		    <div id="womanMenu" class="dropdownContent">
		      <div>
		      	<a href="#" onclick="brand(this.name, this.title)" title="woman" name="GEIGER">가이거</a>
		        <a href="#" onclick="brand(this.name, this.title)" title="woman" name="GUESS">게스</a>
		        <a href="#" onclick="brand(this.name, this.title)" title="woman" name="GUCCI">구찌</a>
		        <a href="#" onclick="brand(this.name, this.title)" title="woman" name="Daniel Wellington">다니엘웰링턴</a>
		        <a href="#" onclick="brand(this.name, this.title)" title="woman" name="DKNY">도나캐런뉴욕</a>
		      </div>
		      <div>
		        <a href="#" onclick="brand(this.name, this.title)" title="woman" name="DISNEY">디즈니</a>
		        <a href="#" onclick="brand(this.name, this.title)" title="woman" name="LACOSTE">라코스테</a>
		        <a href="#" onclick="brand(this.name, this.title)" title="woman" name="MONTBLANC">몽블랑</a>
		        <a href="#" onclick="brand(this.name, this.title)" title="woman" name="VALENTINO RUDY">발렌티노루디</a>
		        <a href="#" onclick="brand(this.name, this.title)" title="woman" name="VOWOOD">보우드</a>
		      </div>
		      <div>
		        <a href="#" onclick="brand(this.name, this.title)" title="woman" name="BOYLONDON">보이런던</a>
		        <a href="#" onclick="brand(this.name, this.title)" title="woman" name="CHANEL">샤넬</a>
		        <a href="#" onclick="brand(this.name, this.title)" title="woman" name="SPERA">스페라</a>
		        <a href="#" onclick="brand(this.name, this.title)" title="woman" name="Alexandre Christie">알렉산더크리스티</a>
		        <a href="#" onclick="brand(this.name, this.title)" title="woman" name="ORIS">오리스</a>
		      </div>
		      <div>
		        <a href="#" onclick="brand(this.name, this.title)" title="woman" name="OMEGA">오메가</a>
		        <a href="#" onclick="brand(this.name, this.title)" title="woman" name="OBERON">오베론</a>
		        <a href="#" onclick="brand(this.name, this.title)" title="woman" name="JULIUS">쥴리어스</a>
		        <a href="#" onclick="brand(this.name, this.title)" title="woman" name="CASIO">카시오</a>
		        <a href="#" onclick="brand(this.name, this.title)" title="woman" name="KANGOL">캉골</a>
		      </div>
		      <div>
		        <a href="#" onclick="brand(this.name, this.title)" title="woman" name="TISSOT">티쏘</a>
		        <a href="#" onclick="brand(this.name, this.title)" title="woman" name="PAULBRIAL">폴브리알</a>
		      </div>
		    </div>
		  </div>
		
		  <div id="couple" class="dropdownBtn">
		    <button id="coupleDropBtn" class="dropBtn" name="couple" onclick="typeBrand(this.name)">COUPLE</button>
		    <div id="coupleMenu" class="dropdownContent" >
		      <div>
		        <a href="#" onclick="brand(this.name, this.title)" title="couple" name="DISNEY">디즈니</a>
		        <a href="#" onclick="brand(this.name, this.title)" title="couple" name="MONDAINE">몬데인</a>
		        <a href="#" onclick="brand(this.name, this.title)" title="couple" name="Alexandre Christie">알렉산더크리스티</a>
		        <a href="#" onclick="brand(this.name, this.title)" title="couple" name="OBERON">오베론</a>
		        <a href="#" onclick="brand(this.name, this.title)" title="couple" name="JULIUS">쥴리어스</a>        
		      </div>
		      
		      <div>
		        <a href="#" onclick="brand(this.name, this.title)" title="couple" name="CASIO">카시오</a>
		        <a href="#" onclick="brand(this.name, this.title)" title="couple" name="KANGOL">캉골</a>
		        <a href="#" onclick="brand(this.name, this.title)" title="couple" name="TID">티아이디</a>
		      </div>
		    </div>
		  </div>
	</div>
	</div>
</body>
</html>