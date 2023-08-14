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
		
			#header {
				font-family: apple sd gothic neo,malgun gothic,nanumbarungothic,nanumgothic,dotum,sans-serif;
			    border: 0;
			    padding: 9px 0;
			    color: #111;
			    font-size: 16px;
			    line-height: 22px;
			    text-align: center;
			    font-weight: bold;
			    border-bottom : 1px solid rgb(224, 224, 224);
			    margin-bottom: 10px;
			}
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
			.selectButton {
				color: white;
				text-align: center;
				background-color: #628ac5;
				border: 1px solid rgb(224, 224, 224);
				width: 80px;
				margin-top: 5px;
				margin-bottom: 15px;
			}
			.select {
				color: white;
				text-align: center;
				background-color: #628ac5;
				border: 1px solid rgb(224, 224, 224);
				width: 80px;
				margin-top: 5px;
				margin-bottom: 15px;
				margin-right: 10px;
			}
			#addAddress {
				color: rgb(41, 141, 239);
				background-color: white;
				font-weight: bold;
				text-align: center;
				border: 1px solid rgb(224, 224, 224);
				width: 95%;
				margin-left: 18px;
				margin-top: 10px;
				margin-bottom: 20px;
				font-size: 25px;
				border-bottom-width: 3px;
				height: 60px;
				cursor: pointer;
			}
			
		</style>
	</head>
	
	<body>
		<div id= "header">배송지 선택</div>
				
		<!------------------------------------- 내용 들어갈 div -------------------------------------->
		<div class="container" style="width: 100%;">
			<div id="addressContainer" style="width: 100%;">
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
						<div class="d-flex justify-content-between">
							 <button class="modifyButton" onclick=location.href="addressModify?addressNo=${address.address_no}">수정</button> 
						    <!--  <button class="selectButton mr-3" onclick=location.href="orderPay?addressNo=${address.address_no}">선택</button>  -->
						    <a class="select btn btn-outline-primary btn-sm" href="javascript:select(${address.address_no})">선택</a>
						</div>
					</div>	
				</c:forEach>	
			</div>
		</div>
			
			<div class="d-flex justify-content-center m-4">
				<a class="btn btn-sm" href="?pageNo=1">처음</a>
				<c:if test="${pager.groupNo>1}">
					<a class="btn btn-sm" href="?pageNo=${pager.startPageNo-1}">이전</a>
				</c:if>
				
				<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
					<c:if test="${pager.pageNo != i}">
						<a class="btn btn-sm" href="?pageNo=${i}">${i}</a>
					</c:if>
					<c:if test="${pager.pageNo == i}">
						<a class="btn btn-sm" href="?pageNo=${i}">${i}</a>
					</c:if>
				</c:forEach>
				
				<c:if test="${pager.groupNo<pager.totalGroupNo}">
					<a class="btn btn-sm" href="?pageNo=${pager.endPageNo+1}">다음</a>
				</c:if>
				<a class="btn btn-sm" href="?pageNo=${pager.totalPageNo}">맨끝</a>
			</div>
			
			<button id="addAddress" onclick=location.href="addressAdd">
				+ 배송지 추가
			</button>
      
	</body>
	