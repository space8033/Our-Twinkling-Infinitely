<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>oti</title>
      	<link rel="icon" href="../common/image/coupang/아이콘.jpg" type="image/x-icon"> 
		
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
		
		<script src="myAddressAdd.js"></script>
			
		<style>
			button {
				border: none;
			}
		</style>
	</head>
	
	<body>
	<br>
		<div class="container" style="font-size: 26px; text-align: center;">
			회원 정보 수정
		</div>
		<br>
		<form action="">
		
			<div class="container d-flex pt-4" style="border-top: 1px solid #e5e5e5">
				<div class="d-flex pt-2" style="width: 15%">
					<span style="font-size: 11px;">아이디</span>
					<img src="https://img.echosting.cafe24.com/skin/base/common/ico_required.gif" width="7" height="7">
				</div>
				<div>
					<input type="text" id="id" class="m-1">	
				</div>
				<div class="ml-2">
					(영문자소문자/숫자, 4~16자)
				</div>
			</div>
			<br>
			<div class="container d-flex pt-4" style="border-top: 1px solid #e5e5e5">
				<div class="d-flex pt-2" style="width: 15%">
					<span style="font-size: 11px;">비밀번호</span>
					<img src="https://img.echosting.cafe24.com/skin/base/common/ico_required.gif" width="7" height="7">
				</div>
				<div>
					<input type="text" id="password" class="m-1">	
				</div>
				<div class="ml-2">
					(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자)
				</div>
			</div>
			<br>
			<div class="container d-flex pt-4" style="border-top: 1px solid #e5e5e5">
				<div class="d-flex pt-2" style="width: 15%">
					<span style="font-size: 11px;">비밀번호 확인</span>
					<img src="https://img.echosting.cafe24.com/skin/base/common/ico_required.gif" width="7" height="7">
				</div>
				<div>
					<input type="text" id="passwordConfirm" class="m-1">	
				</div>
			</div>
			<br>
			<div class="container d-flex pt-4" style="border-top: 1px solid #e5e5e5">
				<div class="d-flex pt-2" style="width: 15%">
					<span style="font-size: 11px;">이름</span>
					<img src="https://img.echosting.cafe24.com/skin/base/common/ico_required.gif" width="7" height="7">
				</div>
				<div>
					<input type="text" id="name" class="m-1">	
				</div>
			</div>
			<br>
			<div class="container d-flex pt-4" style="border-top: 1px solid #e5e5e5">
				<div class="d-flex pt-2" style="width: 15%">
					<span style="font-size: 11px;">주소</span>
				</div>
				<div>
					<div class="d-flex">
						<div style="width:20%"><input type="text" id="address" class="m-1" style="width: 100%">	</div>
						<div><button class="mt-2 ml-3">우편번호></button></div>
					</div>
					<div class="d-flex">
						<div><input type="text" id="address" class="m-1">	</div>
						<div class="mt-1 ml-2">기본 주소</div>
					</div>
					<div class="d-flex">
						<div><input type="text" id="address" class="m-1">	</div>
						<div class="mt-1 ml-2">나머지 주소(선택 입력 가능)</div>
					</div>
				</div>
			</div>
			<br>
			<div class="container d-flex pt-4" style="border-top: 1px solid #e5e5e5">
				<div class="d-flex pt-2" style="width: 15%">
					<span style="font-size: 11px;">휴대전화</span>
					<img src="https://img.echosting.cafe24.com/skin/base/common/ico_required.gif" width="7" height="7">
				</div>
				<div class="d-flex">
					<input type="text" id="phone1" class="m-1" style="width:10%">
					<span> - </span>	
					<input type="text" id="phone2" class="m-1" style="width:10%">	
					<span> - </span>	
					<input type="text" id="phone3" class="m-1" style="width:10%">	
				</div>
			</div>
			<br>
			<div class="container d-flex pt-4" style="border-top: 1px solid #e5e5e5">
				<div class="d-flex pt-2" style="width: 15%">
					<span style="font-size: 11px;">SMS 수신여부</span>
					<img src="https://img.echosting.cafe24.com/skin/base/common/ico_required.gif" width="7" height="7">
				</div>
				<div>
					<div class="d-flex mt-1">
						<input class="mx-2 mt-1" type="radio" name="receiveSms"> 수신함 
						<input class="mx-2 mt-1" type="radio" name="receiveSms"> 수신안함
					</div>
					<div style="font-size: 11px">쇼핑몰에서 제공하는 유익한 이벤트 소식을 SMS로 받으실 수 있습니다.</div> 				
				</div>
			</div>
			<br>
			<div class="container d-flex pt-4" style="border-top: 1px solid #e5e5e5">
				<div class="d-flex pt-2" style="width: 15%">
					<span style="font-size: 11px;">이메일</span>
					<img src="https://img.echosting.cafe24.com/skin/base/common/ico_required.gif" width="7" height="7">
				</div>
				<div class="d-flex">
					<input type="text" id="email" class="m-1">
				</div>
			</div>
			<br>
			<div class="container d-flex pt-4" style="border-top: 1px solid #e5e5e5">
				<div class="d-flex pt-2" style="width: 15%">
					<span style="font-size: 11px;">이메일 수신여부</span>
					<img src="https://img.echosting.cafe24.com/skin/base/common/ico_required.gif" width="7" height="7">
				</div>
				<div>
					<div class="d-flex mt-1">
						<input class="mx-2 mt-1" type="radio" name="receiveEmail"> 수신함 
						<input class="mx-2 mt-1" type="radio" name="receiveEmail"> 수신안함
					</div>
					<div style="font-size: 11px">쇼핑몰에서 제공하는 유익한 이벤트 소식을 SMS로 받으실 수 있습니다.</div> 				
				</div>
			</div>			
			
			<br>
			<br>
			<div class="d-flex container pt-4" style="border-top: 1px solid #e5e5e5">
				<div style="width:30%"></div>
				<button class="mx-2 p-2" style="width:15%">회원정보수정</button>
				<button class="mx-2 p-2" style="width:15%">취소</button>
				<div style="width:30%"></div>
				<button style="width:10%; border: 1px solid #d0d0d0; background-color: white">회원탈퇴</button>
			</div>
		</form>
		
		<hr>
	</body>
</html>