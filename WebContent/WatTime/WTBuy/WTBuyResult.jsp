<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	상품 주문을 완료 했습니다. 주문 내역은 마이페이지 > 주문 내역에서 확인해 주시기 바랍니다.
	<input type="button" value="메인으로 가기" onclick="go()">
	<script>
		function go(){
			var form = document.createElement("form");
			form.setAttribute("charset", "utf-8");
			form.setAttribute("method", "Post"); // Get 또는 Post 입력
			form.setAttribute("action", "WTMain.jsp");
	
			document.body.appendChild(form);
			
			form.submit();
		}
	</script>
</body>
</html>