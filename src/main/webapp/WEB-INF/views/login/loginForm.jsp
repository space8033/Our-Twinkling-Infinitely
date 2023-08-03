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
	
	<script src="${pageContext.request.contextPath}/resources/js/loginForm.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/loginForm_css.css">
    <title>쿠팡 로그인 폼</title>
</head>
<body>
    <header>
        <h1><a href="${pageContext.request.contextPath}"><img src="${pageContext.request.contextPath}/resources/yuimg/메인로고.png" alt="OTi로고"></a></h1>
    </header>
    <section>
            
               <form id="loginForm" name="loginForm" action="#" onsubmit="checkValidation()" novalidate method="post">
                 <div class="form-group">
                 	<div id="email-form" class="email-form-group line-gray">
                 		<div>
						 	<label for="email"><img src = "${pageContext.request.contextPath}/resources/image/sion/semail.JPG"></label>
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
							 <label for="pwd"><img src = "${pageContext.request.contextPath}/resources/image/sion/spwd.JPG" style="border-right: 1px solid #ccc"></label>
						</div>
						<div>	
							 <input type="password" onblur="checkValidation()" onclick="line2()" placeholder="비밀번호" id="pwd"
							 style = "height: 100%; width: 370px; outline:none;" autocomplete="off">
							 
						</div>
						
						<div>
							<button type="button"><img id="eye" onclick="blink()" src = "${pageContext.request.contextPath}/resources/image/sion/seye.JPG"></button>
							
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