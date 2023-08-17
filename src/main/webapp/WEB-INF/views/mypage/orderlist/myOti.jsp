<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<script src="${pageContext.request.contextPath}/resources/js/orderList.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myOti.css"/>
	</head>
	
	<body class="container">
		<div class="header">
			 <img id="avatar" src="" alt="Avatar" onclick="changeAvatar()">
			<div>
				<h2>${loginIng.users_id}</h2>
			</div>
		  <p>Scroll down to see the sticky effect.</p>
		</div>
	
		<div id="wrapper">
				<div id="myCoupangContent" class="container">
					<ul id="menu-tab" class="nav nav-tabs nav-justified m-3">
					    <li class="t-menu nav-item">
					      <a class="nav-link active" data-toggle="tab" href="#detail">주문 내역</a>
					    </li>
					    <li class="t-menu nav-item">
					      <a class="nav-link" data-toggle="tab" href="#addressList">배송지 관리</a>
					    </li>
					    <li class="t-menu nav-item">
					      <a class="nav-link" data-toggle="tab" href="#reviewList">리뷰 관리</a>
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
						    <div id="reviewList" class="container tab-pane fade" style="background-color: white"><br>
						    
						    </div>
						    <div id="menuu3" class="container tab-pane fade" style="background-color: white"><br>
						      
						    </div>
					  	</div>
					</div>
				</div>
			</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %> 