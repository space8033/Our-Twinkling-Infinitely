<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		
		<script src="${pageContext.request.contextPath}/resources/js/joinForm.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/joinForm_css.css">
    <title>쿠팡 회원가입 폼</title>
</head>
<body>
    <header>
        <h1><a href="https://www.coupang.com/"><img src="${pageContext.request.contextPath}/resources/image/coupanglogo.png" alt="쿠팡로고"></a></h1>
    </header>
    <section>
    	<form id="joinForm" name="joinForm" action="#" onsubmit="checkValidation()" novalidate method="post">
        	
        	
        	회원정보를 입력해주세요.
        	<div class="form-group">
            	<div id="id-form" class="id-form-group line-gray">
                 	<div>
						<label for="id"><img src = "${pageContext.request.contextPath}/resources/image/sion/semail.JPG"></label>
					</div>
					<div>
						<input type="text" class="input" placeholder="아이디" id="id" onfocus="this.placeholder=''"
							  autocomplete="off">
						
					</div>
				</div>	
				<span id="uidErr1" class="errorMsg text-danger d-none small" style="margin-left:10px; font-family: dotum,sans-serif; font-size: 12px;">아이디를 입력해주세요.</span>
				<span id="uidErr2" class="errorMsg text-danger d-none small" style="margin-left:10px; font-family: dotum,sans-serif; font-size: 12px;">이미 가입된 아이디입니다.</span>
				<span id="uidErr3" class="errorMsg text-danger d-none small" style="margin-left:10px; font-family: dotum,sans-serif; font-size: 12px;">아이디를 올바르게 입력해주세요.</span>
				
		   </div>
				
				
		   <div class="form-group">
		 	   <div id="pwd-form" class="pwd-form-group line-gray">
				   <div>
						<label for="pwd"><img src = "${pageContext.request.contextPath}/resources/image/sion/spwd.JPG"></label>
				   </div>
				   <div>	
						<input type="password"  onfocus="this.placeholder=''"  placeholder="비밀번호" id="pwd"
							   autocomplete="off">
				   </div>
			   </div>
		       <span id="pwdErr1" class="errorMsg text-danger d-none small" style="margin-left:10px; font-family: dotum,sans-serif; font-size: 12px;">비밀번호를 입력해주세요.</span>
			   <span id="pwdErr2" class="errorMsg text-danger d-none small" style="margin-left:10px; font-family: dotum,sans-serif; font-size: 12px;">비밀번호 형식에 맞게 입력해주세요.</span>
			   <span id="pwdErr3" class="errorMsg text-danger d-none small" style="margin-left:10px; font-family: dotum,sans-serif; font-size: 12px;">사용 가능한 비밀번호입니다.</span>
		   </div>
				
		   <div class="form-group">
		    	<div id="pwd-form-check" class="pwd-form-group line-gray">
				 	<div>
						 <label for="pwd-check"><img src = "${pageContext.request.contextPath}/resources/image/sion/spwdcheck.JPG" ></label>
					</div>
					<div>	
						 <input type="password"  placeholder="비밀번호 확인" id="pwd-check"
							    onfocus="this.placeholder=''" autocomplete="off">
					</div>
				</div>
				<span id="pwdCheckErr1" class="errorMsg text-danger d-none small" style="margin-left:10px; font-family: dotum,sans-serif; font-size: 12px;">확인을 위해 비밀번호를 다시 입력해주세요.</span>
				<span id="pwdCheckErr2" class="errorMsg text-danger d-none small" style="margin-left:10px; font-family: dotum,sans-serif; font-size: 12px;">비밀번호가 일치하지 않습니다.</span>
				<span id="pwdCheckErr3" class="errorMsg text-danger d-none small" style="margin-left:10px; font-family: dotum,sans-serif; font-size: 12px;">비밀번호가 일치합니다.</span>
		   </div>
				
				
		   <div class="form-group">
                <div id="email-form" class="email-form-group line-gray">
                 	 <div>
					    <label for="email"><img src = "${pageContext.request.contextPath}/resources/image/sion/semail.JPG"></label>
				 	 </div>
		    		 <div>
						<input type="email" onfocus="this.placeholder=''" placeholder="이메일" id="email"
						        autocomplete="off">
					 </div>
			    </div>
				<span id="emailErr1" class="errorMsg text-danger d-none small" style="margin-left:10px; font-family: dotum,sans-serif; font-size: 12px;">이메일을 입력해주세요.</span>
				<span id="emailErr2" class="errorMsg text-danger d-none small" style="margin-left:10px; font-family: dotum,sans-serif; font-size: 12px;">이메일 형식으로 입력해주세요.</span>
				<span id="emailErr3" class="errorMsg text-danger d-none small" style="margin-left:10px; font-family: dotum,sans-serif; font-size: 12px;">이미 가입된 이메일입니다.</span>
		   </div>
				
				
		   <div class="form-group">
                <div id="name-form" class="name-form-group line-gray">
                 	 <div>
						 <label for="name"><img src = "${pageContext.request.contextPath}/resources/image/sion/sname.JPG"></label>
					 </div>
					<div>
						<input type="text" onfocus="this.placeholder=''" placeholder="이름" id="name"
							    autocomplete="off">
					</div>
				</div>
				<span id="nameErr" class="errorMsg text-danger d-none small" style="margin-left:10px; font-family: dotum,sans-serif; font-size: 12px;">이름을 정확히 입력하세요.</span>
		   </div>
				
				
		   <div class="form-group">
                 <div id="tel-form" class="tel-form-group line-gray">
                 	  <div>
						 	<label for="tel"><img src = "${pageContext.request.contextPath}/resources/image/sion/stel.JPG"></label>
					  </div>
					  <div>
							<input type="tel" onfocus="this.placeholder=''" pattern="010-[0-9]{3,4}-[0-9]{4}" placeholder="휴대폰 번호" id="tel"
							 autocomplete="off">
					  </div>
				 </div>
				 <span id="telErr1" class="errorMsg text-danger d-none small" style="margin-left:10px; font-family: dotum,sans-serif; font-size: 12px;">휴대폰 번호를 정확하게 입력하세요.</span>
				 <span id="telErr2" class="errorMsg text-danger d-none small" style="margin-left:10px; font-family: dotum,sans-serif; font-size: 12px;">ww*****@naver.com 아이디로 가입된 휴대폰 번호입니다.</span>
		   </div>
				
			
		   <!-- 이용약관 동의 -->	
			
		   <div class="allagree">
	          <input type="checkbox" id="agree" name="agree" value="agree"/>
	             <label for="agree">모두 확인하였으며 동의합니다.</label>
	       </div>
	       <span>전체 동의에는 필수 및 선택 정보에 대한 동의가 포함되어 있으며, 개별적으<br>로 동의를 선택 하실 수 있습니다. 선택 항목에 대한 동의를 거부하시는 경우<br>에도 서비스 이용이 가능합니다.</span>
	      
	      
	       <div class="agreementbox">
	       
	           <div class="agreement">
	              <input type="checkbox" id="agree1" name="agree" value="agree"/>
	               <label for="agree1">[필수] 만 14세 이상입니다</label>
	           </div>     
	           <div class="agreement">
	               <input type="checkbox" id="agree2" name="agree" value="agree"/>
	               <label for="agree2">[필수] 쿠팡 이용약관 동의</label>
	           </div>     
	           <div class="agreement">
	               <input type="checkbox" id="agree3" name="agree" value="agree"/>
	               <label for="agree3">[필수] 전자금융거래 이용약관 동의 </label>
	           </div>     
	           <div class="agreement">
	               <input type="checkbox" id="agree4" name="agree" value="agree"/>
	               <label for="agree4">[필수] 개인정보 수집 및 이용 동의</label>
	           </div>     
	           <div class="agreement">
	               <input type="checkbox" id="agree5" name="agree" value="agree"/>
	               <label for="agree5">[필수] 개인정보 제3자 제공 동의</label>
	           </div>     
	           <div class="agreement">
	               <input type="checkbox" id="agree6" name="agree" value="agree"/>
	               <label for="agree6">[선택] 마케팅 목적의 개인정보 수집 및 이용 동의</label>
	           </div>     
	           <div class="agreement">
	               <input type="checkbox" id="agree7" name="agree" value="agree"/>
	               <label for="agree7">[선택] 광고성 정보 수신 동의</label>
	           </div>     
	           <div class="se">
		           <div class="agreement">
		               <input type="checkbox" id="agree8" name="agree" value="agree"/>
		               <label for="agree8">     [선택] 이메일 수신 동의</label>
		           </div>     
		           <div class="agreement">
		               <input type="checkbox" id="agree9" name="agree" value="agree"/>
		               <label for="agree9">     [선택] SMS, SNS 수신 동의</label>
		           </div>     
		           <div class="agreement">
		               <input type="checkbox" id="agree10" name="agree" value="agree"/>
		               <label for="agree10">     [선택] 앱 푸시 수신 동의</label>
		           </div>     
	           </div>
	     
	     </div>
	     
	     <button type="submit" id="continue_btn">동의하고 계속하기</button>
      </form>
    </section>
    <div class="biz_register">
        <p>법인 고객이신가요? </p>
        <p style="margin-bottom:5px;">사업자 회원으로 전용 특가 혜택을 누려보세요. </p>
        <a href="https://login.coupang.com/corporation/member/landing-page">쿠팡비즈 간편가입 <strong>></strong>
        </a>
    </div>
    <footer>
        &copy;Coupang Corp. All rights reserved.
    </footer>
</body>

</html>