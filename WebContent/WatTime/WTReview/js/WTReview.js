function reviewList(){
	var form = document.createElement("form");
	form.setAttribute("charset", "utf-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTReview/WTReview.jsp?pageNum=1");

	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "pageNum");
	hiddenField.setAttribute("value", "1");
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "sort");
	hiddenField.setAttribute("value", "reg_date DESC");
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "listCount");
	hiddenField.setAttribute("value", "10");
	form.appendChild(hiddenField);
	
	document.body.appendChild(form);
	
	form.submit();
	
}

function reviewListCount(count,sort){
	var form = document.createElement("form");
	form.setAttribute("charset", "utf-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTReview/WTReview.jsp?pageNum=1");

	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "pageNum");
	hiddenField.setAttribute("value", "1");
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "sort");
	hiddenField.setAttribute("value", sort);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "listCount");
	hiddenField.setAttribute("value", count);
	form.appendChild(hiddenField);
	
	document.body.appendChild(form);
	
	form.submit();
}

//정렬
function reviewLastest(pageNum, listCount){
	var form = document.createElement("form");
	form.setAttribute("charset", "utf-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTReview/WTReview.jsp?pageNum="+pageNum);

	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "listCount");
	hiddenField.setAttribute("value", listCount);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "sort");
	hiddenField.setAttribute("value", "reg_date DESC");
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "pageNum");
	hiddenField.setAttribute("value", pageNum);
	form.appendChild(hiddenField);
	
		
	document.body.appendChild(form);
	
	form.submit();
}
function scoreSort(pageNum, listCount){
	var form = document.createElement("form");
	form.setAttribute("charset", "utf-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTReview/WTReview.jsp?pageNum="+pageNum);

	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "listCount");
	hiddenField.setAttribute("value", listCount);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "sort");
	hiddenField.setAttribute("value", "reviewScore DESC");
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "pageNum");
	hiddenField.setAttribute("value", pageNum);
	form.appendChild(hiddenField);
	
		
	document.body.appendChild(form);
	
	form.submit();
}
//상세 페이지 넘어가는 부분
function productSpecPage(productCode){
	var form = document.createElement("form");
	form.setAttribute("charset", "utf-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTProduct/WTProductSpec.jsp?pageNum=1");

	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "productCode");
	hiddenField.setAttribute("value", productCode);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "modify");
	hiddenField.setAttribute("value", "0");
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "sort");
	hiddenField.setAttribute("value", "reg_date DESC");
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "pageNum");
	hiddenField.setAttribute("value", "1");
	form.appendChild(hiddenField);
		
	document.body.appendChild(form);
	
	form.submit();
}

//페이지 관련
//이전
function back(pageNum, listCount ,sort){
	var form = document.createElement("form");
	form.setAttribute("charset", "utf-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTReview/WTReview.jsp?pageNum="+pageNum);

	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "listCount");
	hiddenField.setAttribute("value", listCount);
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
function pageNum(pageNum, listCount ,sort){
	var form = document.createElement("form");
	form.setAttribute("charset", "utf-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTReview/WTReview.jsp?pageNum="+pageNum);

	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "listCount");
	hiddenField.setAttribute("value", listCount);
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
function next(pageNum, listCount ,sort){
	var form = document.createElement("form");
	form.setAttribute("charset", "utf-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTReview/WTReview.jsp?pageNum="+pageNum);

	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "listCount");
	hiddenField.setAttribute("value", listCount);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "sort");
	hiddenField.setAttribute("value", sort);
	form.appendChild(hiddenField);
	
		
	document.body.appendChild(form);
	
	form.submit();
}