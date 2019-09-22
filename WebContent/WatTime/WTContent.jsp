<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.text.*,java.sql.*,javax.sql.*,javax.naming.*,java.util.* ,WatTimePack.*" %>
<%request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="productDTO" class = "WatTimePack.WatTimeProductDTO" scope="page">
	<jsp:setProperty name="productDTO" property="*"/>
</jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href = "style.css" rel = "stylesheet" type = "text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script><!-- 최신버전 제이쿼리 -->


</head>
<%
	DecimalFormat df = new DecimalFormat("#,###");
	List<WatTimeProductDTO> productList = null;
	WatTimeProductDAO productDAO = new WatTimeProductDAO();
	productList = productDAO.getProductMainManList();
%>
<body>
	<div id="content"> 
		<div id="bannerContent">
			<ul id="mainSlide" val="1" mx="5">
				<li id="img1" class="banner"><a href="#"><img src="img/img1.jpg" alt=""/></a></li>
				<li id="img2" class="banner"><a href="#"><img src="img/img2.jpg" alt=""/></a></li>
				<li id="img3" class="banner"><a href="#"><img src="img/img3.jpg" alt=""/></a></li>
				<li id="img4" class="banner"><a href="#"><img src="img/img4.jpg" alt=""/></a></li>
				<li id="img5" class="banner"><a href="#"><img src="img/img5.jpg" alt=""/></a></li>
			</ul>
		</div>

		<div id="midelContent">
			 <div id ="brandDiv">
			 	<p id="brandP">Wat Time Focus</p>
			 </div>
				 
			 <div id="wattimeContent">
				 <div id="wattimeSale1" class="wattimeSale"><a href="#"><img alt="" src="img/sale1.jpg" width="650px" height="280px"></a></div>					
				 <div id="wattimeSale2" class="wattimeSale"><a href="#"><img alt="" src="img/sale2.jpg" width="650px" height="280px"></a></div> 
			</div>
			<div class="wattimeSubSale" >
				 <div>
					 <p>
						 <a href="#"><img src="img/watch/0231001.jpg" style="width:240px; height:250px;dispaly:block;"> 
						 		<span class="mainSpan">[카시오[CASIO] ]</span>
						 		<span class="subSpan">[카시오시계 CASIO] A158WA-1DF (A158WA-1) / 디지털 공용 메탈시계 32X25mm</span>
						 		<span>
						 			<strong>19,500원</strong>
						 		</span>
						 </a>
					</p>
				 </div>
				  <div >
					 <p>
						 <a href="#"><img src="img/watch/0042001.jpg" style="width:240px; height:250px;dispaly:block;"> 
						 		<span class="mainSpan" >[ 게스[GUESS] ]</span>
						 		<span class="subSpan">[게스시계 GUESS] W1009L3 / 여성용 메탈밴드 27mm</span>
						 		<span>
						 			<strong>325,000원</strong>
						 		</span>
						 </a>
					</p>
				 </div>
				  <div >
					 <p>
						 <a href="#"><img src="img/watch/0031001.jpg" style="width:240px; height:250px;dispaly:block;"> 
						 		<span class="mainSpan">[ 가이거[GEIGER] ]</span>
						 		<span class="subSpan" >[가이거시계 GEIGER] GE1180MBS 신상 오토매틱 스켈레톤 42mm 메탈시계</span>
						 		<span>
						 			<strong>89,000원</strong>
						 		</span>
						 </a>
					</p>
				 </div>
				  <div >
					 <p>
						 <a href="#"><img src="img/watch/0251001.jpg" style="width:240px; height:250px;dispaly:block;"> 
						 		<span class="mainSpan">[태그호이어[TAG HUEUR] ]</span>
						 		<span class="subSpan">[태그호이어시계 TAG HUEUR] CAY111A.BA0927 / 디지털 남성 메탈시계 32mm</span>
						 		<span>
						 			<strong>1,537,000원</strong>
						 		</span>
						 </a>
					</p>
				 </div>
				  <div >
					 <p>
						 <a href="#"><img src="img/watch/0301001.jpg" style="width:240px; height:250px;dispaly:block;"> 
						 		<span class="mainSpan">[해밀턴[HAMILTON] ]</span>
						 		<span class="subSpan">[해밀턴시계 HAMILTON] H32405551 / 디지털 남성 가죽시계 32X25mm</span>
						 		<span>
						 			<strong>67,500원</strong>
						 		</span>
						 </a>
					
				 </div>
			</div>
	
			<!-- 남자  -->
			 <div id ="brandDiv">
			 	<p id="brandP">For  Man</p>
			 </div>
			 <div id="mainSlideMan">	
				 <ul id="wattimeContentMan" val="1" mx="5">
				 	<li id="wattimeContentM1" ><a href="#"><img src="img/wattimeContentM1.jpg" class="slideWatch"/></a></li>
				 	<li id="wattimeContentM2" ><a href="#"><img src="img/wattimeContentM2.jpg" class="slideWatch"/></a></li>
				 	<li id="wattimeContentM3" ><a href="#"><img src="img/wattimeContentM3.jpg" class="slideWatch"/></a></li>
				 	<li id="wattimeContentM4" ><a href="#"><img src="img/wattimeContentM4.jpg" class="slideWatch"/></a></li>
				 	<li id="wattimeContentM5" ><a href="#"><img src="img/wattimeContentM5.jpg" class="slideWatch"/></a></li>
				 </ul>
			 </div>
			<div id="slideMan" >
				<ul class="slideManUl">
					<li>
						<div class="slideManForm">
<%
						//productList에 넣은 것을 화면에 1개씩 출력
						for(int i = 0 ; i < productList.size() ; i++){
							productDTO = productList.get(i);
%>	
							<div class="slideManClass">
								<p>
									<a href="#"><img alt="시계사진" src="..\img\brand\<%=productDTO.getProductSimpleImgFileName() %>">
									<br>
									<span>[<%=productDTO.getBrandKor() %>[<%=productDTO.getBrandEng() %>] ]</span>
									<span class="subSpan"><%=productDTO.getProductName() %></span>
							 		<span> 
							 			<strong><%=df.format(productDTO.getProductPrice()) %>원</strong>
							 		</span> 
							 		</a>
								</p>
							</div>
<%
						}
%>
						</div>
					</li>
				</ul>
			</div>
			 <div id ="brandDiv">
			 	<p id="brandP">For Woman</p>
			 </div>
			 <div id="mainSlideWoman">	
				 <ul id="wattimeContentWoman" val="1" mx="4">
				 	<li id="wattimeContentW1" class="contentListWoman"><a href="#"><img src="img/wattimeContentW1.jpg" class="slideWatch"/></a></li>
				 	<li id="wattimeContentW2" class="contentListWoman"><a href="#"><img src="img/wattimeContentW2.jpg" class="slideWatch"/></a></li>
				 	<li id="wattimeContentW3" class="contentListWoman"><a href="#"><img src="img/wattimeContentW3.jpg" class="slideWatch"/></a></li>
				 	<li id="wattimeContentW4" class="contentListWoman"><a href="#"><img src="img/wattimeContentW4.jpg" class="slideWatch"/></a></li>
				 </ul>
			 </div>
			 <div id="slideMan" >
				<ul class="slideManUl">
					<li>
						<div class="slideManForm">
							<div class="slideManClass">
								<p>
									<a href="#"><img alt="시계사진" src="img/watch/0251001.jpg">
									<br>
									<span>[해밀턴[HAMILTON] ]</span>
									<span class="subSpan">[해밀턴시계 HAMILTON] H32405551 / 디지털 남성 가죽시계 32X25mm</span>
							 		<span> 
							 			<strong>67,500원</strong>
							 		</span> 
							 		</a>
								</p>
							</div>
							<div class="slideManClass">
								<p>
									<a href="#"><img alt="시계사진" src="img/watch/0251001.jpg">
									<span>[해밀턴[HAMILTON] ]</span>
									<span class="subSpan">[해밀턴시계 HAMILTON] H32405551 / 디지털 남성 가죽시계 32X25mm</span>
							 		<span>
							 			<strong>67,500원</strong>
							 		</span>
							 		</a>
								</p>
							</div>
							<div class="slideManClass">
								<p>
									<a href="#"><img alt="시계사진" src="img/watch/0251001.jpg">
									<span>[해밀턴[HAMILTON] ]</span>
									<span class="subSpan">[해밀턴시계 HAMILTON] H32405551 / 디지털 남성 가죽시계 32X25mm</span>
							 		<span>
							 			<strong>67,500원</strong>
							 		</span>
							 		</a>
								</p>
							</div>
							<div class="slideManClass">
								<p>
									<a href="#"><img alt="시계사진" src="img/watch/0251001.jpg">
										<span>[해밀턴[HAMILTON] ]</span>	
										<span class="subSpan">[해밀턴시계 HAMILTON] H32405551 / 디지털 남성 가죽시계 32X25mm</span>
								 		<span>
								 			<strong>67,500원</strong>
								 		</span>
							 		</a>
								</p>
							</div>
							<div class="slideManClass">
								<p>
									<a href="#"><img alt="시계사진" src="img/watch/0251001.jpg">
									<span>[해밀턴[HAMILTON] ]</span>
									<span class="subSpan">[해밀턴시계 HAMILTON] H32405551 / 디지털 남성 가죽시계 32X25mm</span>
							 		<span>
							 			<strong>67,500원</strong>
							 		</span>
							 		</a>
								</p>
							</div>
							<div class="slideManClass">
								<p>
									<a href="#"><img alt="시계사진" src="img/watch/0251001.jpg">
									<span>[해밀턴[HAMILTON] ]</span>
									<span class="subSpan">[해밀턴시계 HAMILTON] H32405551 / 디지털 남성 가죽시계 32X25mm</span>
							 		<span>
							 			<strong>67,500원</strong>
							 		</span>
							 		</a>
								</p>
							</div>
							<div class="slideManClass">
								<p>
									<a href="#"><img alt="시계사진" src="img/watch/0251001.jpg">
									<span>[해밀턴[HAMILTON] ]</span>
									<span class="subSpan">[해밀턴시계 HAMILTON] H32405551 / 디지털 남성 가죽시계 32X25mm</span>
							 		<span>
							 			<strong>67,500원</strong>
							 		</span>
							 		</a>
								</p>
							</div>
							<div class="slideManClass">
								<p>
									<a href="#"><img alt="시계사진" src="img/watch/0251001.jpg">
									<span>[해밀턴[HAMILTON] ]</span>
									<span class="subSpan">[해밀턴시계 HAMILTON] H32405551 / 디지털 남성 가죽시계 32X25mm</span>
							 		<span>
							 			<strong>67,500원</strong>
							 		</span>
							 		</a>
								</p>
							</div>
						</div>
					</li>
				</ul>
			</div>
	 </div>
	 </div>
<!-- 제이쿼리 부분 -->

<script> 
 
//페이지가 로딩될때 함수를 실행합니다.

 imgslide(); 
function imgslide(){
	$val = $("#mainSlide").attr("val"); //현재 이미지 번호를 가져옵니다
	$mx = $("#mainSlide").attr("mx"); //총 이미지 개수를 가져옵니다
	$("#img"+$val).hide(); //현재 이미지를 사라지게 합니다.
	if( $val == $mx ){
		$val = 1;
	} //현재이미지가 마지막 번호라면 1번으로 되돌립니다.
	else{
		$val++;
	} //마지막 번호가 아니라면 카운트를 증가시켜줍니다
	$("#img"+$val).fadeIn(400); //변경된 번호의 이미지영역을 나타나게 합니다.괄호 안에 숫자는 페이드인 되는 시간을 나타냅니다.
	$("#mainSlide").attr('val',$val); //변경된 이미지영역의 번호를 부여합니다.
	setTimeout('imgslide()',3000); //4초 뒤에 다시 함수를 호출합니다.(숫자값 1000당 1초)
	return 0;
}

wattimeContentMan(); 
function wattimeContentMan(){
  $val = $("#wattimeContentMan").attr("val"); //현재 이미지 번호를 가져옵니다
  $mx = $("#wattimeContentMan").attr("mx"); //총 이미지 개수를 가져옵니다
	$("#wattimeContentM"+$val).hide(); //현재 이미지를 사라지게 합니다.
	if( $val == $mx )
		
		{ $val = 1; } //현재이미지가 마지막 번호라면 1번으로 되돌립니다.

	else{ $val++; } //마지막 번호가 아니라면 카운트를 증가시켜줍니다

	$("#wattimeContentM"+$val).fadeIn(400); //변경된 번호의 이미지영역을 나타나게 합니다.괄호 안에 숫자는 페이드인 되는 시간을 나타냅니다.
	
	$("#wattimeContentMan").attr('val',$val); //변경된 이미지영역의 번호를 부여합니다.

	setTimeout('wattimeContentMan()',6000); //6초 뒤에 다시 함수를 호출합니다.(숫자값 1000당 1초)

}

wattimeContentWoman(); 

function wattimeContentWoman(){
	
  $val = $("#wattimeContentWoman").attr("val"); //현재 이미지 번호를 가져옵니다

  $mx = $("#wattimeContentWoman").attr("mx"); //총 이미지 개수를 가져옵니다
  
   
	$("#wattimeContentW"+$val).hide(); //현재 이미지를 사라지게 합니다.

	if( $val == $mx )
		
		{ $val = 1; } //현재이미지가 마지막 번호라면 1번으로 되돌립니다.

	else{ $val++; } //마지막 번호가 아니라면 카운트를 증가시켜줍니다

	$("#wattimeContentW"+$val).fadeIn(400); //변경된 번호의 이미지영역을 나타나게 합니다.괄호 안에 숫자는 페이드인 되는 시간을 나타냅니다.
	
	$("#wattimeContentWoman").attr('val',$val); //변경된 이미지영역의 번호를 부여합니다.

	setTimeout('wattimeContentWoman()',6000); //6초 뒤에 다시 함수를 호출합니다.(숫자값 1000당 1초)

}
</script>
</body>
</html>