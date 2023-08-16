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
						    
						    </div>
						    <div id="addressList" class="container tab-pane fade" style="background-color: white"><br>
						    
						    </div>
						    <div id="menuu2" class="container tab-pane fade" style="background-color: white"><br>
						    
						    </div>
						    <div id="menuu3" class="container tab-pane fade" style="background-color: white"><br>
						      
						    </div>
					  	</div>
					</div>
				</div>
			</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %> 