<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

		<script src="${pageContext.request.contextPath}/resources/js/orderList.js"></script>
		
		<style>
			/*--------------------------------- frame ----------------------------------------*/
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
			
		</style>
	</head>
	
	<body class="container">
		<div id="wrapper">
		<!------------------------------------- 내용 들어갈 div -------------------------------------->
				<div id="myCoupangContent" class="container">
						<div class="font-weight-bold mt-4" style="font-size: 20px; margin-bottom: 10px;">주문목록</div>
					
					<ul id="menu-tab" class="nav nav-tabs nav-justified m-3">
					    <li class="t-menu nav-item">
					      <a class="nav-link active" data-toggle="tab" href="#detail">주문 내역</a>
					    </li>
					    <li class="t-menu nav-item">
					      <a class="nav-link" data-toggle="tab" href="#addressList">배송지 관리</a>
					    </li>
					    <li class="t-menu nav-item">
					      <a class="nav-link" data-toggle="tab" href="#menuu2">리뷰 관리</a>
					    </li>
					    <li class="t-menu nav-item">
					      <a class="nav-link" data-toggle="tab" href="#menuu3">교환/환불/취소 내역</a>
					    </li>
					</ul>
					
					<div class="container mt-3">
						<div class="tab-content">
						    <div id="orderList" class="container tab-pane active" style="background-color: white"><br>
							      <img src="data:MIME;base64, ${detailImg.image_fileName}"/>
						    </div>
						    <div id="addressList" class="container tab-pane fade" style="background-color: white"><br>
						    
						    </div>
						    <div id="menuu2" class="container tab-pane fade" style="background-color: white"><br>
						    
						    </div>
						    <div id="menuu3" class="container tab-pane fade" style="background-color: white"><br>
						      
						    </div>
					  	</div>
					</div>
					
					<div id="deliveryNotify" class="my-5 container">
						<div id="notifyTop " class="mb-3">
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
	<%@ include file="/WEB-INF/views/common/footer.jsp" %> 