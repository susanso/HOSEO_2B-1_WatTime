//장바구니 갯수 수정
function productCountModify(memId, num){
	var productCount = document.getElementById("productCountNum").value;
	var form = document.createElement("form");
	form.setAttribute("charset", "utf-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTBasket/WTBasketModify.jsp");
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "memId");
	hiddenField.setAttribute("value", memId);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "num");
	hiddenField.setAttribute("value", num);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "productCount");
	hiddenField.setAttribute("value", productCount);
	form.appendChild(hiddenField);
	
	document.body.appendChild(form);
	
	form.submit();
}
//상품 클릭
function goProduct(productCode){
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
function productCountChange(productCount){
	document.getElementById("productCountNum").value = productCount;
}
//한개 삭제
function basketOneDelete(num,memId){

	var form = document.createElement("form");
	form.setAttribute("charset", "utf-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTBasket/WTBasketOneDelete.jsp");
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "num");
	hiddenField.setAttribute("value", num);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "memId");
	hiddenField.setAttribute("value", memId);
	form.appendChild(hiddenField);
	
	document.body.appendChild(form);
	
	form.submit();
	
}
//모두 삭제
function basketAllDelete(memId){
	

	var form = document.createElement("form");
	form.setAttribute("charset", "utf-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTBasket/WTBasketAllDelete.jsp");
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "memId");
	hiddenField.setAttribute("value", memId);
	form.appendChild(hiddenField);
	
	document.body.appendChild(form);
	
	form.submit();
	
}
//페이지 관련
//이전
function back(pageNum){
	var form = document.createElement("form");
	form.setAttribute("charset", "utf-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTNoticeList.jsp");
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "pageNum");
	hiddenField.setAttribute("value", pageNum);
	form.appendChild(hiddenField);
	
	document.body.appendChild(form);
	
	form.submit();
}
//페이지
function pageNum(pageNum){
	var form = document.createElement("form");
	form.setAttribute("charset", "utf-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTNoticeList.jsp");
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "pageNum");
	hiddenField.setAttribute("value", pageNum);
	form.appendChild(hiddenField);
	
	document.body.appendChild(form);
	
	form.submit();
}
//다음
function next(pageNum){
	var form = document.createElement("form");
	form.setAttribute("charset", "utf-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTNoticeList.jsp");
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "pageNum");
	hiddenField.setAttribute("value", pageNum);
	form.appendChild(hiddenField);
	
	document.body.appendChild(form);
	
	form.submit();
}