<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
	    <meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=2.0">
		<link rel="shortcut icon"
			  href="//image9.coupangcdn.com/image/coupang/favicon/v2/favicon.ico"
			  type="image/x-icon" />
	     
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/loginForm.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/loginForm_css.css">
	    <title>쿠팡 로그인 폼</title>
	</head>
	<body>
	    <header>
	        <h1>
	        	<a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/resources/yuimg/메인로고.png" alt="OTi로고"></a>
	        </h1>
	    </header>
	    <section>
	            <input type="hidden" id="modifyMsg" value="${msg}">
	            <form id="loginForm" name="loginForm" action="loginForm" onsubmit="checkValidation()" method="post">
	                 <div class="form-group">
	                 	<div id="id-form" class="id-form-group line-gray">
	                 		<div>
							 	<label for="uid"><img src = "${pageContext.request.contextPath}/resources/image/sion/semail.JPG"></label>
							</div>
							<div>
								<input type="text" placeholder="아이디" onfocus="this.placeholder=''" id="uid" value="${loginDto.users_id}" name="users_id"
								style="outline:none;" autocomplete="off">
							</div>
						</div>	
						<span id="uidErr1" class="errorMsg text-danger d-none small" style="margin-left:10px; font-family: dotum,sans-serif; font-size: 12px;">아이디를 입력해주세요.</span>
						<span id="uidErr2" class="errorMsg text-danger d-none small" style="margin-left:10px; font-family: dotum,sans-serif; font-size: 12px;">아이디 형식으로 입력해주세요.</span>
						<c:if test="${error1 != null}">
							<span id="uidErr3" class="errorMsg text-danger small" style="margin-left:10px; font-family: dotum,sans-serif;
	    						  font-size: 12px;">${error1}
	    				    </span>
						</c:if>
						<c:if test="${error2 != null}">
							<span id="uidErr3" class="errorMsg text-danger small" style="margin-left:10px; font-family: dotum,sans-serif;
	    						  font-size: 12px;">${error2}
	    				    </span>
						</c:if>
					</div>
					
					
					 <div class="form-group">
					 	<div id="pwd-form" class="pwd-form-group line-gray">
					 		<div>
								 <label for="pwd"><img src = "${pageContext.request.contextPath}/resources/image/sion/spwd.JPG" ></label>
							</div>
							<div>	
								 <input type="password"  placeholder="비밀번호" onfocus="this.placeholder=''" id="pwd" value="${loginDto.users_password}" name="users_password"
								 style = "height: 100%; width: 370px; outline:none;" autocomplete="off">
								 
							</div>
							<div>
								<button type="button"><img id="eye" onclick="blink()" src ="${pageContext.request.contextPath}/resources/image/sion/seye.JPG"></button>
								<!-- ${pageContext.request.contextPath}/resources/image/sion/seye.JPG -->
								
							</div>
						</div>
						<span id="pwdErr1" class="errorMsg text-danger d-none small" style="margin-left:10px; font-family: dotum,sans-serif; font-size: 12px;">비밀번호를 입력해주세요.</span>
						<span id="pwdErr2" class="errorMsg text-danger d-none small" style="margin-left:10px; font-family: dotum,sans-serif; font-size: 12px;">비밀번호를 형식에 맞게 입력해주세요.</span>
	    				<c:if test="${error3 != null}">
							<span id="pwdErr3" class="errorMsg text-danger small" style="margin-left:10px; font-family: dotum,sans-serif;
	    						  font-size: 12px;">${error3}
	    				    </span>
						</c:if>
					</div>
						
				    <div class="form-check d-flex">
						 <div>
						 	<a id="idpwd" href="https://login.coupang.com/login/accountInfoFind.pang" style="font-size:14px; margin-top:5px;">아이디·비밀번호 찾기 <strong>></strong></a>
						 </div>
					</div>
	                <div class="login_form_btn">
	                    <button type="submit" id="login_btn">로그인</button>
	                    <hr/>
	                    <button onclick="joinForm" id="join_btn">회원가입</button>
	                </div>
	        
	       	   </form>
	    </section>
	    <div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %> 	        