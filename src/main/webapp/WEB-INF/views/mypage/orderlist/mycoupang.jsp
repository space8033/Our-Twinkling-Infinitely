<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>쿠팡!</title>
      	<link rel="icon" href="../common/image/coupang/아이콘.jpg" type="image/x-icon"> 
		
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
		
		<script src="${pageContext.request.contextPath}/resources/js/mycoupang.js"></script>
		
		<style>
			#myCoupang {
				background-color: rgb(40, 108, 179);
				font-size: 30px;
				width: 15%;
				height: 100px;
				float: left;
			}
			#moneyCoupon {
				background-color: rgb(130, 188, 226);
				width: 85%;
				height: 100px;
				float: left;
			}
			.mcItem {
				width: 20%;
				text-shadow: 2px 2px 8px rgb(40, 108, 179);
				border-color: rgb(249, 249, 249);
			}
			.countings {
				cursor: pointer;
			}
			.mcCount {
				font-size: 35px;
			}
			
			#myCoupangLM {
				width: 15%;
				padding-left: 5px;
				float: left;
			}
			#myCoupangLM div span {
				margin-left: 7px;
			}
			#myCoupangLMT {
				border: 1px solid rgb(239, 241, 240);
				background-color: rgb(249, 249, 249);
			}
			.listLeft {
				list-style-type: none;
				font-size: 12px;
				text-align: left;
				padding: 3px;
				margin: 5px;
			}
			.listLeft li {
				margin: 2px;
				cursor: pointer;
			}
			.listLeft li a {
				color: black;
			}
			.listLeft li a:hover {
				color: rgb(95, 144, 210);
				text-decoration: none;
			}
			
			#sideService div{
				width: 100%;
				border: 1px solid rgb(239, 241, 240);
			}
			#sideService div:hover {
				border: 1px solid rgb(40, 108, 179);
				cursor: pointer;
			}
			
			#myCoupangContent {
				width: 85%;
			}
			/*---------------------------------마이쿠팡 frame ----------------------------------------*/
			#searchingBox {
				position: relative;
			}
			#searchingBox input {
				display: inline;
				height: 32px;
				border: 1px solid rgb(216, 216, 216);
				border-right: none; 
				vertical-align: middle;
			}
			#searchingBox input:focus {
				outline: none;
			}
			#search {
				position: absolute;
				display: inline;
				border: 1px solid rgb(216, 216, 216);
				border-left: none;
				background-color: white;
				vertical-align: middle;
			}
			
			.boxes {
				width: 73px;
				height: 25px;
				border-radius: 13px;
				border : 1px solid rgb(196, 205, 213);
				background-color: white;
				font-size: 12px;
				text-align: center;
				vertical-align: middle;
				margin-right: 5px;
				cursor: pointer;
				align-items: center;
				justify-content: center;
				font-weight: 500px;
			}
			.clickedBox {
				background-color: rgb(52, 106, 255);
				color: white;
			}
			
			.classifyMine {
				border: 1px solid rgb(196, 205, 213);
				width: 25%;
				height: 40px;
				text-align: center;
				padding: 7px;
				background-color: rgb(249, 249, 249);
				font-weight: bold;
				border-bottom-color: rgb(75, 129, 217);
				border-bottom-width: 2px;
			}
			.selectedClass {
				border: 2px solid rgb(75, 129, 217);
				border-bottom: none;
				color: rgb(75, 129, 217);
				background-color: white;
			}
			
			.classifyByDate {
				border: 1px solid rgb(196, 205, 213);
				border-radius: 13px;
				width: 95%;
				margin-left: 13px;
				padding-left: 10px;
				padding-top: 10px;
				margin-top: 20px;
				box-shadow: 0px 1px 0px 0px gray;
			}
			#seeDetail {
				color: rgb(79, 107, 181);
				margin-right: 30px;
			}
			#seeDetail:hover {
				color: rgb(79, 107, 181);
				text-decoration: none;
			}
			#detailHover {
				color: rgb(64, 106, 226);
			}
			#detailHover:hover {
				text-decoration: none;
				color: rgb(64, 106, 226);
			}
			.orderCard {
				width: 95%;
				padding-left: 15px;
			}
			.orderCardLeft {
				border: 1px solid rgb(196, 205, 213);
				border-radius: 13px 0 0 13px;
				width: 70%;
			}
			.orderCardRight {
				border: 1px solid rgb(196, 205, 213);
				border-radius: 0 13px 13px 0;
				width: 30%;
				flex-direction: column;
				align-items: center;
				justify-content: center;
			}
			.cardButton {
				border: 1px solid rgb(196, 205, 213);
				border-radius: 3px;
				width: 80%;
				background-color: white;
				margin : 5px 0 5px 0;
			}
			.lowerCard:hover {
				cursor: pointer;
			}
			.moreIcon {
				cursor: pointer;
			}
			#pagingButton div button{
				margin-top: 20px;
				background-color: white;
				border: 1px solid rgb(196, 205, 213);
				border-radius: 4px;
				height: 40px;
				width: 80px;
			}
			
			#deliveryNotify {
				border: 1px solid rgb(196, 205, 213);
			}
			#notifyBottom {
				background-color: #f3f3f3;
			}
			#deleteUnderline:hover {
				text-decoration: none;
				color: rgb(100, 139, 214);
			}
			
			/*------------------------------------footer css------------------------------------*/
			/* footer */
			.footer-frame {
			   
			   width: 100%;
			   position: relative;
			   border-top: #ddd solid 2px;
			    background: #fff;
			}
			
			.footer-layer1 {
			   border-bottom: #ddd solid 1px;
			    height: 50px;
			    text-align: center;
			    padding-top: 15px;
			    white-space: nowrap;
			}
			
			.footer-layer1 a {
			   display: inline-block;
			    white-space: nowrap;
			    padding: 0 14px;
			    font-size: 12px;
			    color: #555;
			    height: 12px;
			    border-left: #888 solid 1px;
			}
			
			.footer-layer1 a:first-child{
			   border-left: 0;
			}
			
			.footer-layer1 .site-picker {
			   position: relative;
			    font-size: 14px;
			    display: inline-block;
			    text-align: left;
			    vertical-align: top;
			    margin-top: -9px;
			    color: #212b36;
			    margin-left: 5px;
			}
			
			.footer-layer1 .site-picker .site-picker-arrow {
			   transition: .3s;
			   display: inline-block;
			    width: 14px;
			    height: 14px;
			    background-color: #333;
			}
			
			.footer-layer2 {
			   width: 1020px;
			    height: 100px;
			    margin: 30px auto;
			    font-size: 12px;
			    color: #555;
			    line-height: 150%;
			}
			
			.footer-layer2 h1 {
			   float: left;
			    width: 150px;
			    background-image: none;
			}
			
			.footer-layer2 h1 a {
			   display: block;
			   width: 117px;
			   height: 34px;
			    overflow: hidden;
			    background: url(//static.coupangcdn.com/image/coupang/common/footer_asset_v8.png) no-repeat;
			   background-position: -19px -34px;
			    text-indent: -99em;
			   margin-left: 10px;
			}
			
			.footer-layer2 a {
			   color: #555;
			}
			
			
			.footer-layer2 address {
			   float: left;
			    width: 260px;
			}
			
			.footer-layer2 .licensee {
			   text-decoration: underline;
			}
			
			.footer-layer2 .contact-info {
			   float: left;
			    width: 340px;
			    color: #555;
			}
			
			.footer-layer2 strong {
			   font-weight: bold;
			    font-size: 12px;
			}
			
			.footer-layer2 .contact-info em {
			   font-size: 24px;
			    font-family: Tahoma;
			    font-weight: bold;
			    display: block;
			    margin: 9px 0 11px 0;
			   font-style: normal;
			}
			
			.footer-layer2 .safe-service {
			   float: left;
			    width: 270px;
			    font-size: 11px;
			}
			
			.footer-layer3 {
			   width: 1020px;
			    height: 80px;
			    margin: 0 auto;
			    position: relative;
			    border-top: #ddd solid 1px;
			}
			
			.footer-layer3 .certification-list {
			   width: 968px;
			   height: 80px;
			   margin: 0 auto;
			   background: url(//static.coupangcdn.com/image/coupang/common/footer_asset_v12.png) no-repeat;
			   background-position: -44px -92px;
			   position: relative;
			}
			
			.footer-layer4 {
			   background: #333;
			    height: 100px;
			}
			
			.footer-layer4 .coupang-copyright {
			   width: 1020px;
			    margin: 0 auto;
			    position: relative;
			}
			
			.footer-layer4 .coupang-copyright p {
			   color: #888;
			    font-size: 11px;
			}
			
			.footer-layer4 .coupang-copyright .info {
			   padding: 21px 0 3px 0;
			}
			
			.footer-layer4 .coupang-copyright .sns-link {
			   position: absolute;
			    top: 23px;
			    right: 0;
			}
			
			.footer-layer4 .coupang-copyright .sns-link li {
			   float: left;
			   list-style: none;
			}
			
			.footer-layer4 .coupang-copyright .sns-link a {
			   width: 34px;
			    height: 34px;
			    margin-right: 8px;
			   display: block;
			    overflow: hidden;
			    background: url(//static.coupangcdn.com/image/coupang/common/footer_asset_v8.png) no-repeat;
			    text-indent: -99em;
			}
			
			.footer-layer4 .coupang-copyright .sns-link a.facebook {
			   background-position: -220px -30px;
			}
			
			.footer-layer4 .coupang-copyright .sns-link a.blog {
			   background-position: -348px -30px;
			}
			
			.footer-layer4 .coupang-copyright .sns-link a.instagram {
			   background-position: -390px -30px;
			}
		</style>
	</head>
	
	<body >
		<div id="wrapper" style="width: 1400px;">
			<div style="padding-left: 400px;">
				<!-- 파란색 부분 -->
				<div id="myCoupangTop" class="d-flex">
					<div id="myCoupang" class="text-light text-center py-4"> MY쿠팡</div>
               <div id="moneyCoupon" class="d-flex" >
                  <div class="mcItem text-light font-weight-bold pl-4 border border-top-0
                                     border-left-0 border-bottom-0 py-3">
                     미사용티켓 <br>
                     <div class="countings">
                        <span class="mcCount font-weight-light">0</span>장
                     </div>
                  </div>
                  <div class="mcItem text-light font-weight-bold pl-4 border border-top-0
                                     border-left-0 border-bottom-0 py-3">
                     배송중 <br>
                     <div class="countings">
                        <span class="mcCount font-weight-light">0</span>개
                     </div>
                  </div>
                  <div class="mcItem text-light font-weight-bold pl-4 border border-top-0
                                     border-left-0 border-bottom-0 py-3">
                     할인쿠폰 <br>
                     <div class="countings">
                        <span class="mcCount font-weight-light">0</span>장
                     </div>
                  </div>
                  
                  <div class="d-flex flex-column text-light" style="width: 40%; height: 100px;">
                     <div class="border border-top-0 border-left-0 border-right-0
                              text-left py-2 font-wieght-bold d-flex px-4 py-3" style="height:50%; border-color:rgb(249, 249, 249)">
                        <div style="float: left; width:50%; font-weight:bold; text-shadow: 2px 2px 8px rgb(40, 108, 179);">
                           쿠페이 머니 
                        </div>
                        <div class="countings text-right" style="float: right; width:50%;">
                           <span style="font-size:25px; font-weight: lighter;">0</span> 원                  
                        </div>
                     </div>
                     <div class="text-left py-2 font-wieght-bold d-flex px-4 py-3" style="height:50%;">
                        <div style="float: left; width:50%; font-weight:bold; text-shadow: 2px 2px 8px rgb(40, 108, 179);">
                           쿠팡 캐시 
                        </div>
                        <div class="countings text-right" style="float: right; width:50%;">
                           <span style="font-size:25px; font-weight: lighter;">0</span> 원                  
                        </div>
                     </div>
                  </div>
               </div>
				</div>
				
				<!-- 파란색 아래부분 -->
				<div id="myCoupangMid" class="d-flex">
					<div id="myCoupangLM">
						<div id="myCoupangLMT">
                     <div>
                        <span class="font-weight-bold">MY 쇼핑</span>
                        <ul class="listLeft"> 
                           <li><a href="mycoupang.jsp" style="color: rgb(95, 144, 210)" >주문목록/배송조회</a></li>
                           <li><a href="cancelHistory.jsp" >취소/반품/교환/환불 내역</a></li>
                           <li><a href="#">와우 멤버십</a></li>
                           <li><a href="https://mc.coupang.com/ssr/desktop/fresh-bag/instruction">로켓프레시 프레시백</a></li>
                           <li><a href="#">정기배송관리</a></li>
                           <li><a href="#">영수증 조회/출력</a></li>
                        </ul>
                     </div>
                     <hr>
                     <div>
                        <span class="font-weight-bold">MY 혜택</span>
                        <ul class="listLeft"> 
                           <li><a href="#">할인쿠폰</a></li>
                           <li><a href="#">쿠팡캐시/기프트카드</a></li>
                        </ul>
                     </div>
                     <hr>
                     <div>
                        <span class="font-weight-bold">MY 활동</span>
                        <ul class="listLeft"> 
                           <li><a href="#">문의하기</a></li>
                           <li><a href="#">문의내역 확인</a></li>
                           <li><a href="#">리뷰관리</a></li>
                           <li><a href="#">찜리스트</a></li>
                        </ul>
                     </div>
                     <hr>
                     <div>
                        <span class="font-weight-bold">MY 정보</span>
                        <ul class="listLeft"> 
                           <li><a href="memberConfirm.jsp">개인정보확인/수정</a></li>
                           <li><a href="#">결제수단·쿠페이 관리</a></li>
                           <li><a href="myAddress.jsp">배송지 관리</a></li>
                        </ul>
                     </div>
                  </div>
                  
                  <div id="sideService" class="mt-2">
                     <div>
                        <a href="#">
                           <img src="../common/image/coupang/w쿠팡문의.png" width="100%">
                        </a>
                     </div>
                     <div>
                        <a href="#">
                           <img src="../common/image/coupang/w고객의소리.png" width="100%">
                        </a>
                     </div>
                     <div>
                        <a href="#">
                           <img src="../common/image/coupang/w취소반품.png" width="100%">
                        </a>
                     </div>
                  </div>
					</div>
		<!------------------------------------- 내용 들어갈 div -------------------------------------->
				<div id="myCoupangContent" class="pl-3">
					<div>
						<div class="font-weight-bold mt-4 ml-3" style="font-size: 20px; margin-bottom: 10px;">주문목록</div>
						
						<div id="searchingBox">
							<input placeholder="주문한 상품을 검색할 수 있어요!" style="width: 62%; margin-left:15px; display:inline;">
							<button id="search" type="submit">
								<img id="searchIcon" src="../common/image/coupang/w돋보기.png" width= 25 height= 28.5>
							</button>
						</div>
						<div id="filterBox" class="d-flex ml-3 mt-2">
							<button class="boxes py-1 clickedBox">최근 6개월</button>
							<button class="boxes py-1">2023</button>
							<button class="boxes py-1">2022</button>
							<button class="boxes py-1">2021</button>
							<button class="boxes py-1">2020</button>
							<button class="boxes py-1">2019</button>
							<button class="boxes py-1">2018</button>
						</div>
					</div>
					
					<div class="d-flex mt-4 ml-3" style="width: 95%;">
						<button id="all" value="all" class="classifyMine selectedClass">전체</button>
						<button id="deliver" value="deliver" class="classifyMine">배송상품</button>
						<button id="travel" value="travel" class="classifyMine">여행상품</button>
						<button id="ticket" value="ticket" class="classifyMine">티켓상품</button>
					</div>
					
					<div id="breakDown" class="mb-4">
						
					</div>
					
					<div id="deliveryNotify" class="my-5">
						<div id="notifyTop " class="pl-4 mb-3">
							<div class="d-flex mb-3">
								<div style="width: 80%; font-weight: bold; color: #99918e; padding-top: 5px;">배송상품 주문상태 안내</div>
								<div style="width: 20%; font-size: 12px; padding-top: 5px; ">
									<a id="deleteUnderline" style="color: rgb(100, 139, 214);" href="#">
										자세한 내용 더보기>
									</a>
								</div>
							</div>
							<div class="px-4">
								<img src="//img1a.coupangcdn.com/image/my/desktop/order-status.png" width="96%">
							</div>
							<div class="d-flex pr-4">
								<div style="width: 20%; font-size: 10px; text-align: center;">
									주문,결제,확인 <br>
									이 완료되었습니다.
								</div>
								<div style="width: 20%; font-size: 10px; text-align: center;">
									판매자가 발송할 <br>
									상품을 준비중입니다.
								</div>
								<div style="width: 20%; font-size: 10px; text-align: center;">
									상품준비가 완료되어 <br>
									곧 배송될 예정입니다.
								</div>
								<div style="width: 20%; font-size: 10px; text-align: center;">
									상품이 고객님께 <br>
									배송중입니다.
								</div>
								<div style="width: 20%; font-size: 10px; text-align: center;">
									상품이 주문자에게<br>
									전달완료되었습니다
								</div>
							</div>
						</div>
						<div id="notifyBottom" class="px-4">
							<div class="pt-3"> 
								<img src="../common/image/coupang/w경고.png" width="17" height="17">
								<span class="text-danger font-weight-bold" style="font-size: 13px; vertical-align: bottom;">취소/반품/교환 신청</span>
								<span style="font-size: 12px; vertical-align: bottom; font-weight:bold; color: #99918e;">전 확인해주세요!</span>
							</div>
							<div class="my-3"> 
								<span style="font-size: 12px font-weight:bold; color: #99918e;">취소</span> <br>
								<span style="font-size: 10px; color: #99918e;">- 여행/레저/숙박 상품은 취소 시 수수료가 발생할 수 있으며,</span> <br>
								<span style="font-size: 10px; color: #99918e;"> 취소수수료를 확인하여 2일 이내(주말,공휴일 제외) 처리결과를 문자로 안내해드립니다.(당일 접수 기준, 마감시간 오후 4시)</span> <br>
								<span style="font-size: 10px; color: #99918e;">- 문화 상품은 사용 전날 24시까지 취소 신청 시 취소수수료가 발생되지 않습니다.</span><br>
								
							</div>
							<div class="my-3"> 
								<span style="font-size: 12px font-weight:bold; color: #99918e;">반품</span> <br>
								<span style="font-size: 10px; color: #99918e;">- 상품 수령 후 7일 이내 신청하여 주세요.</span> <br>
								<span style="font-size: 10px; color: #99918e;">- 상품이 출고된 이후에는 배송 완료 후, 반품 상품을 회수합니다.</span> <br>
								<span style="font-size: 10px; color: #99918e;">- 설치상품/주문제작/해외배송/신선냉동 상품 등은 고객센터에서만 반품 신청이 가능합니다.</span>
								<span><a href="#" style="font-size: 10px; color: black; text-decoration: none;">
									1:1 문의하기>
								</a></span>
							</div>
							<div class="mt-3"> 
								<span style="font-size: 12px font-weight:bold; color: #99918e;">교환</span> <br>
								<span style="font-size: 10px; color: #99918e;">- 상품의 교환 신청은 고객센터로 문의하여 주세요.</span>
								<span><a href="#" style="font-size: 10px; color: black; text-decoration: none;">
									1:1 문의하기>
								</a></span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
				
				
		<!-- 하단 footer -->
      <div id="footer">
	      	 <footer class="footer-frame">
	         <div class="footer-layer1">
	            <a href="https://news.coupang.com/" target="_blank">회사소개</a>
	            <a href="https://ir.aboutcoupang.com/English/home/" target="_blank">Investor Relations</a>
	            <a href="https://rocketyourcareer.kr.coupang.com" target="_blank">인재채용</a>
	            <a href="https://wing.coupang.com/vendor/joining/welcome?inflow=WEB_FOOTER_B">입점 / 제휴문의</a>
	            <a href="https://csmessenger.coupang.com/cs-center/notice/main">공지사항</a>
	            <a href="https://csmessenger.coupang.com/cs-center/voc/main">고객의 소리</a>
	            <a href="/np/policies/terms">이용약관</a>
	            <a href="https://privacy.coupang.com/ko/center/coupang" style="font-weight: bold;"><b>개인정보 처리방침</b></a>
	            <a href="https://rocketpay.coupang.com/rocketpay/operationTerms/coupangPcFooter">쿠팡페이 이용약관</a>
	            <a href="https://privacy.coupang.com/ko/land/coupay" style="font-weight: bold;"><b>쿠팡페이 개인정보처리방침</b></a>
	            <a href="/np/safety">신뢰관리센터</a>
	            <a href="https://partners.coupang.com/" target="_blank">제휴마케팅</a>
	            <a href="https://ads.coupang.com" target="_blank">광고안내</a>
	         </div>
	
	         <div class="footer-layer2">
	            <h1><a href="https://www.coupang.com/" title="COUPANG">COUPANG</a></h1>
	            <div>
	               <address>
	                           상호명 및 호스팅 서비스 제공 : 쿠팡(주)<br>
	                           대표이사 : 강한승,박대준<br>
	                           서울시 송파구 송파대로 570 <br>
	                           사업자 등록번호 : 120-88-00767 <br>
	                           통신판매업신고 : 2017-서울송파-0680<br>
	                  <a class="licensee"
	                     href="http://www.ftc.go.kr/info/bizinfo/communicationViewPopup.jsp?wrkr_no=1208800767"
	                     target="_blank" title="사업자정보 확인">사업자정보 확인 &gt;</a>
	               </address>
	               <div class="contact-info">
	                  <a class="call-center" href="https://csmessenger.coupang.com/cs-center/chat/main" title="365 고객센터">
	                     <strong>365고객센터</strong> | 전자금융거래분쟁처리담당<br>
	                     <em>1577-7011 (유료)</em>
	                        서울시 송파구 송파대로 570<br>
	                     <span class="contact-fax">email : help@coupang.com</span>
	                  </a>
	               </div>
	               <p class="safe-service">
	                  <strong>우리은행 채무지급보증 안내</strong><br>
	                  <span>
	                        당사는 고객님이 현금 결제한 금액에 대해<br>우리은행과 채무지급보증 계약을 체결하여<br>안전거래를 보장하고 있습니다.<br>
	                  </span>
	                  <a href="https://www.coupang.com/np/etc/popWooriService" target="_blank"
	                     style="text-decoration: underline;" title="서비스 가입사실 확인">서비스 가입사실 확인
	                     &gt;</a>
	               </p>
	            </div>
	         </div>
	
	         <div class="footer-layer3">
	            <div class="certification-list">
	            </div>
	         </div>
	
	         <div class="footer-layer4">
	            <div class="coupang-copyright">
	               <p class="info" style="padding-top: 9px;">사이버몰 내 판매되는 상품 중에는 쿠팡에 등록한 개별 판매자가 판매하는 마켓플레이스(오픈마켓) 상품이 포함되어
	                           있습니다.<br>
	                           마켓플레이스(오픈마켓) 상품의 경우 쿠팡은 통신판매중개자이며 통신판매의 당사자가 아닙니다.<br>
	                           쿠팡은 마켓플레이스(오픈마켓) 상품, 거래정보 및 거래 등에 대하여 책임을 지지않습니다.<br>
	                           쿠팡은 소비자 보호와 안전거래를 위해 신뢰관리센터(CM112@coupang.com)를 운영하고 있으며, 관련 분쟁이 발생할 경우 별도의 분쟁 처리절차에 의거 분쟁이 처리됩니다.<br>
	                     Copyright © Coupang Corp. 2010-2022 All Rights Reserved.
	               </p>
	               <ul class="sns-link">
	                  <li><a href="https://www.facebook.com/Coupang.korea" target="_blank" class="facebook"
	                        title="쿠팡 페이스북">쿠팡 페이스북</a></li>
	                  <li><a href="https://news.coupang.com/" target="_blank" class="blog" title="쿠팡 뉴스룸">쿠팡 뉴스룸</a></li>
	                  <li><a href="https://www.instagram.com/coupang" target="_blank" class="instagram" title="쿠팡 인스타그램">쿠팡
	                           인스타그램</a></li>
	               </ul>
	            </div>
	         </div>
	      </footer>
      </div>
	</body>
</html>