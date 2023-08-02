<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>쿠팡! - 무드등</title>
      <link rel="icon" href="../common/image/coupang/아이콘.jpg" type="image/x-icon"> 
      
      <!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"> -->
	  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
	  <!-- <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script> -->
		
      <style>
            *{
               margin: 0;
               padding: 0;
             }
             
             #wrapper {
        		 background-color: #f0f0f0;
         
      		 }
		      #customer{
		         display: inline-block; /* 가로로 나열하기 위해 block레벨 요소를 inline-block레벨로 전환 */
		         background-color: #f0f0f0; 
		         float: right; 
		         width: 20%; 
		         margin-right:20px; 
		      }
		      /* 고객센터 */
		      #center{
		         width: 120px;
		         cursor: pointer;
		         background-color:  #f0f0f0;
		      }
		      #center:hover{
		         width: 120px;
		         text-decoration: none;
		         color: black;
		      }
		      #customer:hover{
		         width: 120px;
		         background-color: white;
		      }
		      #c_list li{
		         width: 120px;
		         display:inline-block;
		         background-color: white;
		      }
		      .list{
		         background-color: white;
		      }
		      #wrapper2{
		         background-color: white;
		         padding-left: 250px;
		      
		      }
		      #category{
		         padding: 0;
		      }
		      /* 로고 */
		      #logo{
		         position: absolute;
		         top: 40px;   
		      }
		   
		      /* 검색 */
		      .search-container{
		            position: absolute;
		            top: 60px;
		            left: 580px;
		            margin-left: 0;
		            width: 700px;
		            height: 37px;
		            margin-right: 22px;
		            border: 2px solid #4285f4;
		               
		      }
		      /* 검색_input */
		      #p_select{
		         all: unset; 
		         width: 250px;
		         font-size: 14px;
		      }
		      #input{
		         display: flex;
		         width: 276px;
		         padding: 10px; 
		         align-items: center;
		      }
		      /*  검색_image */
		      #submit{
		         all: unset; /* 태그의 기본 스타일 값 모두 초기화 */
		         cursor: pointer;
		      }
		      /* 마이크 아이콘 */
		      #icon1{
		         display: inline-block;
		         cursor: pointer;
		         position: absolute;
		         top: 0px;
		         right: 40px;
		         width: 40px;
		         height: 40px;
		      }
		      /* 돋보기 아이콘 */
		      #icon2{
		         display: inline-block;
		         position: absolute;
		         top:0px;
		         right: 2px;
		         width: 40px;
		         height: 40px;
		      }
		      /* 검색_전체 option */
		      .header_searchSelect{
		      	 outline:none;
		         display: inline;
		         float:left;
		         width: 135px;/* 원하는 너비설정 */
		         height: 37px;
		         padding-left: 9px; /* 원하는 높이 설정*/ 
		         font-family: inherit; /* 폰트 상속 */
		         background: url(../common/image/coupang/전체option_화살표.png) no-repeat 95% 50%; /* 화살표 모양의 이미지 */
		         background-color: #fff;
		         -webkit-appearance: none; /* 네이티브 외형 감추기 */
		         -moz-appearance: none;
		         appearance: none; 
		         border-bottom-color: #4285f4;
		         border-bottom-width: 1.5px;
		      }
		      /* IE 10, 11의 네이티브 화살표 숨기기 */
		      .header_searchSelect::-ms-expand{
		         display:none;
		      }
		      #wrapper3{
		         height: 32px;
		         background-color: #f6f6f6;
		         margin: 0;
		      }
		      .choice{
		         float: left;
		         
		      }
		      .choice p {
		         text-align: center;
		         font-size: 15px
		      }
		      #all:hover{
		        background-color: white;   
		        text-decoration: underline;
		        color: #5d8fc3;
		      }
		      div a {
		        text-decoration: none;
		        color: black;
		        font-size: 6px;
		        padding: 10px;
		        display:inline-block;
		      }
		      ul {
		        display: inline;
		        margin: 0;
		        padding: 0;
		      }
		      ul li {display: inline-block;}
		      /*입점신청, 고객센터, 카테고리*/
		      .drawer li:hover {background: white;}
		      .drawer li:hover ul {
		         display: block;
		         background-color: white;
		         box-shadow: 5px 5px 5px lightgray;
		         z-index: 1;
		      }
		      .drawer li ul {
		        position: absolute;
		        width: 100xp;
		        display: none;
		      }
		      .drawer li ul li {  
		        display: block;
		        background-color: white;
		      }
		      
		      .drawer li ul li a:link {
		        text-decoration: none;
		      }
		      
		      .drawer li ul li a:visited {
		        text-decoration: none;
		      }
		      
		      .drawer li ul li a:hover {
		        display:inline-block;
		        background-color: white;
		        text-decoration: underline;
		        color: #5d8fc3;
		      }
		      
		      .drawer li ul li a:active {
		        background-color: white;
		        text-decoration: underline;
		        color: #5d8fc3;
		      }
		      .right{
		         float: right;
		         
		      }
		      /* 마이쿠팡,장바구니 */
		      .h_mine1{
		      	float: right;
		      }
		      .h_mine2{
		      	float: right;
		      }
		      /* 장바구니 말풍선 */
		      .basket_wrap{
		         position: relative;
		         display: inline-block;
		         margin: 0px;
		      }
		      /* tooltip: 해당영역에 마우스를 올리면 부가적으로 정보가 나타나게 하는 것*/
		      .task-tooltip {
		          position:absolute; 
		          width: 200px;
		          padding: 50px;
		          padding-left: 0px;
		          visibility: hidden;
		          background-color: #fcfcfc;
		          color: black;
		          text-align: center;
		          z-index: 1;
		          top: 100%;
		          left: 50%;
		          margin-left: -100px;
		      }
		      /* 툴팁 말풍선 삼각형*/
		      .task-tooltip::after {
		          content:"";
		          position: absolute;
		          top: 121px;
		          left: 102px;
		          margin:-133px 0 0 -10px;
		          border-width: 10px;
		          border-style: solid;
		          /* 위는 색 지정, 오른쪽,아래,왼쪽은 색 지정 */
		          border-color: transparent transparent #fcfcfc transparent;  
		      }
		      .task-tooltip::before {
		          content:"";
		          position: absolute;
		          top: 99%;
		          left: 40%;
		          margin:-133px 0 0 -10px;
		          border-width: 12px;
		          border-style: solid;
		          /* 위는 색 지정, 오른쪽,아래,왼쪽은 색 지정 */
		          border-color: transparent transparent #f5f5f5 transparent;  
		         }   
		      /* 장바구니 hover */
		      .basket_wrap:hover .task-tooltip{
		         visibility: visible;
		         box-shadow: 5px 5px 5px 5px lightgray;
		      }
		
		      /* 슬라이드 */
		      .h_section{
		         position: absolute;
		         top: 100px;
		         left:360px;
		      }
		      .h_section input[type=radio]{/* h_section클래스 안에 id값이 slide를 갖고있는 input을 선택*/
		         display: none; 
		      }
		      .h_section .h_slidewrap{
		         max-width: 1057px;
		         margin: 0 auto;
		         overflow: hidden;
		      }
		      .h_section .h_slidelist{
		         white-space:nowrap; /* 줄바꿈 제거 */
		         font-size: 0;
		      }
		      .h_section .h_slidelist > li{
		         display: inline-block;
		         vertical-align: middle;/* 세로정렬 */
		         width: 100%; /* 부모 div 크기에 맞춤 */
		         transition: all .5s; /* 슬라이드 애니매이션(전체 옵션, 시간: 0.5초) */
		      }
		      .h_section .h_slidelist > li > a{
		         display: block;
		         position: relative;
		      }
		      .h_section .h_slidelist > li > a img{
		         width: 100%;
		      }
		      /* 방향 라벨 */
		      .h_section .h_slidelist label{
		         position: absolute;
		         top: 50%;
		         transform: translateY(-50%);/* 자신의 높이의 반만큼 위로 올라감 */
		         padding: 10px;
		         cursor: pointer;
		      }
		      .h_section .h_slidelist .h_left{
		         left: 0px;
		         font-size: 20px;
		      }
		      .h_section .h_slidelist .h_right{
		         right: 0px;
		         font-size: 20px;
		      }
		      .h_section [id="slide01"]:checked ~ .h_slidewrap .h_slidelist > li {
		           transform: translateX(0%);
		       }
		      .h_section [id="slide02"]:checked ~ .h_slidewrap .h_slidelist > li {
		           transform: translateX(-100%);
		        }
             /*---------------------------------------------------------------------------유진 스타일  */
             
           	aside{
	            width:200px;
	            height:100%;
	            border: 1px solid #f2f2f2;
	            background-color: #ffffff;
				margin-left: 0px;
           	}
         	hr {
            	width: 170px;
            	border: 1px solid #f2f2f2;
            	margin: 10px;
         	}
        	.option-item:hover{
            	background-color: #f2f2f2
        	}
        	.option-item {
           		list-style: none;
           		disply: block;
        	}
      		label:hover {
	           	color: blue;
	            background-color: transparent;
	            text-decoration: none;
	            cursor: pointer;
      		}
	        .option-item input[type=checkbox]:checked + label {
	          	color: blue;
	      	}
	      	h4 {
	         	margin: 5px;
	      	}
      		.srightbar {
         		float: right;
      		}
      		.sshoppingbasket, .srecentlywatch { 
		         border: 1px solid black;
		         width: 100px;
		         height: 30px;
		         background-color: #354056;
		         color: white;
		         font-size:x-small;
		         padding: 10px;
		         box-sizing: border-box;
      		}
      
      		.sshoppingbasket:hover {
         		text-decoration: underline;
      		}
      
      		.srecentlywatcheditem {
		         border: 1px solid black;
		         width: 100px;
		         height: 300px;
		         text-align: center;
		         font-size:x-small;
		         padding : 100px 0;
		         box-sizing: border-box;   
      		}  	
           /*-----------------------------------------------------------------------------------승주 스타일  */
           	#top{
                background-color: #f2f2f2;
             }
             
	         #top a{
	            font-size: 6px;
	            padding: 10px;
	            display:inline-block;
	         }
	         
	         .out {
	            display: inline;
	         }
	         
	         .category {
	            margin-right: 40px;
	            display: inline-block;
	         }
	         .category:hover {
	            background: #555;
	         }
	         .category:hover ul {
	            display:block;
	         }
	         
	         .in {
	            position: absolute;
	            width: 200px;
	            list-style: none;
	            display: none;
	         }
	         .in list {
	            background: #555;
	            display: block;
	         }
	         
	         .item {
	            display: block !important;
	         }
	         .itemlist: hover {
	            background: #666;
	         }
            
            .right {
               float: right;
            }
            
            /*-------------------------------------------------------------------------------------*/
            .filter {
            	background-color: #f2f2f2;
            }
            .relate {
            	font-size: 6pt;
            	color: #1f7ee8;
            }
            .relate :visited {
            	color: #1f7ee8;
            }
            .relate a {
            	text-decoration: none;
            	margin: 3pt;
            }
            
            .filter input[type=radio] {
            	accent-color: red;
            	display: none;
            }
           
            .filter input[type=radio] + label{
            	cursor: pointer;
            	margin-right: 10px;
            	font-size: 6px;
            }
            .filter input[type=radio]:checked + label{
            	font-weight: bold;
            	color: #3d85cd;
            }
           
           .lfilter {
           		display: inline-block;
           		font-size: 6pt;
           		float: right;
           		margin-right: 30px;
           		margin-top: -3px;
           		padding-bottom: 10px;
           }
           .lfilter li {
           		display: inline-block;
           }
           .lfilter li:hover ul {
           		display: block;
           }
           .lcount {
           		position: absolute;
           		display: none;
           		font-size: 6pt;
           }
           .lcount li{
           		display: block;
           		margin: 3px;
           }
           .lcount li a {
           		display: block !important;
           		margin: 5px;
           }
           .lcount li a:hover {
           		background-color: #f2f2f2;
           }
           
           .lproduct {
           		margin: 3px;
           		padding: 5px;
           		width: 200px;
           		cursor: pointer;
           		height: 400px;
           }
           
           .lproduct:hover {
           		outline: 1px solid white;
           		box-shadow: 5px 5px 5px lightgray;
           }
           
           .lforflex {
           		display: flex;
           		flex-direction: row;
           		flex-wrap: wrap;
           }
           
           /* ------------------------------------------------------------------------------- */
           .lmainimg {
           		width: 200px; 
           		height: 200px;
           }
           .ltitle{
           		font-size: 6pt; 
           		margin-left: 3px;
           }
           .ldc{
           		text-decoration: line-through;
           		text-align: left;
           		color: gray;
           }
           .ldetail {
           		font-size: 13px;
           }
           .lrocket {
           		float: left; 
           		color: #b43137; 
           		font-weight: bold; 
           		margin-left: 3px;
           }
           .lricon {
           		float: left; 
           		width: 20px; 
           		height: 20px;
           }
           .lfont {
           		float: left; 
           		color: #2596b6; 
           		font-weight: bold;
           }
           .larrival {
           		color: #50967a; 
           		font-size: 11px; 
           		margin-left: 3px;
           }
           .lstar
           {
           		float: left; 
           		height: 15px; 
           		margin-top: 2px;
           }
           .lreview {
           		font-size: 6px; 
           		color: #939592
           }
           .lround {
           		font-size: 5px; 
           		border: 1px solid #e4e6e5; 
           		border-radius:10px; 
           		display:inline-block;
           }
           .lcash {
           		height: 10px; 
           		margin-left: 2px; 
           		margin-right: 2px;
           }
           .lspace {
           		white-space: pre-wrap;
           }
           .lmin {
           		padding-left: 2px; 
           		font-size: 6px; 
           		font-weight: bold;
           }
           
           .lpage {
           		margin-right: 20px;
           		font-size: 15px;
           		font-weight: bold;
           		color: #407bcb;
           }
           .lpage:hover {
           		cursor: pointer;           
           }
           /*------------------------------------------------------------------------------------  */   
           .ful {
           		text-align: center;
           		
           }
           .ful li {
           		display: inline-block;
           		padding: 10px;
           		font-size: 6px;
           }
           .ful li:hover {
           		cursor: pointer;
           }
           .foota:visited {
           		color: black;
           }
           .foota2 {
           		text-decoration: none;
           }
           .foota2:visited {
           		color: black;
           		text-decoration: none;
           }
           .footer div {
           		margin: 10px;
           }
           #service {
           		text-decoration: underline;
           }
           #service:hover{
				cursor: pointer;
           }
           #service:visited {
           		color: black;
           		text-decoration: underline;
           }
           /*---------------------------------------------------------------------------------------- 오우주 끝 */
           
      </style>
      
   </head>
   
   <body style="width: 100%;">
			<!-- 유진 -->
		<div id="wrapper">
           <div>
            <div>
              <a class="left" href="#" style="padding-left: 250px;">즐겨찾기</a>
              <ul class = "drawer">
                <li>
                <!-- 입점신청 -->
                  <a class="left" href="#" style="background-color: #f0f0f0;">입점신청</a> 
                  <ul>
                    <li><a class="list" href="https://marketplace.coupangcorp.com/s/" target="_blank">오픈마켓</a></li>
                    <li><a class="list" href="https://travel-sellers.coupang.com/" target="_blank">여행·티켓</a></li>
                    <li><a class="list" href="https://supplier.coupang.com/welcome/join/" target="_blank">로켓배송</a></li>
                    <li><a class="list" href="https://partners.coupang.com/" target="_blank">제휴마켓팅</a></li>
                  </ul>
                </li>
              </ul>
              <div id="customer" style="width: 8%; height: 10px; text-align: left;">
               <ul class = "drawer">
                    <li>
                    <!-- 고객센터 -->
                    <a class="right" href="#" style="background-color: #f0f0f0; width: 120px;">고객센터</a>
                    <ul id="c_list">
                       <li><a id="center"class="list" target="_blank">고객센터</a></li>
                       <li><a class="list" href="https://marketplace.coupangcorp.com/s/" target="_blank">자주묻는 질문</a></li>
                       <li><a class="list" href="https://travel-sellers.coupang.com/" target="_blank">1:1 채팅문의</a></li>
                       <li><a class="list" href="https://supplier.coupang.com/welcome/join/" target="_blank">고객의 소리</a></li>
                       <li><a class="list" href="https://partners.coupang.com/" target="_blank">최소/ 반품 안내</a></li>
                   </ul>
                   </li>
               </ul>
            </div>
              <a  class="right" href="#">로그인</a>
              <a class="right" href="#">회원가입</a>
            </div>
           </div>
           
            
            <div id="wrapper2" >
               <nav>
                  <div>
                     <!-- 마이쿠팡,장바구니 -->
                     <div style="margin-right: 28%;">
                        <ul class="drawer">
                           <li class="h_mine1">
                              <a  href="#" style="padding: 0;">
                              <img src="../common/image/coupang/마이쿠팡.jpg" width="65">
                              </a>
                              <ul style="z-index: 1;">
                                 <li><a class="list" href="mycoupang.jsp" target="_blank">주문목록</a></li>
                                   <li><a class="list" href=# target="_blank">취소/반품</a></li>
                                   <li><a class="list" href=# target="_blank">찜 리스트</a></li>
                              </ul>
                           </li>
                           <li class="h_mine2"><!-- 장바구니 -->
                              <div class="basket_wrap">
                                 <div class="h_basket"> 
                                    <img src="../common/image/coupang/장바구니.jpg" width="65">
                                 </div>
                                 <div class="task-tooltip" style="font-size: 12px">
                                    	장바구니에 담긴 상품이 없습니다.
                                 </div>
                              </div>
                           </li>
                        </ul>   
                     </div>
                    <ul class = "drawer">
                      <li>
                        <a id=category href="#">
                        <img src="../common/image/coupang/카테고리.jpg" style="width:110px;height:110px;">
                        </a> 
                        <ul>
                          <li><a class="list" href=# target="_blank">패션의류/잡화</a></li>
                          <li><a class="list" href=# target="_blank">뷰티</a></li>
                          <li><a class="list" href=# target="_blank">출산/유아동</a></li>
                          <li><a class="list" href=# target="_blank">식품</a></li>
                          <li><a class="list" href=# target="_blank">주방용품</a></li>
                          <li><a class="list" href=# target="_blank">생활용품</a></li>
                          <li><a class="list" href=# target="_blank">홈인테리어</a></li>
                          <li><a class="list" href=# target="_blank">가전디지털</a></li>
                          <li><a class="list" href=# target="_blank">스포츠/레저</a></li>
                          <li><a class="list" href=# target="_blank">자동차용품</a></li>
                          <li><a class="list" href=# target="_blank">도서/음반/DVD</a></li>
                          <li><a class="list" href=# target="_blank">완구/취미</a></li>
                          <li><a class="list" href=# target="_blank">문구/오피스</a></li>
                          <li><a class="list" href=# target="_blank">반려동물용품</a></li>
                          <li><a class="list" href=# target="_blank">헬스/건강식품</a></li>
                          <li><a class="list" href=# target="_blank">여행/티켓</a></li>
                          <li><a class="list" href=# target="_blank">테마관</a></li>
                        </ul>
                      </li>
                    </ul>
                    <a id=logo href="#" title="Coupang - 내가 잘사는 이유">
                        <img src="../common/image/coupang/coupang로고.jpg" style="width:200px;height:50px;">
                    </a> 
                  </div>
                  <div id="wrapper2_h">
                     <!-- 검색 -->
                     <div class="search-container">
                        <form action="https://www.coupang.com/np/search" style="padding:0px;">
                           <div> 
                              <!-- 전체option -->
                              <select class="header_searchSelect" >
                                 <option value="All" selected>전체</option>
                                 <option value="SRP">출산/유아동</option>
                                 <option value="All">식품</option>
                                 <option value="All">주방용품</option>
                                 <option value="All">홈인테리어</option>
                                 <option value="All">가전디지털</option>
                                 <option value="All">스포츠/레저</option>
                                 <option value="All">자동차용품</option>
                                 <option value="All">도서/음반/DVD</option>
                                 <option value="All">완구/취미</option>
                                 <option value="All">문구/오피스</option>
                                 <option value="All">반려동물용품</option>
                                 <option value="All">헬스/건강식품</option>
                                 <option value="All">국내여행</option>
                                 <option value="All">해외여행</option>
                                 <option value="All">장마준비</option>
                                 <option value="All">로켓설치</option>
                                 <option value="All">쿠팡Only</option>
                                 <option value="All">싱글라이프</option>
                                 <option value="All">악기전문관</option>
                                 <option value="All">결혼준비</option>
                                 <option value="All">아트/공예</option>
                                 <option value="All">미세먼지용품</option>
                                 <option value="All">홈카페</option>
                                 <option value="All">실버스토어</option>
                                 <option value="All">로켓펫닥터</option>                  
                              </select>
                              <div id="input">
                                 <a title="쿠팡 상품 검색" style="margin: 0; padding: 0 ; float: right">
                                    <input id = "p_select" name = "p_select" type = "text" placeholder="찾고 싶은 상품을 검색해보세요!"> 
                                 </a>
                              </div>
                            <div>
                                 <img id="icon1" src="../common/image/coupang/검색_녹음.png" class="s_coupang">
                                 <button id="submit" type="submit">
                                    <a href="#" title="검색" style="margin: 0px; padding: 0px;">
                                       <img id="icon2" src="../common/image/coupang/검색_돋보기.png"  class="s_coupang">
                                    </a>
                                 </button>
                            </div>
                          </div>
                        </form>
                     </div>
                  </div>   
                  <!-- 슬라이드 -->
                  <div class="h_section">
                     <!-- 한개의 input = page 수 -->
                     <input type="radio" name="slide" id="slide01" checked>
                     <input type="radio" name="slide" id="slide02">   
                     
                     <div class="h_slidewrap">
                        <ul class="h_slidelist">
                           <!-- 첫번째 슬라이드 내용 -->
                           <li>
                              <a>
                                 <label for="slide01" class="h_left"></label>
                                 <img src="../common/image/coupang/슬라이드1.png"/>
                                 <label for="slide02" class="h_right"></label>
                              </a>
                          </li>
                           <!-- 두번째 슬라이드 내용 -->
                           <li>
                              <a>
                                 <label for="slide01" class="h_left"></label>
                                 <img src="../common/image/coupang/슬라이드2.png"/>
                                 <label for="slide02" class="h_right"></label>
                              </a>
                          </li>
                        </ul>
                     </div>
                  </div>
               </nav>
             
               <div id="wrapper3">   
                   <ul>
                     <li class="choice"><a id="all" href=# target="_blank" style="background-color: #f6f6f6;" >전체</a></li>
                      <li class="choice"><p style="font-size: 6px; margin-top: 10px; background-color: #f6f6f6">> '무드등'</p></li>
                   </ul>      
               </div>
               
            </div>
         </div>
		
		 <div>
		</div>
		
		<div style="display:flex; width:1400px;"><!--new  -->
   			<!-- 승주 -->
   			<aside class="asideleft">
                <div class="stype">
                     <h4>종류</h4>
					<div class="option-item">
                         <input type="checkbox" id="stype1" name="type">
                         <label for="stype1">장스탠드</label>
					</div>
					<div class="option-item">
                        <input type="checkbox" id="stype2" name="type"/>
                        <label for="stype2"> 단스탠드 </label>
					</div>
					<div class="option-item">
                        <input type="checkbox" id="stype3" name="type"/>
                        <label for="stype3"> 학생스탠드 </label>
					</div>
					<div class="option-item">
                         <input type="checkbox" id="stype4" name="type"/>
                         <label for="stype4"> 무드등 </label>
					</div>
					<div class="option-item">
                         <input type="checkbox" id="stype5" name="type"/>
                         <label for="stype5"> 천장등/벽등 </label>
					</div>
					<div class="option-item">
                         <input type="checkbox" id="stype6" name="type"/>
                         <label for="stype6"> 줄조명 </label>
					</div>
         
                </div>
                 <hr>
                   <div class="scolor">
                         <h4>색상</h4>
                         <div class="option-item">
                          <input type="checkbox" id="scolor1" name="color"/>
                          <label for="scolor1"> 검정 </label>
                         </div>
                       	<div class="option-item">
                           <input type="checkbox" id="scolor2" name="color"/>
                           <label for="scolor2"> 네이비 </label>
						</div>
                        <div class="option-item">
                           <input type="checkbox" id="scolor3" name="color"/>
                           <label for="scolor3"> 그레이 </label>
                        </div>
                        <div class="option-item">
                           <input type="checkbox" id="scolor4" name="color"/>
                           <label for="scolor4"> 실버 </label>
                        </div>
                        <div class="option-item">
                           <input type="checkbox" id="scolor5" name="color"/>
                           <label for="scolor5"> 레드 </label>
                        </div>
                        <div class="option-item">
                          <input type="checkbox" id="scolor6" name="color"/>
                          <label for="scolor6"> 오렌지 </label> 
                      	</div>
                   </div>
                   <hr>
                   
                 <div class="sinstallation">
                            <h4>설치형태</h4>
                            <div class="option-item">
                              <input type="checkbox" id="sins1" name="installation type"/>
                              <label for="sins1"> 스탠드형 </label>
                           </div>
                           <div class="option-item">
                            <input type="checkbox" id="sins2" name="installation type"/>
                            <label for="sins2"> 걸이형 </label>
                         </div>
                         <div class="option-item">
                           <input type="checkbox" id="sins3" name="installation type"/>
                           <label for="sins3"> 스탠드형+걸이형 </label>
                        </div>
                        <div class="option-item">
                            <input type="checkbox" id="sins4" name="installation type"/>
                            <label for="sins4"> 집게형 </label>
                         </div>
                         <div class="option-item">
                            <input type="checkbox" id="sins5" name="installation type"/>
                            <label for="sins5"> 설치형 </label>
                         </div>
                         <div class="option-item">
                            <input type="checkbox" id="sins6" name="installation type"/>
                            <label for="sins6"> 부착형 </label>
                       </div>
                   </div>
                 <hr>
                 
                 <div class="spowersupplymethod">
                           <h4>전원공급방식</h4>
                           <div class="option-item">
                            <input type="checkbox" id="spow1" name="powersupplymethod"/>
                            <label for="spow1"> 전기코드/USB </label>
                         </div>                         
                         <div class="option-item">
                            <input type="checkbox" id="spow2" name="powersupplymethod"/>
                          <label for="spow2"> USB 충전식 </label>
                       </div>
                       <div class="option-item">
                          <input type="checkbox" id="spow3" name="powersupplymethod"/>
                          <label for="spow3"> 코드 충전식 </label>
                       </div>
                       <div class="option-item">
                          <input type="checkbox" id="spow4" name="powersupplymethod"/>
                          <label for="spow4"> 건전지 </label>
                       </div>
                       <div class="option-item">
                          <input type="checkbox" id="spow5" name="powersupplymethod"/>
                          <label for="spow5"> 태양열 집열판 </label>
                       </div>
                   </div>
                   <hr>
                   <div>
                          <h4>스타일/테마</h4>
                          <div class="option-item">
                            <input type="checkbox" id="s1" name="type">
                            <label for="s1">모던/심플</label>
                         </div>                        
                         <div class="option-item">
                           <input type="checkbox" id="s2" name="type"/>
                           <label for="s2"> 북유럽 </label>
                        </div>
                        <div class="option-item">
                           <input type="checkbox" id="s3" name="type"/>
                           <label for="s3"> 키즈/캐릭터 </label>
                        </div>
                        <div class="option-item">
                            <input type="checkbox" id="s4" name="type"/>
                            <label for="s4"> 내츄럴 </label>
                         </div>
                         <div class="option-item">
                            <input type="checkbox" id="s5" name="type"/>
                            <label for="s5"> 로맨틱 </label>
                         </div>
                         <div class="option-item">
                            <input type="checkbox" id="s6" name="type"/>
                            <label for="s6"> 클래식/엔틱 </label>
                         </div>
                   </div>
              </aside>
         
               
   		<!-- 오우주 -->
   		<div style="float: left; width: 1000px; margin:0px;">
	   		<div>
	   			<div class="relate" style="width: 90%;">
		   			<a style="color: black;">연관 검색어 :</a>
		   			<a href="#">침실 무드등</a>
		   			<a href="#">드림 캐쳐</a>
		   			<a href="#">led 무드등</a>
		   			<a href="#">조명</a>
		   			<a href="#">무드등</a>
		   			<a href="#">led드림캐쳐</a>
		   			<a href="#">스탠드 무드등</a>
		   			<a href="#">드림캐처</a>
		   			<a href="#">드림캐쳐 벽조명</a>
	   			</div>	
	
	   			<div class="filter" style="width: 90%;">
	   				<input type="radio" id="order1" name="ordering" checked="checked"><label for="order1">쿠팡 랭킹순</label>
	   				<input type="radio" id="order2" name="ordering"><label for="order2">낮은가격순</label>
	   				<input type="radio" id="order3" name="ordering"><label for="order3">높은가격순</label>
	   				<input type="radio" id="order4" name="ordering"><label for="order4">판매량순</label>
	   				<input type="radio" id="order5" name="ordering"><label for="order5">최신순</label>
	   				
	   				<ul class="lfilter">
	   					<li>
	   						<a href="#">36개씩 보기</a>
	   						<ul class="lcount">
	   							<li><a href="#">48개씩 보기</a>
	   							<li><a href="#">60개씩 보기</a>
	   							<li><a href="#">72개씩 보기</a>
	   						</ul>
	   					</li>
	   				</ul>
	   			</div>
	   		</div>
	
			<div>
				<a href="#">
					<img src="../common/image/coupang/광고.png" style="width: 90%;">
				</a>
	   			<h4>'무드등'에 대한 검색결과</h4>	
				
				<div class="lforflex" style="width: 100%; display: flex;">
					<div class="lproduct" onclick="location.href='http://localhost:8080/html_css_javascript/homework/detailView.jsp';">
						<header>
							<img src="../common/image/coupang/오리 1.jpg" class="lmainimg">
						</header>
						<div class="ltitle">
							무아스 철푸덕 LED 충전식 실리콘 무드등, 화이트
							<br>
							<br>
							 15% <span class="ldc">19,900</span>
						</div>
						<div class="ldetail">
							<span class="lrocket"> 16,800원 </span>
							<a>
								<img src="../common/image/coupang/로켓배송.jpg" class="lricon">
								<span class="lfont">로켓배송</span>					
							</a>
						</div>
						<br>
						<div class="larrival">
							 내일(목) 도착 보장
						</div>
						<img src="../common/image/coupang/별점5.jpg" class="lstar">
						<span class="lreview">(235)</span>
						<br>
						<div class="lround">
							<img src="../common/image/coupang/cash.png" class="lcash">
							<span class="lspace">최대 815원 적립  </span>
						</div>
					</div>
					
					<div class="lproduct" onclick="location.href='http://localhost:8080/html_css_javascript/homework/detailView.jsp';">
						<header>
							<img src="../common/image/coupang/달2.jpg" class="lmainimg">
						</header>
						<div class="ltitle">
							핑크퐁 멜로디 수면등, 혼합색상
							<br>
							<br>
							 12% <span class="ldc">32,000</span>
						</div>
						<div class="ldetail">
							<span class="lrocket"> 27,900원 </span>
							<a>
								<img src="../common/image/coupang/로켓배송.jpg" class="lricon">
								<span class="lfont">로켓배송</span>					
							</a>
						</div>
						<br>
						<div class="larrival">
							 내일(목) 도착 보장
						</div>
						<img src="../common/image/coupang/별점4.5.jpg" class="lstar">
						<span class="lreview">(42)</span>
						<br>
						<div class="lround">
							<img src="../common/image/coupang/cash.png" class="lcash">
							<span class="lspace">최대 1,395원 적립  </span>
						</div>
					</div>
					
					<div class="lproduct" onclick="location.href='http://localhost:8080/html_css_javascript/homework/detailView.jsp';">
						<header>
							<img src="../common/image/coupang/피카츄3.jpg" class="lmainimg">
						</header>
						<div class="ltitle">
							포켓몬스터 피카츄 미니 무드등, 낮잠
							<br>
							<br>
						</div>
						<div class="ldetail">
							<span class="lrocket"> 5,610원 </span>
							<a>
								<img src="../common/image/coupang/로켓배송.jpg" class="lricon">
								<span class="lfont">로켓배송</span>					
							</a>
						</div>
						<br>
						<div class="larrival">
							 내일(목) 도착 보장
						</div>
						<div class="lmin">
							새 상품, 반품 (12) 최저 4,950원
						</div>
						<img src="../common/image/coupang/별점4.5.jpg" class="lstar">
						<span class="lreview">(4079)</span>
						<br>
						<div class="lround">
							<img src="../common/image/coupang/cash.png" class="lcash">
							<span class="lspace">최대 280원 적립  </span>
						</div>
					</div>
					
					<div class="lproduct" onclick="location.href='http://localhost:8080/html_css_javascript/homework/detailView.jsp';">
						<header>
							<img src="../common/image/coupang/나무4.jpg" class="lmainimg">
						</header>
						<div class="ltitle">
							이코노미쿠스 LED 무선 감성 나무 침대 간접 조명 전등 수면등 무드등 크리스마스, 나무와잎
							<br>
							<br>
							 37% <span class="ldc">30,000</span>
						</div>
						<div class="ldetail">
							<span class="lrocket"> 18,900원 </span>
							<a>
								<img src="../common/image/coupang/상품_제트배송.jpg" style="float: left; width: 85px; height: 20px;">
												
							</a>
						</div>
						<br>
						<div class="larrival">
							 내일(목) 도착 보장
						</div>
						<img src="../common/image/coupang/별점4.5.jpg" class="lstar">
						<span class="lreview">(780)</span>
						<br>
						<div class="lround">
							<img src="../common/image/coupang/cash.png" class="lcash">
							<span class="lspace">최대 945원 적립  </span>
						</div>
					</div>
					
					<div class="lproduct" onclick="location.href='http://localhost:8080/html_css_javascript/homework/detailView.jsp';">
						<header>
							<img src="../common/image/coupang/우주5.jpg" class="lmainimg">
						</header>
						<div class="ltitle">
							회전하는 수정구슬 오르골 무드등 은하수 + 리모컨, 혼합색상
							<br>
							<br>
							 7% <span class="ldc">33,890</span>
						</div>
						<div class="ldetail">
							<span class="lrocket"> 31,510원 </span>
							<a>
								<img src="../common/image/coupang/로켓배송.jpg" class="lricon">
								<span class="lfont">로켓배송</span>					
							</a>
						</div>
						<br>
						<div class="larrival">
							 내일(목) 도착 보장
						</div>
						<img src="../common/image/coupang/별점4.5.jpg" class="lstar">
						<span class="lreview">(192)</span>
						<br>
						<div class="lround">
							<img src="../common/image/coupang/cash.png" class="lcash">
							<span class="lspace">최대 1,575원 적립  </span>
						</div>
					</div>
					
					<div class="lproduct" onclick="location.href='http://localhost:8080/html_css_javascript/homework/detailView.jsp';">
						<header>
							<img src="../common/image/coupang/달6.png" class="lmainimg">
						</header>
						<div class="ltitle">
							선진 16색 감성 달 무드등 중형 + 리모컨, 혼합색상
							<br>
							<br>
						</div>
						<div class="ldetail">
							<span class="lrocket"> 13,700원 </span>
							<a>
								<img src="../common/image/coupang/로켓배송.jpg" class="lricon">
								<span class="lfont">로켓배송</span>					
							</a>
						</div>
						<br>
						<div class="larrival">
							 내일(목) 도착 보장
						</div>
						<div class="lmin">
							새 상품, 반품 (6) 최저 11,640원
						</div>
						<img src="../common/image/coupang/별점4.5.jpg" class="lstar">
						<span class="lreview">(6002)</span>
						<br>
						<div class="lround">
							<img src="../common/image/coupang/cash.png" class="lcash">
							<span class="lspace">최대 685원 적립  </span>
						</div>
					</div>
					
					<div class="lproduct" onclick="location.href='http://localhost:8080/html_css_javascript/homework/detailView.jsp';">
						<header>
							<img src="../common/image/coupang/오리7.png" class="lmainimg">
						</header>
						<div class="ltitle">
							투랩 러블리덕 LED 무드등
							<br>
							<br>
							6% <span class="ldc">16,240</span>
						</div>
						<div class="ldetail">
							<span class="lrocket"> 15,220원 </span>
							<a>
								<img src="../common/image/coupang/로켓배송.jpg" class="lricon">
								<span class="lfont">로켓배송</span>					
							</a>
						</div>
						<br>
						<div class="larrival">
							 내일(목) 도착 보장
						</div>
						<img src="../common/image/coupang/별점4.5.jpg" class="lstar">
						<span class="lreview">(1948)</span>
						<br>
						<div class="lround">
							<img src="../common/image/coupang/cash.png" class="lcash">
							<span class="lspace">최대 761원 적립  </span>
						</div>
					</div>
					
					<div class="lproduct" onclick="location.href='http://localhost:8080/html_css_javascript/homework/detailView.jsp';">
						<header>
							<img src="../common/image/coupang/아보카도8.png" class="lmainimg">
						</header>
						<div class="ltitle">
							헤이루미 귀여운 아보카도 무드등 LED 실리콘 수면등 취침등 캠핑조명
							<br>
							<br>
							31% <span class="ldc">29,000</span>
						</div>
						<div class="ldetail">
							<span class="lrocket"> 19,800원 </span>
							<a>
								<img src="../common/image/coupang/로켓배송.jpg" class="lricon">
								<span class="lfont">로켓배송</span>					
							</a>
						</div>
						<br>
						<div class="larrival">
							 내일(목) 도착 보장
						</div>
						<img src="../common/image/coupang/별점4.5.jpg" class="lstar">
						<span class="lreview">(71)</span>
						<br>
						<div class="lround">
							<img src="../common/image/coupang/cash.png" class="lcash">
							<span class="lspace">최대 900원 적립  </span>
						</div>
					</div>
					
				</div>
				
				
				<div style="text-align: center;">
					<span class="lpage" onclick="#">＜</span>
					<span class="lpage" onclick="#" style="border: 1px solid black; padding-left: 3px; padding-right: 3px;">1</span>
					<span class="lpage"	onclick="#">2</span>
					<span class="lpage"	onclick="#">3</span>
					<span class="lpage" onclick="#">4</span>
					<span class="lpage" onclick="#">5</span>
					<span class="lpage" onclick="#">...</span>
					<span class="lpage" onclick="#">27</span>					
					<span class="lpage" onclick="#">＞</span>
					
				</div>
				
				<br>
			</div>
   		</div>
		<div class="srightbar">
                <div class="sshoppingbasket">
                  장바구니 ▶ <span style="text-align: right; color: #48aadb; float: right;">0</span> 
                </div>
                <div class="srecentlywatch">
                  최근본상품 <span style="text-align: right; color: #48aadb; float: right;">0</span> 
                </div>
                <div class="srecentlywatcheditem">
                   최근본 상품이<br>없습니다.
                </div>
             </div>
		</div><!--div 수정  -->
		
		<hr style="width: 100%;">
		<div>
			<ul class="ful" style="display: flex; justify-content: center;">
				<li onclick="#">회사소개</li>
				<li onclick="#">Investor Relations</li>
				<li onclick="#">인재채용</li>
				<li onclick="#">입점/제휴문의</li>
				<li onclick="#">공지사항</li>
				<li onclick="#" style="font-weight: bold">고객의 소리</li>
				<li onclick="#">이용약관</li>
				<li onclick="#">개인정보 처리방침</li>
				<li onclick="#">쿠팡페이 이용약관</li>
				<li onclick="#" style="font-weight: bold">쿠팡페이 개인정보처리방침</li>
				<li onclick="#">신뢰관리센터</li>
				<li onclick="#">제휴마케팅</li>
				<li style="border-right: white;">광고안내</li>
			</ul>
		</div>
		<hr style="width: 100%;">
		
		<div class="footer" style="width: 1000px; display: flex; flex-direction: row; margin: 0 300px;">
			<div style="width: 33%;">
				<img src="../common/image/coupang/coupangfoot.png" style="float: left; width: 150px;">
				<p style="margin-top: 10px; font-size: 6px;">
					상호명 및 호스팅 서비스 제공 : 쿠팡(주) <br>
					대표이사 : 강한승,박대준 <br>
					서울시 송파구 송파대로 570 <br>
					사업자 등록번호 : 120-88-00767 <br>
					통신판매업신고 : 2017-서울송파-0680 <br>
					<a class="foota" href="#">사업자정보 확인> </a>
				</p>
			</div>
			<div style="width: 33%;">
				<a href="#" class="foota2">
					<span style="font-weight: bold;">365 고객센터</span> | 전자금융거래분쟁처리담당<br>
					<span style="font-weight: bold;">1577-7011(유료)</span><br>
					서울시 송파구 송파대로 570<br>
					email: help@coupang.com
				</a>
			</div>
			<div style="width: 33%; font-size: 6px;">
				<a style="font-size: 10px; font-weight: bold; margin-top: 20px;">우리은행 채무지급보증 안내</a> <br>
				당사는 고객님이 현금 결제한 금액에 대해 <br>
				우리은행과 채무지급보증 계약을 체결하여 <br>
				안전거래를 보장하고 있습니다. <br>
				<span onclick="#" id="service">서비스 가입사실 확인 ></span>
			</div>
		</div>
		<hr>
		<img src="../common/image/coupang/footlong.png" style="width: 70%; margin:0 250px;">
		
		<div style="width: 100%; background-color: #333333; display: flex; flex-direction: row; justify-content: center">
			<div style="width: 70%; color: gray; font-size: 5pt; padding-top: 2px; padding-left: 250px;">
				사이버몰 내 판매되는 상품 중에는 쿠팡에 등록한 개별 판매자가 판매하는 마켓플레이스(오픈마켓) 상품이 포함되어 있습니다. <br>
				마켓플레이스(오픈마켓) 상품의 경우 쿠팡은 통신판매중개자이며 통신판매의 당사자가 아닙니다.<br>
				쿠팡은 마켓플레이스(오픈마켓) 상품, 거래정보 및 거래 등에 대하여 책임을 지지 않습니다.<br>
				쿠팡은 소비자 보호와 안전거래를 위해 신뢰관리센터(CM112@coupang.com)를 운영하고 있으며, 관련 분쟁이 발생할 경우 별도의 분쟁 처리절차에 의거 분쟁이 처리됩니다. <br>
				Copyright © Coupang Corp. 2010-2022 All Rights Reserved.
			</div>
			<div style="width: 30%; padding: 10px;">
				<a href="#">
					<img src="../common/image/coupang/facebook.png" style="width: 40px; height: 40px; float: left">
				</a>
				<a href="#">
					<img src="../common/image/coupang/blog.png" style="width: 40px; height: 40px; float: left">
				</a>
				<a href="#">
					<img src="../common/image/coupang/insta.png" style="width: 40px; height: 40px; float: left">
				</a>
			</div>
		</div>
   </body>
</html>