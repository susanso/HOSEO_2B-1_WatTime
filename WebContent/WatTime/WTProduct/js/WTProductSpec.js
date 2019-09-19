//상품 수정
function productModifyForm(productCode){
	var form = document.createElement("form");
	form.setAttribute("charset", "UTF-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTProduct/WTProductModifyForm.jsp");

	var hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "productCode");
	hiddenField.setAttribute("value", productCode);
	form.appendChild(hiddenField);
	
	document.body.appendChild(form);
	
	form.submit();
}
//상품 삭제
function productDeleteForm(productCode){
	var form = document.createElement("form");
	form.setAttribute("charset", "UTF-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTProduct/WTProductDelete.jsp");

	var hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "productCode");
	hiddenField.setAttribute("value", productCode);
	form.appendChild(hiddenField);
	
	document.body.appendChild(form);
	
	form.submit();
}

////상품 상세 페이지
function countPlus(price,count){

    var countNum = parseInt(count) + 1;
    document.getElementById("productCount").value = countNum;
    var total = price * countNum;
    var totalfomat = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    document.getElementById("totalPrice").textContent = totalfomat+"원";
}

function countMinus(price,count){
    var total = 0;
    var countNum = parseInt(count) - 1;
    if(countNum==0){
        alert("최소 수량은 1개입니다.");
        document.getElementById("productCount").value = 1;
        var totalfomat = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        document.getElementById("totalPrice").textContent = totalfomat+"원";
    }else{
        document.getElementById("productCount").value = countNum;
        var total = price * countNum;
        var totalfomat = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        document.getElementById("totalPrice").textContent = totalfomat+"원";
    }
}
//구매 후기 텍스트 길이
function productReviewLength(){
	var productReview = document.getElementById("productReview").value;
	document.getElementById("productReviewLength").textContent= "현재 문자 길이 "+productReview.length+"/200";
}
function productReviewLengthRe(){
	var productReview = document.getElementById("productReviewRe").value;
	document.getElementById("productReviewLengthRe").textContent= "현재 문자 길이 "+productReview.length+"/200";
}
//유효성 검사
function reviewCheck(){
	if(document.getElementById("logCheck").value =="logno"){
		alert("로그인 해주세요");
	}else if(document.getElementById("productReview").value ==""){
		alert("내용을 입력해주세요");
	}else{
		document.getElementById("reviewForm").submit();
	}
}
//정렬
//최신순
function reviewLastest(productCode, modify, pageNum){
	var form = document.createElement("form");
	form.setAttribute("charset", "UTF-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTProduct/WTProductSpec.jsp?pageNum="+pageNum);

	 
	var hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "productCode");
	hiddenField.setAttribute("value", productCode);
	form.appendChild(hiddenField);
	
	var hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "pageNum");
	hiddenField.setAttribute("value", pageNum);
	form.appendChild(hiddenField);
	 
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "modify");
	hiddenField.setAttribute("value", modify);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "sort");
	hiddenField.setAttribute("value", "reg_date DESC");
	form.appendChild(hiddenField);
	
	
	document.body.appendChild(form);
	
	form.submit();
}
//별점순
function scoreSort(productCode, modify, pageNum){
	var form = document.createElement("form");
	form.setAttribute("charset", "UTF-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTProduct/WTProductSpec.jsp?pageNum="+pageNum);

	 
	var hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "productCode");
	hiddenField.setAttribute("value", productCode);
	form.appendChild(hiddenField);
	
	var hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "pageNum");
	hiddenField.setAttribute("value", pageNum);
	form.appendChild(hiddenField);
	 
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "modify");
	hiddenField.setAttribute("value", modify);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "sort");
	hiddenField.setAttribute("value", "reviewScore DESC");
	form.appendChild(hiddenField);
	
	
	document.body.appendChild(form);
	
	form.submit();
	
}
//구매후기 삭제
function reviewDelete(memId, reviewNum, sort, pageNum, productCode){
	var form = document.createElement("form");
	form.setAttribute("charset", "UTF-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTReview/WTReviewDelete.jsp");

	 
	var hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "productCode");
	hiddenField.setAttribute("value", productCode);
	form.appendChild(hiddenField);

	 
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "reviewNum");
	hiddenField.setAttribute("value", reviewNum);
	form.appendChild(hiddenField);
	
	var hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "pageNum");
	hiddenField.setAttribute("value", pageNum);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "memId");
	hiddenField.setAttribute("value", memId);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "sort");
	hiddenField.setAttribute("value", sort);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "pageNum");
	hiddenField.setAttribute("value", pageNum);
	form.appendChild(hiddenField);
	
	document.body.appendChild(form);
	
	form.submit();
}
//구매후기 수정 폼
function reviewModifyForm(reviewNum,productCode,sort,pageNum){
	var form = document.createElement("form");
	form.setAttribute("charset", "UTF-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTProduct/WTProductSpec.jsp?pageNum="+pageNum);

	 
	var hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "productCode");
	hiddenField.setAttribute("value", productCode);
	form.appendChild(hiddenField);

	 
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "modify");
	hiddenField.setAttribute("value", reviewNum);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "sort");
	hiddenField.setAttribute("value", sort);
	form.appendChild(hiddenField);
	
	var hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "pageNum");
	hiddenField.setAttribute("value", pageNum);
	form.appendChild(hiddenField);
	
	document.body.appendChild(form);
	
	form.submit();
}
//구매후기 수정 액션
function reviewModify(productCode,reviewNum,sort){
	//location.href="WTMain.jsp?pageChange=WTReviewModify.jsp?modifyNum="+modify;
	
	var obj1 = document.getElementsByName("productReviewRe")[0].value;
	var obj2 = document.getElementsByName("scoreRe")[0].value;
	
	var form = document.createElement("form");
	form.setAttribute("charset", "UTF-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTReview/WTReviewModify.jsp");

	 
	var hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "productReview");
	hiddenField.setAttribute("value", obj1);
	form.appendChild(hiddenField);

	 
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "score");
	hiddenField.setAttribute("value", obj2);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "reviewNum");
	hiddenField.setAttribute("value", reviewNum);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "sort");
	hiddenField.setAttribute("value", sort);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "productCode");
	hiddenField.setAttribute("value", productCode);
	form.appendChild(hiddenField);
	
	document.body.appendChild(form);
	 
	form.submit();
	
}
//장바구니 버튼
function basketPro(logCheck,productCount,productCode, productName, productPrice, memId, memName, fileName, tictok){
	if(logCheck=="logno"){
		alert("로그인을 해주세요");
	}else if(productCount == 0){
		alert("상품의 갯수가 0개입니다.");
		document.getElementById("productCount").focus();
	}else{
		var form = document.createElement("form");
		form.setAttribute("charset", "utf-8");
		form.setAttribute("method", "Post"); // Get 또는 Post 입력
		form.setAttribute("action", "WTMain.jsp?pageChange=WTProduct/WTProductBasketPro.jsp");

		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "productCount");
		hiddenField.setAttribute("value", productCount);
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "productCode");
		hiddenField.setAttribute("value", productCode);
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "productName");
		hiddenField.setAttribute("value", productName);
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "productPrice");
		hiddenField.setAttribute("value", productPrice);
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "memId");
		hiddenField.setAttribute("value", memId);
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "memName");
		hiddenField.setAttribute("value", memName);
		form.appendChild(hiddenField);
		document.body.appendChild(form);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "fileName");
		hiddenField.setAttribute("value", fileName);
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "tictok");
		hiddenField.setAttribute("value", tictok);
		form.appendChild(hiddenField);
		
		document.body.appendChild(form);
		form.submit();
	}
}

//페이지 관련
//이전
function back(pageNum, modify, productCode, sort){
	var form = document.createElement("form");
	form.setAttribute("charset", "utf-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTProduct/WTProductSpec.jsp?pageNum="+pageNum);

	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "modify");
	hiddenField.setAttribute("value", modify);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "productCode");
	hiddenField.setAttribute("value", productCode);
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
function pageNum(pageNum, modify, productCode, sort){
//

	var form = document.createElement("form");
	form.setAttribute("charset", "utf-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTProduct/WTProductSpec.jsp?pageNum="+pageNum);

	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "modify");
	hiddenField.setAttribute("value", modify);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "productCode");
	hiddenField.setAttribute("value", productCode);
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
function next(pageNum, modify, productCode, sort){
	var form = document.createElement("form");
	form.setAttribute("charset", "utf-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTProduct/WTProductSpec.jsp?pageNum="+pageNum);

	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "modify");
	hiddenField.setAttribute("value", modify);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "productCode");
	hiddenField.setAttribute("value", productCode);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "sort");
	hiddenField.setAttribute("value", sort);
	form.appendChild(hiddenField);
	
		
	document.body.appendChild(form);
	
	form.submit();
}