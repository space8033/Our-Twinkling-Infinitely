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
		<div id= "header">주문 상세보기</div>
				
		<!------------------------------------- 내용 들어갈 div -------------------------------------->
		<div class="container" style="width: 100%;">
			<div id="detailContainer" style="width: 100%;">
			<c:forEach var="orderInfo" items="${detailList}" varStatus="c">
			    주문번호 : ${orderInfo.orderNo}
			    총 결제 금액 : ${orderInfo.totalPrice}
			    배송지 : ${orderInfo.address}
			    배송 요청사항 : ${orderInfo.addressRequest}
			    쿠폰 사용 내역 : ${orderInfo.couponContent}
			    포인트 사용 내역 : ${orderInfo.usedPoint}
			</c:forEach>
			</div>
		</div>
			
			
      
	</body>
	