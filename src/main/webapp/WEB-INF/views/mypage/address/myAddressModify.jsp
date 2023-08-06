<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
		
		<script src="${pageContext.request.contextPath}/resources/js/myAddressAdd.js"></script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
		    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		    function findAddress() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var roadAddr = data.roadAddress; // 도로명 주소 변수
		                var extraRoadAddr = ''; // 참고 항목 변수
		
		                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                    extraRoadAddr += data.bname;
		                }
		                // 건물명이 있고, 공동주택일 경우 추가한다.
		                if(data.buildingName !== '' && data.apartment === 'Y'){
		                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                }
		                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                if(extraRoadAddr !== ''){
		                    extraRoadAddr = ' (' + extraRoadAddr + ')';
		                }
		
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById("roadAddress").value = roadAddr;
		                document.getElementById("jibunAddress").value = data.jibunAddress;
		                
		                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
		                if(roadAddr !== ''){
		                    document.getElementById("extraAddress").value = extraRoadAddr;
		                } else {
		                    document.getElementById("extraAddress").value = '';
		                }
		
		                var guideTextBox = document.getElementById("guide");
		                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
		                if(data.autoRoadAddress) {
		                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
		                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
		                    guideTextBox.style.display = 'block';
		
		                } else if(data.autoJibunAddress) {
		                    var expJibunAddr = data.autoJibunAddress;
		                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
		                    guideTextBox.style.display = 'block';
		                } else {
		                    guideTextBox.innerHTML = '';
		                    guideTextBox.style.display = 'none';
		                }
		            }
		        }).open();
		    }
		</script>
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
			.inputHolder3 {
				width: 800px;
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
				.inputHolder3 {
					width: 800px;
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
				.inputHolder3 {
					width: 480px;
					height: 51.5px;
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
							<input type="text" id="uname" class="inputHolder" placeholder="받는 사람" style="border: 1px solid #d0d0d0;" 
									value="${address.address_receiver}" name="address_receiver">
						</div>
					</div>
					<span id=unameErr1 class="errorMsg text-danger d-none small ml-2" style="border: none">받을 사람 이름을 입력해주세요.</span>
					<span id=unameErr2 class="errorMsg text-danger d-none small ml-2" style="border: none">받는 사람 이름을 정확히 입력해주세요.</span>
				</div>
				<div class="mt-3 d-flex">
					<div style="border: 1px solid #d0d0d0;">
						<img class="addressIcon" src="${pageContext.request.contextPath}/resources/oimg/w주소.png">
					</div>
					<div>
						<input class="inputHolder2" id="findNum" type="text" placeholder="우편번호 찾기" disabled="disabled" style="border: 1px solid #d0d0d0; border-right:none; background-color: white;">
					</div>
					<div class="cursorPointer" style="border: 1px solid #d0d0d0; border-left: none;" onclick="findAddress()">
						<img class="addressIcon" src="${pageContext.request.contextPath}/resources/oimg/w돋보기.png">
					</div>
				</div>
				<div>
					<div id="addressContainer" class="mb-3">	
						<div>
							<input class="inputHolder3" type="text" id="roadAddress" placeholder="도로명주소" value="도로명주소" disabled="disabled" style="border: 1px solid #d0d0d0;">
						</div>				
						<div>
							<input class="inputHolder3" type="text" id="jibunAddress" placeholder="지번주소" disabled="disabled" style="border: 1px solid #d0d0d0;">
						</div>
						<div>
							<span id="guide" style="color:#999;display:none"></span>
						</div>
						<div>
							<input class="inputHolder3" type="text" id="extraAddress" placeholder="참고항목"disabled="disabled"  style="border: 1px solid #d0d0d0;">
						</div>
						<div>
							<input class="inputHolder3" type="text" id="detailAddress" placeholder="상세주소" style="border: 1px solid #d0d0d0;">							
						</div>
					</div>
					<span id=uaddressErr class="errorMsg d-none text-danger small ml-2" style="border: none;">주소를 검색해주세요.</span>
				</div>
				<div>
					<div class="my-3 d-flex">
						<div style="border: 1px solid #d0d0d0;">
							<img class="addressIcon" src="${pageContext.request.contextPath}/resources/oimg/w핸드폰.png">
						</div>
						<div>
							<input type="text" id="utel" placeholder="휴대폰 번호" class="inputHolder2" style="border: 1px solid #d0d0d0;"
									value="${address.usersPhone}" name="usersPhone">
						</div>
						<div class="cursorPointer" id="addButton" style="border: 1px solid #d0d0d0; border-left: none;">
							<img class="addressIcon" src="${pageContext.request.contextPath}/resources/oimg/w더하기.png">
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
				
				<div class="d-flex justify-content-center mb-3">
					<input id="submit" type="submit" style="border: none; background-color: #0073e8; color: white;" class="inputHolder" value="저장">
				</div>
				<div class="d-flex justify-content-center">
					<input id="delete" type="submit" style="border: none; background-color: #d53328; color: white;" class="inputHolder" value="삭제">
				</div>
			</form>
		</div>
	</body>
<%@ include file="/WEB-INF/views/common/footer.jsp" %> 