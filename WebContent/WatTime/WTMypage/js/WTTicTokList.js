//상품 명 클릭시 팝업
function orderProductList(orderNum){
	url = "WTMypage/WTOrderProductList.jsp?orderNum="+orderNum;
	ret = window.open(url,"_blank","toolbar=no, scrollbars=yes",false);	
}
//검색 날짜 유효성
function dateCheck(dateStart,dateEnd){
	var newDt = new Date();
	var year = newDt.getFullYear();
    var month = newDt.getMonth()+1;
    var day = newDt.getDate();

    var date = year+"-"+month+"-"+day;
    
    //시작 날짜
    var y = dateStart.substr(0, 4);
    var m = dateStart.substr(5, 2);
    var d = dateStart.substr(8, 2);
    var dateStartFormat = new Date(y,m,d);
   
    //끝 날짜
    var y = dateEnd.substr(0, 4);
    var m = dateEnd.substr(5, 2);
    var d = dateEnd.substr(8, 2);
    var dateEndFormat = new Date(y,m,d);
    
	//현재 날짜
    var y = date.substr(0, 4);
    var m = date.substr(5, 2);
    var d = date.substr(8, 2);
    var dateFormat= new Date(y,m,d);

	if(dateStart==""||dateEnd==""){
		alert("날짜를 입력해주세요");
	}else if(dateStart>dateEnd){
		alert("시작 날짜가 끝 날짜보다 큽니다.");
	}else if(dateStartFormat>dateFormat||dateEndFormat>dateFormat){
		alert("오늘 날짜보다 큽니다.");
	}else{
		year = dateEndFormat.getFullYear();
		month = dateEndFormat.getMonth();
	    day = dateEndFormat.getDate()+1;
	    dateEnd = year+"-"+month+"-"+day+" 00:00:00";
	    
		var form = document.createElement("form");
		form.setAttribute("charset", "utf-8");
		form.setAttribute("method", "Post"); // Get 또는 Post 입력
		form.setAttribute("action", "WTMain.jsp?pageChange=WTMypage/WTTicTokList.jsp?pageNum=1");
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "startDate");
		hiddenField.setAttribute("value", dateStart+" 00:00:00");
		form.appendChild(hiddenField);
		
		hiddenField = document.createElement("input");
		hiddenField.setAttribute("type", "hidden");
		hiddenField.setAttribute("name", "endDate");
		hiddenField.setAttribute("value", dateEnd);
		form.appendChild(hiddenField);
		
		document.body.appendChild(form);
		
		form.submit();
	}
}
//날짜 버튼
function monthSearch(mm){
	var orderStatus = document.getElementById("orderStatusSelect");
	if(orderStatus==null){
		orderStatus = null;
	}else{
		orderStatus = document.getElementById("orderStatusSelect").value;
	}
	var newDt = new Date();
    newDt.setMonth(newDt.getMonth()+1-parseInt(mm)); 
    newDt.setDate(1);
    var year = newDt.getFullYear();
    var month = newDt.getMonth();
    var day = newDt.getDate();
    
    var date = year+"-"+month+"-"+day+" 00:00:00";
    var form = document.createElement("form");
	form.setAttribute("charset", "utf-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTMypage/WTTicTokList.jsp?pageNum=1");
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "startDate");
	hiddenField.setAttribute("value", date);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "orderStatus");
	hiddenField.setAttribute("value", orderStatus);
	form.appendChild(hiddenField);
	
	document.body.appendChild(form);
	
	form.submit();
	
}
//페이지 관련
//이전
function back(pageNum,startDate,endDate){
	var form = document.createElement("form");
	form.setAttribute("charset", "utf-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTMypage/WTTicTokList.jsp?pageNum="+pageNum);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "startDate");
	hiddenField.setAttribute("value", startDate);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "endDate");
	hiddenField.setAttribute("value", endDate);
	form.appendChild(hiddenField);
	
	document.body.appendChild(form);
	
	form.submit();
}
//페이지
function pageNum(pageNum,startDate,endDate){
	var form = document.createElement("form");
	form.setAttribute("charset", "utf-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTMypage/WTTicTokList.jsp?pageNum="+pageNum);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "startDate");
	hiddenField.setAttribute("value", startDate);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "endDate");
	hiddenField.setAttribute("value", endDate);
	form.appendChild(hiddenField);
	
	document.body.appendChild(form);
	
	form.submit();
}
//다음
function next(pageNum,startDate,endDate){
	var form = document.createElement("form");
	form.setAttribute("charset", "utf-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTMypage/WTTicTokList.jsp?pageNum="+pageNum);

	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "startDate");
	hiddenField.setAttribute("value", startDate);
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "endDate");
	hiddenField.setAttribute("value", endDate);
	form.appendChild(hiddenField);
	
	document.body.appendChild(form);
	
	form.submit();
}