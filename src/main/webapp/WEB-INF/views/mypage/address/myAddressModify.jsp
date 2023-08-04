<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
	
		<script src="${pageContext.request.contextPath}/resources/js/myAddressModify.js"></script>
		
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
		</style>
	</head>
	
	<body>
		<div id="wrapper" class="container">			
		<!------------------------------------- 내용 들어갈 div -------------------------------------->
				<div id="container">
				
				</div>
				 <form id="registerForm" name="registerForm" novalidate method="post" style="padding-left: 30px; padding-top: 50px;">
					<div class="my-3">
						<div class="my-3 d-flex">
							<div style="border: 1px solid #d0d0d0;">
								<img src="${pageContext.request.contextPath}/resources/oimg/w회원.png" width="50" height="50">
							</div>
							<div>
								<input type="text" id="uname" class="inputHolder" value="구구팡" style="height: 51.5px; width: 750px; border: 1px solid #d0d0d0;">
							</div>
						</div>
						<span id=unameErr1 class="errorMsg text-danger d-none small ml-2" style="border: none">받을 사람 이름을 입력해주세요.</span>
						<span id=unameErr2 class="errorMsg text-danger d-none small ml-2" style="border: none">받는 사람 이름을 정확히 입력해주세요.</span>
					</div>
					
					<div>
						<div class="d-flex">
							<div style="border: 1px solid #d0d0d0;">
								<img src="${pageContext.request.contextPath}/resources/oimg/w주소.png" width="50" height="101">						
							</div>
							<div>
								<div class="d-flex">
									<div>
										<input id="findNum" type="text" disabled="disabled" value="서울특별시 여기구 저기동 안아파트" style="height: 51.5px; width: 700px; border: 1px solid #d0d0d0; border-right:none; background-color: white;">
									</div>
									<div class="cursorPointer" style="border: 1px solid #d0d0d0; border-left: none;">
										<img src="${pageContext.request.contextPath}/resources/oimg/w돋보기.png" width="50" height="50">
									</div>
								</div>
								<div>
									<input id="findNum" type="text" value="강호동 강백호" style="height: 51.5px; width: 750.5px; border: 1px solid #d0d0d0; background-color: white;">								
								</div>
							</div>
						</div>
					</div>
					<div>
						<div class="my-3 d-flex">
							<div style="border: 1px solid #d0d0d0;">
								<img src="${pageContext.request.contextPath}/resources/oimg/w핸드폰.png" width="50" height="50">
							</div>
							<div>
								<input type="text" id="utel" placeholder="휴대폰 번호" value="010-1234-5678" class="inputHolder" style="height: 51.5px; width: 700px; border: 1px solid #d0d0d0;">
							</div>
							<div class="cursorPointer" id="addButton" style="border: 1px solid #d0d0d0; border-left: none;">
								<img src="${pageContext.request.contextPath}/resources/oimg/w더하기.png" width="50" height="50">
							</div>
						</div>
						<span id=utelErr1 class="errorMsg text-danger d-none small ml-2" style="border: none;">휴대폰 번호를 입력해주세요.</span>
						<span id=utelErr2 class="errorMsg text-danger d-none small ml-2" style="border: none;">국내 휴대폰 번호만 가능합니다.</span>
					</div>
					<div class="d-none" id="contactBox">
						<div class="my-3 d-flex">
							<div style="border: 1px solid #d0d0d0;">
								<img src="${pageContext.request.contextPath}/resources/oimg/w전화.png" width="50" height="50">
							</div>
							<div>
								<input type="text" value="010-1111-2222" id="contact" class="inputHolder" style="height: 51.5px; width: 700px; border: 1px solid #d0d0d0;">
							</div>
							<div class="cursorPointer" id="removeButton" style="border: 1px solid #d0d0d0; border-left: none;">
								<img src="${pageContext.request.contextPath}/resources/oimg/w빼기.png" width="50" height="50">
							</div>
						</div>
						<span id=contactErr class="errorMsg text-danger d-none small ml-2" style="border: none;">연락처 번호를 정확히 입력해주세요.</span>
					</div>
					<div class="my-3 d-flex">
						<div style="border: 1px solid #d0d0d0;">
							<img src="${pageContext.request.contextPath}/resources/oimg/w요청사항.png" width="50" height="50">
						</div>
						<div>
							<input id="deliveryNotify" type="text" value="문 앞에 두고 도망가세여" disabled="disabled" style="height: 51.5px; width: 700px; border: 1px solid #d0d0d0; border-right:none; background-color: white;">
						</div>
						<div class="cursorPointer" style="border: 1px solid #d0d0d0; border-left: none;">
							<img src="${pageContext.request.contextPath}/resources/oimg/w우꺽쇠.png" width="50" height="50">
						</div>
					</div>
					
					<div class="my-3">
						<input type="checkbox" id="basicCheck" checked=checked style="width: 20px; height: 20px; vertical-align: middle;"> <span style="vertical-align: middle;">기본 배송지로 선택</span>
					</div>
					
					<input id="submit" type="submit" style="border: none; margin-bottom: 5px; width: 800px; height: 50px; background-color: #0073e8; color: white;" value="저장">
					<input id="cancel" type="submit" style="border: 1px solid #d8d8d8; margin-top: 5px; width: 800px; height: 50px; background-color: white; color: #b44442;" value="삭제">
				</form> 
			</div>
		</div>	
	</body>
<%@ include file="/WEB-INF/views/common/footer.jsp" %> 