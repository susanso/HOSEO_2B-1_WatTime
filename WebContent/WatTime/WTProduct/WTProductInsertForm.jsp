<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*" %>
<%@ page import = "java.sql.Timestamp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품 등록</title>
<script language = "JavaScript" src = "WTProduct/js/WTProductInsert.js"></script>
</head>
<body>
	<form method="post" action="WTProduct/WTProductInsertPro.jsp" id="productInsertForm" enctype="multipart/form-data">
		<table border=1>
			<!-- 이미지 및 가격 -->
			<tr>
				<td rowspan="2">
					미리보기 사진 등록<br>
					<input type="file" id="productSimpleImg" name="productSimpleImg" size=40 required>
				</td>
				<td>
					제품코드 : <input type="text" id="productCode" name="productCode" required ><br>
					제품명 : <input type="text" id="productName" name="productName" required><br>
					브랜드 : <select id ="brand" name="brand" onchange="brandKorCon(this.options[this.selectedIndex].text)">
							  <option value="" selected disabled required>선택</option>
							  <option value="DKNY">DKNY</option>
							  <option value="GEIGER">GEIGER</option>
							  <option value="GUESS">GUESS</option>
							  <option value="GUCCI">GUCCI</option>
							  <option value="Daniel Wellington">Daniel Wellington</option>
							  <option value="DIESEL">DIESEL</option>
							  <option value="DISNEY">DISNEY</option>
							  <option value="LACOSTE">LACOSTE</option>
							  <option value="LUMINOX">LUMINOX</option>
							  <option value="MONDAINE">MONDAINE</option>
							  <option value="MONTBLANC">MONTBLANC</option>
							  <option value="VALENTINO RUDY">VALENTINO RUDY</option>
							  <option value="VOWOOD">VOWOOD</option>
							  <option value="BOYLONDON">BOYLONDON</option>
							  <option value="CHANEL">CHANEL</option>
							  <option value="SPERA">SPERA</option>
							  <option value="Alexandre Christie">Alexandre Christie</option>
							  <option value="ORIS">ORIS</option>
							  <option value="OMEGA">OMEGA</option>
							  <option value="OBERON">OBERON</option>
							  <option value="JULIUS">JULIUS</option>
							  <option value="CASIO">CASIO</option>
							  <option value="KANGOL">KANGOL</option>
							  <option value="TAG HEUER">TAG HEUER</option>
							  <option value="TISSOT">TISSOT</option>
							  <option value="FOCE">FOCE</option>
							  <option value="PAULBRIAL">PAULBRIAL</option>
							  <option value="HAMILTON">HAMILTON</option>
							</select><br>
					브랜드(한글):<input type="text" id="brandKor" name="brandKor" required><br>
					타입 :<select id ="type" name="type">
							  <option value="" selected disabled required>선택</option>
							  <option value="man">남성</option>
							  <option value="woman">여성</option>
							  <option value="couple">커플</option>
						</select>
					원가격 : <input type="number" id="productOriginalPrice" name="productOriginalPrice" onblur="productSalePrice(productOriginalPrice.value,productSale.value)" required>원<br>
					할인율 : <input type="number" id="productSale" name="productSale" min="0" max="100" onblur="productSalePrice(productOriginalPrice.value,productSale.value)">%<br>
					소비자가격 : <input type="number" id="productPrice" name="productPrice" onblur="productSalePrice()">원<br>
					TicTok : <input type="number" id="tictok" name="tictok"><br>
					제조국 : <input type="text" id="productCountry" name="productCountry" required><br>
				</td>
			</tr>
			<!-- 등록버튼 -->
			<tr>
				<td>
					<input type = "submit" value="등록하기">
				</td>
			</tr>
			<!-- 상세 이미지 -->
			<tr>
				<td colspan="2">
					상세 사진 등록<br>
					<input type="file" id="productDetailImg" name="productDetailImg" size=100 required>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>