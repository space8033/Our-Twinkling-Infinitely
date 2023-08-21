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
	  <script src="${pageContext.request.contextPath}/resources/js/myAddressAdd.js"></script>
	  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/addressRequest.css"/>	

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
			.addAddress {
				color: rgb(41, 141, 239);
				font-weight: bold;
				text-align: center;
				border: 1px solid rgb(224, 224, 224);
				width: 95%;
				margin-left: 18px;
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
			  padding: 10px;
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
		<div id= "header">배송지 추가</div>
		<div id="wrapper" class="d-flex justify-content-center">
		<!------------------------------------- 내용 들어갈 div -------------------------------------->
			<form id="addressAdd" name="addressAdd" onsubmit="checkValidation()" action="addressAdd" method="post">
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
							<input type="tel" id="utel" placeholder="휴대폰 번호" class="inputHolder" style="border: 1px solid #d0d0d0;"
								   pattern="010-[0-9]{3,4}-[0-9]{4}" maxlength="13" oninput="autoHyphen(this)" value="${address.users_phone}" name="users_phone">
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
				<span id=deliveryNotifyErr class="errorMsg d-none text-danger small" style="border: none;">배송 요청사항을 입력해주세요.</span>
				<div id="requestModal" class="modal">
					<div id="requestContainer"  class="modal-content pl-3" style="width: 100%;  margin-top: 10px;">
						<div class="d-flex">
							<div style="width: 95%"></div>
							<div style="width: 5%">
								<span id="close">X</span>
							</div>
						</div>
						
						<div id= "header">배송 요청사항</div>
						<div class="notice">
				            <span style="padding-botton:10px;">
				           		사회적 거리두기를 위해, 모든 배송을 비대면으로 진행합니다.<br>
								‘직접 받고 부재 시 문 앞’을 선택해도 문 앞으로 배송합니다.
							</span>
				        </div>	
				         <div class="selec">     
				            <div  class="on"> 
				          		<label>
									<input type="radio" id="door" name="select" value="문 앞" checked="checked"/>
										문 앞
								</label>
							</div>
				            <div  class="on"> 
						         <label>
									<input type="radio" id="ftof" name="select" value="직접 받고 부재 시 문 앞" />
										직접 받고 부재 시 문 앞
								 </label>
							</div>
					        <div  class="on"> 
								 <label>
									<input type="radio" id="securityOffice" name="select" value="경비실"/>
										경비실
								 </label>
						    </div>
				            <div  class="on"> 
				       			<label>
									<input type="radio" id="delBox" name="select" value="택배함"/>
										택배함
				 				</label>
							</div>
						  	<div id="show1" class="on" style=" display: none; background-color: #f4f4f4; padding-left:10px; padding-right:10px;">
						  		<div>로켓배송에만 사용됩니다.</div>
						  		<div><input type="text" id="boxNo" placeholder="택배함 번호" style="width:100%;"></div>
						  	</div>
				            <div class="on"> 
				       			<label>
									<input type="radio" id="etc" name="select" value="기타사항"/>
										기타사항
					 			</label>
							</div>
						   <div id="show2" class="on" style="display: none; background-color: #f4f4f4;  padding-left:10px; padding-right:10px;">
						  		<div>소화전/EPS/TPS 등은 안전상 보관 불가</div>
						  		<div><input type="text" id = "etcName" placeholder="장소만 입력" style="width:100%;"></div>
						   </div>      
				         </div>
				                
				         <div class="num">
				         	<div class="doorNum" >공동현관 출입번호</div>
				         	<div style="padding:10px;"> 
				        		<label>
									<input type="radio" id="pwdY" name="pwdselect" value=" 공동현관 출입번호 : "/>
									<input type="text" style="width:90%;" id="pwdNo" name="pwdselect" placeholder="예 : #1234"/>
				  				</label>
							</div>
							<div class="doorNumNotice" style="padding:10px;"> 
				        		<label>
									<input type="radio" id="pwdN" name="pwdselect" value=" 비밀번호 없이 출입 가능해요." checked="checked"/>
										비밀번호없이 출입 가능해요.
					 			</label>
							</div> 
				
							<div style="color: #888888; font-size:12px; padding-right:15px;">
								입력된 공동현관 출입번호는 쿠팡이 로켓배송을 위해 필요한 정보로, 향후 배송을 위해 필요한 기간 동안 보관하는데 동의합니다.
							</div> 
				         </div>
				         
				         <div id="agreeSave">
				             	동의하고 저장하기
				         </div>
				 	</div> 
				</div>
			
				<div class="my-3">
					<input type="checkbox" id="basicCheck" style="width: 20px; height: 20px; vertical-align: middle;" 
						name="address_isdefault" value="true"> <span style="vertical-align: middle;">기본 배송지로 선택</span>
				</div>
				
				<div class="d-flex justify-content-center">
					<input id="submit" type="submit" style="border: none; background-color: #0073e8; color: white; margin-bottom: 20px;" class="inputHolder" value="저장">
				</div>
			</form>
		</div>
	</body>
</html>
