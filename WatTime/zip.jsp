<%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="WatTimePack.*, java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script>
		function AutoInput(zip, address){
			zip1 = zip.substring(0,3);
			zip2 = zip.substring(4,7);
			opener.nform.zip1.value = zip1;
			opener.nform.zip2.value = zip2;
			self.close();
		}
	</script>
</head>
<body>
	<table align=center border=0>
		<tr>
			<td bgcolor="#A3ACD5" width=100>
				<font size=2><center>우편번호</center></font>
			</td>
			<td bgcolor="#A3ACD5" width=100>
				<font size=2><center>주소</center></font>
			</td>
		</tr>
		
		<%
			ZipCodeDB zipdb = new ZipCodeDB();
			request.setCharacterEncoding("utf-8");
			
			zipdb.connect();
			String dong = request.getParameter("dong");
			
			String sql = "select * from zipcode where dong like '%"+dong+"%'";
			ResultSet rs = zipdb.resultQuery(sql);
			
			if(rs.next()){
				do{
					String zip = rs.getString("ZIPCODE");
					String sido = rs.getString("SIDO");
					String gugun = rs.getString("GUGUN");
					String don = rs.getString("DONG");
					String ri = rs.getString("RI");
					String bunji = rs.getString("BUNJI");
					if(ri==null) ri="";
					if(bunji==null) bunji="";
					String address = sido+""+gugun+""+don+""+ri+""+bunji;
		%>
		<tr>
			<td bgcolor="#eeeee">
				<center><font size=2>
				<a href="JavaScript:AutoInput('<%=zip %>','<%=address %>','<%=zip %>')"></a>
				</font></center>
			</td>
			<td bgcolor="#eeeee">
				<font size=2><a href="JavaScript:AutoInput('<%=zip %>','<%=address %>','<%=address %>')"></a></font>
			</td>
		</tr>
		
		<%
				}while(rs.next());
			}else{
		%>
		</table>
		<font size=2><center><br>찾고자하는 동이 존재하지 않습니다.<br><BR><br>
		다시 검색 하시려면 <a href =../WatTime/ZipInoutForm.html>요기</a>를 누르세요</center></font>
		<%} %>
		
		<br><br><br>
		<center><a href="JavaScript:self.close()">닫기</a></center>
</body>
</html>