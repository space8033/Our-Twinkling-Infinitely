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
		
		<script src="myAddress.js"></script>
		
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
				width: 18%;
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
			
			.myAddress {
				width: 95%;
				margin-left : 18px;
				padding-left: 15px;
				border: 1px solid rgb(224, 224, 224);
			}
			#standardAddress {
				border: 1px solid black;
				border-radius: 7px 7px 7px 7px;
				width: 63px;
				font-size: 12px;
				color: gray;
				/* display: none; */
			}
			.modifyButton {
				color: #628ac5;
				text-align: center;
				background-color: white;
				border: 1px solid rgb(224, 224, 224);
				width: 80px;
				margin-top: 5px;
				margin-bottom: 15px;
			}
			#addAddress {
				color: rgb(41, 141, 239);
				font-weight: bold;
				text-align: center;
				border: 1px solid rgb(224, 224, 224);
				width: 95%;
				margin-left: 18px;
				margin-top: 10px;
				font-size: 25px;
				border-bottom-width: 3px;
				cursor: pointer;
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
	
	<body>
		<div id="wrapper" style="width:1400px; padding-left: 400px;">
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
								<li><a href="mycoupang.jsp">주문목록/배송조회</a></li>
								<li><a href="cancelHistory.jsp">취소/반품/교환/환불 내역</a></li>
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
								<li><a href="myAddress.jsp" style="color: rgb(95, 144, 210)">배송지 관리</a></li>
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
				<div style="width: 100%; margin-top: 20px;">
					<div id="addressContainer" style="width: 100%;">
						
					</div>
					<div id="addAddress">
						+ 배송지 추가
					</div>
				</div>
			</div>
		</div>
		<!-- 하단 footer -->
      <div id="footer">
      </div>
	</body>
</html>