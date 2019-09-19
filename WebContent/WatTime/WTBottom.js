//공지사항
function noticeListClick(num){
	var form = document.createElement("form");
	form.setAttribute("charset", "UTF-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTNotice/WTNoticeForm.jsp");

	 
	var hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "noticeNum");
	hiddenField.setAttribute("value", num);
	form.appendChild(hiddenField);
	
	var hiddenField = document.createElement("input");
	hiddenField.setAttribute("type", "hidden");
	hiddenField.setAttribute("name", "pageNum");
	hiddenField.setAttribute("value", "1");
	form.appendChild(hiddenField);
	
	document.body.appendChild(form);

	form.submit();
}