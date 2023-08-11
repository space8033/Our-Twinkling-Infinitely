<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="icon" href="/html_css_javascript/favicon.ico" type="image/x-icon">
		<title>Insert title here</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/addressRequest.js" charset="utf-8"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/addressRequest.css"/>	
	</head>
	<body>
		<div id= "header">배송 요청사항</div>
		<div id="requestContainer" style="width: 100%; margin-top: 10px;">
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
						<input type="radio" id="ftof" name="select" value="직접" />
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
			  		<div><input type="text" placeholder="택배함 번호 (필수)" style="width:100%;"></div>
			  	</div>
	            <div class="on"> 
	       			<label>
						<input type="radio" id="etc" name="select" value="기타사항"/>
							기타사항
		 			</label>
				</div>
			   <div id="show2" class="on" style="display: none; background-color: #f4f4f4;  padding-left:10px; padding-right:10px;">
			  		<div>소화전/EPS/TPS 등은 안전상 보관 불가</div>
			  		<div><input type="text" placeholder="장소만 입력 (필수)" style="width:100%;"></div>
			   </div>      
	         </div>
	                
	         <div class="num">
	         	<div class="doorNum" >공동현관 출입번호</div>
	         	<div style="padding:10px;"> 
	        		<label>
						<input type="radio" id="pwdY" name="pwdselect" value="YES"/>
						<input type="text" style="width:90%;" id="etc" name="select" placeholder="예 : #1234"/>
	  				</label>
				</div>
				<div class="doorNumNotice" style="padding:10px;"> 
	        		<label>
						<input type="radio" id="pwdN" name="pwdselect" value="NONE"/>
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
	</body>
</html>