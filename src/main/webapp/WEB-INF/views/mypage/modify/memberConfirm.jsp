<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>쿠팡!</title>
      <link rel="icon" href="../common/image/coupang/아이콘.jpg" type="image/x-icon"> 
		
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	</head>
	
	<script src="memberConfirm.js"></script>
	
	<body>
		<div style="margin-left: 30px;">
			<div style="font-size: 40px; font-weight: bold; margin-top: 50px;">
				회원정보확인
			</div>
			<div style="margin-top: 20px; margin-bottom: 20px;">
				<span style="color: #609bc7;">coupang@oti.com</span>님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한번 확인 합니다.
			</div>
			<form style="width: 90%;">
				<div class="d-flex" style="border-top: 4px solid #969696">
					<div class="p-3" style="width: 15%; background-color: #eef1f8; border-right: 1px solid #969696; text-align: center;">
						아이디(이메일)
					</div >
					<div class="p-3">
						coupang@oti.com
					</div>
				</div>
				<div class="d-flex" style="border-top: 0.5px solid #969696; border-bottom: 0.5px solid #969696;">
					<div class="p-3" style="width: 15%; background-color: #eef1f8; border-right: 1px solid #969696; text-align: center;">
						비밀번호
					</div >
					<div class="p-3">
						<input id="password" type="password" style="width: 500px;">
					</div>
				</div>
				
				<div class="d-flex mt-4">
					<div style="width: 45%;"></div>
					<div class="d-flex justify-content-right">
						<button id="confirm" style="background-color:#19a9ef; color: white; border: none; width: 100px; height: 30px;" onclick="completeSubmit()">확인</button>
					</div>
					<div style="width: 4%;"></div>
					<div style="width: 51%;">
						<button id="cancel" style="background-color:#a3a6b5; color: white; border: none; width: 100px; height: 30px;" onclick="cancelSubmit()">취소</button>
					</div>
				</div>
			</form>
		</div>
	
	</body>
</html>