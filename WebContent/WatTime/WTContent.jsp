<%@ page language = "java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="script.js"></script>
<link href = "style.css" rel = "stylesheet" type = "text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script><!-- 최신버전 제이쿼리 -->
<!-- 제이쿼리 부분 -->

<script> 
 
//페이지가 로딩될때 함수를 실행합니다

imgslide(); 


function imgslide(){
	
  $val = $("#mainSlide").attr("val"); //현재 이미지 번호를 가져옵니다

  $mx = $("#mainSlide").attr("mx"); //총 이미지 개수를 가져옵니다
  
   
	$("#img"+$val).hide(); //현재 이미지를 사라지게 합니다.

	if( $val == $mx )
		
		{ $val = 1; } //현재이미지가 마지막 번호라면 1번으로 되돌립니다.

	else{ $val++; } //마지막 번호가 아니라면 카운트를 증가시켜줍니다

	$("#img"+$val).fadeIn(400); //변경된 번호의 이미지영역을 나타나게 합니다.괄호 안에 숫자는 페이드인 되는 시간을 나타냅니다.
	
	$("#mainSlide").attr('val',$val); //변경된 이미지영역의 번호를 부여합니다.

	setTimeout('imgslide()',4000); //3초 뒤에 다시 함수를 호출합니다.(숫자값 1000당 1초)

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
</script>
</head>
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
		 	<p id="brandP">Wat Time Content</p>
		 </div>
			 
		 <div id="wattimeContent">
			 <div id="wattimeSale1" class="wattimeSale"><a href="#"><img alt="" src="img/sale1.jpg" width="650px" height="280px"></a></div>					
			 <div id="wattimeSale2" class="wattimeSale"><a href="#"><img alt="" src="img/sale2.jpg" width="650px" height="280px"></a></div> 
		</div>
		<div class="wattimeSubSale" >
			 <div>
				 <p>
					 <a href="#"><img src="img/watch/0231001.jpg" style="width:240px; height:250px;dispaly:block;"> 
					 		<span style="display: block; line-height: 25px; font-size: 13px; text-align: left; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">[카시오[CASIO] ]</span>
					 		<span style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap; display: block; clear: both; line-height: 25px; font-size: 13px; text-align: left;">[카시오시계 CASIO] A158WA-1DF (A158WA-1) / 디지털 공용 메탈시계 32X25mm</span>
					 		<span>
					 			<strong>19,500원</strong>
					 		</span>
					 </a>
				</p>
			 </div>
			  <div >
				 <p>
					 <a href="#"><img src="img/watch/0231001.jpg" style="width:240px; height:250px;dispaly:block;"> 
					 		<span style="display: block; line-height: 25px; font-size: 13px; text-align: left; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">[카시오[CASIO] ]</span>
					 		<span style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap; display: block; clear: both; line-height: 25px; font-size: 13px; text-align: left;">[카시오시계 CASIO] A158WA-1DF (A158WA-1) / 디지털 공용 메탈시계 32X25mm</span>
					 		<span>
					 			<strong>19,500원</strong>
					 		</span>
					 </a>
				</p>
			 </div>
			  <div >
				 <p>
					 <a href="#"><img src="img/watch/0231001.jpg" style="width:240px; height:250px;dispaly:block;"> 
					 		<span style="display: block; line-height: 25px; font-size: 13px; text-align: left; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">[카시오[CASIO] ]</span>
					 		<span style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap; display: block; clear: both; line-height: 25px; font-size: 13px; text-align: left;">[카시오시계 CASIO] A158WA-1DF (A158WA-1) / 디지털 공용 메탈시계 32X25mm</span>
					 		<span>
					 			<strong>19,500원</strong>
					 		</span>
					 </a>
				</p>
			 </div>
			  <div >
				 <p>
					 <a href="#"><img src="img/watch/0231001.jpg" style="width:240px; height:250px;dispaly:block;"> 
					 		<span style="display: block; line-height: 25px; font-size: 13px; text-align: left; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">[카시오[CASIO] ]</span>
					 		<span style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap; display: block; clear: both; line-height: 25px; font-size: 13px; text-align: left;">[카시오시계 CASIO] A158WA-1DF (A158WA-1) / 디지털 공용 메탈시계 32X25mm</span>
					 		<span>
					 			<strong>19,500원</strong>
					 		</span>
					 </a>
				</p>
			 </div>
			  <div ><!-- 여기에 클리어 부스 해야합니다용가리 -->
				 <p>
					 <a href="#"><img src="img/watch/0231001.jpg" style="width:240px; height:250px;dispaly:block;"> 
					 		<span style="display: block; line-height: 25px; font-size: 13px; text-align: left; text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">[카시오[CASIO] ]</span>
					 		<span style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap; display: block; clear: both; line-height: 25px; font-size: 13px; text-align: left;">[카시오시계 CASIO] A158WA-1DF (A158WA-1) / 디지털 공용 메탈시계 32X25mm</span>
					 		<span>
					 			<strong>19,500원</strong>
					 		</span>
					 </a>
				</p>
			 </div>
		</div>

			 
		 <div id ="brandDiv">
		 	<p id="brandP">For Man</p>
		 </div>
			<div id="mainSlideMan">	
				 <div id="slideman1">
					 <ul id="wattimeContentMan" val="1" mx="5">
					 	<li id="wattimeContentM1" class="contentListMan"><a href="#"><img src="img/wattimeContentM1.jpg" alt=""/></a></li>
					 	<li id="wattimeContentM2" class="contentListMan"><a href="#"><img src="img/wattimeContentM2.jpg" alt=""/></a></li>
					 	<li id="wattimeContentM3" class="contentListMan"><a href="#"><img src="img/wattimeContentM3.jpg" alt=""/></a></li>
					 	<li id="wattimeContentM4" class="contentListMan"><a href="#"><img src="img/wattimeContentM4.jpg" alt=""/></a></li>
					 	<li id="wattimeContentM5" class="contentListMan"><a href="#"><img src="img/wattimeContentM5.jpg" alt=""/></a></li>
					 </ul>
				 </div>
	
				 <div id="slideman2">
				 
				 </div>
			</div>
			 
			 <div>
			 <div id="wattimeContentWoman" val="1" mx="5"></div>
			 <div></div>
			 <div></div>
			 <div></div>
			 </div>
	 
	</div>
 </div>
</body>
</html>