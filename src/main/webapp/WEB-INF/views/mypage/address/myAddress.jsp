<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
		
		<script src="${pageContext.request.contextPath}/resources/js/myAddress.js"></script>
		
		<style>
			
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
			
		</style>
	</head>
	
	<body class="container">
				
		<!------------------------------------- 내용 들어갈 div -------------------------------------->
				<div style="width: 100%; margin-top: 20px;">
					<div id="addressContainer" style="width: 100%;">
						<c:forEach var="address" items="${address}">
							<div class="myAddress">
								<div class="mt-4 mb-2 font-weight-bold">' + ${address.address_receiver} + '</div>
								<c:if test="${address.address_isdefault == true}">
									<div id="standardAddress">기본배송지</div>
								</c:if>
								<div class="mt-2">${address.address_basic} ${address.address_detail}</div>
								<div> ${address.usersPhone}</div>
								<div> ${address.deliveryRequest }</div>
								<div><button class="modifyButton" value="' + index + '">수정</button></div>
							</div>
						</c:forEach>
					</div>
					<div id="addAddress">
						+ 배송지 추가
					</div>
				</div>
      
	</body>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %> 