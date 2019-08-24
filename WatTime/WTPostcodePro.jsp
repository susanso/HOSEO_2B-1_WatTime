<%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*" %>
<%
	request.setCharacterEncoding("utf-8");
	String memAddress = request.getParameter("memAddress");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편번호 찾기</title>
<script language = "JavaScript" src = "script.js"></script>
    <!-- jQuery  -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    
    <!-- bootstrap JS -->
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    
    <!-- bootstrap CSS -->
    <link href="https://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
<script>
</Script> 
</head>
<body>
	<form method="post" id="addressSearchForm" name="addressSearchForm" action="WTZipcodePro.jsp">
		<input type="text" id="memAddress" name="memAddress" placeholder="주소 입력 예 : 판교">
		<input type="button" value="우편번호 찾기" onclick="addressSearch()">	
	</form><br>
	<div class="row">
        <table id="table" width="100%" class="table table-bordered table-hover text-center">
            <thead>
                <tr>
                    <th>번호 </th>
                    <th>우편번호</th>
                    <th>지번 주소</th>
                    <th>도로명 주소</th>
                    <th>기타</th>
                </tr>
            </thead>
            <%
            int i = 1;
			request.setCharacterEncoding("UTF-8");
			
			RegisterBean rslt = new RegisterBean();
			try(Connection con = DBMgr.getInstance().getConnection()){
				PreparedStatement pstmt = con.prepareStatement("select * from postcode where address like '%"+memAddress+"%'");
				ResultSet rs = pstmt.executeQuery();
			
				if(rs.next()){
					do{
						//sql로 검색하고 나온 레코드들을 한 줄씩 받아오는 부분
						String address=rs.getString("address");
						String newPostcode=rs.getString("newpostcode");
						String roadAddress=rs.getString("roadaddress");
						String etc=rs.getString("etc");
						//새 우편번호, 도로명 등 null일 땐 공백으로 대체
						if(newPostcode==null) newPostcode="";
						if(roadAddress==null)roadAddress="";
						if(etc==null)etc="";
	            %>
	            <tbody>                
	                <tr>
	                	<td><font size=2><%=i %></font></td>
	                    <td><%=newPostcode %></td>
	                    <td><font size=2><%=address %></font></td>
	                    <td><font size=2><%=roadAddress %></font></td>
	                    <td><font size=2><%=etc %></font></td>
	                </tr>
	            </tbody>
	        <%
	        	i = i +1;
	        	}while(rs.next());
	        %>
	        	</table>
	        <% 
	        	}else{
	        %>
	        	</table>
	        	입력한 주소는 없습니다.
	        <%
	        		
        		}
			}catch (SQLException e) {
				throw new RuntimeException(e);
			}
		%>
    </div>
    <br><br>
	<script>
	//테이블의 Row 클릭시 값 가져오기
	$("#table tr").click(function(){     
	    var str = ""
	    var tdArr = new Array();    // 배열 선언
	    
	    // 현재 클릭된 Row(<tr>)
	    var tr = $(this);
	    var td = tr.children();
	    
	    // 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
	    td.each(function(i){
	        tdArr.push(td.eq(i).text());
	    });
	    
	    
	    // td.eq(index)를 통해 값을 가져올 수도 있다.
	    var no = td.eq(0).text();
	    var newPostcode = td.eq(1).text();
	    var address = td.eq(2).text();
	    var roadAddress = td.eq(3).text();
	    var etc = td.eq(4).text();
	    
	    opener.document.getElementById("memPostcode").value = newPostcode;
		opener.document.getElementById("memRoadAddress").value = roadAddress;
		opener.document.getElementById("memJibunAddress").value= address;
		opener.document.getElementById("memEtcAddress").value= etc;
		opener.document.getElementById("memDetailAddress").value= "";
		window.close();
	});
	</script>
</body>
</html>