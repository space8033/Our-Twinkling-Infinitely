<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="icon" href="${pageContext.request.contextPath}/resources/images/logo-spring.png" type="image/x-icon">
      <title>Insert title here</title>
      
      <!-- Bootstrap을 사용하기 위한 외부 라이브러리 가져오기 -->
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
      <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	  <script src="${pageContext.request.contextPath}/resources/js/myAddress.js"></script>
		
		<style>
		
			
			
		</style>
	</head>
	
	<body>
		
				
		<!------------------------------------- 내용 들어갈 div -------------------------------------->
		<div class="container" style="width: 100%; height: 100%">
			<div id= "header" class="my-2" style="text-align: center; font-size: 20px; font-weight: bold;">주문 상세보기</div>
			<div id="detailContainer" style="width: 100%; font-size: 15px;">
			<c:forEach var="orderInfo" items="${detailList}" varStatus="c">
				<ul class="list-group">
				  <li class="list-group-item">주문번호 : ${orderInfo.orderNo} </li>
				  <li class="list-group-item">총 결제 금액 : ${orderInfo.totalPrice} 원</li>
				  <li class="list-group-item">배송지 : ${orderInfo.address} </li>
				  <li class="list-group-item">배송 요청사항 : ${orderInfo.addressRequest} </li>
				  <li class="list-group-item">쿠폰 사용 내역 : 
					  <c:if test="${orderInfo.couponContent == 'NO_COUPON0'}">
					  	 쿠폰을 사용해서 할인받은 금액이 없습니다.
					  </c:if>
					  <c:if test="${orderInfo.couponContent == 'DEL_FREE_COUPON2500'}">
					  	 COMEBACK 쿠폰 사용 / 배송비 무료
					  </c:if>
					  <c:if test="${orderInfo.couponContent == 'BIRTHDAY_COUPON2000'}">
					  	 생일 쿠폰 사용 / 2000원 할인
					  </c:if>
					  <c:if test="${orderInfo.couponContent == 'WELCOME_COUPON10'}">
					  	 가입 쿠폰 사용 / 10% 할인 적용
					  </c:if>
				  </li>
			      <li class="list-group-item">포인트 사용 내역 : ${orderInfo.usedPoint} P</li>
				</ul>    
			</c:forEach>
			</div>
		</div>
      
	</body>
	