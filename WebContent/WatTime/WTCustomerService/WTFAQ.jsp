<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href = "style.css	" rel = "stylesheet" type = "text/css">
<script language = "JavaScript" src = "WTCustomerService/js/WTFAQ.js"></script>
</head>
<body>
	
	<div style="line-height: 90px;margin:30px auto;width:1300px;font-size:50px;height:90px;font-family: 'Roboto', sans-serif;/* border-top:1px solid gray; */border-bottom:1px solid gray;">
		<div id="faqMainBar">FAQ </div>
		<div id="faqMainBar" class="faqBar">
			<input type="button" id="faq" name="faq" value="FAQ" onclick="FAQPage()">
			<input type="button" id="notice" name="notice" value="공지사항" onclick="noticePage()">
			<input type="button" id="review" name="review" value="구매후기" onclick="reviewPage()">
		</div>
	</div>
	<div class="tab_area">
    <ul class="tab">
      <li><a href="#panel1" class="">자주묻는질문</a></li>
      <li><a href="#panel2" class="">주문/결제</a></li>
      <li><a href="#panel3" class="">배송문의</a></li>
      <li><a href="#panel4" class="">교환반품</a></li>
      <li><a href="#panel5" class="">변경/취소</a></li>
      
      <li><a href="#panel6" class="">회원/적립금/쿠폰</a></li>
      <li><a href="#panel7" class="">A/S</a></li>
      <li><a href="#panel8" class="">상품문의</a></li>
    </ul>
    <!-- 자주묻는질문 -->
    <div class="panel" id="panel1">
      <dl>
        <dt> <font color="red" size="5">Q.</font> WatTime ! 정품 맞나요?</dt>
        <dd style="display: none;"> 저희 WatTime에서는 2010년 시작으로 단 1건의 위조상품(가품)을 취급하거나 판매하지 않은 100% 진품만을 판매하고 있습니다.
          
          WatTime는 '정확한 정품을 합리적인 가격과 고객을 만족시킬 수 있는 서비스로 맞이하자' 라는 초심으로 성장을 해왔습니다.
          
          현재 국내본사정품과 병행상품 모두 취급을 하고 있으며, 병행수입상품(직수입상품) 경우 해외로부터 한국 본사를 통하지 않고 저희가 직접 수입하고있습니다.
          
          저희는 특정 브랜드의 국내외 가격의 폭이 너무 높을 경우,
          병행수입(직수입)을 진행하면서 정확한 정품을 소비자가 보다 저렴하고 합리적으로 구매할 수 있도록 유통 구조를 최소화하는데 최선을 다하고있습니다.
          병행수입상품 경우 국내본사가 아닌 해외본사 혹은 해외 타국 본사로부터 물품을 수입하므로 몇몇 브랜드는 국내본사에서 AS접수가 불가능하며, 저희 WatTime 측으로 AS진행이 가능합니다.
          AS경우 저희측으로 접수를 주시면 국내자체 AS센터와 한국시계협동조합의 정식AS 서비스를 통해 소비자들에게 빠르고, 확실하고, 합리적으로 AS 서비스를 진행하고 있습니다. <span> * WatTime에서 판매하는 한국 본사를 상품경우 백화점 및 한국 본사를 통해 동일하게 AS진행이 가능합니다.
          
          저희 WatTime는 항상 100% 진품만을 판매 드리고있으며, 온라인 시계 판매업체 1위 쇼핑몰인 만큼 안심하시고 구매하실 수 있도록 최선을 다하겠습니다. </span> </dd>
        <dt><font color="red" size="5">Q.</font> 병행수입 상품이 무엇인가요?</dt>
        <dd style="display: none;">병행수입이란 "국내 독점 판매권을 갖고 있는 공식 수입업체가 아닌 일반 수입업자가 다른 유통경로를 거쳐 국내로 들여오는 것. 정부는 수입 공산품의 가격 인하를 유도하기 위해 1995년 11월부터 일부 예외규정을 두고 병행수입(그레이임포트)을 허용했다." 라고 네이버 사전에 명시가 되어있습니다.
          
          쉽게 말해, 해외브랜드 상품을 한국 공식 수입업체만 수입해서 판매할 경우 가격독점으로 인해 폭리 및 시장독점을 막기위해 해외에서는 일찍이 병행수입을 권장하고 있습니다
          국내 정부 역시 2000년후반 이후로 소비자들의 피해를 막기위해 병행수입을 권장하며 장려하는 법안들이 마련되고 있습니다.
          
          저희 WatTime에서는 국내본사정품과 병행상품 모두 취급을 하고 있으며, 병행수입상품(직수입상품) 경우 해외로부터 한국 본사를 통하지 않고 저희가 직접 수입하고있습니다.
          저희는 특정 브랜드의 국내외 가격의 폭이 너무 높을 경우,
          병행수입(직수입)을 진행하면서 정확한 정품을 소비자가 보다 저렴하고 합리적으로 구매할 수 있도록 유통 구조를 최소화하는데 최선을 다하고있습니다.
          병행수입상품 경우 국내본사가 아닌 해외본사 혹은 해외 타국 본사로부터 물품을 수입하므로 몇몇 브랜드는 국내본사에서 AS접수가 불가능하며, 저희 WatTime 측으로 AS진행이 가능합니다.
          AS경우 저희측으로 접수를 주시면 국내자체 AS센터와 한국시계협동조합의 정식AS 서비스를 통해 소비자들에게 빠르고, 확실하고, 합리적으로 AS 서비스를 진행하고 있습니다. <span> * WatTime에서 판매하는 한국 본사를 상품경우 백화점 및 한국 본사를 통해 동일하게 AS진행이 가능합니다.
          
          저희 WatTime는 항상 100% 진품만을 판매 드리고있으며, 온라인 시계 판매업체 1위 쇼핑몰인 만큼 안심하시고 구매하실 수 있도록 최선을 다하겠습니다.
          감사합니다^^ </span> </dd>
        <!--dt>WatTime는 왜 전화연결이 불가능한가요?</dt>
        <dd style="display: none;"> 안녕하세요 WatTime입니다.
          저희 WatTime는 많은 고객님들의 많은 통화량으로 오히려 고객님들에게 안내지연에 불편을 드림을 최소화하고자
          고객님들의 모든 문의를 게시판을 통해서 처리해드리고 있습니다.
          
          궁금하신 내용을 해당 게시판으로 문의주시면 30분 이내에 안내드리는 서비스를 진행하고 있습니다.
          (평일 12:30~13:40 까지는 점심시간으로 게시판 답변처리가 불가합니다.)
          
          항상 최선을 다해 고객님들에 불편을 최소화하고자 노력하는 WatTime가 되겠습니다.-^^ <span></span> </dd-->
        <dt><font color="red" size="5">Q.</font>품절안내를 받았는데 어떻게 해야할까요?</dt>
        <dd style="display: none;"> 안녕하세요 WatTime입니다
          
          먼저 이용에 불편을 드려 죄송합니다. 
          
          현재 고객님께서 주문해주신 제품 재고가 모두 소진이되어 발송이 불가능한 경우,
          상담원과의 상담을 통해 상품교환, 환불, 입고 시까지 대기 등 고객님께서 원하시는 방향으로 업무진행을 도와드리고 있습니다.
          
          1:1 문의 게시판을 통해 빠른처리 진행할 수 있도록 최선을 다하겠습니다.
          
          감사합니다~ <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>시계 사용 설명서가 없는데 어떻게 사용하나요?</dt>
        <dd style="display: none;"> 안녕하세요 WatTime입니다^^ 한글 설명서를 요청주시는 고객님들을 위해 자료실 게시판으로 업로드 중에 있습니다.                 
        하단의 링크를 통하여 자료실로 이동하시면 원하시는 한글 설명서 다운로드가 가능합니다.                 
        자료실에서 확인되지 않는 제품의 경우 게시판으로 고객님의 이메일 주소와 함께 문의 주시면 메일로 첨부 드리고 있습니다.  <br>                
        <span><a href="/board/board.html?code=timemecca_board11" style="color:red;">자료실 바로가기</a>  </span> </dd>
      </dl>
    </div>
    <!--// 자주묻는질문 //--> 
    
    <!-- 주문,결제 -->
    <div class="panel" id="panel2" style="display: none;">
      <dl>
        <dt><font color="red" size="5">Q.</font>상품을 직접 방문하여 구매 할 수는 없나요?</dt>
        <dd style="display: none;"> WatTime는 직영 오프라인을 운영하지 않으며, 최적의 판매가격 측정을 위해 온라인몰에 집중하고 있습니다.<br>
          상품은 운영사무실이 아닌 물류창고나 브랜드본사에 보관되어 있기 때문에 방문 구매가 불가한 점 양해 부탁드립니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>전화주문 가능한가요?</dt>
        <dd style="display: none;"> WatTime는 모든 상담을 빠르게 처리하기 위해 1:1 상담게시판으로 운영되어 전화연결이 불가합니다.<br>
          회원가입이 번거로우실 경우 비회원 구매도 가능하오니<br>
          [구매하실 상품 클릭 후 바로 구매 &gt; 로그인 창 밑의 비회원 구매하기 &gt; *표시가 있는 부분 모두 기재 &gt; 결제수단 선택 &gt; 구매 진행 동의 체크 &gt; 결제하기] 경로 통하여 구매 부탁드립니다.<br>
          <br>
          *도저히 컴퓨터나 모바일에 구매가 어려우신 분께서는 문의게시판 밑 카카오톡 상담으로 연락처를 남겨주시면 회신드릴 수 있도록 진행하겠습니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>기본 배송지 변경은 어떻게 하나요?</dt>
        <dd style="display: none;"> 상품 발송전 변경&amp;취소 게시판으로 문의하시면 변경 드릴 수 있습니다. 이미 배송이 시작된 후로는 변경이 불가한 점 안내드립니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>무이자 할부 가능 카드는 어떤 것이 있나요? </dt>
        <dd style="display: none;"> 주문페이지 또는 공지사항을 통해 무이자 할부 서비스 중인 신용카드사를 확인하실 수 있습니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>현금영수증&amp;세금계산서 신청은 어떻게 하나요? </dt>
        <dd style="display: none;"> * 현금영수증<br>
          상품 수령 후 구매완료 시 상품문의 게시판에 고객님 성함과 주문번호, 현금영수증 신청하실 번호를 기재해주시면 보다 빠른 처리 도와드리겠습니다.<br>
          <br>
          *세금계산서<br>
          세금 계산서는 발행이 불가합니다. 현금으로 결제 시 지출 증빙을 위해서 현금영수증을 발행해 드립니다.<br>
          매입세액공제를 받으시길 원하는 경우, 지출증빙용으로 현금영수증을 신청하시기 바랍니다.<br>
          현금영수증 신청 시 타인의 정보(핸드폰 번호, 사업자 번호)를 입력한 후 발급이 가능합니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>주문내역은 어디서 확인하나요? </dt>
        <dd style="display: none;"> 사이트 상단 우측 마이페이지 누르시면 조회가 가능합니다. 회원이실 경우 로그인 후 조회하시고, 비회원이실 경우 주문번호, 고객님 성함, 비밀번호 기재하시면 확인 가능합니다.<br>
          주문번호가 기억나지 않는 경우엔 게시판으로 문의해주시면 답변 도와드리겠습니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>무통장 입금으로 주문했습니다. 언제까지 입금해야 하나요?</dt>
        <dd style="display: none;"> 재고가 있는 상품의 경우 익일 오후 2시 이전에 결제 확인까지 진행 주셔야 합니다. (최장 장바구니 내에서는 7일간 가능합니다)<br>
          무통장 입금의 경우 은행 자동 업데이트 1~2시간 후 확인될 수 있으므로 11시~12시까지는 입금 주셔야 합니다.<br>
          또한 구매하실 때 기재한 예금주 성함과 입금하셨을 때 예금주 성함이 다를 경우 입금 처리가 지연될 수 있는 점 안내드립니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>신용카드 결제 후, 할부 개월 수를 변경할 수 있나요? </dt>
        <dd style="display: none;"> 신용카드 결제 완료 건에 대해서 카드/할부 개월 수 등의 결제정보 변경이 불가하므로 신중히 결제해 주시기 바랍니다.<br>
          카드 결제 정보 변경을 원하실 경우에는 주문취소 후, 재 주문을 해 주셔야 합니다. 취소 후 재 주문 시 사용하였던 쿠폰의 재 발행이 불가하며 이벤트 혜택이 변동될 수 있습니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>결제수단을 변경할 수 있나요?</dt>
        <dd style="display: none;"> 결제가 완료된 주문 건에 대한 결제정보 변경은 불가합니다. 결제수단의 변경을 원하시는 경우, 기존 주문 건을 취소하신 후 새로 주문해 주셔야 합니다.<br> 
          취소 후 재 주문 시 사용하였던 쿠폰의 재 발행이 불가하며 이벤트 혜택이 변동될 수 있습니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>한 주문 건에 여러 가지 결제수단을 이용할 수 있나요? </dt>
        <dd style="display: none;"> 분할결제의 경우 상품문의를 통하여 남겨주시면 보다 빠른 처리 도와드릴 수 있습니다.<br>
          구매하실 상품의 모델명과 분할결제할 금액 말씀 주시면 고객님의 성함으로 개인 결제창 열어드리고 있습니다.<br>
          검색창에 '개인결제창' 또는 고객님 성함으로 검색하시면 확인 가능합니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>주문한 상품이 품절일 경우 어떻게 되나요?</dt>
        <dd style="display: none;"> 교환/환불 중 요청하시는 처리 방법을 게시판에 남겨 주시면 보다 빠른 처리 도와드릴 수 있습니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>판매가 종료된 상품을 다시 구매할 수 있나요?</dt>
        <dd style="display: none;"> 판매가 종료되어 품절로 확인되는 상품들은 상품문의 게시판에 모델명과 함께 문의하시면 재입고 예정 확인 후 안내 드릴 수 있으며, <br>
          상품 판매가 옆의 재입고 SMS 알림 설정해주시면 입고시 SMS로 안내받으실 수 있습니다. <span></span> </dd>
      </dl>
    </div>
    <!--// 주문,결제 //--> 
    
    <!-- 배송조회 -->
    <div class="panel" id="panel3" style="display: none;">
      <dl>
        <dt><font color="red" size="5">Q.</font>주문 시 배송일은 언제인가요? </dt>
        <dd style="display: none;"> 모델명과 함께 1:1 문의 게시판으로 문의를 주시면 보다 정확한 안내 드릴 수 있습니다.<br>
          재고가 있는 상품의 경우 오후 2시 이전에 입금 확인될 경우 당일, 이후엔 익일 출고됩니다. 수령일은 택배사의 사정에 따라 2~3일 더 소요될 수 있습니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>상품을 직접 방문하여 수령할 수는 없나요?</dt>
        <dd style="display: none;"> WatTime는 직영 오프라인을 운영하지 않으며, 최적의 판매가격 측정을 위해 온라인몰에 집중하고 있습니다.<br>
          상품은 운영사무실이 아닌 물류창고나 브랜드본사에 보관되어 있기 때문에 방문 수령이 불가한 점 양해 부탁드립니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>퀵서비스 가능 한가요?</dt>
        <dd style="display: none;"> 상품마다 퀵서비스 가능 여부가 달라지기 때문에 모델명과 함께 게시판으로 문의주시면 답변 도와드릴 수 있습니다.<br>
          퀵서비스는 착불로만 발송되며 서울~경기도 지역에 한하여 발송됩니다.<br>
          퀵서비스가 가능한 제품일 경우 결제 후 바로 게시판에 요청 주셔야 택배로 발송되기 전에 퀵으로 발송되는 점 참고 부탁드립니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>배송조회는 어떻게 하면 되나요?</dt>
        <dd style="display: none;"> 주문조회에서 확인되는 송장번호 또는 안내 받으시는 송장번호를 해당 택배사에서 배송조회 클릭 후 송장번호 기입하시면 조회 가능합니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>비회원으로 주문했는데 배송조회는 어떻게 하나요?</dt>
        <dd style="display: none;"> 비회원이실 경우 페이지 우측 상단 [마이페이지] 클릭 후 주문번호, 주문자 성함, 비밀번호를 기재하시면 확인 가능합니다.<br>
          이후 고객님의 주문 건의 배송조회가 가능합니다. 문자로 발송되는 송장번호로도 조회 가능합니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>운송장 번호 조회가 안돼요.</dt>
        <dd style="display: none;"> 송장번호는 발송이 시작된 당일 오후 10시 이후부터 가능합니다.<br>
          이후에도 조회가 되지 않을 경우에는 1:1 게시판으로 문의하시면 보다 정확한 안내 드릴 수 있습니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>택배사 정보를 알고 싶습니다.</dt>
        <dd style="display: none;"> WatTime에서 보유하고 있는 상품의 경우 CJ 대한통운 택배사를 이용하고 있습니다.<br>
          본사 측에서 별도 발송되는 상품의 경우에는 타 택배사를 이용할 수 있으며, CJ 대한통운 택배로 조회가 되지 않으실 경우 1:1 게시판으로 문의하시면 보다 정확한 안내 드릴 수 있습니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>보호필름을 시계랑 시켰는데 안 왔는데 어떻게 해야 되나요?</dt>
        <dd style="display: none;"> 보호필름의 경우 본사에서 직발송 도와드리고 있습니다. 평균 제품 수령 후 1~2일 내에 보호필름을 수령하실 수 있습니다.<br>
          기간이 지난 후에도 수령하지 못하신 경우 게시판으로 문의주시면 확인 후 처리 드리겠습니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>선물을 하려고 합니다. 포장도 가능한가요?</dt>
        <dd style="display: none;"> 상품은 물류창고 또는 본사 측에서 발송되어 상품 포장 서비스는 불가한 점 양해 부탁드립니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>상품을 구매했는데 일부만 배송되었어요.</dt>
        <dd style="display: none;"> 일부 상품이 품절 또는 입고 예정이거나 본사 측에서 따로 출고되는 상품이어서 부분 배송 발송될 수 있습니다. 1:1 게시판으로 문의하시면 보다 정확한 안내 드릴 수 있습니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>배송 중에 배송정보를 변경할 수 있나요? </dt>
        <dd style="display: none;"> 배송이 시작된 후로는 기사님께서 상품을 인수해간 이후기 때문에 배송정보를 변경할 수 없습니다.<br>
          중요사항을 입력하지 못하여 배송받지 못할 상황이라면 택배사로 문의하시거나 저희 쪽으로 상품이 반송된 후 재발송 가능합니다.<br>
          반송 후 재발송 요청 시에는 택배비용을 지불해주셔야 합니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>무료배송 기준과 배송료는 얼마인가요?</dt>
        <dd style="display: none;"> 실 결제금액(할인 적용 후 구매금액)이 십만 원 이상의 경우 무료배송입니다.<br>
          십만 원 미만일 경우&nbsp; 3,000원의 배송비가 결제금액에 포함되어 결제됩니다. 도서지역의 경우 배송비가 추가로 결재됩니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>해외 배송이 되나요?</dt>
        <dd style="display: none;"> WatTime는 해외 배송 서비스를 지원하지 않고 있는 점 양해 부탁드립니다.<br>
          국내 배송은 재고가 있는 상품의 경우 2시까지 결제 확인건에 한하여 당일 발송됩니다. <span></span> </dd>
      </dl>
    </div>
    <!-- // 배송조회 //--> 
    
    <!-- 교환반품 -->
    <div class="panel" id="panel4" style="display: none;">
      <dl>
        <dt><font color="red" size="5">Q.</font>제품은 받았는데 맘에 들지않아 반품을 원하시는 고객님(처리방법과 소요기간)</dt>
        <dd style="display: none;"> 안녕하세요 WatTime입니다.^-^
          
          - 처리방법 -
          받으신 교환/반품 봉투에 성함과 연락처, 반품사유를 기재해주시고,<br>
          6천원을 동봉하여 CJ 대한통운 택배 반품회수접수를 통해 제품을 보내주시면 되겠습니다.<br>
          반품 시 받으신 구성품에 훼손없이 모든 구성품/사은품을 보내주셔야 금액 차감없이 환불이 가능합니다.<br>
          <br>
          타 택배사 이용시에는 봉투에 동일하게 기재 후 배송비를 선불로 결제하시고 3천원(최초 발송비)를 동봉하여 발송해주시면 되겠습니다.<br>
          <br>
          -소요기간-<br>
          당사에서 제품수령 후 상품과 구성품/사은품 이상을 검수 후 진행을 도와드리고 있습니다.<br>
          제품수령 후 2~3일 이내 검수 후 고객님께 연락을 드린 뒤 반품/환불 처리를 진행하고 있습니다.<br>
          제품과 택&amp;구성품에는 오염 및 훼손이 없어야 업무처리가 빠르게 진행됩니다.<br>
          <br>
          업무량에 따라 기간이 3~5일 지연 될 수 있을 수 있으니 이 점 양해 부탁드립니다.<br>
          착용감이 있거나 상품이 훼손된 경우 등 반품이 불가할 수 있으니 주문하신 상품 상세 페이지 참고 부탁드립니다.
          감사합니다~ <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>제품받았는데 오작동, 불량으로 반품하고 싶어요. (방법과 소요기간)</dt>
        <dd style="display: none;"> 안녕하세요 WatTime입니다.^-^<br>
          <br>
          제품수령 후 오작동 및 제품불량으로 반품을 원하실 경우<br>
          <br>
          - 처리방법 -<br>
          받으신 교환/반품 봉투에 성함과 연락처, 반품사유를 기재해주시고,<br>
          CJ 대한통운 택배 반품회수접수를 통해 제품을 보내주시면 되겠습니다.<br>
          반품 시 받으신 구성품에 훼손없이 모든 구성품/사은품을 보내주셔야 금액 차감없이 환불이 가능합니다.<br>
          타 택배사 이용시에는 봉투에 동일하게 기재 후 착불로 보내주시면 동일하게 처리가 가능합니다.<br>
          <br>
          -소요기간-<br>
          당사에서 제품수령 후 상품과 구성품/사은품 이상을 검수 후 진행을 도와드리고 있습니다.<br>
          제품수령 후 2~3일 이내 검수 후 고객님께 연락을 드린 뒤 반품/환불 처리를 진행하고 있습니다.<br>
          제품과 택&amp;구성품에는 오염 및 훼손이 없어야 업무처리가 빠르게 진행됩니다.<br>
          업무량에 따라 기간이 3~5일 지연 될 수 있을 수 있으니 이 점 양해 부탁드립니다.
          
          감사합니다^-^ <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>주문한 상품이랑 다른 물건이 왔어요</dt>
        <dd style="display: none;"> 우선 이용 불편 드려 정말 죄송합니다.<br>
          제품 받으신 그대로 WatTime 하단의 주소에 착불로, 사유와 요청 바라시는 처리 방법 기재해서 보내주시면 확인 후에 처리 진행 드리겠습니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>교환/반품 시 배송비는 부담은 누가 하나요?</dt>
        <dd style="display: none;"> 단순 변심, 배송 주소지 오류로 반송된 경우 등 상품의 문제가 아닌 경우에는 고객님께서 왕복 배송비를 부담하셔야 합니다.<br>
          3,000원 동봉하신 후, 편하신 택배사 이용하셔서 선불로 보내주시면 됩니다.<br>
          오배송, 상품의 파손, 상세정보와 다른 경우 등 고객님의 과실이 아닐 경우 타임 메카에서 배송비를 부담하며 편하신 택배사 이용하셔서 착불로 보내주시면 됩니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>반품 접수 후 반품 상품을 보냈는데 아직 카드 취소가 되지 않았어요. </dt>
        <dd style="display: none;"> 반품 후 카드 취소가 되지 않았을 경우에는 다음과 같은 사유가 있을 수 있습니다.<br>
          1. 신용카드 승인 취소 처리기간 소요 반품 상품의 회수 후 3영업일 이내 주문취소 처리되며, 카드사에 따라 승인 취소 처리까지 영업일 기준 4 - 5일이 소요될 수 있습니다.<br>
          2. 회수 확인이 정상적으로 되지 않아 결제 취소가 되지 않은 경우 (1:1문의하기) -(교환 및 반품 문의) 게시판에 문의를 주시면 상세히 안내해 드리도록 하겠습니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>배송비를 동봉하지 못했는데 어떻게 해야 하나요?</dt>
        <dd style="display: none;"> 배송비를 동봉해주시면 좀 더 빠른 처리가 가능합니다.<br>
          동봉하지 못하셨을 경우 아래 계좌로 입금해주시면 입금 확인 후 진행하겠습니다.<br>
          국민은행 489701-01-563229 (주)트랜드메카 / 왕복 배송비 6,000원 <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>반품하고 싶은데 택배기사님이 가져가시나요?</dt>
        <dd style="display: none;"> 택배사의 회수를 원하시면 게시판에 신청 부탁드리며 신청해주신 고객님의 상품은 CJ 대한통운 택배 측에 회수 접수 도와드리겠습니다.<br>
          1~2일 정도 소요되며 택배기사님 방문 시 받으신 상태 그대로 구성품 누락 없이 포장하여, 편지 봉투 형식의 주문서에 내용 기재 후 안쪽에 왕복 배송비 6,000원 동봉하여<br>
          제품 보내주시면 확인 후 처리 도와드리도록 하겠습니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>반품이나 교환은 언제까지 가능한가요?</dt>
        <dd style="display: none;"> 배달 완료된 날짜로부터 7일 이내에 교환/반품 신청 및 상품을 다시 보내주시면 됩니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>반품 기간은 어떻게 되나요?</dt>
        <dd style="display: none;"> 제품 수령 후 2~3일 이내 검수 후에 고객님께 연락을 드려 반품 진행을 도와드리고 있습니다.<br>
          제품에 흠집과 택 및 구성품 훼손이 없어야 가능합니다.<br>
          원활한 진행을 위해 택배비 동봉 부탁드리며, 입고되는 수량에 따라 처리기간이 지연될 수 있는 점 양해 부탁드리겠습니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>상품의 포장을 훼손했는데 반품할 수 있나요?</dt>
        <dd style="display: none;"> 상품의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 반품이 가능합니다.<br>
          ※단, 상품 포장 자체를 상품의 가치 중 하나로 인정받는 상품일 때는 상품 포장을 훼손했을 경우 구매자의 단순 변심에 의한 반품은 불가합니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>상품 수령후 교환하고 싶어요~</dt>
        <dd style="display: none;"> 받으신 상태 그대로 구성품 누락 없이 저희 타임 메카 사이트 하단 주소로 보내주세요!<br>
          제품과 함께 보내드린 주문서에 주문자분 성함, 연락처, 교환 상품 기재하여 주문서 안쪽에 3,000원 동봉하신 후, 편하신 택배사 이용하셔서 선불로 보내주시면 됩니다.<br>
          착용감이 있거나 상품이 훼손된 경우 등 교환이 불가할 수 있으니 자세한 내용은 주문하신 상품 상세 페이지 참고 부탁드립니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>새 상품과 맞교환이 가능한가요?</dt>
        <dd style="display: none;"> 수령하셨던 제품의 상태를 체크한 후에 교환 진행이 가능하기 때문에 맞교환은 불가한 점 양해 부탁드립니다.<br>
          상품 보내주시면 검수 후에 빠르게 진행 도와드리겠습니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>교환 신청을 취소하고 싶어요</dt>
        <dd style="display: none;"> 교환 신청 취소는 1:1문의로 글 남겨주시면 확인 후 안내해드리도록 하겠습니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>교환 기간은 어떻게 되나요?</dt>
        <dd style="display: none;"> 제품 수령 후 2~3일 이내 검수 후에 고객님께 연락을 드려 교환 진행을 도와드리고 있습니다. 제품에 흠집과 택 및 구성품 훼손이 없어야 가능합니다.<br>
          원활한 진행을 위해 택배비 동봉 부탁드리며, 입고되는 수량에 따라 처리기간이 지연될 수 있는 점 양해 부탁드리겠습니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>교환한 상품 다시 교환 가능한가요?</dt>
        <dd style="display: none;"> 단순 변심 등 상품의 문제가 아닌 경우 상품의 훼손 없이 보내주시면 가능하며 고객님이 배송비를 부담하셔야 합니다.<br>
          구성품 누락 없이 원하시는 상품 내용 기재 후 3,000원 동봉하신 후, 편하신 택배사 이용하셔서 선불로 보내주시면 됩니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>교환할 상품이 품절됐는데 어떻게 해야 하나요?</dt>
        <dd style="display: none;"> 품절로 교환이 어려울 경우 반품으로 진행되며 교환 배송비로 보내주신 비용은 반품 배송비로 처리됩니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>상품 보냈는데 배달 완료라고 떴습니다. 언제 처리되나요?</dt>
        <dd style="display: none;"> 반품 상품 입고시 검수, 처리 완료되는데 1~2일 정도 소요되며 배달 완료로 송장 조회되어도 사무실로 입고되기까지 며칠 더 소요될 수 있습니다.<br>
          보내주신 송장 번호 게시판에 남겨주시면 좀 더 정확한 안내 도와드리겠습니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>반품할 때 배송비는 누가 부담하나요?</dt>
        <dd style="display: none;"> 단순 변심, 배송 주소지 오류로 반송된 경우 등 상품의 문제가 아닌 경우에는 고객님이 왕복 배송비를 부담하셔야 합니다.<br>
          3,000원 동봉하신 후, 편하신 택배사 이용하셔서 선불로 보내주시면 됩니다.<br>
          오배송, 상품의 파손, 상세정보와 다른 경우 등 고객님의 과실이 아닐 경우 타임 메카에서 배송비를 부담하며 편하신 택배사 이용하셔서 착불로 보내주시면 됩니다. <span></span> </dd>      
      </dl>
    </div>
    <!--// 교환반품 //--> 
    
    <!-- 변경,취소 -->
    <div class="panel" id="panel5" style="display: none;">
      <dl>
        <dt><font color="red" size="5">Q.</font>주문을 취소하고 싶어요.</dt>
        <dd style="display: none;"> 주문 취소의 경우 "MY PAGE &gt; 쇼핑 정보 &gt; 주문/배송" 메뉴에서 주문 상태가 "입금 대기" 이거나 "결제 완료"일 경우 온라인에서 즉시 주문취소가 가능하며,<br>
          주문 상태가 "상품 준비 중 또는 배송준비중"인 경우 변경&amp;취소 게시판으로 주문취소가 가능한지 문의해 주시기 바랍니다.<br>
          상품이 이미 준비되어 택배기사에게 전달된 경우 상품을 정상적으로 수령한 후 반품 신청을 하셔야 합니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>주문취소 신청 버튼이 보이지 않아요</dt>
        <dd style="display: none;"> 주문 후 입금 처리가 완료된 경우, [주문취소] 버튼이 보이지 않습니다. 주문 상태가 "상품 준비 중" 또는 "배송 준비 중"인 경우, <br>
          게시판으로 주문 취소가 가능한지 문의해 주시기 바랍니다. 상품이 이미 발송이 된 경우, 상품을 정상적으로 수령한 후, 반품을 하셔야 합니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>배송전 교환하고 싶어요~</dt>
        <dd style="display: none;"> 주문 상태가 배송 중이 아닌 경우 게시판으로 교환하실 제품명과 함께 문의해 주시기 바랍니다.<br>
          상품이 이미 준비되어 택배기사에게 전달된 경우 상품을 정상적으로 수령한 후 교환 신청을 하셔야 합니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>상품이 배송 중인데, 취소할 수 있나요?</dt>
        <dd style="display: none;"> 배송이 시작된 후에는 상품이 이미 택배사 측으로 전달되었기 때문에 취소가 불가한 점 양해 부탁드립니다. 때문에 상품을 정상적으로 수령한 후, 반품으로 보내주셔야 합니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>등록한 환불계좌를 변경하고 싶어요.</dt>
        <dd style="display: none;"> 무통장입금의 경우 환불 요청하실 때 변경하실 계좌번호 말씀 주시면 처리 드릴 수 있습니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>품절 안내받았는데 어떻게 해야 하나요?</dt>
        <dd style="display: none;"> 안녕하세요 WatTime입니다<br>
          먼저 이용에 불편을 드려 죄송합니다. <br>
          현재 고객님께서 주문해주신 제품 재고가 모두 소진이 되어 발송이 불가능한 경우,<br>
          상담원과의 상품을 통해 상품교환, 환불, 입고 시까지 대기 등 고객님께서 원하시는 방향으로 업무 진행을 도와드리고 있습니다.<br>
          변경&amp;취소  게시판을 통해 빠른 처리 진행할 수 있도록 최선을 다하겠습니다. <span></span> </dd>
      </dl>
    </div>
    <!--// 변경,취소 //--> 
    
    <!-- 회원정보&적립금 -->
    <div class="panel" id="panel6" style="display: none;">
      <dl>
        <dt><font color="red" size="5">Q.</font>적립금 사용이 되지 않아요</dt>
        <dd style="display: none;"> 적립금은 1만원 이상부터 사용 가능합니다. 또한 구매하시려는 상품의 가격이 5만원 이상인 제품에만 적립금을 사용하실 수 있습니다.
          미가용 적립금의 경우 가용 적립금으로 변경된 후 사용 가능하며, 제품 배송 완료 7일 이후에 가용 적립금으로 변경됩니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>쿠폰 적용은 모든 상품에 적용되나요?</dt>
        <dd style="display: none;"> 신규 회원 쿠폰은 할인율이 높은 브랜드 및 제품의 경우 쿠폰 적용 불가하오니 이점 참고 부탁드립니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>회원 ID와 비밀번호를 잊었을 경우 어떻게 하면 되나요?</dt>
        <dd style="display: none;"> [로그인] 누르시면 로그인 창 하단에 아이디 찾기, 비밀번호 찾기 확인 가능하십니다.
          이후 가입하셨을 때 기재하신 핸드폰 번호 또는 이메일 입력하시면 확인 가능합니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>임시 비밀번호를 받고 싶은데 이메일 주소와 휴대폰 번호가 변경되어 확인할 수 없어요</dt>
        <dd style="display: none;"> 1:1 게시판 문의를 통하여 고객님의 성함과 아이디 말씀 주시면 임시 비밀번호 설정 후 안내 드릴 수 있습니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>적립금은 언제 적립되나요?</dt>
        <dd style="display: none;"> 적립금은 자동으로 적립됩니다. 단, '배송완료' 상태가 된 날짜부터 7일 후에 자동으로 적립되는 점 안내드립니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>적립금 /쿠폰 유효기간은 어떻게 되나요?</dt>
        <dd style="display: none;"> 적립금 유효기간은 따로 없으며 쿠폰의 경우 쿠폰 내역 확인에서 유효기간 확인 가능합니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>적립금으로 결제했다가 주문을 취소했을 경우 적립금은 어떻게 되나요?</dt>
        <dd style="display: none;"> 취소 후 자동적으로 다시 적립됩니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>쿠폰을 사용한 주문을 취소, 반품할 경우 쿠폰이 재발행되나요?</dt>
        <dd style="display: none;"> 취소 후 자동적으로 다시 발급됩니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>타임 메카 회원에 가입하려면 어떻게 하나요? </dt>
        <dd style="display: none;"> PC 버전일 경우 페이지 상단 우측에 [회원가입] 경로 통하여 가입하실 수 있습니다.
          모바일일 경우 페이지 상단의 [회원가입] 경로 통하여 가입할 수 있습니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>회원정보 변경은 어떻게 해야 하나요?</dt>
        <dd style="display: none;"> [마이페이지]로 들어오셔서 로그인 후 회원정보 눌러주시면 변경 가능합니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>ID를 변경하고 싶어요</dt>
        <dd style="display: none;"> ID 변경은 생성 이후 불가하기 때문에 신중하게 가입 부탁드립니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>장바구니에 넣어둔 상품이 사라졌어요</dt>
        <dd style="display: none;"> 이미 판매가 종료된 상품은 장바구니에서 확인이 불가할 수 있습니다. 넣어두셨던 상품의 모델명 말씀 주시면 재고 확인 도와 드리겠습니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>메일이나 SMS 수신을 거부하고 싶어요</dt>
        <dd style="display: none;"> [로그인 &gt; 회원정보] 경로 들어오셔서 이메일, SMS 수신 여부에  '수신안함' 으로 체크하시고 수정해주시면 됩니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>회원 탈퇴하고 싶어요</dt>
        <dd style="display: none;"> [로그인 &gt; 회원정보] 경로 들어오셔서 페이지 하단의 탈퇴 버튼 눌러주시면 가능합니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>탈퇴 후에 재가입할 수 있나요?</dt>
        <dd style="display: none;"> 탈퇴 후 재 가입 가능하오나 이전 주문 건, 적립금, 쿠폰은 사라지는 점 참고 부탁드립니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>등록한 환불계좌를 변경하고 싶어요.</dt>
        <dd style="display: none;"> 무통장입금의 경우 환불 요청하실 때 변경하실 계좌번호 말씀 주시면 처리 드릴 수 있습니다. <span></span> </dd>
      </dl>
    </div>
    <!--// 회원정보&적립금 //--> 
    
    <!-- AS문의 -->
    <div class="panel" id="panel7" style="display: none;">
      <dl>
        <dt><font color="red" size="5">Q.</font>AS 진행 방식은 어떻게 되나요?</dt>
        <dd style="display: none;"> 본사 브랜드의 경우 본사 수리센터를 통해 수리진행이 되시며 본사 브랜드를 제외한 제품의 경우<br>
         트렌드 메카 자체 AS 센터를 통해 AS가 진행이 됩니다.<br>
          기간의 경우 최소 2주에서 최대 4주가 걸리시며 7일 이내 견적 확인 후 고객님께 비용 안내를 도와드리고 있습니다 <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>AS의 경우 어떻게 신청을 하나요?</dt>
        <dd style="display: none;"> 시계 AS 신청 시 경우 타임 메카 주소로 제품 보내주시면 되십니다.<br>
         보내주실 때에는 선불에 등봉 3천 원과 구매 이력을 확인할 수 있는 정보(구매하신 사이트, 구매 날짜,<br>
         구매자님 성함 및 연락처, AS 사유)를 기재해주셔서 보내주시면 되시겠습니다. AS 접수 후에 견적 확인까지<br>
         7일 이내로 소요되며 비용 나올 시 따로 연락을 드리고 있습니다. 무상 진행의 경우 문자안내로 도와드리며<br>
         기간은 문자 받으신 기준으로부터 10~14일 소요되며 특이사항이 생기면 연락드리고 있습니다.<span></span> </dd>
        <dt><font color="red" size="5">Q.</font>백화점 AS가 가능한가요?</dt>
        <dd style="display: none;"> 죄송한 말씀이지만 저희 제품이 병행 제품이어서 백화점 매장 접수는 따로 안되십니다.<br>
         저희 측으로 제품을 보내주시면 1년 무상으로 AS 접수가 가능하니 문제가 생기시면 저희 측으로 보내주시면 되시겠습니다.<br>
         단, 외부에서 배터리 교체를 진행하거나 수리진행을 하셨을 때에는 1년 무상보증 기간이 무력화되니 이점 참고 부탁드리겠습니다<span></span> </dd>
        <dt><font color="red" size="5">Q.</font>기계식 무브먼트란 무엇인가요?</dt>
        <dd style="display: none;">시계의 경우 쿼츠 무브먼트 제품과 오토매틱 제품(기계식 무브먼트) 이렇게 두 가지로 나누어지십니다.<br>
        쿼츠제품의 경우 일반적으로 배터리로 작동이 되는 제품이십니다. 시계 초침을 보시게되면 한칸씩 움직이는 제품이 쿼츠 제품이십니다.<br>
        오토매틱 제품의 경우 배터리는 따로 들어가지는 않지만 정밀한 기계로 작동이 되는 제품이십니다.  어떤 기계에도 기름이 들어가듯이<br>
         기계식 무브먼트 제품에도 기름이 들어가게 되십니다. 그 기름을 갈아주는 것을 오버홀이라는 작업이며 일반적으로<br>
         3년~4년 주기로 진행을 해주시면 시계 관리를 하시기에는 적당하십니다. 그리고 기계식 무브먼트 제품의 경우 작동을 안하게 되면<br>
         기름이 떠빠르게 굳기 때문에 오버홀 주기가 더 짧아질 수도 있으니 이점 참고해주시기 바랍니다. 기계식 제품의 경우<br>
         3시 방향의 크라운을 자전거 페달을 밟듯이 30 ~ 40바퀴 정도 감아주시거나 무브먼트 뒤에 로터로 동력을 주실 수가 있습니다.<br>
         로터로 동력을 감아주실 경우에는 하루 8시간 정도 착용을 해주시면 되시겠습니다<span></span>
        </dd>
        <dt><font color="red" size="5">Q.</font>기계식 시계 인데 제품이 멈췄는데 어떻게 해야 하나요?</dt>
        <dd style="display: none;">기계식 시계의 경우 동력이 부족하여 작동이 안 되시는 경우 많으십니다.<br>
            3시 방향의 크라운을 자전거 페달을 밟듯이 감아주시거나 하루 8시간 이상 착용하시면 되시겠습니다.<br>
            그럼에도 불구하고 작동이 안 되신다고 하면 제품이 이상이 있을 수 있으니 저희 측으로 제품을 보내주시면<br>
            자체 AS 센터에서 점검 진행 도와드리도록 하겠습니다.<span></span>
        </dd>       
        <dt><font color="red" size="5">Q.</font>기계식 시계가 시간 오차가 나는데 정상인가요?</dt>
        <dd style="display: none;">기계식 시계의 경우 하루 일오 차가 최대 15초가 차이가 나 실수 있습니다.<br>
            태엽이 맞물려서 작동이 되어 밸런스 휠이라는 부품이 움직일 때마다 초가 움직이는 원리라서 하루 일오 차가 있으시며<br>
            오차량이 누적이 되면 최대 한 달에 7분 정도 오차가 나 실수 있습니다. 그래도 오차가 더 많이 발생이 되신다면<br>
            기계식 시계의 제품은 시간 조정이 가능하여 저희 측으로 제품을 보내주시면 되시겠습니다<span></span>
        </dd> 
        <dt><font color="red" size="5">Q.</font>기계식 시계의 경우 동력을 어떻게 주나요?</dt>
        <dd style="display: none;">오토매틱 상품은 수동과 자동 이 있으시며 ""수동""인 경우 3시 방향에 있는 크라운을 직접 돌려 충전을 시키는 방법이시며 자동인 경우 무브먼트 안에 로터가 탑재되어 손목의 힘으로 로터가 돌아가 충전이 되는 방법과 수동 시계처럼 3시 방향의 크라운을 감아주시는 방법이 있습니다.<span></span></dd>
        <dt><font color="red" size="5">Q.</font>기계식 시계의 관리는 어떻게 하나요?</dt>
        <dd style="display: none;">기계식 시계 경우 무브먼트 자체가 정교한 부품으로 조립되어있어 작은 충격에 의해서도 고장이 날수가 있습니다.<br>
        밸런스 휠이라는 부품에 머리카락 두께처럼 얇은 부품이 감아져있어서 작은 충격에도 쏠릴 수가 있습니다. 쏠리게 되면<br>
        시간 오차 및 작동 정지 현상이 발생합니다. 그래서 충격을 줄 수 있는 행동과 골프, 야구 스윙이 들어가는 행동을 해주시면 안 되십니다. 그리고 자성에 의해서도 시간 오차 및 작동 정지 현상이 있는데 이는 밸런스 휠에 헤어스프링에 자성이 생기게 되면 서로 달라붙어서 스피커. 핸드폰, 자석 팔찌 등 자성이 있는 제품에 멀리하시면 되시겠습니다.<span></span></dd>
        <dt><font color="red" size="5">Q.</font>날짜가 오전 12시(24시)에 넘어가지 않는데 불량인가요?</dt>
        <dd style="display: none;">오후 11시부터 새벽 1시까지 날짜 변경 메커니즘이 이미 작동 중이 시기 때문에 시간 안에 변경이 되시는 부분은 제품의 이상이 아니십니다 <span></span></dd>
        <dt><font color="red" size="5">Q.</font>날짜를 변경하지 말하야 할 시간이 있나요?</dt>
        <dd style="display: none;">시계 시간으로 밤 9시부터 새벽 4시 사이에는 날짜, 요일 변경을 하시면 안 되십니다. 날짜 기어 와 요일 기어가 자동으로 맞물려서 넘어가는 시간대입니다 외부의 압력으로 인해 강제적으로 넘어가게 되면 날짜 기어가 망가지거나 부러질 수 있어 추후에 날자, 요일 변경이 안되실 수도 있습니다.<span></span></dd>
        <dt><font color="red" size="5">Q.</font>시계 날짜 이상해요</dt>
        <dd style="display: none;">
        1. 용두를 한칸빼서 전날 날짜로 맞춥니다. 오늘이 27일 이면 26일로 날짜를 맞춥니다.<br>
        2. 용두를 두칸빼서 분침을 돌려서 12시에서 날짜가 넘어갈때 까지 돌립니다.<br>
        3. 날짜가 넘어가면 그때가 새벽 영시입니다.이때 날짜가 오늘날짜 입니다.<br>
        4. 영시기준으로 시간을 정확히 맞춥니다. 가령현재시간이 오후4시이면 영시니까 분침을 한바퀴 더돌려서 4시에 맞춥니다.<br>
        5.?30일 까지만 있는달은 다시 수작업으로 날짜를 맞춰줘야 합니다.<span></span></dd>
        <dt><font color="red" size="5">Q.</font>로즈 골드 제품의 변색 관리는 어떻게 하나요?</dt>
        <dd style="display: none;">로즈 골드 제품의 경우 실버 제품과 골드 제품의 비해서 변색이 더 빨리 일어나실 수가 있습니다. 변색의 경우 화장품, 로션, 물기, 등등 이로 인해 변색이 일어날 수 있습니다 또한 로즈 골드의 경우 변색 수리 AS가 불가하니 착용하실 때 주의하셔서 착용하시기 바랍니다.<span></span></dd>
        <dt><font color="red" size="5">Q.</font>순토 AS 진행은 어떻게 되나요?</dt>
        <dd style="display: none;">순토 제품의 경우 한국에서 수리가 안되어 해외 본사(홍콩)으로 보내어 수리진행을 하고 있습니다. 해외로 AS 접수 후 비용 안내를 도와드리고 있지만 고객님께서 취소하시는 경우 해외 택배 반송비용 6만 원 또는 제품 파기로 진행을 도와드릴 수가 있습니다. 기간의 경우 최소 1달에서 2달 사이로 예상하시면 되시겠습니다.<span></span></dd>
        <dt><font color="red" size="5">Q.</font>습기가 발생하게 되면 어떻게 대처해야 되나요?</dt>
        <dd style="display: none;">습기가 형성이 되어 누적이 되면 물방울 이 형성이 되는데 이때 물방을이 기계 안쪽이나 문자판에 들어갈수가 있습니다. 누적된 상태에서 더 심해지면 수리 비용이 많이 발생할 수 있습니다. 그래서 습기 발생 시에는 바로 저희 측으로 연락 후 AS 진행을 받으시면 되시겠습니다,<span></span></dd>
        <dt><font color="red" size="5">Q.</font>습기가 생기는 원인은 뭔가요?</dt>
        <dd style="display: none;">착용 중에 용두 또는 크로노 버튼이나 뒷백으로 습기가 들어가서 생기는 현상이십니다.  만약 습기가 차게 되면 저희 측으로 바로 보내주시면 확인 후 진행을 도와드리겠습니다. 착용 중에 생기는 현상이라서  착용을 주의하셔서 착용하셔야 됩니다.<span></span></dd>   
        <dt><font color="red" size="5">Q.</font>시계를 받았는데 작동이 안되는데 불량인가요?</dt>
        <dd style="display: none;">저희 제품의 경우 병행제품이여서 시계가 작동이 되어 오는 경우가 많습니다. 그래서 1년이내에 1회 배터리교체 무상으로 진행을 도와드리고있습니다. 외부에서 배터리 교체를 하지마시고 저희측으로 보내주시면 확인후 진행을 도와드리겠습니다.  그리고 일부제품의 경우 초침이 없는 제품이 있습니다. 그래서 초침이 없는 제품의 경우 시간을 셋팅후에 확인부탁드리겠습니다. 그럼에도 불구하고 작동이 안되면 저희측으로 제품 보내주시면 되시겠습니다. 외부에서 배터리 교체를 진행시에는 1년 무상보증 무력화와 교환반품이 불가하니 이점 꼭 확인해 주시기 바랍니다.<span></span></dd>
        <dt><font color="red" size="5">Q.</font>어떤 상태에서 AS 비용 유상이 되나요?</dt>
        <dd style="display: none;">기간은 1년 이내이며 센터에서 결항이 아닌 사용자 부주의로 인한 결과로 나왔을 때 유상으로 진행이 되십니다. 그리고 외부에서 배터리 교체 및 수리진행을 하셨을 때 무상 보증 기간이 무력화되어 유상으로 진행되시니 이점 참고 부탁드리겠습니다.<span></span></dd>
        <dt><font color="red" size="5">Q.</font>주얼리 제품도 변색 AS가 가능한가요?</dt>
        <dd style="display: none;">주얼리 제품 중 실버 소재로 된 제품은 사용기간과 관련 없이 사용자의 따라 변색 기간이 다릅니다. 실버 특성상 제품 변색은 자연스러운 현상이며 도금 및 폴리싱 과정을 통해 유상수리 가능합니다. 그리고 로즈 골드 제품의 경우는 변색 수리가 불가하오니 이점 참고 부탁드리겠습니다.<span></span></dd>
        <dt><font color="red" size="5">Q.</font>크로노그래프 기능이 있는데 초침이 안 가요</dt>
        <dd style="display: none;">크로노그래프 제품 같은 경우 기존에 초침으로 판단되는 초침이 초침 기능을 하는 제품이 아니시기 때문에 3/6/9시 방향 중 작은 초침이 시계의 초침이시며 초침이라 판단되던 초침은 2,4시 방향 버튼을 이용하여 수동으로 작동, 작동 정지를 해주셔야 합니다.<span></span></dd>
        <dt><font color="red" size="5">Q.</font>크로노그래프 바늘이 정시에 안 와요 반품해주세요</dt>
        <dd style="display: none;">크로노그래프 기능을 이용하였는데 리셋을 하여도 12시 방향으로 가지 않으시는 것은 제품의 세팅이 되지 않은 상태로 출고되시는 부분으로 새로 조작을 해주셔야 하며 제품의 이상이 아닌 조작이 가능하신 부분입니다.  고객 센터나 게시판 문의해주시면 답변 도와드리겠습니다. <span></span></dd>
        <dt><font color="red" size="5">Q.</font>오버홀은 어떤걸 얘기하는건가요?</dt>
        <dd style="display: none;">넓은 의미로 시계가 작동되게 할 수 있는 무브먼트를 전체 분해후에 기존에 주유되었던 오일을 제거후 새로운 오일을 주유후 재조립하는 수리서비스중 하나입니다.<span></span></dd>
        <dt><font color="red" size="5">Q.</font>오버홀은 주기도 따로있나요?</dt>
        <dd style="display: none;">기계식 시계 뿐만 아니라 쿼츠시계제품의경우도 오버홀을 해주셔야되며 통상적으로 3~5년에 한번씩이지만 시계가 작동이 안된상태에서 장시간 두게되면 오일이 굳게되어 오버홀 주기가 빨라질 수 있으니 참고바랍니다.<span></span></dd>
        <dt><font color="red" size="5">Q.</font>메탈 밴드 변색 관리는 어떻게 하나요?</dt>
        <dd style="display: none;">메탈 밴드의 경우 먼지와 땀의 축척은 피부를 자극하며 스테인리스 스틸의 산화를 진행 시키므로, 주기적으로 칫솔과 액체비누, 물티슈 등을 이용해 세척 후 마른 헝겊으로 잘 닦아주는 관리가 필요합니다.<span></span></dd>
        <dt><font color="red" size="5">Q.</font>밴드 조절은 어떻게 해야 되나요?</dt>
        <dd style="display: none;">밴드 조절의 경우 타임 메카로 방문을 해주시거나 택배 접수를 통해 줄을 줄일 수 있는 방법과 인근 시계방을 이용하면 진행이 가능하십니다 방문을 하실 경우 오전 11시에서 12사이 및 오후 2시에서 4시까지 방문이 가능하십니다 택배 접수의 경우 선불에 동봉 3천 원과 줄이실 칸수 적어서 보내주시면 2~3일 소요 후 출고 가능하십니다.<span></span></dd>
        <dt><font color="red" size="5">Q.</font>가죽밴드 관리는 어떻게하나요?</dt>
        <dd style="display: none;">물에 묻거나, 땀을 흘렸을 때에는 곧바로 흡습성이 좋은 마른 옷감등으로 수분을 빨아들일 수 있도록 가볍게 닦으십시오.? 시계를 풀러 놓으실 때에는 통풍이 좋은 곳에 놓아주십시오. 땀을 많이 흘릴 때 또는 계절일 때에는 시계를 조금 느슨하게(손가락 1개 정도 들어가는 정도) 착용하시는 것도 좋은 방법입니다. 장시간 외부에서 장시간 태양광등 강한 빛에 쬐이게 되면, 피혁이 변색 또는 변형될 수 있습니다. 자동차의 계기반(dashboard)의 위등에 방치하시는 것은 금물입니다<span></span></dd>
        <dt><font color="red" size="5">Q.</font>우레탄 밴드 관리는 어떻게 하나요?</dt>
        <dd style="display: none;">폴리우레탄(polyurethane)등 연질 플라스틱(plastics)제 밴드는, 통상 2～3년의 사용으로, 재질이 경화되기도 하고, 색상이 변할 수 있습니다. 특히, 장시간 젖었던 상태인 채로 습기가 많은 장소에 방치하거나, 장시간 직사일광에 노출되면, 밴드의 노화현상이 비교적 단기간에 이뤄지며, 조각이나 균열이 생길 수 있습니다. 해안 스포츠(marine sports)나 아웃도어용으로 많이 사용되는 폴리우레탄(polyurethane)밴드입니다만, 보관 상태나 열화의 정도에 주의하여 사용하시기 바랍니다<span></span></dd>
        <dt><font color="red" size="5">Q.</font>메탈밴드관리는 어떻게 하나요?</dt>
        <dd style="display: none;">스테인리스 스틸 소재의 밴드라도, 밴드 사이에 쌓였던 땀이나 오염물질에 의해 녹이 생길 수 있습니다. 땀을 흘렸던 때에는 오염되거나 녹이 슬수 있어, 의류의 소매등에 노랗게 더럽히는 원인도 될 수 있기 때문에, 시계는 항상 청결하게 유지하시는 것이 좋습니다. 특히 고급품에 사용되고 있는 블록밴드는 치밀한 구조로 되어 있기 때문에, 땀이나 오염이 쌓이기쉽게 되어있습니다. 이와 같은 금속 밴드의 경우에는, 정기적인 손질이 필요합니다.<span></span></dd>
        <dt><font color="red" size="5">Q.</font>세라믹 밴드 관리는 어떻게하나요?</dt>
        <dd style="display: none;">세라믹 밴드의 경우 기스에는 강하나 충격으로 인해 쉽게 깨집니다. 기스가 나는경우 메탈밴드는 폴리싱이 가능하지만 세라믹밴드는 불가하여 교체로밖에 진행이 안되십니다. 재고가 없을시 제작으로 진행을 도와드리고있습니다.<span></span></dd>
        <dt><font color="red" size="5">Q.</font>사파이어 글라스는 어떤건가요?</dt>
        <dd style="display: none;">글라스중 제일 고가의 글라스이며 주로 명품시계 유리에 사용이 됩니다. 기스에는 강하나 충격에는 깨질 수 있습니다.<span></span></dd>
        <dt<font color="red" size="5">Q.</font>>미네랄 글라스는 어떤건가요?</dt>
        <dd style="display: none;">기스에는 제일 약하며 충격에는 강해 강한충격을 가하지 않는이상 깨지지 않으며 일반적인 시계 유리로 사용되고 있습니다.<span></span></dd>
        <dt><font color="red" size="5">Q.</font>고강도(하드렉스) 글라스는 어떤건가요?</dt>
        <dd style="display: none;">사파이어 글라스와 미네랄 글라스의 절충으로 보시면 될것 같습니다. 깨지지 않고, 기스도 잘 안납니다. 그러나 미네랄 글라스와 비교했을 땐, 깨질 확률이 조금 높구요. 사파이어 글라스보다는, 기스가 잘 납니다<span></span></dd>
        <dt><font color="red" size="5">Q.</font>30m 방수는 어떤 경우인가요?</dt>
        <dd style="display: none;">3기압 방수로, 비에 젖어도 괜찮으나 수도꼭지에서 흐르는 물에는 주의하세요. 3기압 이상의 수압이 가해져 시계내부에물이 침입할 경우가 있습니다.<span></span></dd>
        <dt><font color="red" size="5">Q.</font>50m 방수는 어떤 경우인가요?</dt>
        <dd style="display: none;">5기압 방수로, 세안 등으로 수돗물이 살짝 닿아도 괜찮은 정도입니다. 시계를 물에 넣는 것은 삼가하십시오.<span></span></dd>
        <dt><font color="red" size="5">Q.</font>100m 방수는 어떤 경우인가요?</dt>
        <dd style="display: none;">10기압 방수로, 잠깐 물속에 시계를 빠드려도 괜찮습니다. 단, 수영은 금해주세요. 손목의 움직임으로 순간 압력이 10기압을 넘을 수 있습니다.<span></span></dd>
        <dt><font color="red" size="5">Q.</font>300m 방수는 어떤 경우인가요?</dt>
        <dd style="display: none;">30기압 이상 방수로, 다이버시계로서의 성능을 구비하고 있습니다. 하지만 수중사용이 많은 분들은 1년에 1번, 보통은 2년에 한번 방수테스트를 받으십시오.<span></span></dd>                                        
      </dl>
    </div>
    <!--// AS문의 //--> 
    
    <!-- 상품문의 -->
    <div class="panel" id="panel8" style="display: block;">
      <dl>
        <dt><font color="red" size="5">Q.</font>상품 구매 전 반드시 확인해야 할 사항이 어떤 게 있나요?</dt>
        <dd style="display: none;"> 온라인 쇼핑은 상품을 직접 보고 구매하는 것이 아니므로 구매 전에 상품 정보를 꼼꼼히 살펴보셔야 합니다.
          다른 구매자들의 구매후기를 참고하시면  구매에 도움이 될 수 있습니다.
          교환/반품 및 불가 사유에 대한 안내를 확인하셔야 교환/반품에 대한 번거로움을 줄이실 수 있습니다.
          배송지 정보가 맞는지 주문/결제 전에 꼭 확인해 주세요. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>시계줄은 어떻게 줄이나요?</dt>
        <dd style="display: none;"> 상품은 물류창고 측에서 발송되기 때문에 수선 후 발송이 어려운 점 안내드립니다.
          메탈 시계줄은 상품 수령 후 가까운 시계방 방문하셔서 줄여주셔야 하는 점 양해 부탁드립니다.
          공구를 함께 구매하시면 집에서도 쉽게 수선 가능합니다.
          WatTime 하단의 주소로 방문 주시면 무상으로 수선 드리고 있으나, 평일 오전 10시~오후 5시(점심시간 12시~2시 제외)에 방문 주셔야 가능한 점 안내드립니다.
          택배로 보내주실 경우 고객님의 손목 둘레와 요청사항을 기재하시고 보내주셔야 보다 빠르게 처리 드릴 수 있습니다.
          
          ※ 택배로 보내주실 경우 2~3일 정도 소요될 수 있으며 선불에 3000원 동봉해주셔야 처리되는 점 안내드립니다 <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>구매하려는 상품의 재고가 있는지 궁금해요</dt>
        <dd style="display: none;"> 상품마다 재고량이 다르기 때문에 모델명과 함께 상품문의 게시판 문의해주시면 상세하고 빠르게 답변해드리겠습니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>상품 받았는데 왜 날짜랑 시간이랑 맞춰서 보내주지 않나요?</dt>
        <dd style="display: none;"> 상품은 물류창고, 본사 측에서 발송되기 때문에 시간과 날짜 등을 맞춰서 발송 드리기 어려운 점 양해 부탁드립니다.
          또한 오토매틱, 에코드라이브 등의 기능을 가진 제품들은 시간과 날짜 등을 맞춰서 발송 드리더라도
          기능의 특성상 수령시 미작동 또는 날짜와 시간이 맞지 않을 수 있는 점 안내드립니다.
          때문에 상품 수령 후 고객님께서 조정 후 착용 주셔야 하며, 조작법이 미숙하신 경우 상품문의 게시판으로 문의주시면 답변 도와드리겠습니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>상품 사용법이 알고 싶습니다.</dt>
        <dd style="display: none;"> 상품마다 사용법이 다르기 때문에 상품문의 게시판으로 문의해주시면 상세하고 빠르게 답변해드리겠습니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>기계식(오토매틱) 무브먼트란 무엇인가요?</dt>
        <dd style="display: none;"> 시계의 경우 쿼츠 무브먼트 제품과 오토매틱 제품(기계식 무브먼트) 이렇게 두 가지로 나누어집니다.
          쿼츠 제품의 경우 일반적으로 배터리로 작동이 되는 제품입니다.
          시계 초침을 보시게 되면 한 칸씩 움직이는 제품이 쿼츠 제품입니다.
          오토매틱 제품의 경우 배터리는 따로 들어가지는 않지만 정밀한 기계로 작동이 되는 제품입니다. 
          어떤 기계에도 기름이 들어가듯이 기계식 무브먼트 제품에도 기름이 들어가게 됩니다.
          그 기름을 갈아주는 것을 오버홀이라는 작업이며 일반적으로 3~4년 주기로 진행을 해주시면 시계 관리를 하시기에는 적당합니다.
          그리고 기계식 무브먼트 제품의 경우 작동을 안 하게 되면 기름이 더빠르게 굳기 때문에 오버홀 주기가 더 짧아질 수도 있으니 이점 참고해주시기 바랍니다.
          기계식 제품의 경우 3시 방향의 크라운을 자전거 페달을 밟듯이 30 ~ 40바퀴 정도 감아주시거나 무브먼트 뒤에 로터로 동력을 주실 수가 있습니다.
          로터로 동력을 감아주실 경우에는 하루 8시간 정도 착용을 해주시면 됩니다 <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>기계식(오토매틱) 시계를 사용 할 때 주의 해야 할 사항이 있나요?</dt>
        <dd style="display: none;"> 기계식 시계의 경우 무브먼트 자체가 정교한 부품으로 조립되어있어 작은 충격에 의해서도 고장이 날 수 있습니다. <span></span> 밸런스 휠이라는 부품에 머리카락 두께처럼 얇은 부품이 감아져있어서 작은 충격에도 쏠릴 수가 있습니다.
          쏠리게 되면 시간 오차 및 작동 정지 현상이 발생합니다. 그렇기 때문에 충격을 줄 수 있는 행동과 골프, 야구 스윙이 들어가는 행동을 해주시면 안 됩니다.
          또한 자성에 의해서도 시간 오차 및 작동 정지 현상이 있는데 이는 밸런스 휠에 헤어스프링에 자성이 생기게 되면 서로 달라붙어서 스피커, 핸드폰, 자석 팔찌 등 자성이 있는 제품에 멀리하셔야 합니다. </dd>
        <dt><font color="red" size="5">Q.</font>시계 방수는 어떤 건가요?</dt>
        <dd style="display: none;"> 생활방수 시계 (10BAR 이하)는 수돗물의 직수, 목욕탕, 사우나, 수영 등 물의 직접적인 접촉은 피해야 합니다. 
          방수시계 20BAR 이상이어도 물에 접촉하는 횟수가 많거나 시계가 오래된 경우 정기적으로 시계 내부의 모든 개스킷을 갈아 주어야 합니다.
          바닷물이나 살균된 물에 노출된 뒤에는 반드시 흐르는 물에 닦고 나서 흡수가 잘 되는 헝겊으로 말려야 합니다. <span></span> </dd>
        <dt><font color="red" size="5">Q.</font>상품에 대해 더 자세히 알고 싶어요</dt>
        <dd style="display: none;"> 상품 상세페이지에 나와있는 내용 외에 더 궁금하신 내용이 있으시다면 상품문의 게시판을 통해 고객님의 궁금증을 해결해드리도록 하겠습니다. <span></span> </dd>
      </dl>
    </div>
    <!--// 상품문의 //--> 
    <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script> 
    <script type="text/javascript">
            window.jQuery1_12_4 = jQuery.noConflict(true);
            (function($) {
                var jQuery = $;
                $('.panel:not(:first)').hide()
                $('.tab li a:first').addClass('on')
                $('.tab li a').click(function() {
                    var link = $(this).attr('href')
                    $('.panel').hide()
                    $(link).show()

                    $('.tab li a').removeClass('on')
                    $(this).addClass('on')

                    return false;
                });

                $('.panel dd').hide()
                $('.panel dt').click(function(){
                    $('+dd',this).slideToggle('fast')
                })
            }(jQuery1_12_4));
        </script> 
  </div>
</body>
</html>