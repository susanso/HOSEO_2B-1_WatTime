//상품 할인율 적용
function productSalePrice(productOriginalPrice, productSale){
	if(productSale==""){
		productSale = 0;
	}
	
	var price = productOriginalPrice - (productOriginalPrice * (productSale/100));
	var tictok = price * 0.01;
	
	document.getElementById("productPrice").value = price;
	document.getElementById("tictok").value = tictok;
}
//상품 브랜드 한글
function brandKorCon(brand){
	if(brand=="DKNY"){
		document.getElementById("brandKor").value = "도나카란";
	}else if(brand=="GEIGER"){
		document.getElementById("brandKor").value = "가이거";
	}else if(brand=="GUESS"){
		document.getElementById("brandKor").value = "게스";
	}else if(brand=="GUCCI"){
		document.getElementById("brandKor").value = "구찌";
	}else if(brand=="Daniel Wellington"){
		document.getElementById("brandKor").value = "다니엘 웰링턴";
	}else if(brand=="DIESEL"){
		document.getElementById("brandKor").value = "디젤";
	}else if(brand=="DISNEY"){
		document.getElementById("brandKor").value = "디즈니";
	}else if(brand=="LACOSTE"){
		document.getElementById("brandKor").value = "라코스테";
	}else if(brand=="LUMINOX"){
		document.getElementById("brandKor").value = "루미녹스";
	}else if(brand=="MONDAINE"){
		document.getElementById("brandKor").value = "몬데인";
	}else if(brand=="MONTBLANC"){
		document.getElementById("brandKor").value = "몽블랑";
	}else if(brand=="VALENTINO RUDY"){
		document.getElementById("brandKor").value = "발렌티노루디";
	}else if(brand=="VOWOOD"){
		document.getElementById("brandKor").value = "보우드";
	}else if(brand=="BOYLONDON"){
		document.getElementById("brandKor").value = "보이런던";
	}else if(brand=="CHANEL"){
		document.getElementById("brandKor").value = "샤넬";
	}else if(brand=="SPERA"){
		document.getElementById("brandKor").value = "스페라";
	}else if(brand=="Alexandre Christie"){
		document.getElementById("brandKor").value = "알렉산더 크리스티";
	}else if(brand=="ORIS"){
		document.getElementById("brandKor").value = "오리스";
	}else if(brand=="OMEGA"){
		document.getElementById("brandKor").value = "오메가";
	}else if(brand=="OBERON"){
		document.getElementById("brandKor").value = "오베론";
	}else if(brand=="JULIUS"){
		document.getElementById("brandKor").value = "쥴리어스 ";
	}else if(brand=="CASIO"){
		document.getElementById("brandKor").value = "카시오";
	}else if(brand=="KANGOL"){
		document.getElementById("brandKor").value = "캉골";
	}else if(brand=="TAG HEUER"){
		document.getElementById("brandKor").value = "태그호이어";
	}else if(brand=="TISSOT"){
		document.getElementById("brandKor").value = "티쏘";
	}else if(brand=="FOCE"){
		document.getElementById("brandKor").value = "포체";
	}else if(brand=="PAULBRIAL"){
		document.getElementById("brandKor").value = "폴브리알";
	}else if(brand=="HAMILTON"){
		document.getElementById("brandKor").value = "헤밀턴";
	}
}