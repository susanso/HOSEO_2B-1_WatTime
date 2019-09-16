////상품 관련 페이지
//전체 브랜드
function allBrand(){
	var form = document.createElement("form");
	form.setAttribute("charset", "utf-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTProduct/WTProduct.jsp?pageNum=1");

	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "brandEng");
	hiddenField.setAttribute("value", "all");
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "type");
	hiddenField.setAttribute("value", "");
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "sort");
	hiddenField.setAttribute("value", "productOrder DESC");
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "pageNum");
	hiddenField.setAttribute("value", "1");
	form.appendChild(hiddenField);
	
	document.body.appendChild(form);
	
	form.submit();
}
//남,여,커플 브랜드
function typeBrand(type){
	var form = document.createElement("form");
	form.setAttribute("charset", "utf-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTProduct/WTProduct.jsp?pageNum=1");
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "brandEng");
	hiddenField.setAttribute("value", "");
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "type");
	hiddenField.setAttribute("value", type);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "sort");
	hiddenField.setAttribute("value", "productOrder DESC");
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "pageNum");
	hiddenField.setAttribute("value", "1");
	form.appendChild(hiddenField);
	
	document.body.appendChild(form);
	
	form.submit();
}
//브랜드 누르기
function brand(brandEng, type){
	var form = document.createElement("form");
	form.setAttribute("charset", "utf-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTProduct/WTProduct.jsp?pageNum=1");

	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "brandEng");
	hiddenField.setAttribute("value", brandEng);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "type");
	hiddenField.setAttribute("value", type);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "sort");
	hiddenField.setAttribute("value", "productOrder DESC");
	form.appendChild(hiddenField);
	
	document.body.appendChild(form);
	
	form.submit();
}
//정렬
function sort(sorted, brand, type){
	var sortText = "";
	if(sorted=="hotProduct"){
		sortText = "productOrder DESC";
	}else if(sorted=="highPrice"){
		sortText = "productPrice DESC";
	}else if(sorted=="rowPrice"){
		sortText = "productPrice ASC";
	}else if(sorted=="newProduct"){
		sortText = "productAddDate DESC";
	}
	var form = document.createElement("form");
	form.setAttribute("charset", "utf-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTProduct/WTProduct.jsp?pageNum=1");

	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "sort");
	hiddenField.setAttribute("value", sortText);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "brandEng");
	hiddenField.setAttribute("value", brand);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "type");
	hiddenField.setAttribute("value", type);
	form.appendChild(hiddenField);
		
	document.body.appendChild(form);
	
	form.submit();
}
////상품 등록 페이지
//상품 등록 페이지 이동
function productInsertForm(){
	location.href="WTMain.jsp?pageChange=WTProduct/WTProductInsertForm.jsp"
}
//상품 상세보기
function productSpec(productCode){
	var form = document.createElement("form");
	form.setAttribute("charset", "UTF-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTProduct/WTProductSpec.jsp?pageNum=1");

	 
	var hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "productCode");
	hiddenField.setAttribute("value", productCode);
	form.appendChild(hiddenField);

	var hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "pageNum");
	hiddenField.setAttribute("value", "1");
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "modify");
	hiddenField.setAttribute("value", 0);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "sort");
	hiddenField.setAttribute("value", "reg_date DESC");
	form.appendChild(hiddenField);
	
	document.body.appendChild(form);
	
	form.submit();
}

//페이지 관련
//이전
function back(pageNum, brand, type, sort){
	var form = document.createElement("form");
	form.setAttribute("charset", "utf-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTProduct/WTProduct.jsp?pageNum="+pageNum);

	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "brandEng");
	hiddenField.setAttribute("value", brand);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "type");
	hiddenField.setAttribute("value", type);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "sort");
	hiddenField.setAttribute("value", sort);
	form.appendChild(hiddenField);
	
		
	document.body.appendChild(form);
	
	form.submit();
}
//페이지
function pageNum(pageNum, brand, type, sort){
	var form = document.createElement("form");
	form.setAttribute("charset", "utf-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTProduct/WTProduct.jsp?pageNum="+pageNum);

	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "brandEng");
	hiddenField.setAttribute("value", brand);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "type");
	hiddenField.setAttribute("value", type);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "sort");
	hiddenField.setAttribute("value", sort);
	form.appendChild(hiddenField);
	
		
	document.body.appendChild(form);
	
	form.submit();
}
//다음
function next(pageNum, brand, type, sort){
	var form = document.createElement("form");
	form.setAttribute("charset", "utf-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTProduct/WTProduct.jsp?pageNum="+pageNum);

	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "brandEng");
	hiddenField.setAttribute("value", brand);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "type");
	hiddenField.setAttribute("value", type);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "sort");
	hiddenField.setAttribute("value", sort);
	form.appendChild(hiddenField);
	
		
	document.body.appendChild(form);
	
	form.submit();
}