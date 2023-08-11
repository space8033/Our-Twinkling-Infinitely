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
  	    <script src="${pageContext.request.contextPath}/resources/js/addressSelect.js" charset="utf-8"></script>
  	    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/addressSelect.css"/>
	</head>
	<body>
		<div id= "header">배송지 선택</div>
		<div id="addressContainer" style="width: 100%; margin-top: 10px;">
	        <div class="myAddress s">
	           <div class="mt-3 mb-2 font-weight-bold">쿠쿠팡</div>
	           <div id="standardAddress">기본배송지</div>
	           <div class="mt-2">서울특별시 여기구 저기동 안아파트 강호동 강백호</div>
	           <div>010-1111-2222</div>
	           <div>문 앞에 두고 도망가세여</div>
	           <div class="buttonClass">
	            <div><button class="abutton" id="modifyButton" onclick="modifyAddress()">수정</button></div>
	           
	            <div><button class="abutton" id="select" onclick="selectAddress()">선택</button></div>
	           </div>	
	        </div>
	      
			<div id="container">
			
			</div>
			<div id="addAddress" onclick="addAddress()">
			    + 배송지 추가
			</div>
		 </div> 
	</body>
</html>