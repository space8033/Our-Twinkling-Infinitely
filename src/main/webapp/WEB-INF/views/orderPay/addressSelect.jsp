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
  	 <script src="addressSelect.js"></script>
  	 
  	 
	<style>
		#header {
			/* /* position: fixed; */ */
			font-family: apple sd gothic neo,malgun gothic,nanumbarungothic,nanumgothic,dotum,sans-serif;
		    margin: 0;
		    border: 0;
		    padding: 9px 0;
		    color: #111;
		    font-size: 16px;
		    line-height: 22px;
		    text-align: center;
		    font-weight: bold;
		    border-bottom : 1px solid rgb(224, 224, 224);
		}
	
		.myAddress {
            width: 95%;
            margin-left : 18px;
            padding-top: 0px;
            
            padding-left: 15px;
            border: 1px solid rgb(224, 224, 224);
         }
         
         .s {
         	 border: 2px solid #0073e9;
         	 
         }
         
         #standardAddress {
            border: 1px solid black;
            border-radius: 7px 7px 7px 7px;
            width: 63px;
            font-size: 12px;
            color: gray;
            /* display: none; */
         }
         #modifyButton {
            text-align: center;
            background-color: white;
            border: 1px solid rgb(224, 224, 224);
            width: 80px;
            margin-top: 5px;
            margin-bottom: 15px;
            padding-top: 7px;
            padding-bottom: 7px;
            color: #0073e9;
            border-radius: 2px;
         }
         #select {
         	
            text-align: center;
            background-color: #0073e9;
            color: #fff;
   			border: 0;
            box-shadow: inset 0 -2px 0 rgba(0,0,0,0.38);
            width: 80px;
            margin-top: 5px;
            margin-bottom: 15px;
            padding-top: 7px;
            padding-bottom: 7px;
             font-weight: bold;
             border-radius: 2px;
         
         }
         #addAddress {
            color: rgb(41, 141, 239);
            font-weight: bold;
            text-align: center;
            border: 1px solid rgb(224, 224, 224);
            width: 95%;
            margin-left: 18px;
            margin-top: 10px;
            font-size: 25px;
            border-bottom-width: 3px;
            cursor: pointer;
            margin-bottom: 100px;
            padding-top: 15px;
            padding-bottom: 15px;
         }
         
         .buttonClass {
         	display: flex;
         	justify-content: space-between;
         	padding-right: 15px;
         
         }
	</style>
	
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
	                  <div><button class="abutton" id="modifyButton">수정</button></div>
	                  <div><button class="abutton" id="select">선택</button></div>
                  </div>	
               </div>
             
               <div id="container">
               
          
             
          
              </div>
              <div id="addAddress">
                  + 배송지 추가
               </div>
              
              
              
 </div> 
</body>
</html>