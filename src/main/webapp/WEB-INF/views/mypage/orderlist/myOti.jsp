<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/myOti.css"/>
		<script src="${pageContext.request.contextPath}/resources/js/orderList.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/myPage.js"></script>
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
					<a onclick="showPointList()" href="#myPoints" class="accordion">
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
					<a onclick="showPinquiryList()" href="#">
						<img class="icon" src="https://cdn-icons-png.flaticon.com/512/1898/1898245.png" width="55"/>
						<div class="text-body">문의></div>
					</a>
					<p>${pinquirys}</p>
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
		  	<div class="noCoupon card">사용가능한 쿠폰이 없습니다.</div>
		  </c:if>
		</div>
		<div id = "myPoints" class="container">
				
		<!------------------------------------- 내용 들어갈 div -------------------------------------->
				
  		</div>
  		<div id="myPinquiries">
  			<table class="table">
		       	<colgroup>
		      		<col width="7%">
		      		<col width="12%">
		      		<col width="10%">
		      		<col width="auto">
		      		<col width="12%">
		      		<col width="13%">
		      	</colgroup>
		      	<thead>
		      		<tr>
		      			<th scope="col">번호</th>
		      			<th scope="col">답변여부</th>
		      			<th scope="col">구분</th>
		      			<th scope="col">제목</th>
		      			<th scope="col">작성자</th>
		      			<th scope="col">등록일자</th>
		      		</tr>
		      	</thead>
			    <c:if test="${pinquirys == 0}">		
			    	<tbody>
						<tr>
					   		<td id="noInquiry" colspan="6">등록된 상품문의가 없습니다.</td>						
						</tr>			    	
			    	</tbody>      				   
			    </c:if>
		      	<tbody>
		      		<c:forEach var="pinquiry" items="${myinquiryList}" varStatus="i">
			      		<tr onclick="showInquiryContent(this)" style="cursor: pointer;">
			      			<td>${i.count}</td>
			      			<td>답변예정</td>
			      			<td>
			      				<c:if test="${pinquiry.PINQUIRY_TYPE == 1}">
			      					크기
			      				</c:if>
			      				<c:if test="${pinquiry.PINQUIRY_TYPE == 2}">
			      					배송
			      				</c:if>
			      				<c:if test="${pinquiry.PINQUIRY_TYPE == 3}">
			      					재입고
			      				</c:if>
			      				<c:if test="${pinquiry.PINQUIRY_TYPE == 4}">
			      					상품상세문의
			      				</c:if>
			      				<c:if test="${pinquiry.PINQUIRY_TYPE == 5}">
			      					기타
			      				</c:if>
			      			</td>
			      			<td>${pinquiry.PINQUIRY_TITLE}</td>
			      			<td>${pinquiry.USERS_USERS_ID}</td>
			      			<td>${pinquiry.PINQUIRY_CREATEDDATE}</td>
			      		</tr>
			      		<tr class="content-row">
			      			<td colspan="6" style="background-color: #f5f5f5;">
			      				<div class="content">${pinquiry.PINQUIRY_CONTENT}</div>
			      			</td>	
			      		</tr>			      		
		      		</c:forEach>
		      	</tbody>
	      </table>
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