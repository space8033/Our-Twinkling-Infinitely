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
	
    <title>쿠팡 회원가입 폼</title>

	<style>
		* {
		    margin: 0px;
		    padding: 0px;
		}
		
		.skip {
		    display:none;
		}
		
		body{
		    margin: 0 auto;
		    padding: 0;
		    min-width: 290px;
		    max-width: 460px;
		}
		
		h1 {
		    text-align: center;
		    margin:40px auto 10px;
		}
		
		h1 a img {
		    width:195px;
		    height: 45px;
		}
		
		section {
		    font-family: dotum,sans-serif;
		    font-size: 12px;
		    line-height: 1.0;
		    color: #666;
		  
		}
		section #loginform {
		    margin-bottom: 20px;
		   
		    
		}
		section #loginform .form_title {
		    
		    font-size: 14px;
		    font-weight: bold;
		    line-height: 1.29;
		    letter-spacing: normal;
		    color: #111;
		}
		
		.form-group {
			
			padding-top: 5px; 
			margin-bottom: 8px;
			
		}
		
		.form-group img {
			width: 44px;
			height: 45px;
			cursor: pointer;
		}
		
		.email-form-group {
			display: flex;
			border-top: 1px solid #ccc;
			
			border-right : 1px solid #ccc;
			margin: 0px;
			padding: 0px;
			height: 48px;
			width: 450px;
			margin-bottom: 10px;
		
		}
		
		.line-gray{
			border-bottom : 1px solid #ccc;
		}
		.line-red{
			border-bottom : 2px solid red;
		}
		.line-blue{
			border-bottom : 2px solid blue;
		}
		
		
		.email-form-group > div {
			border-left: 1px solid #ccc;
			margin: 0px;
		}
		
		
		.pwd-form-group {
			display: flex;
			border-top: 1px solid #ccc;
			border-right : 1px solid #ccc;
			border-left: 1px solid #ccc;
			height: 48px;
		    width: 450px;
			margin-bottom: 10px;
		}
		
		
		.pwd-form-group button {
			text-align: center;
			border: none;
			margin-left: 4px;
			margin-top: 13px;
			padding: 0px;
			cursor: pointer;
		
		}
		
		#eye {
			height: 23px;
			width: 22px;
			text-align: center;
			padding: 0px;
			margin: 0px;
			vertical-align: bottom;
			cursor: pointer;
		}
		
		input[type="email"]
		{
			
			color: #666;
			font-size: 14px;
			font-family: dotum,sans-serif;
			box-sizing: border-box;
			height: 100%;
			width: 400px;
			margin: 0;
			padding: 10px;
			border: none;
			font-weight: bold;
		}
		
		input[type="password"]
		{
			
			color: #666;
			font-size: 14px;
			box-sizing: border-box;
			
			font-family: dotum,sans-serif;
			font-weight: bold;
			margin: 0;
			padding: 10px;
			border: none;
		}
		input[type="text"]
		{
			
			color: #666;
			font-size: 14px;
			box-sizing: border-box;
			
			font-family: dotum,sans-serif;
			font-weight: bold;
			margin: 0;
			padding: 10px;
			border: none;
		}
		
		 ::placeholder {
			color: #ccc !important;
		}
		
		#idpwd {
			float: right;
			color: #346aff;
			text-decoration: none;
			padding-left: 205px;
			
		}
		
		.login_form_btn button {
			 width: 450px;
			height: 45px;
			margin-top: 15px;
			font-size: 16px;
			font-family: apple sd gothic neo,malgun gothic,nanumbarungothic,nanumgothic,dotum,sans-serif;
			font-weight: bold;
			border-radius: 3px;
			cursor: pointer;
			
		}
		
		hr {
			margin-top : 13px;
			margin-bottom : 15px;
			margin-right : 10px;
		}
		
		#login_btn {
			background-color: #346aff;
			color: white;
			border: 1px solid #346aff;
			margin-bottom: 0px;
		}
		#join_btn {
			background-color: #fff;
			color: #454f5b;
			border: 1px solid #b1b1b1;
			margin: 0px;
			
		}
		
			input[type="checkbox"]{

			width: 20px; /*Desired width*/
			height: 20px; /*Desired height*/
			margin: 0px;
			padding: 0px;
		}
			
		.form-check {
			padding: 0px;
			margin-top: 5px;
			padding-top: 5px;
			
		}
		
		.form-check span {
			cursor: pointer;
			padding-left: 5px;
			width: 70px;
		}
		
		
		.biz_register {
		  	margin-top: 30px;
		    margin-bottom: 18px;
		    text-align: center;
		    line-height: 1.6;
		    font-weight: 400;
 		    font-size: 13px;
  		    line-height: 18px;
  		    color: #637381;
		    font-family: dotum,sans-serif;
		}
		.biz_register p {
		  
		    margin: 1px;
		    
		}
		
		.biz_register a {
		    font-style: normal;
		    font-weight: bold;
		    font-size: 14px;
		    line-height: 17px;
		    color: #454f5b;
		    text-decoration: none;
		    
		}
		
		footer {
		  
		    text-align: center;
		    padding: 20px 0 40px;
			font-family: dotum,sans-serif;
		    font-size: 12px;
		    line-height: 1.6;
		    color: #555;
		    
		}
</style>

<script>
	function blink() {
		var click = document.getElementById('eye');
		var pwdType = document.getElementById("pwd").getAttribute("type");
			if(click.src.match("seyeb")) {
				click.src = "../common/image/coupang/sion/seye.JPG";
				 
			} else {
				click.src = "../common/image/coupang/sion/seyeb.JPG";
			}
			 if(pwdType === "password"){
			      document.getElementById("pwd").setAttribute("type", "text");
			   }
			   else if(pwdType === "text"){
			      document.getElementById("pwd").setAttribute("type", "password");
			   }
		
	}
	function line1() {
		var borderbottom = document.querySelector("#email-form");
		borderbottom.classList.remove("line-gray");
		borderbottom.classList.add("line-blue");
	}
	function line2() {
		var borderbottom = document.querySelector("#pwd-form");
		borderbottom.classList.remove("line-gray");
		borderbottom.classList.add("line-blue");
	}
	
	function checkValidation() {
   		var isValidation = true;
   		
   		
   		//모든 에러 메세지를 보여주지 않도록 초기화
   		var errorMsgs = document.querySelectorAll(".errorMsg");
   		errorMsgs.forEach(el => el.classList.add("d-none"));
   
			//uid 검사
			var uid = document.querySelector("#email").value;
			
			
			console.log("email: " + uid);
			if(uid === "") {
				isValidation = false;
				var uidErr1 = document.querySelector("#uidErr1");
				uidErr1.classList.remove("d-none");
				var borderbottom = document.querySelector("#email-form");
				borderbottom.classList.remove("line-gray");
				borderbottom.classList.remove("line-blue");
				borderbottom.classList.add("line-red");
				
				
			} else {
  				var pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	   			var result = pattern.test(email);
	   			if(!result) {
	   				isValidation = false;
	   				var uidErr2 = document.querySelector("#uidErr2");
	   				uidErr2.classList.remove("d-none");
	   				var borderbottom = document.querySelector("#email-form");
					borderbottom.classList.remove("line-gray");
					borderbottom.classList.add("line-red");
					borderbottom.classList.remove("line-blue");
	   			}
  			}
			
			
			
			
			//pwd검사
			var pwd = document.querySelector("#pwd").value;
 			if(pwd ==="") {
  				isValidation = false;
  				var pwdErr = document.querySelector("#pwdErr");
  				pwdErr.classList.remove("d-none");
  				
  				var borderbottom = document.querySelector("#pwd-form");
				borderbottom.classList.remove("line-gray");
				borderbottom.classList.add("line-red");
				borderbottom.classList.remove("line-blue");
  			} else if(pwd !== "") {
  				var borderbottom = document.querySelector("#pwd-form");
				borderbottom.classList.remove("line-red");
				borderbottom.classList.remove("line-blue");
				borderbottom.classList.add("line-gray");
				
  				
  			}

		if(!isValidation) {
			event.preventDefault();
		
		}
}

</script>

</head>
<body>
    <header>
        <h1><a href="https://www.coupang.com/"><img src="../common/image/coupang/coupanglogo.png" alt="쿠팡로고"></a></h1>
    </header>
    <section>
    	<form id="joinForm" name="joinForm" action="#" onsubmit="checkValidation()" novalidate method="post">
        	<div class="form-group">
            	<div id="id-form" class="id-form-group line-gray">
                 	<div>
						<label for="id"><img src = "../common/image/coupang/sion/semail.JPG"></label>
					</div>
					<div>
						<input type="text" onblur="checkValidation()" onclick="line1()" placeholder="아이디" id="id"
							   style="outline:none;" autocomplete="off">
						
					</div>
				</div>	
				<span id="uidErr2" class="errorMsg text-danger d-none small" style="margin-left:10px; font-family: dotum,sans-serif; font-size: 12px;">아이디는 이메일 형식으로 입력해주세요.</span>
				
		   </div>
				
				
		   <div class="form-group">
		 	   <div id="pwd-form" class="pwd-form-group line-gray">
				   <div>
						<label for="pwd"><img src = "../common/image/coupang/sion/spwd.JPG" style="border-right: 1px solid #ccc"></label>
				   </div>
				   <div>	
						<input type="password" onblur="checkValidation()" onclick="line2()" onfocus="this.placeholder=''" placeholder="비밀번호" id="pwd"
							   style = "height: 100%; width: 370px; outline:none;" autocomplete="off">
				   </div>
			   </div>
		       <span id="pwdErr1" class="errorMsg text-danger d-none small" style="margin-left:10px; font-family: dotum,sans-serif; font-size: 12px;">비밀번호를 입력해주세요.</span>
			   <span id="pwdErr2" class="errorMsg text-danger d-none small" style="margin-left:10px; font-family: dotum,sans-serif; font-size: 12px;">비밀번호 형식에 맞게 입력해주세요.</span>
		   </div>
				
		   <div class="form-group">
		    	<div id="pwd-form-check" class="pwd-form-group line-gray">
				 	<div>
						 <label for="pwd-check"><img src = "../common/image/coupang/sion/spwd.JPG" style="border-right: 1px solid #ccc"></label>
					</div>
					<div>	
						 <input type="password" onblur="checkValidation()" onclick="line2()" placeholder="비밀번호 확인" id="pwd-check"
							    style = "height: 100%; width: 370px; outline:none;" onfocus="this.placeholder=''" autocomplete="off">
					</div>
				</div>
				<span id="pwdCheckErr1" class="errorMsg text-danger d-none small" style="margin-left:10px; font-family: dotum,sans-serif; font-size: 12px;">확인을 위해 비밀번호를 다시 입력해주세요.</span>
				<span id="pwdCheckErr2" class="errorMsg text-danger d-none small" style="margin-left:10px; font-family: dotum,sans-serif; font-size: 12px;">입력하신 비밀번호와 맞지 않습니다.</span>
		   </div>
				
				
		   <div class="form-group">
                <div id="email-form" class="email-form-group line-gray">
                 	 <div>
					    <label for="email"><img src = "../common/image/coupang/sion/semail.JPG"></label>
				 	 </div>
		    		 <div>
						<input type="email" onblur="checkValidation()" onclick="line1()" onfocus="this.placeholder=''" placeholder="이메일" id="email"
						       style="outline:none;" autocomplete="off">
					 </div>
			    </div>
				<span id="uemailErr1" class="errorMsg text-danger d-none small" style="margin-left:10px; font-family: dotum,sans-serif; font-size: 12px;">이메일을 입력해주세요.</span>
				<span id="uemailErr2" class="errorMsg text-danger d-none small" style="margin-left:10px; font-family: dotum,sans-serif; font-size: 12px;">이메일 형식으로 입력해주세요.</span>
		   </div>
				
				
		   <div class="form-group">
                <div id="name-form" class="name-form-group line-gray">
                 	 <div>
						 <label for="name"><img src = "../common/image/coupang/sion/semail.JPG"></label>
					 </div>
					<div>
						<input type="text" onblur="checkValidation()" onclick="line1()" onfocus="this.placeholder=''" placeholder="이름" id="name"
							   style="outline:none;" autocomplete="off">
					</div>
				</div>
				<span id="nameErr" class="errorMsg text-danger d-none small" style="margin-left:10px; font-family: dotum,sans-serif; font-size: 12px;">이름을 정확히 입력하세요.</span>
		   </div>
				
				
		   <div class="form-group">
                 <div id="tel-form" class="tel-form-group line-gray">
                 	  <div>
						 	<label for="tel"><img src = "../common/image/coupang/sion/semail.JPG"></label>
					  </div>
					  <div>
							<input type="tel" onblur="checkValidation()" onclick="line1()" onfocus="this.placeholder=''" pattern="010-[0-9]{3,4}-[0-9]{4}" placeholder="휴대폰 번호" id="tel"
							style="outline:none;" autocomplete="off">
					  </div>
				 </div>
				 <span id="telErr1" class="errorMsg text-danger d-none small" style="margin-left:10px; font-family: dotum,sans-serif; font-size: 12px;">휴대폰 번호를 정확하게 입력하세요.</span>
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