<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="icon" href="../../common/image/coupang/쿠팡아이콘.png" type="image/x-icon">
      <title>쿠팡! | 장바구니</title>
      
      <!-- Bootstrap을 사용하기 위한 외부 라이브러리 가져오기 -->
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
      <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/gasparesganga-jquery-loading-overlay@2.1.7/dist/loadingoverlay.min.js"></script>
      
      <script src="${pageContext.request.contextPath}/resources/js/basket.js"></script>
      <!--<link rel="stylesheet" src="../css/basket_style.css"></link>  -->
      <style>
		 *{
		   margin: 0;
		   padding: 0;
		 }
		 /* 장바구니 쿠팡로고 */
		 #header{
		 	position: relative;
		 	left: 350px;
		 	width: 980px;
		 	height: 72px;
		 	border-bottom: 2px solid #8a8a8a
		 }
		 .logo{
		 	margin: 0 auto 70px;
		 	width: 140px;
		 	height: 67px;
		 	float: left; 
		 }
		 .logo a{
		  position: relative;
		  top: 20px
		 }
		 .logo a img{
		 	width: 140px;
		 	height: 37px;	
		 }
		 /* 장바구니 내용 */
		 #contents{
		  	position: relative;
		 	left: 350px;
		 	width: 980px;
		 }
		 /* 장바구니 내용-title */
		 .c_title img{
		 	width: 933px;
		 	margin-bottom: 40px;
		 }
		 
		 /* 장바구니 내용- tab */
		  .tab1{
		    float: left;
			width: 100%;
			border-bottom: 2px solid #0073e9;
			padding-left: 20px;
			padding-bottom: 10px;
			background: #fff;
			font-weight: 700;
			color: #0073e9;
		  }
		  /* 테이블 */
		 /* 테이블_thead ----------------------------------------------------------------------------------------------*/
		 .table{
			border: 1px solid black;
		 }
		 .table thead{
		 	 background-color: #f5f5f5;
		 }
		 .table thead tr th{
		 	position: relative;
		 } 
		 /* 테이블_tbody -----------------------------------------------------------------------------------------------*/
		 #span1{
		 	font-weight: bold;
		 }
		 #span2{
		  font-size: 12px;
		 }
		 .t2{
		 	height: 150px;
		 }
		 .t2_nonMessage{
		 	text-align: center;
		 	font-size: 14px;
		 	padding: 40px;
		 }
		 .t3_td{
		 	padding: 100px;
		 }
		 .t3_td_contents{
		 	font-size: 13px;
		 	font-weight: bold; 
		 	text-align: center;
		 }
		 .t3_td_button{
		 	text-align: center;
		 	padding-top: 20px;
		 }
		 /*product_contents 상품이름*/
		 .c_name{
		 	border-bottom: 1px solid #e0e0e0;
		 	width: 324px;
		 }
		 .c_name a{
		 	color: #555;
		 	font-size: 14px;
		 	text-decoration: none;
		 	cursor:pointer;
		 }
		 .c_name a img{
		 
		 }
		 .c_name a:hover{
		 	text-decoration: underline;
		 	color: #555;
		 }
		 .c_date{
		 	width: 324px;
		 }
		 .c_option{
		 	float: right;
		 }
		 /* product_contents 상품배송예정일 */
		 .arrival{
		 	font-size: 13px;
		 }
		 .condition{
		 	font-size: 5px;
		 }
		 /* cancel 버튼 */
		 .cancel{
		 	width: 18px;
		 	height: 18px;
		 	font-size: 10px;
		 	border: 1px solid #d8d8d8;
		 	background-color: #ffff; 
		 }
		 /* 수량변경 버튼 */
		 .btn-quantity{
		 	font-size: 10px;
		 	border: 1px solid #d8d8d8;
		 	background-color: #ffff; 
		 	margin-left: 70px;
		 }
		 /* benefit */
		 #pointwrapper{
		 	 border: 1px solid #e0e0e0;
		 	 padding-left: 5px;
		 	 padding-right: 5px;
			 border-radius: 25px;
		 }
		 .point{
		 	font-size: 12px;
		 }
		 /* discount */
		 .discount{
    		border-left: 1px solid #e0e0e0;
    		border-right: 1px solid #e0e0e0;
    		border-bottom: 1px solid #e0e0e0;
		 }
		 .discount div{
		 	font-size: 12px;
		 	text-align: center;
		 }
		 .delivery_fee{
			border-bottom: 1px solid #e0e0e0;
		 	font-size: 12px;
		 	text-align: center;
		 }
		 /* t3-------------------------------------------------------------------------------------------------- */
		 .t3{
		 	background-color: #f5f5f5;
		 	position: relative;
		 }
		 /* 툴팁 */
		 .tool_tip{
		 	margin-left: 200px;
		 }
		 .tip{
		 	width: 400px;
		    padding: 12px 0px 12px 0px;
		    background: #fff;
		    text-align: center;
		    line-height: 15px;
		    z-index: 100;
		    border: 1px solid #999;
		 }
	 /*   .tip::after {
	          content:"";
	          position: absolute;
	          top: 153px;
	          right: 240px;
	          margin:-133px 0 0 -10px;
	          border-width: 8px;
	          border-style: solid;
	          /* 위는 색 지정, 오른쪽,아래,왼쪽은 색 지정 */
	          border-color: transparent transparent transparent white; 
	          z-index: 100; 
	      }
	      .tip::before {
	          content:"";
	          position: absolute;
	          top: 151px;
	          right: 240px;
	          margin:-133px 0 0 -10px;
	          border-width: 10px;
	          border-style: solid;
	          /* 위는 색 지정, 오른쪽,아래,왼쪽은 색 지정 */
	          border-color: transparent transparent transparent  lightgray;  
	         } 
	       
	       .tt_price{
	       	 padding-left: 5px; 
	       	 padding-bottom: 10xp; 
	       	 padding-top: 10px;
	       }
	      .tt_calproduct{
	      	margin-top: 13px; 
	      }  
	     /*전체선택*/
	     .selection{
	     	font-size: 12px;
	     }
	     /* 삭제버튼 */
	     .delete{
	     	border: 1px solid #d8d8d8;
	     	background-color: #ffff;
	     	font-size: 10px;
	     	padding: 3px;
	     }
	     /* cash_benefit_wrapper */
	     .cash_benefit_wrapper{
	     	border: #e1e1e1;
	     	margin-top:40px;
	     	margin-bottom: 40px;
	     	padding: 20px; 
	     }
	     .cbc_title{
	     	margin: 0 0 8px;
		    font-size: 14px;
		    font-weight: 700;
	     }
	     .ccbc_details{
	     	display: inline-block;
	     }
	     .cbc_details div{
	     	display: block;
	     	font-size: 14px;
	     }
	     .coupaybtn{
	     	display: inline-block;
	     }
	     /* total  */
	     .total_order_price{
	     	clear: both;
		    border: 4px solid #c8c8c8;
		    text-align: center;
		    padding: 12px;
		    margin-bottom: 80px; 
	     }
	     .top_text{
	     	color: #888888;
	     	font-size: 14px;
	     }
	     .top_price{
	     	font-weight: bold;
	     }
	     .top_calculator{
	     	border: 1px solid #d2d2d2;
	     	width: 50px;
	     }
		 /* 계속 쇼핑하기, 구매하기 버튼 */
		 .btn1{
		  	width: 220px;
		  	height: 63px;
		 }
		 .btn2{
		 	width: 220px;
		 	height: 63px;
		 }
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
	   
   <body style="background-color: #f0f0f0;">
   		<div id="wrapper" width="980px">
   			<header id="header">
   				<div class="logo">
   					<a href="#">
   					  <img src="../../common/image/coupang/s_coupang로고.png"/>
   					</a>
   				</div>
   			</header>
   			<section id="contents" style="background-color: white;">
   				<div  class="card-body">
		      		<section style="border: 1px solid black;">
   						<div class="c_title">
   							<img src="../../common/image/coupang/s_장바구니title.jpg"/>
   						</div>
   						<article>
   							<div>
   								<span class="tab1">일반구매</span>
   							</div>
								<table id="table" class="table">
									<colgroup>
										<col width="50">
										<col width="80">
										<col width="*">
										<col width="90">
										<col width="90">
									</colgroup>
								    <thead>
								      <tr class="head">
								        <th scope="col" background-color: lightgray;">
								        	<label>
									        	<input id="th_checkBox" 
									        			title="모든 상품을 결제상품으로 설정" 
								        				type="checkbox" 
								        				id="cboxAll_top"
								        				class="cboxAll"  
								        				value="selectall"
								        				name="chk"
								        				onclick="checkAll()" />
				        					</label>
                                        </th>
                                        <th scope="col"><span id="th_all_title"><!-- 상품이 있을 경우 들어갈 전체선택 --></span></th>
								        <th scope="colgroup">상품정보</th>
								        <th scope="col">상품금액</th>
								        <th scope="col">배송비</th>
								      </tr>
								      
								    </thead>
								    
								    <div id="spinner_container">
								      	
								    </div>
								    <tbody id ="basket_tbody">
								     <!-- Json으로 불러오는 곳 -->  
								    </tbody>
								      <tr id="json_t3" class="t3" colspan="5">
								        <td scope="colgroup" class="tool_tip" colspan="5">
								        	<div class="d-flex">
								        		<div class="tip" style="width: 520px; margin-left: 0px;">
									        		<span style="font-size: 13px;">다른</span>
									        		<a href="http://localhost:8080/html_css_javascript/homeworks/list.jsp">
									        			<span style="font-size: 13px;">로켓배송 상품 (로켓와우 포함)</span>
									        		</a>
									        		<span style="font-size: 13px;">을 추가해도 함께</span>
									        		<span class="text-success" style="font-size: 13px;">무료배송</span>
									        		<span style="font-size: 13px;">가능!</span>
									        	</div>
									        	<img src="../../common/image/coupang/s_arrow.jpg" height="30" style="margin-left: -3px; padding-top: 8px;"/>
									        	<span id="tt_price" class="tt_price">상품가격 </span>
									        	<span id="tt_price_product" style="padding-top: 10px; font-weight:bold;">0</span>
									        	<span class="tt_price">원</span>
									        	<span class="tt_product"><img class="tt_calproduct" src="../../common/image/coupang/s_+.jpg" width="20"></span>
									        	<span class="tt_price">배송비</span>
									        	<span id="tt_price_delivery" style="padding-top: 10px;">무료</span>
									        	<span ><img class="tt_price" src="../../common/image/coupang/s_=.jpg" width="26"></span>
									        	<span class="tt_price">주문금액</span>
									        	<span id="tt-product-total" style="padding-top: 10px; font-weight:bold;">0</span>
									        	<span class="tt_price">원</span>
								        	</div>	
								        </td>
								      </tr>
						    	</table>
					    	
							<div id="lastselector" class="lastselector">
							  <label>
				        		<input title="모든 상품을 결제상품으로 설정" 
				        				type="checkbox"
				    					id="cboxAll_bottom"
				        				class="cboxAll"  
				        				value="selectall"
				        				name="chk"
				        				onclick="checkAll()" />
				        		<span class="selection">전체선택</span>
				        		<span class="selection">(</span>
				        		<span id="s_p_choice" class="selection"></span>
				        		<span class="selection">/</span>
				        		<span id="s_t_choice" class="selection"></span>
				        		<span class="selection" style="margin-right: 10px;">)</span>
				        	 </label>
				        	 <button id="btn_delete" class="delete" style="margin-right: 10px;" onclick="removeProduct()"></button>
				        	 <button id="poolDelete" class="delete">품절/판매종료상품 전체삭제</button>
						   </div>
						   <div class="cash_benefit_wrapper border rounded-sm">
					    		<div class="cash_benefit_contents">
					    			<img src="//img1a.coupangcdn.com/image/cart/generalCart/ico_cash_m_2x.png" width="24"/>
					    			<span class="cbc_title">캐시적립 혜택</span>
					    		</div>
					    		<div class="d-flex">
						    		<div class="cbc_details" style="width: 75%">
						    			<div>[로켓와우 + 쿠페이 계좌이체] 결제 시 2% 적립</div>
							    		<div>[로켓와우 + 쿠페이 머니] 결제 시 4%  추가적립</div>
							    		<div>쿠페이 머니 결제 시 1% 적렙</div>
						    		</div>
						    		<div>
						    			<div class="coupaybtn btn btn-outline-primary btn-sm" 
						    			style="padding-bottom: -50px;" onclick="openPopup1()">로켓와우 무료체험 신청하기</div>
						    		</div>
					    		</div>
  				    	  </div>
  				    	  <div class="total_order_price">
  				    	  	<span class="top_text">총 상품가격</span>
  				    	  	<span id="top_product" class="top_price">0</span>
  				    	  	<span class="top_text" style="margin-right: 20px;">원</span>
  				    	  	<span class="top_calculator" style="margin-right: 20px;">+</span>
  				    	  	<span class="top_text">총 배송비</span>
  				    	  	<span id="top_delivery" class="top_price">0</span>
  				    	  	<span class="top_text" style="margin-right: 20px;">원</span>
  				    	  	<span class="top_calculator" style="margin-right: 20px;">=</span>
  				    	  	<span class="top_text">총 주문금액</span>
  				    	  	<span id="top_total" class="top_price text-danger">0</span>
  				    	  	<span class="top_text">원</span>
  				    	  </div>
   				    	</article>
   				    	<div class="btns d-flex justify-content-center">
   				    		<button class="btn1 btn btn-outline-primary m-1">계속 쇼핑하기</button>
   				    		<button class="btn2 btn btn-primary m-1">구매하기</button>
   				    	</div>
   				    	
   				    </section>
   				    
      			</div>
   			</section>
   			
   			<footer  style="border: 1px solid black;">
   				     <div class="footer-layer1">
			            <a href="https://news.coupang.com/" target="_blank">회사소개</a>
			            <a href="https://ir.aboutcoupang.com/English/home/" target="_blank">Investor Relations</a>
			            <a href="https://rocketyourcareer.kr.coupang.com" target="_blank">인재채용</a>
			            <a href="https://wing.coupang.com/vendor/joining/welcome?inflow=WEB_FOOTER_B">입점 / 제휴문의</a>
			            <a href="https://csmessenger.coupang.com/cs-center/notice/main">공지사항</a>
			            <a href="https://csmessenger.coupang.com/cs-center/voc/main">고객의 소리</a>
			            <a href="/np/policies/terms">이용약관</a>
			            <a href="https://privacy.coupang.com/ko/center/coupang" style="font-weight: bold;"><b>개인정보 처리방침</b></a>
			            <a href="https://rocketpay.coupang.com/rocketpay/operationTerms/coupangPcFooter">쿠팡페이 이용약관</a>
			            <a href="https://privacy.coupang.com/ko/land/coupay" style="font-weight: bold;"><b>쿠팡페이 개인정보처리방침</b></a>
			            <a href="/np/safety">신뢰관리센터</a>
			            <a href="https://partners.coupang.com/" target="_blank">제휴마케팅</a>
			            <a href="https://ads.coupang.com" target="_blank">광고안내</a>
			         </div>

		         <div class="footer-layer2">
		            <h1><a href="https://www.coupang.com/" title="COUPANG">COUPANG</a></h1>
		            <div>
		               <address>
		                  상호명 및 호스팅 서비스 제공 : 쿠팡(주)<br>
		                  대표이사 : 강한승,박대준<br>
		                  서울시 송파구 송파대로 570 <br>
		                  사업자 등록번호 : 120-88-00767 <br>
		                  통신판매업신고 : 2017-서울송파-0680<br>
		                  <a class="licensee"
		                     href="http://www.ftc.go.kr/info/bizinfo/communicationViewPopup.jsp?wrkr_no=1208800767"
		                     target="_blank" title="사업자정보 확인">사업자정보 확인 &gt;</a>
		               </address>
		               <div class="contact-info">
		                  <a class="call-center" href="https://csmessenger.coupang.com/cs-center/chat/main" title="365 고객센터">
		                     <strong>365고객센터</strong> | 전자금융거래분쟁처리담당<br>
		                     <em>1577-7011 (유료)</em>
		                     서울시 송파구 송파대로 570<br>
		                     <span class="contact-fax">email : help@coupang.com</span>
		                  </a>
		               </div>
		               <p class="safe-service">
		                  <strong>우리은행 채무지급보증 안내</strong><br>
		                  <span>
		                     당사는 고객님이 현금 결제한 금액에 대해<br>우리은행과 채무지급보증 계약을 체결하여<br>안전거래를 보장하고 있습니다.<br>
		                  </span>
		                  <a href="https://www.coupang.com/np/etc/popWooriService" target="_blank"
		                     style="text-decoration: underline;" title="서비스 가입사실 확인">서비스 가입사실 확인
		                     &gt;</a>
		               </p>
		            </div>
		         </div>
		
		         <div class="footer-layer3">
		            <div class="certification-list">
		            </div>
		         </div>

		         <div class="footer-layer4">
		            <div class="coupang-copyright">
		               <p class="info" style="padding-top: 9px;">사이버몰 내 판매되는 상품 중에는 쿠팡에 등록한 개별 판매자가 판매하는 마켓플레이스(오픈마켓) 상품이 포함되어
		                  있습니다.<br>
		                  마켓플레이스(오픈마켓) 상품의 경우 쿠팡은 통신판매중개자이며 통신판매의 당사자가 아닙니다.<br>
		                  쿠팡은 마켓플레이스(오픈마켓) 상품, 거래정보 및 거래 등에 대하여 책임을 지지않습니다.<br>
		                  쿠팡은 소비자 보호와 안전거래를 위해 신뢰관리센터(CM112@coupang.com)를 운영하고 있으며, 관련 분쟁이 발생할 경우 별도의 분쟁 처리절차에 의거 분쟁이 처리됩니다.<br>
		                  Copyright © Coupang Corp. 2010-2022 All Rights Reserved.
		               </p>
		               <ul class="sns-link">
		                  <li><a href="https://www.facebook.com/Coupang.korea" target="_blank" class="facebook"
		                        title="쿠팡 페이스북">쿠팡 페이스북</a></li>
		                  <li><a href="https://news.coupang.com/" target="_blank" class="blog" title="쿠팡 뉴스룸">쿠팡 뉴스룸</a></li>
		                  <li><a href="https://www.instagram.com/coupang" target="_blank" class="instagram" title="쿠팡 인스타그램">쿠팡
		                        인스타그램</a></li>
		               </ul>
		            </div>
		         </div>
   			</footer>
   		</div>
   </body>
</html>