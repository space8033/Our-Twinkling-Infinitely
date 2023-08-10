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
	  <script src="${pageContext.request.contextPath}/resources/js/myAddressModify.js"></script>
	  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	  <script>
			function findAddress() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var roadAddr = data.roadAddress; // 도로명 주소 변수
		                var extraRoadAddr = ''; // 참고 항목 변수
		
		                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    extraRoadAddr += data.bname;
		                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                extraRoadAddr = ' (' + extraRoadAddr + ')';
		
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById("roadAddress").value = roadAddr;
		                document.getElementById("jibunAddress").value = data.jibunAddress;
		                document.getElementById("extraAddress").value = extraRoadAddr;
	
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
			
			.modal {
			  display: none; /* Hidden by default */
			  position: fixed; /* Stay in place */
			  z-index: 1; /* Sit on top */
			  left: 0;
			  top: 0;
			  width: 100%; /* Full width */
			  height: 100%; /* Full height */
			  overflow: auto; /* Enable scroll if needed */
			  background-color: rgb(0,0,0); /* Fallback color */
			  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
			}
			
			/* Modal Content/Box */
			.modal-content {
			  background-color: #fefefe;
			  margin: 15% auto; /* 15% from the top and centered */
			  padding: 20px;
			  border: 1px solid #888;
			  width: 50%; /* Could be more or less, depending on screen size */
			}
			#close {
			  color: #aaa;
			  font-size: 28px;
			  font-weight: bold;
			}
			
			#close:hover,
			#close:focus {
			  color: black;
			  text-decoration: none;
			  cursor: pointer;
			}
			
			#selectRequest:hover {
				cursor: pointer;
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
				.modal-content {
				  width: 50%; /* Could be more or less, depending on screen size */
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
				.modal-content {
				  width: 80%; /* Could be more or less, depending on screen size */
				}
			}
		</style>
	</head>
	
	<body class="container">
		<div id="wrapper" class="d-flex justify-content-center">	
		<!------------------------------------- 내용 들어갈 div -------------------------------------->
			<form id="modifyForm" name="modifyForm" action="modifyForm" method="post" class="pt-5">
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
							<input class="inputHolder3" type="text" id="roadAddress" value="도로명주소"  placeholder="도로명주소" readonly="readonly" style="border: 1px solid #d0d0d0;"
										value="${address.address_roadAddress}" name="address_roadAddress">
						</div>				
						<div>
							<input class="inputHolder3" type="text" id="jibunAddress" placeholder="지번주소" readonly="readonly" style="border: 1px solid #d0d0d0;"
										value="${address.address_jibunAddress}" name="address_jibunAddress">
						</div>
						<div>
							<input class="inputHolder3" type="text" id="extraAddress" placeholder="참고항목" readonly="readonly"  style="border: 1px solid #d0d0d0;"
										value="${address.address_extraAddress}" name="address_extraAddress">
						</div>
						<div>
							<input class="inputHolder3" type="text" id="detail" placeholder="상세주소" style="border: 1px solid #d0d0d0;"
										value="${address.address_detail}" name="address_detail">
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
							<input type="text" id="utel" placeholder="휴대폰 번호" class="inputHolder" style="border: 1px solid #d0d0d0;"
									value="${address.users_phone}" name="users_phone">
						</div>
					</div>
					<span id=utelErr1 class="errorMsg text-danger d-none small ml-2" style="border: none;">휴대폰 번호를 입력해주세요.</span>
					<span id=utelErr2 class="errorMsg text-danger d-none small ml-2" style="border: none;">국내 휴대폰 번호만 가능합니다.</span>
				</div>
				<div class="my-3 d-flex">
					<div style="border: 1px solid #d0d0d0;">
						<img class="addressIcon" src="${pageContext.request.contextPath}/resources/oimg/w요청사항.png">
					</div>
					<div>
						<input id="deliveryNotify" class="inputHolder2" type="text" placeHolder="배송 요청사항" readonly="readonly" style="border: 1px solid #d0d0d0; border-right:none; background-color: white;" value="${address.deliveryRequest}" name="deliveryRequest">
					</div>
					<div id="modalButton" class="cursorPointer" style="border: 1px solid #d0d0d0; border-left: none;">
						<img class="addressIcon" src="${pageContext.request.contextPath}/resources/oimg/w우꺽쇠.png" >
					</div>
				</div>
				<div id="requestModal" class="modal">
					<div class="modal-content">
						<div class="d-flex">
							<div style="width: 87%"></div>
							<div style="width: 13%">
								<span id="close">X</span>
							</div>
						</div>
						<div>
							<input type="radio" name="requestType" value="문 앞 보관">
							<label for="door">문 앞 보관</label>							
						</div>
						<div>
							<input type="radio" name="requestType" value="경비실 보관">
							<label for="securityOffice">경비실 보관</label>
						</div>
						<div>
							<input type="radio" name="requestType" value="택배함 보관">
							<label for="courierBox">택배함 보관</label>
						</div>
						<br>
						<div class="d-flex">
							<div style="width: 85%"></div>
							<div id="selectRequest" class="p-2" style="border: solid 1px black; background-color: #0073e8; color: white">선택</div>
						</div>
					</div>
				</div>
			
				<div class="my-3">
					<input type="checkbox" id="basicCheck" style="width: 20px; height: 20px; vertical-align: middle;" 
						name="address_isdefault" value="true"> <span style="vertical-align: middle;">기본 배송지로 선택</span>
				</div>
				
				<div class="d-flex justify-content-center">
					<input id="submit" type="submit" style="border: none; background-color: #0073e8; color: white;" class="inputHolder" value="저장">
				</div>
				<div class="d-flex justify-content-center mt-3">
					<input id="delete" type="submit" style="border: none; background-color: #d53328; color: white;" class="inputHolder" value="삭제">
				</div>
			</form>
		</div>
	</body>
</html>