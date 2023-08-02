<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>쿠팡! - 무드등</title>
		<link rel="icon" href="../common/image/coupang/아이콘.jpg" type="image/x-icon"> 
		
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
	    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
		<script src="detailView.js"></script>
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
		         display:inline;
		         background-color: white;
		      }
		      .list{
		         background-color: white;
		      }
		      #wrapper2{
		      	 left: 200px;
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
		         width: 100%;
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
		         width: 138px;/* 원하는 너비설정 */
		         height: 37px;
		         padding: 9px; /* 원하는 높이 설정*/ 
		         font-family: inherit; /* 폰트 상속 */
		         background: url(../common/image/coupang/전체option_화살표.png) no-repeat 95% 50%; /* 화살표 모양의 이미지 */
		         background-color: #fff;
		         -webkit-appearance: none; /* 네이티브 외형 감추기 */
		         -moz-appearance: none;
		         appearance: none; 
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
		         position: absolute;
		         right: 335px;/* 360 */
		         top: 53px;
		      }
		      .h_mine2{
		         position: absolute;
		         right: 274px;
		         top: 51px;
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
		       /*------------------------------------------------------유진 스타일  */
			
			#sideimgs {
				height: 455px;
				width: 50px;
				float: left;
			}
			
			.sideimg {
				height: 50px;
				width: 50px;
				margin: 3px;
			}
			
			.sideimg:hover {
				cursor: pointer;
			}
			.selectedSideImg {
				border: 2px solid #366bf9;
				
			}
			.topmiddle:hover {
				cursor: pointer;
			}
			
			#company {
				color: #7890d0;
				font-size: 6px;
				text-decoration: none;
				font-weight: bold;
			}
			#company:visited {
				text-decoration: none;
			}
			#star {
				color: #7890d0;
				font-size: 12px;
				font-weight: bold;
				text-decoration: none;
			}
			#star:hover {
				cursor: pointer;
			}
			#star:visited {
				text-decoration: none;
			}
			#detailbox {
				width: 455px;
				font-size: 15px;
				background-color: #fafafa;
				border: 1px lightgray solid;
				padding: 10px;
			}
			#rocketwow {
				display: inline;
				width: 250px;
				border: 1px #5f76d3 solid;
				color: #5f76d3;
				padding: 5px;
				margin-left: 7px;
			}
			#rocketwow:hover {
				cursor: pointer;
			}
			#rocketwow:visited {
				text-decoration: none;
			}
			#rocketwow a {
				text-decoration: none;
				color: #5f76d3;
			}
			#quantity {
				width: 70px;
				height: 50px;
				font-size: 25px;
				text-align: center;
			}
			
			.boxin {
				margin: 10px;
			}
			.lround {
           		font-size: 15px; 
           		border: 1px solid #e4e6e5; 
           		border-radius:20px; 
           		display:inline-block;
           		margin-top: 5px;
           	}
           	.lcash {
           		height: 15px; 
           		margin-left: 4px; 
           		margin-right: 4px;
           	}
           	.lspace {
           		white-space: pre-wrap;
           	}
           	.hline {
           		width: 455px;
           		margin-top: 10px;
           		margin-bottom: 10px;
           	}
           	.price {
           		margin: 15px;
           	}
           	
           	#cart {
           		height: 54px;
           		width: 180px;
           		color: #3b71ef;
           		background-color: white;
           		text-decoration: none;
           		border: 1px solid #3b71ef;
           		font-size: 15px;
           		font-weight: bold;
           	}
           	#cart:hover{
           		cursor: pointer;
           	}           	
           	#buynow {
           		height: 54px;
           		width: 180px;
           		color: white;
           		background-color: #3b71ef;
           		text-decoration: none;
           		border: 1px;
           		font-size: 15px;
           		font-weight: bold;
           	}
           	#buynow:hover {
           		cursor: pointer;
           	}
           	
           	#details {
           		font-size: 12px;
           		margin-left: 20px;
           	}
           	
           	.Allreview {
           		margin-left: 2px;
           		width: 12%;
           	}
           	
           	/* ---------------------------------------------------------우주 스타일 */
           
           .d_section{
            width: 1000px;
           	margin-left: 300px;
         }
         .d_section input[type=radio]{
            display: none; 
         }
         .d_section .d_slidewrap{
            max-width: 867px;
            margin: 0 auto;
            overflow: hidden;
         }
         .d_section .d_slidelist{
            white-space:nowrap; /* 줄바꿈 제거 */
            font-size: 0;
         }
         .d_section .d_slidelist > li{
            display: inline-block;
            vertical-align: middle;/* 세로정렬 */
            width: 100%; /* 부모 div 크기에 맞춤 */
            transition: all .5s; /* 슬라이드 애니매이션(전체 옵션, 시간: 0.5초) */
         }
         .d_section .d_slidelist > li > a{
            display: block;
            position: relative;
         }
         .d_section .d_slidelist > li > a img{
            width: 100%;
         }
         /* 방향 라벨 */
         .d_section .d_slidelist label{
            position: absolute;
            top: 50%;
            transform: translateY(-50%);/* 자신의 높이의 반만큼 위로 올라감 */
            padding: 10px;
            cursor: pointer;
         }
         .d_section .d_slidelist .d_left{
            left: 0px;
            background: url("../common/image/coupang/d_왼쪽 화살표.png");
            width: 20px;
            height: 40px;
         }
         .d_section .d_slidelist .d_right{
            right: 0px;
            background: url("../common/image/coupang/d_오른쪽 화살표.png");
            width: 20px;
            height: 40px;
         }
         .d_section [id="d_slide01"]:checked ~ .d_slidewrap .d_slidelist > li {
              transform: translateX(0%);
          }
         .d_section [id="d_slide02"]:checked ~ .d_slidewrap .d_slidelist > li {
              transform: translateX(-100%);
           }   
         .d_section [id="d_slide03"]:checked ~ .d_slidewrap .d_slidelist > li {
              transform: translateX(-200%);
           }   
         .d_section [id="d_slide04"]:checked ~ .d_slidewrap .d_slidelist > li {
              transform: translateX(-300%);
           }
           	/* -----------------------------------------------------------------------------유진 스타일 */
            /* .ul1 {
		        list-style: none;
		        text-align: center;  
		        border: 1px solid black;
		        height: 60px;
			    padding: 0px;
			    width: 50%;
			    margin: 0 auto; 
			    width: 1000px;
     		 }
      
		     .plist {
		        display:inline-block;
		        margin-right: 10px;
		        padding: 20px; 
		        margin-left: 20px;
		     } */
		     .hr1 {
		        width: 100%;
		     }
		     .review, .review1 {
		         text-align: left;
		         height: 300px;
			   	 padding: 0px;
			     width: 80%;
			     margin: 0 auto; 
		     }
		     .review1 {
		        height: 40px;
		        background-color: #555555;
		       
		     }
		     .h4, .span1 {
		         margin-left: 10px;
		         margin-bottom: 10px;
		     }
		     .span1 {
		         font-size: small;
		     } 
		     .rank {
		         display:block;
		         width: 40%;
		         height: 50px;
		         margin-top: 10px;
		         margin-bottom: 20px;
		      }
		     .reviewphoto1 {
		        width: 100%;
		        height: 90px;
		        margin-bottom: 30px;
		     }
		     .detail {
		        color: blue;
		     }
		     
		     .detail:hover {
		        color: black;
		     }
		     .look {
		        display: flex;
		        justify-content: flex-end;
		        align-items: center;
		     }
		     .review2 {
		        text-align: center;
		     }
		     .bestrecent {
		        color: white;
		     }
		     
		    .p{
              border: 1px solid #dfdfdf;
              width: 180px;
              text-align: center;
              padding: 25px;
              border: 1px solid #dfdfdf;
              background-color: #fafafa;
           	}
           	
           	.p:hover{
           		cursor: pointer;
           	}
           	
           	.selectedP {
           		font-weight: bold;
           		border-bottom: none;
           		background-color: white;
           	}		   
           	
           	/* -------------------------------------------------------------------------------승주 스타일 */
           	/* footer */
			.footer-frame {
			   
			   width: 100%;
			   position: relative;
			   border-top: #ddd solid 2px;
			    background: #fff;
			}
			
			.footer-layer1 {
			   border-bottom: #ddd solid 1px;
			    height: 50px;
			    text-align: center;
			    padding-top: 15px;
			    white-space: nowrap;
			}
			
			.footer-layer1 a {
			   display: inline-block;
			    white-space: nowrap;
			    padding: 0 14px;
			    font-size: 12px;
			    color: #555;
			    height: 12px;
			    border-left: #888 solid 1px;
			}
			
			.footer-layer1 a:first-child{
			   border-left: 0;
			}
			
			.footer-layer1 .site-picker {
			   position: relative;
			    font-size: 14px;
			    display: inline-block;
			    text-align: left;
			    vertical-align: top;
			    margin-top: -9px;
			    color: #212b36;
			    margin-left: 5px;
			}
			
			.footer-layer1 .site-picker .site-picker-arrow {
			   transition: .3s;
			   display: inline-block;
			    width: 14px;
			    height: 14px;
			    background-color: #333;
			}
			
			.footer-layer2 {
			   width: 1020px;
			    height: 100px;
			    margin: 30px auto;
			    font-size: 12px;
			    color: #555;
			    line-height: 150%;
			}
			
			.footer-layer2 h1 {
			   float: left;
			    width: 150px;
			    background-image: none;
			}
			
			.footer-layer2 h1 a {
			   display: block;
			   width: 117px;
			   height: 34px;
			    overflow: hidden;
			    background: url(//static.coupangcdn.com/image/coupang/common/footer_asset_v8.png) no-repeat;
			   background-position: -19px -34px;
			    text-indent: -99em;
			   margin-left: 10px;
			}
			
			.footer-layer2 a {
			   color: #555;
			}
			
			
			.footer-layer2 address {
			   float: left;
			    width: 260px;
			}
			
			.footer-layer2 .licensee {
			   text-decoration: underline;
			}
			
			.footer-layer2 .contact-info {
			   float: left;
			    width: 340px;
			    color: #555;
			}
			
			.footer-layer2 strong {
			   font-weight: bold;
			    font-size: 12px;
			}
			
			.footer-layer2 .contact-info em {
			   font-size: 24px;
			    font-family: Tahoma;
			    font-weight: bold;
			    display: block;
			    margin: 9px 0 11px 0;
			   font-style: normal;
			}
			
			.footer-layer2 .safe-service {
			   float: left;
			    width: 270px;
			    font-size: 11px;
			}
			
			.footer-layer3 {
			   width: 1020px;
			    height: 80px;
			    margin: 0 auto;
			    position: relative;
			    border-top: #ddd solid 1px;
			}
			
			.footer-layer3 .certification-list {
			   width: 968px;
			   height: 80px;
			   margin: 0 auto;
			   background: url(//static.coupangcdn.com/image/coupang/common/footer_asset_v12.png) no-repeat;
			   background-position: -44px -92px;
			   position: relative;
			}
			
			.footer-layer4 {
			   background: #333;
			    height: 100px;
			}
			
			.footer-layer4 .coupang-copyright {
			   width: 1020px;
			    margin: 0 auto;
			    position: relative;
			}
			
			.footer-layer4 .coupang-copyright p {
			   color: #888;
			    font-size: 11px;
			}
			
			.footer-layer4 .coupang-copyright .info {
			   padding: 21px 0 3px 0;
			}
			
			.footer-layer4 .coupang-copyright .sns-link {
			   position: absolute;
			    top: 23px;
			    right: 0;
			}
			
			.footer-layer4 .coupang-copyright .sns-link li {
			   float: left;
			   list-style: none;
			}
			
			.footer-layer4 .coupang-copyright .sns-link a {
			   width: 34px;
			    height: 34px;
			    margin-right: 8px;
			   display: block;
			    overflow: hidden;
			    background: url(//static.coupangcdn.com/image/coupang/common/footer_asset_v8.png) no-repeat;
			    text-indent: -99em;
			}
			
			.footer-layer4 .coupang-copyright .sns-link a.facebook {
			   background-position: -220px -30px;
			}
			
			.footer-layer4 .coupang-copyright .sns-link a.blog {
			   background-position: -348px -30px;
			}
			
			.footer-layer4 .coupang-copyright .sns-link a.instagram {
			   background-position: -390px -30px;
			}
		</style>
		
	</head>
	<body>
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
                       <li><a id="center"class="list" target="_blank" \>고객센터</a></li>
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
                     <!-- 마이쿠팡,장바구니 -->
                     <div>
                        <ul class="drawer">
                           <li class="h_mine1"> <!--마이쿠팡 -->
                              <a  href="#" style="padding: 0;">
                              <img src="../common/image/coupang/마이쿠팡.jpg" width="62">
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
                                    <img src="../common/image/coupang/장바구니.jpg" width="62">
                                 </div>
                                 <div class="task-tooltip" style="font-size: 12px">
                                    장바구니에 담긴 상품이 없습니다.
                                 </div>
                              </div>
                           </li>
                        </ul>   
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
         <!-- ---------------------------------------------------------우주 -->
         <div id="top" class="top d-flex" style="width: 1000px;">
			
		</div>
		<br/>
		<!-- <div class="d_section">
            <h3 id="how?">이런 상품은 어때요?</h3>
           한개의 input = page 수
           <input type="radio" name="slide" id="d_slide01" checked>
           <input type="radio" name="slide" id="d_slide02">   
           <input type="radio" name="slide" id="d_slide03">   
           <input type="radio" name="slide" id="d_slide04">   
           <input type="radio" name="slide" id="d_slide05">   
           
           <div class="d_slidewrap">
              <ul class="d_slidelist">
                 첫번째 슬라이드 내용
                 <li>
                    <a>
                     <label for="d_slide05" class="d_left"></label>
                     <img src="../common/image/coupang/d_슬라이드1.png"/>
                     <label for="d_slide02" class="d_right"></label>
                    </a>
                </li>
                 두번째 슬라이드 내용
                 <li>
                    <a>
                       <label for="d_slide01" class="d_left"></label>
                       <img src="../common/image/coupang/d_슬라이드2.png"/>
                       <label for="d_slide03" class="d_right"></label>
                    </a>
                </li>
                 세번째 슬라이드 내용
                 <li>
                    <a>
                       <label for="d_slide02" class="d_left"></label>
                       <img src="../common/image/coupang/d_슬라이드3.png"/>
                       <label for="d_slide04" class="d_right"></label>
                    </a>
                </li>
                 네번째 슬라이드 내용
                 <li>
                    <a>
                       <label for="d_slide03" class="d_left"></label>
                       <img src="../common/image/coupang/d_슬라이드4.png"/>
                       <label for="d_slide05" class="d_right"></label>
                    </a>
                </li>
                 다섯번째 슬라이드 내용
                 <li>
                    <a>
                       <label for="d_slide04" class="d_left"></label>
                       <img src="../common/image/coupang/d_슬라이드5.png"/>
                       <label for="d_slide01" class="d_right"></label>
                    </a>
                </li>
              </ul>
           </div>
        </div> -->
		
		<div style="width: 1000px; margin-left: 300px; padding-top:20px;">
	      		
	      		<div id="fixedNav" class="d-flex mb-5" style="width: 100%; border-top: 3px solid black; position: sticky; top:0;">
		      		<div id="p1" class="p selectedP" style="width: 25%;" onclick="#">상품상세</div>
			        <div id="p2" class="p" style="width: 25%;" onclick="#">상품평</div>
			        <div id="p3" class="p" style="width: 25%;" onclick="#">상품문의</div>
			        <div id="p4" class="p" style="width: 25%;" onclick="#">배송/교환/반품 안내</div>	      		
	      		</div>

	      		<div>
	      			<img src="//thumbnail6.coupangcdn.com/thumbnails/remote/q89/image/retail/images/2022/09/07/19/6/8ed7ce11-15ab-4e9f-9b31-949fabf919f0.jpg"
	      			style="margin-left: 150px; width:700px;">
	      		</div>
		      	
		      	<div id="reviewContainer">
		      		<div class="d-flex">
		      			<div style="font-size: 20px; font-weight: bold; width: 85%">상품평</div>
		      			<div style="width: 15%; font-size: 18px;"><a href="#" style="color:#5474c9;">상품평 운영원칙</a></div>
		      		</div>
		      		
		      		<div style="width: 100%; font-size: 15px;">동일한 상품에 대해 작성된 상품평으로 판매자는 다를 수 있습니다.</div>
		      		<div class="d-flex mb-4">
		      			<div style="width: 30%;">별점</div>
		      			<div style="width: 7%; font-size: 25px;">247</div>
		      			<div style="width: 10%;">자세히보기></div>
		      		</div>
		      		
		      		<div class="d-flex">
		      			<img class="Allreview" src="https://thumbnail8.coupangcdn.com/thumbnails/local/q-1/image2/PRODUCTREVIEW/202302/6/1739577998301459840/c5a890a3-0d72-4a2a-926d-f8d3a8d268a0.jpg" >
		      			<img class="Allreview" src="https://thumbnail8.coupangcdn.com/thumbnails/local/q-1/image2/PRODUCTREVIEW/202302/6/1739577998301459840/c5a890a3-0d72-4a2a-926d-f8d3a8d268a0.jpg" >
		      			<img class="Allreview" src="https://thumbnail8.coupangcdn.com/thumbnails/local/q-1/image2/PRODUCTREVIEW/202302/6/1739577998301459840/c5a890a3-0d72-4a2a-926d-f8d3a8d268a0.jpg" >
		      			<img class="Allreview" src="https://thumbnail8.coupangcdn.com/thumbnails/local/q-1/image2/PRODUCTREVIEW/202302/6/1739577998301459840/c5a890a3-0d72-4a2a-926d-f8d3a8d268a0.jpg" >
		      			<img class="Allreview" src="https://thumbnail8.coupangcdn.com/thumbnails/local/q-1/image2/PRODUCTREVIEW/202302/6/1739577998301459840/c5a890a3-0d72-4a2a-926d-f8d3a8d268a0.jpg" >
		      			<img class="Allreview" src="https://thumbnail8.coupangcdn.com/thumbnails/local/q-1/image2/PRODUCTREVIEW/202302/6/1739577998301459840/c5a890a3-0d72-4a2a-926d-f8d3a8d268a0.jpg" >
		      			<img class="Allreview" src="https://thumbnail8.coupangcdn.com/thumbnails/local/q-1/image2/PRODUCTREVIEW/202302/6/1739577998301459840/c5a890a3-0d72-4a2a-926d-f8d3a8d268a0.jpg" >
		      			<img class="Allreview" src="https://thumbnail8.coupangcdn.com/thumbnails/local/q-1/image2/PRODUCTREVIEW/202302/6/1739577998301459840/c5a890a3-0d72-4a2a-926d-f8d3a8d268a0.jpg" >
		      		</div>
		      		
		      		<div class="d-flex" style="background-color: #555555; padding: 10px;">
		      			<div style="color: white; border-right: 1px solid #8e9291; padding: 5px;">베스트순</div>
		      			<div style="color: #8e9291; ">최신순</div>
		      			<div class="d-flex">
		      				<div><input placeholder="상품평을 검색해보세요."></div>
		      				<div>돋보기</div>
		      			</div>
		      			<div class="d-flex">
		      				<div><input placeholder="모든 별점 보기"></div>
		      				<div>드롭다운</div>
		      			</div>
		      		</div>
		      		
		      		<div id="reviewCard">
		      			<div class="d-flex">
		      				<div>프로필 사진</div>
		      				<div>
		      					<div>아이디</div>
		      					<div class="d-flex">
									<div>별점</div>
									<div>작성일</div>
								</div>
		      					<div>판매자</div>
		      				</div>
		      			</div>
		      			<div>무아스 철푸덕 led 충전식 실리콘 무드등, 화이트</div>
		      			<div class="d-flex">
		      				<img class=reviewImg src="">
		      			</div>
		      			<div>리뷰 내용</div>
		      			<div class="d-flex">
		      				<div>7명에게 도움 됨</div>
		      				<div>도움이 돼요</div>
		      				<div>도움 안 돼요</div>
		      				<div>신고하기</div>
		      			</div>
		      		</div>
		      		
		      		<div>
		      			<div>페이징</div>
		      		</div>
		      	</div>
		</div>
		
		<div>
		
		</div>
		
		<hr style="width: 100%;">
		
		<div id="footer">
		
		</div>
	</body>
</html>