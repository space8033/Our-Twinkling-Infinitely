<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
		
		<script src="${pageContext.request.contextPath}/resources/js/myAddressAdd.js"></script>
		
		<style>
			
			.myAddress {
				width: 95%;
				margin-top : 25px;
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
			.addAddress {
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
			#deliveryNotify::placeholder{
				color: rgb(82, 123, 179);
				font-weight: bold;
			}
			#findNum::placeholder {
				color: rgb(82, 123, 179);
				font-weight: bold;
			}
			#deliveryNotify:hover{
				cursor: pointer;
			}
			#findNum:hover {
				cursor: pointer;
			}
			.cursorPointer {
				cursor: pointer;
			}
			.inputHolder:focus::placeholder {
				color: transparent;
			}
			.redLine {
				border: 1px solid red;
			}
			.addressIcon {
				width: 50px;
				height: 50px;
			}
			.inputHolder {
				width: 750px;
				height: 51.5px;
			}
			.inputHolder2 {
				width: 700px;
				height: 51.5px;
			}
			
			
			@media (min-width:1250px)  {
				.addressIcon {
					width: 50px;
					height: 50px;
				}
				.inputHolder {
					width: 750px;
					height: 51.5px;
				}
				.inputHolder2 {
					width: 700px;
					height: 51.5px;
				}
			}
			
			@media (max-width:768px)  {
				.addressIcon {
					width:  40px;
					height: 50px;
					justify-content: center;
				}
				.inputHolder {
					width: 440px;
					height: 51.5px;
					justify-content: center;
				}
				.inputHolder2 {
					width: 400px;
					height: 51.5px;
					justify-content: center;
				}
			}
		</style>
	</head>
	
	<body class="container">
		<div id="wrapper" class="d-flex justify-content-center">	
		<!------------------------------------- 내용 들어갈 div -------------------------------------->
			<form id="registerForm" name="registerForm" novalidate method="post" class="pt-5">
				<div class="my-3">
					<div class="my-3 d-flex">
						<div style="border: 1px solid #d0d0d0;">
							<img class="addressIcon" src="${pageContext.request.contextPath}/resources/oimg/w회원.png">
						</div>
						<div>
							<input type="text" id="uname" class="inputHolder" placeholder="받는 사람" style="border: 1px solid #d0d0d0;">
						</div>
					</div>
					<span id=unameErr1 class="errorMsg text-danger d-none small ml-2" style="border: none">받을 사람 이름을 입력해주세요.</span>
					<span id=unameErr2 class="errorMsg text-danger d-none small ml-2" style="border: none">받는 사람 이름을 정확히 입력해주세요.</span>
				</div>
				<div class="my-3 d-flex">
					<div style="border: 1px solid #d0d0d0;">
						<img class="addressIcon" src="${pageContext.request.contextPath}/resources/oimg/w주소.png">
					</div>
					<div>
						<input class="inputHolder2" id="findNum" type="text" placeholder="우편번호 찾기" disabled="disabled" style="border: 1px solid #d0d0d0; border-right:none; background-color: white;">
					</div>
					<div class="cursorPointer" style="border: 1px solid #d0d0d0; border-left: none;">
						<img class="addressIcon" src="${pageContext.request.contextPath}/resources/oimg/w돋보기.png">
					</div>
				</div>
				<div>
					<div class="my-3 d-flex">
						<div style="border: 1px solid #d0d0d0;">
							<img class="addressIcon" src="${pageContext.request.contextPath}/resources/oimg/w핸드폰.png">
						</div>
						<div>
							<input type="text" id="utel" placeholder="휴대폰 번호" class="inputHolder2" style="border: 1px solid #d0d0d0;">
						</div>
						<div class="cursorPointer" id="addButton" style="border: 1px solid #d0d0d0; border-left: none;">
							<img class="addressIcon" src="${pageContext.request.contextPath}/resources/oimg/w더하기.png"">
						</div>
					</div>
					<span id=utelErr1 class="errorMsg text-danger d-none small ml-2" style="border: none;">휴대폰 번호를 입력해주세요.</span>
					<span id=utelErr2 class="errorMsg text-danger d-none small ml-2" style="border: none;">국내 휴대폰 번호만 가능합니다.</span>
				</div>
				<div class="d-none" id="contactBox">
					<div class="my-3 d-flex">
						<div style="border: 1px solid #d0d0d0;">
							<img class="addressIcon" src="${pageContext.request.contextPath}/resources/oimg/w전화.png">
						</div>
						<div>
							<input type="text" placeholder="연락처" id="contact" class="inputHolder2" style="border: 1px solid #d0d0d0;">
						</div>
						<div class="cursorPointer" id="removeButton" style="border: 1px solid #d0d0d0; border-left: none;">
							<img class="addressIcon" src="${pageContext.request.contextPath}/resources/oimg/w빼기.png">
						</div>
					</div>
					<span id=contactErr class="errorMsg text-danger d-none small ml-2" style="border: none;">연락처 번호를 정확히 입력해주세요.</span>
				</div>
				<div class="my-3 d-flex">
					<div style="border: 1px solid #d0d0d0;">
						<img class="addressIcon" src="${pageContext.request.contextPath}/resources/oimg/w요청사항.png">
					</div>
					<div>
						<input id="deliveryNotify" class="inputHolder2" type="text" placeholder="배송 요청사항" disabled="disabled" style="border: 1px solid #d0d0d0; border-right:none; background-color: white;">
					</div>
					<div class="cursorPointer" style="border: 1px solid #d0d0d0; border-left: none;">
						<img class="addressIcon" src="${pageContext.request.contextPath}/resources/oimg/w우꺽쇠.png" >
					</div>
				</div>
				
				<div class="my-3">
					<input type="checkbox" id="basicCheck" style="width: 20px; height: 20px; vertical-align: middle;"> <span style="vertical-align: middle;">기본 배송지로 선택</span>
				</div>
				
				<input id="submit" type="submit" style="border: none; background-color: #0073e8; color: white;" class="inputHolder"value="저장">
			</form>
		</div>
	</body>
<%@ include file="/WEB-INF/views/common/footer.jsp" %> 