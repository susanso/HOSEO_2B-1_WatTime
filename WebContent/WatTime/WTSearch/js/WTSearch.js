//상품 검색
function productSearch(){
	var searchText = document.getElementsByName("searchText")[0].value;
	if(searchText=="여성" || searchText=="여자" || searchText=="여자시계" || searchText=="여자 시계" || searchText=="여성 시계" || searchText=="여성시계"){
		searchText = "woman";
	}else if(searchText=="남성" || searchText=="남자" || searchText=="남자시계" || searchText=="남자 시계" || searchText=="남성 시계" || searchText=="남성시계"){
		searchText = "man";
	}else if(searchText=="커플" || searchText=="커플시계" || searchText=="커플 시계"){
		searchText = "couple";
	}
	var form = document.createElement("form");
	form.setAttribute("charset", "UTF-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTSearch/WTTopSearchPro.jsp?pageNum=1");

	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "searchText");
	hiddenField.setAttribute("value", searchText);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "pageNum");
	hiddenField.setAttribute("value", "1");
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
function sort(sorted, searchText, pageNum){
	
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
	form.setAttribute("action", "WTMain.jsp?pageChange=WTSearch/WTTopSearchPro.jsp?pageNum="+pageNum);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "sort");
	hiddenField.setAttribute("value", sortText);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "searchText");
	hiddenField.setAttribute("value", searchText);
	form.appendChild(hiddenField);
		
	document.body.appendChild(form);
	
	form.submit();
}
//상세보기
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
function back(pageNum, searchText, sort){
	var form = document.createElement("form");
	form.setAttribute("charset", "utf-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTSearch/WTTopSearchPro.jsp?pageNum="+pageNum);

	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "searchText");
	hiddenField.setAttribute("value", searchText);
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
function pageNum(pageNum, searchText, sort){
	var form = document.createElement("form");
	form.setAttribute("charset", "utf-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTSearch/WTTopSearchPro.jsp?pageNum="+pageNum);

	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "searchText");
	hiddenField.setAttribute("value", searchText);
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
function next(pageNum, searchText, sort){
	var form = document.createElement("form");
	form.setAttribute("charset", "utf-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTSearch/WTTopSearchPro.jsp?pageNum="+pageNum);

	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "searchText");
	hiddenField.setAttribute("value", searchText);
	form.appendChild(hiddenField);
	
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "sort");
	hiddenField.setAttribute("value", sort);
	form.appendChild(hiddenField);
	
		
	document.body.appendChild(form);
	
	form.submit();
}