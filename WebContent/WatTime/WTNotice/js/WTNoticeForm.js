//공지사항 목록으로 돌아가기
function noticeListBack(pageNum){
	var form = document.createElement("form");
	form.setAttribute("charset", "UTF-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTNotice/WTNoticeList.jsp?pageNum="+pageNum);

	var hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "pageNum");
	hiddenField.setAttribute("value", pageNum);
	form.appendChild(hiddenField);
	
	document.body.appendChild(form);

	form.submit();
}
//공지사항 수정
function noticeModify(noticeNum){
	var form = document.createElement("form");
	form.setAttribute("charset", "utf-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTNotice/WTNoticeModifyForm.jsp");

	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "noticeNum");
	hiddenField.setAttribute("value", noticeNum);
	form.appendChild(hiddenField);
		
	document.body.appendChild(form);
	
	form.submit();
}
//공지사항 삭제
function noticeDelete(noticeNum){
	var form = document.createElement("form");
	form.setAttribute("charset", "utf-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTNotice/WTNoticeDelete.jsp");

	hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "noticeNum");
	hiddenField.setAttribute("value", noticeNum);
	form.appendChild(hiddenField);
		
	document.body.appendChild(form);
	
	form.submit();
}

