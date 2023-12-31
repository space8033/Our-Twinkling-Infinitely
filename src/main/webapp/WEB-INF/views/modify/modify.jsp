<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>OTi 회원정보수정</title>
      	<link rel="icon" href="${pageContext.request.contextPath}/resources/yuimg/favicon.png" type="image/x-icon">
		
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
		
		<script src="${pageContext.request.contextPath}/resources/js/modify.js" charset="utf-8"></script>
			
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
		<input type="hidden" id="modifyMsg" value="${msg}">
		<br>
		<form method="post" action="modify" id="modify" name="modify" onsubmit="checkValidation()">
			<input type="hidden" value="${success}" id="successMsg">
			<div class="container d-flex pt-4" style="border-top: 1px solid #e5e5e5">
				<div class="d-flex pt-2" style="width: 15%">
					<span style="font-size: 11px;">아이디</span>
					<img src="https://img.echosting.cafe24.com/skin/base/common/ico_required.gif" width="7" height="7">
				</div>
				<div>
					<input readonly="readonly" type="text" id="uid" class="m-1" value="${userInfo.users_id}" name="users_id">	
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
					<input type="password" id="pwd" class="m-1" value="${userInfo.users_password}" name="users_password">	
				</div>
				<div class="ml-2">
					(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8자~16자)
				</div>
			</div>
			<div class="container d-flex pt-1">
				<div class="d-flex pt-2" style="width: 15%">
					<!-- 에러메세지 자리 -->
				</div>
			
				<div>
				   <span id="pwdErr1" class="errorMsg text-danger d-none small" style="margin-left:10px; font-family: dotum,sans-serif; font-size: 12px;">비밀번호를 입력해주세요.</span>
				   <span id="pwdErr2" class="errorMsg text-danger d-none small" style="margin-left:10px; font-family: dotum,sans-serif; font-size: 12px;">영문/숫자/특수문자 조합으로 8~20자 입력해주세요.</span>
				</div>
			</div>	
			
			<br>
			<div class="container d-flex pt-4" style="border-top: 1px solid #e5e5e5">
				<div class="d-flex pt-2" style="width: 15%">
					<span style="font-size: 11px;">비밀번호 확인</span>
					<img src="https://img.echosting.cafe24.com/skin/base/common/ico_required.gif" width="7" height="7">
				</div>
				<div>
					<input type="password" id="pwd-check" class="m-1">	
				</div>
			</div>
			<div class="container d-flex pt-1">
				<div class="d-flex pt-2" style="width: 15%">
					<!-- 에러메세지 자리 -->
				</div>
			
				<div>
				    <span id="pwdCheckErr1" class="errorMsg text-danger d-none small" style="margin-left:10px; font-family: dotum,sans-serif; font-size: 12px;">확인을 위해 비밀번호를 다시 입력해주세요.</span>
					<span id="pwdCheckErr2" class="errorMsg text-danger d-none small" style="margin-left:10px; font-family: dotum,sans-serif; font-size: 12px;">비밀번호가 일치하지 않습니다.</span>
				</div>
			</div>	
			<br>
			<div class="container d-flex pt-4" style="border-top: 1px solid #e5e5e5">
				<div class="d-flex pt-2" style="width: 15%">
					<span style="font-size: 11px;">이름</span>
					<img src="https://img.echosting.cafe24.com/skin/base/common/ico_required.gif" width="7" height="7">
				</div>
				<div>
					<input type="text" id="name" class="m-1" value="${userInfo.users_name}" name="users_name">
				</div>
			</div>
			<div class="container d-flex pt-1">
				<div class="d-flex pt-2" style="width: 15%">
					<!-- 에러메세지 자리 -->
				</div>
			
				<div>
				    <span id="nameErr" class="errorMsg text-danger d-none small" style="margin-left:10px; font-family: dotum,sans-serif; font-size: 12px;">이름을 정확히 입력하세요.</span>
				</div>
			</div>	
			<br>
			<div class="container d-flex pt-4" style="border-top: 1px solid #e5e5e5">
				<div class="d-flex pt-2" style="width: 15%">
					<span style="font-size: 11px;">휴대전화</span>
					<img src="https://img.echosting.cafe24.com/skin/base/common/ico_required.gif" width="7" height="7">
				</div>
				<div class="d-flex">
					<input type="text" id="tel" oninput="autoHyphen(this)" maxlength="13" class="m-1" style="width:100%" value="${userInfo.users_phone}" name="users_phone">
				</div>
			</div>
			<div class="container d-flex pt-1">
				<div class="d-flex pt-2" style="width: 15%">
					<!-- 에러메세지 자리 -->
				</div>
			
				<div>
				    <span id="telErr1" class="errorMsg text-danger d-none small" style="margin-left:10px; font-family: dotum,sans-serif; font-size: 12px;">휴대폰 번호를 정확하게 입력하세요.</span>
				 <c:if test="${error2 != null}">
					<div id="telErr2" role="alert" class="alert alert-danger" style="margin-left:10px; font-family: dotum,sans-serif; font-size: 12px;">
						${error2}
					</div>
				 </c:if>
				</div>
			</div>	
			<br>
			<div class="container d-flex pt-4" style="border-top: 1px solid #e5e5e5">
				<div class="d-flex pt-2" style="width: 15%">
					<span style="font-size: 11px;">개인정보 수집 동의여부</span>
					<img src="https://img.echosting.cafe24.com/skin/base/common/ico_required.gif" width="7" height="7">
				</div>
				<div>
					<div class="d-flex mt-1">
						<input class="mx-2 mt-1" id="infoY" type="radio" name="agreement_info" value="${agreement.agreement_info}"> 동의함 
						<input class="mx-2 mt-1" id="infoN" type="radio" name="agreement_info" value="false"> 동의안함
					</div>
					<div style="font-size: 11px">마케팅 목적의 개인정보 수집 및 이용에 동의합니다.</div> 				
				</div>
			</div>
			<br>
			<div class="container d-flex pt-4" style="border-top: 1px solid #e5e5e5">
				<div class="d-flex pt-2" style="width: 15%">
					<span style="font-size: 11px;">이메일</span>
					<img src="https://img.echosting.cafe24.com/skin/base/common/ico_required.gif" width="7" height="7">
				</div>
				<div class="d-flex">
					<input type="text" id="email" class="m-1" value="${userInfo.users_email}" name="users_email">
				</div>
			</div>
			<div class="container d-flex pt-1">
				<div class="d-flex pt-2" style="width: 15%">
					<!-- 에러메세지 자리 -->
				</div>
			
				<div>
				    <span id="emailErr1" class="errorMsg text-danger d-none small" style="margin-left:10px; font-family: dotum,sans-serif; font-size: 12px;">이메일을 입력해주세요.</span>
					<span id="emailErr2" class="errorMsg text-danger d-none small" style="margin-left:10px; font-family: dotum,sans-serif; font-size: 12px;">이메일 형식으로 입력해주세요.</span>
					<c:if test="${error1 != null}">
						<div id="emailErr3" role="alert" class="alert alert-danger" style="margin-left:10px; font-family: dotum,sans-serif; font-size: 12px;">
							${error1}
						</div>
					</c:if>
				</div>
			</div>	
			<br>
			<div class="container d-flex pt-4 mb-2" style="border-top: 1px solid #e5e5e5">
				<div class="d-flex pt-2" style="width: 15%">
					<span style="font-size: 11px;">sns,sms 수신여부</span>
					<img src="https://img.echosting.cafe24.com/skin/base/common/ico_required.gif" width="7" height="7">
				</div>
				<div>
					<div class="d-flex mt-1">
						<input class="mx-2 mt-1" id="snsY" type="radio" name="agreement_sns" value="${agreement.agreement_sns}"> 수신함 
						<input class="mx-2 mt-1" id="snsN" type="radio" name="agreement_sns" value="false"> 수신안함
					</div>
					<div style="font-size: 11px">쇼핑몰에서 제공하는 유익한 이벤트 소식을 SMS로 받으실 수 있습니다.</div> 				
				</div>
			</div>		
			<br>
			<span>추가 정보</span>
			<div class="container d-flex mt-2 pt-4 pb-2" style="border-top: 1px solid #e5e5e5">
				<div class="d-flex pt-2" style="width: 15%">
					<span style="font-size: 11px;">생년월일</span>
					
				</div>
				<c:if test="${userInfo.users_bdate == null}">
					<div class="d-flex pb-3">
						<input type="date" id="year" maxlength="4" class="m-1" style="width:100%" name="users_bdate"> 
					</div>
				</c:if>
				<c:if test="${userInfo.users_bdate !=null}">
					<div class="d-flex pb-3">
						<input type="date" id="year" maxlength="4" class="m-1" style="width:100%" value="${userInfo.users_bdate}" name="users_bdate" readonly="readonly"> 
					</div>
				</c:if>
				
			</div>
			<div class="d-flex container py-4" style="border-top: 1px solid #e5e5e5">
				<div style="width:30%"></div>
				<button type="submit" class="mx-2 p-2" style="width:15%">회원정보수정</button>
				<button type="button" onclick= "cancel()" class="mx-2 p-2" style="width:15%">취소</button>
				<div style="width:30%"></div>
				<button type="button" onclick="unjoin()" style="width:10%; border: 1px solid #d0d0d0; background-color: white">회원탈퇴</button>
			</div>
		</form>
		
		<div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %> 