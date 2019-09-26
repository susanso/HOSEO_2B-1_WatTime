function basketList(){
	var form = document.createElement("form");
	form.setAttribute("charset", "utf-8");
	form.setAttribute("method", "Post"); // Get 또는 Post 입력
	form.setAttribute("action", "WTMain.jsp?pageChange=WTBasket/WTBasketList.jsp");
	
	document.body.appendChild(form);
	form.submit();
}