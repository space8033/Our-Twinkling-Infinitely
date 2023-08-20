<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<script src="${pageContext.request.contextPath}/resources/js/orderList.js"></script>
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
					<p>가입일: ${joinDay}</p>
					<a href="${pageContext.request.contextPath}/modify">회원 정보 변경</a>
				</div>
				<div id="cash" class="mine">
					<a onclick="showPointList()" href="#" class="accordion">
						<img class="icon" src="${pageContext.request.contextPath}/resources/yuimg/won.png" width="55"/>
						<div class="text-body">적립금></div>
					</a>
					<p>${totalPoints}P</p>
				</div>
				<div class="mine">
					<a onclick="showCouponList()" href="#" class="accordion" >
						<img  class="icon" src="${pageContext.request.contextPath}/resources/yuimg/coupon.png" width="55"/>
						<div class="text-body">쿠폰></div>
					</a>
					<p>${totalCoupons}</p>
				</div>
				<div class="mine">
					<a href="#" onclick="showReview()">
						<img class="icon" src="${pageContext.request.contextPath}/resources/yuimg/리뷰아이콘.png" width="55"/>
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
		<div id="myCoupons">
		  <div id="numOfcoupons">
			  <span><img src="https://cdn-icons-png.flaticon.com/512/6713/6713658.png" width="30"/></span>
			  <span>사용가능 쿠폰수: <span id="num">${totalCoupons}</span></span>
		  </div>
		  <div class="coupon-list">
			  <c:if test="${coupons != null}">
				  <c:forEach var="coupon" items="${coupons}">
				  	<div class="myCoupon">
				  		<c:if test="${coupon.coupon_type == 'BIRTHDAY_COUPON'}">
						  	<div class="coupon-date">쿠폰 지급일: ${coupon.coupon_createdDate}/ 쿠폰 만료일: ${coupon.coupon_expiredDate}</div>
						  	<div class="couponLine card">
							  	<div class="card-body">	
							  		<div class="coupon-title text-primary">					  		
								  		생일 축하 쿠폰
							  		</div>				  	
								  	<p class="coupon-detail"><fmt:formatNumber value="${coupon.coupon_value}" type="number"/>원</p>
								  	<div class="coupon-content">
								  		<span class="text-danger">
								  			<fmt:formatNumber value="${coupon.coupon_condition}" type="number"/>
								  		</span>원 이상 사용 가능!
								  	</div>	 	  	 	  		
							  	</div>
						  	</div>
				  		</c:if>		  	
				  		<c:if test="${coupon.coupon_type == 'WELCOME_COUPON'}">
						  	<div class="coupon-date">쿠폰 지급일: ${coupon.coupon_createdDate}/ 쿠폰 만료일: ${coupon.coupon_expiredDate}</div>
						  	<div class="couponLine card">
						  		<div class="card-body">
						  			<div class="coupon-title">
									  	신규 가입 쿠폰
						  			</div>					  		
								  	<p class="coupon-detail">${coupon.coupon_value}% 할인!</p>
								  	<div class="coupon-content">
								  		<span class="text-danger">
								  			<fmt:formatNumber value="${coupon.coupon_condition}" type="number"/>
								  		</span>원 이상 사용 가능!
								  	</div>	 	  		
						  		</div>
						  	</div>
				  		</c:if>		  	
				  		<c:if test="${coupon.coupon_type == 'DEL_FREE_COUPON'}">
							<div class="coupon-date">쿠폰 지급일: ${coupon.coupon_createdDate}/ 쿠폰 만료일: ${coupon.coupon_expiredDate}</div>
						  	<div class="couponLine card">
							  	<div class="card-body">	
							  		<div class="coupon-title text-primary">						  		
								  		배송비 무료 쿠폰
							  		</div>				  	
								  	<p class="coupon-detail"><fmt:formatNumber value="${coupon.coupon_value}" type="number"/>원</p>
								  	<div class="coupon-content">
								  		<span class="text-danger">
								  			<fmt:formatNumber value="${coupon.coupon_condition}" type="number"/>
								  		</span>원 이상 사용 가능!
								  	</div>	 	  	
							  	</div>
						  	</div>
				  		</c:if>		  	
				  	</div>
				  </c:forEach>
			  </c:if>
		  </div>
		  <c:if test="${totalCoupons == 0}">
		  	<div class="noCoupon card">사용가능한 쿠폰이 업습니다.</div>
		  </c:if>
		</div>
		<div id = "myPoints" class="container">
				
		<!------------------------------------- 내용 들어갈 div -------------------------------------->
				<div id="point-list" style="width: 100%; margin-top: 20px;">
					<div id="pointContainer" style="width: 100%;">
						<c:forEach var="address" items="${list}">
							<div class="myAddress">
								<div class="mt-4 mb-2 font-weight-bold">${address.address_receiver}</div>
								<c:if test="${address.address_isdefault == true}">
									<div id="standardAddress">기본배송지</div>
								</c:if>
								<div class="mt-2">${address.address_roadAddress} </div>
								<div class="mt-2">${address.address_jibunAddress} </div>
								<div class="mt-2">${address.address_extraAddress} </div>
								<div class="mt-2">${address.address_detail} </div>
								<div> ${address.users_phone}</div>
								<div> ${address.deliveryRequest}</div>
								<div><button class="modifyButton" onclick="javascript:showModifyAddress(${address.address_no})">수정</button></div>
							</div>
						</c:forEach>
					</div>
					
					<div class="d-flex justify-content-center m-4">
						<a class="btn btn-sm" href="javascript:showAddress(1)">처음</a>
						<c:if test="${pager.groupNo>1}">
							<a class="btn btn-sm" href="javascript:showAddress(${pager.startPageNo-1})">이전</a>
						</c:if>
						
						<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
							<c:if test="${pager.pageNo != i}">
								<a class="btn btn-sm" href="javascript:showAddress(${i})">${i}</a>
							</c:if>
							<c:if test="${pager.pageNo == i}">
								<a class="btn btn-sm" href="javascript:showAddress(${i})">${i}</a>
							</c:if>
						</c:forEach>
						
						<c:if test="${pager.groupNo<pager.totalGroupNo}">
							<a class="btn btn-sm" href="javascript:showAddress(${pager.endPageNo+1})">다음</a>
						</c:if>
						<a class="btn btn-sm" href="javascript:showAddress(${pager.totalPageNo}">맨끝</a>
					</div>
					
				</div>
  		</div>
		<div id="wrapper">
			<h6>나의 쇼핑 활동</h6>
			<div id="myCoupangContent" class="container">
				<ul id="menu-tab" class="nav nav-tabs nav-justified m-3">
				    <li class="t-menu nav-item">
				      <a class="nav-link active" data-toggle="tab" href="#orderList">주문 내역</a>
				    </li>
				    <li class="t-menu nav-item">
				      <a class="nav-link" data-toggle="tab" href="#addressList">배송지 관리</a>
				    </li>
				    <li class="t-menu nav-item">
				      <a class="nav-link" data-toggle="tab" href="#reviewList">리뷰 관리</a>
				    </li>
				    <li class="t-menu nav-item">
				      <a class="nav-link" data-toggle="tab" href="#cancelList">교환/환불/취소 내역</a>
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
						    <div id="cancelList" class="container tab-pane fade" style="background-color: white"><br>
						      
						    </div>
					  	</div>
					</div>
				</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %> 