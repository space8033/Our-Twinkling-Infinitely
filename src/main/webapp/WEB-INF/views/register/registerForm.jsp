<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=2.0">
<link rel="shortcut icon"
	href="//image9.coupangcdn.com/image/coupang/favicon/v2/favicon.ico"
	type="image/x-icon" />
<title>쿠팡 상품 등록</title>
<link rel="stylesheet" href="registerForm_css.css">
</head>
<body>
	
	
	
	
	
	
  <div id="wrapper">	
	
	<div id="top">
		<div id="logoBox">
			<img src="image/free-icon-menu-8212733.png"width="50" height="41">
			<img src="//image7.coupangcdn.com/image/coupang/common/logo_coupang_w350.png" width="174" height="41">
		</div>
	    <div id="navBox">온라인문의&nbsp&nbsp&nbsp&nbsp | &nbsp&nbsp&nbsp&nbsp도움말&nbsp&nbsp&nbsp&nbsp | &nbsp&nbsp&nbsp&nbsp<img src="image/free-icon-alarm-bell-2088595.png" width="10"height="10"> &nbsp&nbsp&nbsp&nbsp| &nbsp&nbsp&nbsp&nbsp김시온 님
	    </div>
	</div>

	<div id="middle">
		<div id="localNav">
			<div class="accordion">
				<input type="radio" id="tab1" name="accordion">
				<label for="tab1"><img src="image/free-icon-delivery-box-590458.png" width="17" height="17">&nbsp상품관리</label>
				 <div class="acontent">
					 <br>&nbsp&nbsp&nbsp&nbsp상품 등록<br>
				     <br>&nbsp&nbsp&nbsp&nbsp상품 일괄등록<br>
				     <br>&nbsp&nbsp&nbsp&nbsp상품 조회/수정<br>
				     <br>&nbsp&nbsp&nbsp&nbsp카탈로그 매칭관리<br>
					 <br>&nbsp&nbsp&nbsp&nbsp상품 알림<br>
				 </div>
 		    </div>
			<div id="menu">
				<ul>
					<li><img src="image/free-icon-medal-748009.png" width="17" height="17">	가격관리</li>
					<li><img src="image/free-icon-delivery-truck-259569.png" width="20" height="20"> 주문/배송</li>
					<li><img src="image/free-icon-won-4789956.png" width="17" height="17"> 정산</li>
					<li><img src="image/free-icon-smile-2470083.png" width="17" height="17"> 고객관리</li>
					<li><img src="image/free-icon-online-shop-4933816.png" width="17" height="17"> 마이샵</li>
					<li><img src="image/free-icon-coupon-6737610.png" width="17" height="19"> 프로모션</li>
					<li><img src="image/free-icon-statistical-graphic-2931742.png" width="20" height="20"> 광고관리</li>
					<li><img src="image/free-icon-instagram-live-6537813.png" width="17" height="17"> 쿠팡 라이브</li>
					<li><img src="image/free-icon-stats-5997117.png" width="17" height="17"> 판매통계</li>
					<li><img src="image/free-icon-user-747376.png" width="17" height="17"> 판매자정보</li>
					<li><img src="image/free-icon-megaphone-3517265.png" width="17" height="17"> 공지사항</li>
					<li><img src="image/free-icon-flasher-1166573.png" width="17" height="17"> 윤리경영제보</li>
					<li><img src="image/free-icon-courier-3770311.png" width="17" height="17"> 로켓상품공급</li>
				</ul>
			</div>  
			
			
		</div>
			
			
		<div id="content">
			<h1>상품 등록</h1>
				<div class="box">
					<div class="namecontent">
						<h2>노출상품명<img src="image/dot.JPG" width="10" height="10"></h2>
							<div><label for="itemName"> </label> <input id="itemName"
							name="itemName" type="text" maxlength="100" value="노출상품명 입력(브랜드명 + 제품명)"  />
							</div>
						<div id="nameCaution">실제 판매 페이지에 노출되는 상품명입니다. 쿠팡 기준에 맞게 변경될 수 있습니다.</div>
						<div id="registerName">등록상품명(판매자관리용)</div>
						<div>쿠팡에 이미 등록된 상품 기본정보를 불러와 손쉽게 상품을 등록할 수 있습니다.</div>
					</div>
				</div>
				
				
				
				<div class="box">
					<div class= "category">
						<h2>카테고리<img src="image/dot.JPG" width="10" height="10"></h2>
							<div><label for="categorySearch"></label> <input type="search"
								id="categorySearch" name="categorySearch" value="카테고리명 입력">
							</div>
						<div>상품과 맞지 않는 카테고리에 등록할 경우, 적정 카테고리로 이동될 수 있습니다. 단, 카테고리
							수수료는 변경되지 않으니 유의해 주세요.</div>
					</div>
				</div>



				<div class="box">
					<div class= "option">
						<h2>옵션<img src="image/dot.JPG" width="10" height="10"></h2>
						
						<div class="section">
						
							<div class="s_Name">
								<div>옵션명 개수<img src="image/dot.JPG" width="7" height="7"></div>
								<div>옵션 입력<img src="image/dot.JPG" width="7" height="7"></div>
						
							</div>
							
							<div class="s_Content">
								<div>
									<label for="optionQuantity"> </label> <input type="number"
									id="optionQuantity" name="optionQuantity" style="width:200px" min="1" max="3" >
								</div>
		
								<div>
									<label for="optionName">옵션명 &nbsp </label> <input id="optionName"
									name="optionName" type="text" maxlength="3" style="width:150px" value= "예시 : 색상" />
		
									<label for="optionValue"> &nbsp &nbsp옵션값 &nbsp  </label> <input id="optionValue"
									name="optionValue" type="text" maxlength="100" style="width:250px" value= "예시 : 블랙, 화이트(,로 구분)" />
								</div>
								
							</div>
						</div>
					</div>
				</div>
				
				
				

				<div class="box">
					<div class="image">
						<h2>상품이미지<img src="image/dot.JPG" width="10" height="10"></h2>
	
						<div class="imageMain">
							<div id="mainImage">대표 이미지<img src="image/dot.JPG" width="7" height="7"></div>
	
								
							<form action="upload" id="uploadForm" method="post" enctype="multipart/form-data"> 
							<input type="file" name="mainImage" id="file1" style="display:none"/> 
								<br> </form>
								<div class="plusSection">
									<div class="button" onclick="onclick=document.all.file.click()"></div><br>
									<div class="notice"> <p>크기 : 최소 100px 이상 (권장크기: 500x500) </p><p>용량: 10MB이하, 파일 JPG, PNG</p>
									<input type="button"  value= "이미지 URL주소로 등록" onclick="이미지를 등록해주세요" /></div>
								</div>
						</div>
						
						<div class="imagePlus">
							<div id="plusImage">추가 이미지(0/9)</div>
						
							<form action="upload" id="uploadForm" method="post" enctype="multipart/form-data"> 
							<input type="file" name="plusImage" id="file2" style="display:none"/> 
							<br /> </form>
							
								<div class="plusSection">
									<div class="button" onclick="onclick=document.all.file.click()"></div><br>
									<div class="notice"> <p>크기 : 최소 100px 이상 (권장크기: 500x500) </p><p> 용량: 10MB이하, 파일 JPG, PNG</p>
									<input type="button"  value= "이미지 URL주소로 등록" onclick="이미지를 등록해주세요" /></div>
								</div><br>
						
						</div>
					</div>
				</div>
				
				

				<div class="box">
					<div class= "detail">
						<h2>상세설명<img src="image/dot.JPG" width="10" height="10"></h2>
							<input type="button"  value= "이미지 업로드" onclick="이미지를 등록해주세요" />
							<input type="button"  value= "에디터 작성" onclick="이미지를 등록해주세요" />
							<input type="button"  value= "HTML 작성" onclick="이미지를 등록해주세요" />
							<form action="upload" id="uploadForm" method="post" enctype="multipart/form-data"> 
							<input type="file" name="file" id="file" F="display:none"/> <br> 
							</form>
						<div class="detailPlus">
							<div class="button" onclick="onclick=document.all.file.click()"></div>
							<p>등록된 이미지가 없습니다.</p>
						</div>
					 	<p>*이미지 권장 크기 가로: 780px (최소 300px최대 3,000px) / 세로 30,000px 이하 / 10MB 이하의 JPG, PNG 파일</p>
					</div>
				</div>
				
				
				
				<div class="box">
					<div class= inspectionInfo">
						<h2>상품 검수 정보<img src="image/dot.JPG" width="10" height="10"></h2>
						<div class="section">
							<div class="s_Name">
								<div>브랜드<img src="image/dot.JPG" width="7" height="7"></div>
								<div>제조사</div>
								<div>인증 정보<img src="image/dot.JPG" width="7" height="7"></div>
								<div>인증 번호</div>
								<div>병행수입</div>
								<div>미성년자 구매<img src="image/dot.JPG" width="7" height="7"></div>
								<div>인당 최대구매수량</div>
								<div>판매 기간</div>
								<div>부가세<img src="image/dot.JPG" width="7" height="7"></div>
							</div>
							<div class="s_Content">
								<div>
								<label for="brand">  </label> <input id="brand" name="brand"
									type="text" maxlength="160" value="브랜드를 입력해주세요." style="width:400px"/>
								</div>
								<div>
								<label for="manufacturer">  </label> <input id="manufacturer"
									name="manufacturer" type="text" maxlength="100" style="width:400px" value="제조사를 입력해주세요. 제조사를 알 수 없는 경우 브랜드명을 입력해주세요." />
								</div>
								<div>
								 <input type="radio"
									name="certificationInfo" value="A" />인증·신고 대상 &nbsp<input
									type="radio" name="certificationInfo" value="detail" />상세페이지 별도&nbsp
								표기 <input type="radio" name="certificationInfo" value="N/A" />인증·신고
								대상 아님 </div>
								<div><label for="certificationNo">  </label> <input id="certificationNo" name="certificationNo"
									type="text" maxlength="25" style="width:400px" value= "인증번호"/>
								</div>
								<div>
								 <input type="radio" name="parallelImport" value="Y" />병행수입 &nbsp&nbsp
								 <input type="radio" name="parallelImport" value="N" />병행수입 아님
								</div>
								<div>
								 <input type="radio" name="available"
									value="P" />가능 &nbsp&nbsp<input type="radio" name="available" value="N/P" />불가능
								</div>
								<div>
								 <input type="radio" name="maxNo"
									value="set" />설정함 &nbsp&nbsp<input type="radio" name="maxNo"
									value="notSet" />설정안함
								</div>
								<div>
								 <input type="radio" name="salesPeriod"
									value="set" />설정함 &nbsp&nbsp<input type="radio" name="salesPeriod"
									value="notSet" />설정안함
								</div>
								<div>
								<input type="radio" name="VAT"
									value="taxation" />과세 &nbsp&nbsp <input type="radio" name="VAT"
									value="taxFree" />면세
								</div>
							</div>
						</div>
					</div>
				</div>
				
				
				

				<div class="box">
					<div id="requiredInfo">
						<h2>상품정보제공고시<img src="image/dot.JPG" width="10" height="10"></h2>
						<div class ="section">
							<div class="s_Name">
								<div>품명 및 모델명 </div>
								<div>인증/허가 사항</div>
								<div>제조국(원산지)</div>
								<div>제조자(수입자)</div>
								<div>소비자상담 관련 전화번호</div>
							</div>
							<div class="s_Content">
								<div>
								<label for="requiredName">  </label> <input class="requiredInfo" name="name" type="text" maxlength="100" value= "직접 입력해주세요." /> </div><div>
								<label for="permission">  </label>  <input class="requiredInfo" name="permission" type="text" value= "직접 입력해주세요."
									maxlength="100" /></div><div>
								<label for="country">  </label> 	<input class="requiredInfo" value= "직접 입력해주세요."
									name="country" type="text" maxlength="100" /></div><div>
								<label for="manufacturer">  </label> 	<input class="requiredInfo" name="manufacturer" value= "직접 입력해주세요." type="text" maxlength="100" /></div><div>
								<label for="tel">  </label> 	<input class="requiredInfo" name="tel" type="text" maxlength="100" value= "직접 입력해주세요." />
								</div>
							</div>
						</div>
					</div>
				</div>
				
				
				

				<div class="box">
					<div class= "delivery">
						<h2>배송<img src="image/dot.JPG" width="10" height="10"></h2>
							<div class="section">
								<div class="s_Name">
									<div>출고지<img src="image/dot.JPG" width="7" height="7"> </div>
									<div>제주/도서 산간 배송 여부 </div>
									<div>택배사<img src="image/dot.JPG" width="7" height="7"> </div>
									<div>배송방법 <img src="image/dot.JPG" width="7" height="7"></div>
									<div>묶음 배송 <img src="image/dot.JPG" width="7" height="7"></div>
									<div>배송비 종류 <img src="image/dot.JPG" width="7" height="7"></div>
									<div> 출고 소요일 <img src="image/dot.JPG" width="7" height="7"></div>
								</div>
								
								<div class="s_Content">
									<div>
									<label for="address">  </label> <input id="address"
										name="address" type="search" value= "출고지를 선택해주세요." />
									</div>
									<div>
									<label> </label> <input type="radio"
									name="deliveryP" value="P" />가능 &nbsp&nbsp <input type="radio"
									name="deliveryP" value="NP" />불가능
									</div>
									<div>
									<label for="deliveryCompany">  </label> <input id="deliveryCompany" name="deliveryCompany" type="text"
									maxlength="10" value= "택배사를 입력해주세요." />
									</div>
									<div>
									<label for="deliveryMethod">  </label> <input id="deliveryMethod" name="deliveryMethod" type="search"
									maxlength="6" value= "배송 방법을 선택해주세요." />
									</div>
									<div>
									<label> </label> <input type="radio" name="bundleDelivery"
									value="P" />가능 &nbsp&nbsp <input type="radio" name="bundleDelivery"
									value="NP" />불가능
									</div>
									<div>
									<label for="deliveryTypeFee"> </label><input id="deliveryTypeFee" name="deliveryTypeFee" type="search"
									maxlength="20" value= "배송비 종류를 선택해주세요." />
									</div>
									<div>
									<label for="deliveryDate"> </label><input id="deliveryDate" name="deliveryDate" type="number" />
									</div>
								</div>
						</div>
					</div>
				</div>
				
				
				
				<div class="box">
					<div class="return/exchange">
						<h2>반품/교환<img src="image/dot.JPG" width="10" height="10"></h2>
						<p>고객 사유로 인한 반품 시, 왕복 반품/배송비는 <strong>초도배송비 + 반품배송비의 합계인 7,000 원</strong> 이 청구됩니다.</p>
					
						<div class="section">
						<br>
							<div class="s_Name">
								<div>반품/교환지<img src="image/dot.JPG" width="7" height="7"> </div>
								<div>초도배송비(편도)<img src="image/dot.JPG" width="7" height="7"></div>
								<div>반품배송비(편도)<img src="image/dot.JPG" width="7" height="7"></div>
						
							</div>
							
							<div class="s_Content">
								<div>
								<label for="readdress">  </label> <input id="readdress"
								name="readdress" type="text" value= "반품/교환지를 입력해주세요." />
								</div>
								<div>
								<label for="firstDeliveryFee">  </label><input id="deliveryFee" name="firstDeliveryFee" type="number" />
								</div>
								<div>
								<label for="returnDeliveryFee">  </label><input id="deliveryFee" name="returnDeliveryFee" type="number" />
								</div>
							</div>
						</div>
					</div>
				</div>

			

	 	
		</div>
	</div>
		
			<div id="floatingBar" style='box-shadow:rgba(0, 0, 0, 0.3) 0px 19px 38px, rgba(0, 0, 0, 0.22) 0px 15px 12px'>
		 		
		 		<div class = "cleft">
		 		<button type="button" onclick="취소하였습니다.">취소</button>
		 		<button type="button" onclick="미리보기">미리보기</button>
		 		</div>
		 		
		 		<div class = "cright">
		 		<button type="button" onclick="판매 요청하였습니다.">판매 요청</button>
		 		<button type="button" onclick="임시 저장되었습니다.">임시 저장</button>
	 			</div>
 			
			</div>
	</div>
	
	
	
	<div id= "footer">
	
	        <section id="wingFooter">
	           <section id="wingFooterLogo">
	              <a href="https://www.coupang.com/"> <img src="image/coupang_logo.png" width="150" height="30" />
	              </a>
	        	</section>
	        
	        	<section id="wingFooterSns">
	             <ul id="snsList">
		          	  <li><a href=""><img src="image/1.JPG" width="35" height="30" /></a></li>
		              <li><a href=""><img src="image/2.JPG" width="35" height="30" /></a></li>
		              <li><a href=""><img src="image/3.JPG" width="35" height="30" /></a></li>
	             </ul>
	        	</section>
	        
	      	   <section id="footerInfo">
	               <p id="corpInfo" class="footerInfoDetail">쿠팡(주) | 대표이사 : 강한승,
	                  박대준 | 사업자 등록번호 : 120-88-00767 | 통신판매업신고 : 2017-서울송파-0680</p>
	               <p id="corpContact" class="footerInfoDetail">(05510) 서울특별시 송파구
	                  송파대로 570(신천동, 7-30) | Tel: 1600-9879 | Fax : 02-3441-7011</p>
	               <p id="corpRights" class="footerInfoDetail">© Coupang Corp. All
	                  rights reserved.</p>
	      	   </section>
	        </section>
	</div>
	
</body>

</html>
