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
	
    <title>쿠팡 로그인 폼</title>

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
       
          
         
            
               <form id="loginForm" name="loginForm" action="#" onsubmit="checkValidation()" novalidate method="post">
                 <div class="form-group">
                 	<div id="email-form" class="email-form-group line-gray">
                 		<div>
						 	<label for="email"><img src = "../common/image/coupang/sion/semail.JPG"></label>
						</div>
						<div>
							<input type="email" onblur="checkValidation()" onclick="line1()" placeholder="아이디(이메일)" id="email"
							style="outline:none;" autocomplete="off">
						
						</div>
					</div>	
					<span id="uidErr1" class="errorMsg text-danger d-none small" style="margin-left:10px; font-family: dotum,sans-serif;
    font-size: 12px;">아이디(이메일)를 입력해주세요.</span>
					<span id="uidErr2" class="errorMsg text-danger d-none small" style="margin-left:10px; font-family: dotum,sans-serif;
    font-size: 12px;">아이디(이메일)는 이메일 형식으로 입력해주세요.</span>
				
				</div>
				
				
				 <div class="form-group">
				 	<div id="pwd-form" class="pwd-form-group line-gray">
				 		<div>
							 <label for="pwd"><img src = "../common/image/coupang/sion/spwd.JPG" style="border-right: 1px solid #ccc"></label>
						</div>
						<div>	
							 <input type="password" onblur="checkValidation()" onclick="line2()" placeholder="비밀번호" id="pwd"
							 style = "height: 100%; width: 370px; outline:none;" autocomplete="off">
							 
						</div>
						
						<div>
							<button type="button"><img id="eye" onclick="blink()" src = "../common/image/coupang/sion/seye.JPG"></button>
							
						</div>
					
					</div>
					<span id="pwdErr" class="errorMsg text-danger d-none small" style="margin-left:10px; font-family: dotum,sans-serif;
    font-size: 12px;">비밀번호를 입력해주세요.</span>
				</div>
					
			  <div class="form-check d-flex">
					 
					 <div style= "width: 20px;" ><input class="form-check-input" type="checkbox" style="vertical-align:-5px;"></div><div style="margin-top:4px;"><span style="font-size:14px;"> 자동로그인</span></div>
					 <div><a id="idpwd" href="https://login.coupang.com/login/accountInfoFind.pang" style="font-size:14px; margin-top:5px;">아이디·비밀번호 찾기 <strong>></strong> </a></div>
						
				</div>
                  
       		  
       		
                
                
                <div class="login_form_btn">
                    <button type="submit" id="login_btn">로그인</button>
                    <hr/>
                    <button type="submit" id="join_btn">회원가입</button>
                </div>
                
                
        
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