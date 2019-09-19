////고객센터
//FAQ 화면 include 
function FAQPage(){
	var form = document.createElement("form");
	form.setAttribute("charset", "UTF-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTCustomerService/WTFAQ.jsp");

	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "content");
	hiddenField.setAttribute("value", "FAQ");
	form.appendChild(hiddenField);	
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "pageNum");
	hiddenField.setAttribute("value", "1");
	form.appendChild(hiddenField);	
		
	document.body.appendChild(form);
	form.submit();
}
//공지사항 화면 include 
function noticePage(){
	var form = document.createElement("form");
	form.setAttribute("charset", "UTF-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTNotice/WTNoticeList.jsp?pageNum=1");

	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "content");
	hiddenField.setAttribute("value", "NoticeList");
	form.appendChild(hiddenField);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "pageNum");
	hiddenField.setAttribute("value", "1");
	form.appendChild(hiddenField);	
		
	document.body.appendChild(form);
	form.submit();
}
//공지사항 화면 include 
function reviewPage(){
	var form = document.createElement("form");
	form.setAttribute("charset", "UTF-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTReview/WTReview.jsp?pageNum=1");

	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "listCount");
	hiddenField.setAttribute("value", "10");
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
////공지사항
//글 목록 클릭
function noticeListClick(noticeNum,pageNum){
	
	var form = document.createElement("form");
	form.setAttribute("charset", "UTF-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTNotice/WTNoticeForm.jsp");

	 
	var hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "noticeNum");
	hiddenField.setAttribute("value", noticeNum);
	form.appendChild(hiddenField);
	
	var hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "pageNum");
	hiddenField.setAttribute("value", pageNum);
	form.appendChild(hiddenField);
	
	document.body.appendChild(form);

	form.submit();
}

//공지사항 글쓰기 폼
function noticeWriteForm(){
	location.href="WTMain.jsp?pageChange=WTNotice/WTNoticeWriteForm.jsp"
}


//페이지 관련
//이전
function back(pageNum){
	var form = document.createElement("form");
	form.setAttribute("charset", "utf-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTNotice/WTNoticeList.jsp?pageNum="+pageNum);
	
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
	form.setAttribute("action", "WTMain.jsp?pageChange=WTNotice/WTNoticeList.jsp?pageNum="+pageNum);
	
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
	form.setAttribute("action", "WTMain.jsp?pageChange=WTNotice/WTNoticeList.jsp?pageNum="+pageNum);
	
	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "pageNum");
	hiddenField.setAttribute("value", pageNum);
	form.appendChild(hiddenField);
	
	document.body.appendChild(form);
	
	form.submit();
}