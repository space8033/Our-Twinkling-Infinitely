<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<script src="${pageContext.request.contextPath}/resources/js/myPage.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myOti.css"/>
	</head>
	
	<body class="container">
		<div class="header">
			<div id="myPlaying" class="d-flex justify center">	
				<div class="profileImg">
					<c:if test="${loginIng.users_img !=null}">
						<img id="avatar" class="rounded-circle" src="data:MIME;base64, ${loginIng.users_img}" alt="Avatar" width="160">					
					</c:if>	
					<c:if test="${loginIng.users_img == null}">		
						<img id="avatar" class="rounded-circle" src="https://mblogthumb-phinf.pstatic.net/20150427_84/ninevincent_1430122792324niOLy_JPEG/kakao_2.jpg?type=w420" alt="Avatar" width="160" onclick="changeAvatar()">
					</c:if>		
					<div>
						<form id="addMyImg" method="post" enctype="multipart/form-data" action="mypage">
							<label id="label" for="fileInput" class="text-primary" onclick="showSubmitBtn()">					
								사진 수정하기
								<input type="file" id="fileInput" name="users_mattach" style="display: none">						
								<input id="byteFile" type="hidden" name="users_imgFile" value="${loginIng.users_imgFile}">						
							</label>					
							<button id="imgSubmit" class="btn" type="submit">확인</button>
						</form>	
						<a href="${pageContext.request.contextPath}/basic" title="기본이미지로 변경">
							<img src="https://cdn-icons-png.flaticon.com/512/1/1702.png" width="20"/>
						</a>				
					</div>
				</div>
				<div class="myInfo">			
					<h2>${loginIng.users_name}</h2>
					<p>가입일: ${loginIng.users_createdDate}</p>
					<a href="${pageContext.request.contextPath}/modify">회원 정보 변경</a>
				</div>
				<div id="cash" class="mine">
					<a href="#">
						<img class="icon" src="${pageContext.request.contextPath}/resources/yuimg/won.png" width="55"/>
						<div class="text-body">적립금></div>
					</a>
					<p>0</p>
				</div>
				<div class="mine">
					<a href="#">
						<img  class="icon" src="${pageContext.request.contextPath}/resources/yuimg/coupon.png" width="55"/>
						<div class="text-body">쿠폰></div>
					</a>
					<p>${totalCoupons}</p>
				</div>
				<div class="mine">
					<a href="#">
						<img  class="icon" src="${pageContext.request.contextPath}/resources/yuimg/리뷰아이콘.png" width="55"/>
						<div class="text-body">리뷰></div>
					</a>
					<p>${totalReviews}</p>
				</div>
				<div class="mine">
					<a href="#">
						<img class="icon" src="https://cdn-icons-png.flaticon.com/512/1898/1898245.png" width="55"/>
						<div class="text-body">문의></div>
					</a>
					<p>0</p>
				</div>
			</div>
		</div>
		<div id="wrapper">
			<h6>나의 쇼핑 활동</h6>
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
	<%@ include file="/WEB-INF/views/common/footer.jsp" %> 