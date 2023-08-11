<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="icon" href="/html_css_javascript/favicon.ico"
		type="image/x-icon">
		<title>Insert title here</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/orderPay_css.css">
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/orderPay.js"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css"/>
	</head>
	<body>
		<div id="wrapper">
			<!-- 헤더 -->
			<section class="d-flex-column mx-auto " style="width: 1250px;">
				<header class="border-h">
					<div class="head">
						<img src="//image7.coupangcdn.com/image/coupang/common/logo_coupang_w350.png" width="174" height="41" alt="쿠팡">
					</div>
				</header>
			</section>
			<hr>
			<!-- 바디 -->
			<section class="d-flex-column mx-auto " style="width: 1250px;">
				<!-- 페이지창 -->
				<div class="d-flex justify-content-between" style="border-bottom: 3px solid #777">
					<h3>주문/결제</h3>
					<span class="align-self-center"> <span style="color: #346AFF">주문결제></span>주문완료
					</span>
				</div>
				<form onsubmit="return false;">
					<!-- 구매자 정보 -->
					<div class="">
						<h2>구매자정보</h2>
						<table class="consumerInfo">
							<tr>
								<th>이름</th>
								<td>
									 ${orderUser.users_name} 
									
								</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td>${orderUser.users_email}</td>
							</tr>
							<tr>
								<th>휴대폰 번호</th>
								<td><input id="tel" type="tel" name="tel"
									value="${orderUser.users_phone}" style="height:28px; margin-top:10px;">
									<button id="telBtn" type="button" style="height:28px;">수정</button>
									<span class="mx-3" style="color:#9A9A9A;">쿠폰/티켓 정보는 구매한 분의 번호로 전송됩니다.</span>
									<div id="telErr1" class="errMsg" style="color: red;">전화번호
										형식이 올바르지 않습니다.</div>
									<div id="telErr2" class="errMsg" style="color: red;">새로운 번호를 입력해 주세요.</div>
									<p style="margin-top:10px;">* 인증 번호를 못 받았다면, 1577-7011 번호 차단 및 스팸 설정을 확인해 주세요.</p>
									
									<p id="certiNote" style="color: #219b3a;">입력하신 휴대폰 번호로 인증번호가 발송 되었습니다.</p>
									<input id="certiNum" style="border: 1px solid #219b3a;" type="number" name="certiNum">
									<button id="certiBtn" type="button">인증완료</button>
								</td>
							</tr>
						</table>
					</div>
	
					<!-- 받는사람 정보 -->

					<div>
						<div class="d-flex">
							<h2>받는사람정보</h2> 
							<span style="margin-left: 10px;"><button id="transAddress" onclick="openAdress()"> 배송지변경</button></span>
						</div>
						<table class="receiverInfo">
							<tr>
								<th>이름</th>
								<td>김시온
									<span id="border1">기본 배송지</span> 
									<span id="border2">로켓프레시 가능</span> 
									<span id="border3">로켓와우가능</span>
								</td>
							</tr>
							<tr>
								<th>배송주소</th>
								<td>경기도 하남시 미사강변남로125 102동 408호</td>
							</tr>
							<tr>
								<th>연락처</th>
								<td>010-4504-1219</td>
							</tr>
							<tr>
								<th><img src="//img1a.coupangcdn.com/image/www/common/icon_arrow.gif"> 배송 요청사항</th>
								<td>문 앞
									<button onclick="openRequest()">변경</button>
								</td>
							</tr>
						</table>
					</div>
					
					<!--배송 n건중 n -->
					<div class="">
						<h2>배송 1건 중 1</h2>
						<div id="orderplus">
						 	<table class="nofn" style="font-family: Dotum, sans-serif;">
								<tr>
									<th colspan='3' class="text-left" style="font-size: 16px; color: #00891A;">
										내일(화)7/12 도착 보장
									</th>
								</tr>
								<tr>
									<td style="border-right: white;">
										<span class="nofnc" style="font-size: 16px;">
											LEXON MINA 렉슨 미나 S 미니 무드등 인테리어 조명
												- LH60, 실버 - LH60MAP
										</span>
									</td>
									<td style="border-left: white; border-right: white;">	
										<span>수량 1개/무료배송</span>
									</td>		 
									<td style="border-left: white;">		
										<img
											data-bundle-info--rocket-img=""
											class="bundle-info__delivery-type__icon bundle-info__retail__icon__pc"
											src="//img1a.coupangcdn.com/image/cmg/icon/ios/logo_rocket_large@3x.png"
											height="16" alt="로켓배송 상품"
										/>	
									</td>
								</tr>
							</table> 
						</div>
					</div>
					<!-- 결제 정보 -->
					<div id="payInfo" class="">
						<h2>결제 정보</h2>
						<table class="payInfomation">
							<tr>
								<th>총상품가격</th>
								<td><span id="totalPrice">39,900</span>원</td>
							</tr>
							<tr>
								<th>할인쿠폰</th>
								<td  style="margin:0px; padding:0px;">
									<div style=" padding-top:10px; padding-left:16px; color: red; padding-bottom:10px;">
										<span style= "width:155px; display:inline-block;">
											-<span id="discount" ">0</span>원
										</span>
										<button id="couponSelect" >할인쿠폰선택</button>
									</div>
									<div id="dicountRow" style="background-color: #f8f8f8; padding-bottom:16px; padding-top:10px;">
										<input id="couponUse" type="checkbox" name="Use"  style="margin-left: 170px;"/> 
										<span id="couponDiscount"> 2,000</span>원
										<span style="margin-left: 20px;">30000원 이상  장바구니</span>
									</div> 
								</td>
							</tr>
							<tr>
								<th>배송비</th>
								<td><span id="delFee">0</span>원</td>
							</tr>
							<tr>
								<th>쿠팡캐시</th>
								<td style="margin:0px; padding:0px;">
									<div style=" padding-top:10px; padding-left:16px; padding-bottom:10px;">
										<span style="display:inline-block; width:155px;">
											<span id ="balance"> 0 </span>
											<span>원</span>
										</span>
										<span style="padding-top:20px;">
											보유 : <span id="cuBal">302</span>원
										</span>
										<button id="cuCashInput">쿠팡캐시입력</button>
									</div>
								
									<div id="cuCashrow" style="background-color: #f8f8f8; padding-bottom:16px; padding-top:10px;">
									 	
										<input id="cuCash" type="number" value="0" placeholder="0" name="cuCash" style="margin-left: 170px;"/>원 | 
										<input id="allUse" type="checkbox" name="allUse"/> 모두사용
										<div>
											<button id="cuCashApply" style="margin-left: 170px; margin-top:10px;">쿠팡캐시적용</button>
										</div>
										<div id="cashOver" class="choice-error" style="color: red; padding-left: 17px; margin-left: 170px; display: none;">
											사용가능한 캐시를 초과 입력하였습니다.
										</div>
									</div> 
								</td>
							</tr>	
							
							<tr>
								<th>총결제금액</th>
								<td>
									<span id="price">34,900</span>원
									<span id="expectPoint" style="margin-left: 100px; display=none;">
										캐시적립 예정 : <span id="point">399</span>원
									</span>		
								</td>
							</tr>
							<tr>
								<th>결제 방법</th>
								<td>
									<div class="payMethod">
										<div id="L_account-transfer" class="payMethod-arrow">
											<label>
												<input id="account-transfer" class="cash"
													type="radio" name="pay-method" value="계좌이체" checked="checked"/> 계좌이체 
											</label>
										</div>
											
										<div id="L_coupay-money" >
											<label>
												<input id="coupay-money" class="cash" type="radio" name="pay-method" value="쿠페이머니"/> 쿠페이 머니 
												<img
													class="rpay-badge rpay-icon-2percent"
													src="//image7.coupangcdn.com/image/rocketpay/order/icon_max_cashback_v2.png"
													width="66" height="14" alt="최대 캐시적립"
												/>
											</label>
										</div>
										
										<div id="L_credit-card">
											<label>
												<input id="credit-card" class="no-cash" type="radio" name="pay-method" value="신용/체크카드"> 신용/체크카드  
											</label>
										</div>
										
										<div id="L_corporation-card">
											<label>
												<input id="corporation-card" class="no-cash" type="radio" name="pay-method" value="법인카드"> 법인카드  
											</label>
										</div>
										
										<div id="L_phone">
											<label>
												<input id="phone" type="radio" class="no-cash" name="pay-method" value="휴대폰"> 휴대폰  
											</label>
										</div>
										
										<div id="L_deposit-without-bankbook">
											<label>
												<input id="deposit-without-bankbook" class="cash" type="radio" name="pay-method" value="무통장입금"> 무통장입금(가상계좌)  
											</label>
										</div>
									</div>		
											
											
									<!-- 계좌이체 선택시 옵션 -->
									<div id="account-transfer-option" class="pay_select">
										<div>
											<label>
												<span style="padding-right:35px;">은행선택</span> 
												<select id="account-transfer-choice-bank">
													<option value="none">선택</option>
													<option value="카카오뱅크">카카오뱅크</option>
													<option value="농협은행">농협은행</option>
													<option value="국민은행">국민은행</option>
												</select>
											</label>
										</div>
											
										<div id="account-transfer-no-choice" class="choice-error" style="color: red; padding-left: 17px;">
											은행을 선택해주세요
										</div>		
									</div> 
									
									<!--  쿠페이 머니 선택 시 옵션 -->
									<div id="coupay-money-option" class="pay_select">
										<div>
											<label>잔액</label> 
											<span style="padding-left:70px; font-weight:bold">0원</span>
										</div>
										<div style="border-top: 1px solid #e4e4e4; padding-top: 10px;">
											* 잔액이 부족할 경우, 결제 진행 시에 충전됩니다.
										</div>
									</div> 
									
									<!-- 신용/체크카드 선택 시 옵션 -->
									<div id="credit-card-option" class="pay_select">
										<div>
											<label>
												<span style="padding-right:35px;">카드선택</span>  
												<select>
													<option value="KB국민카드">KB국민카드</option>
													<option value="롯데카드">롯데카드</option>
													<option value="신한카드">신한카드</option>
												</select>
											</label>
											
											 <span style="padding-right:35px;"></span> 
											 <label style="font-weight: lighter">
												 <input type="checkbox" checked="checked"> 김시온님 명의 카드
											 </label>	
										</div>
										<div style="border-top: 1px solid #e4e4e4; padding-top: 10px;">
											<label>
												<span style="padding-right:35px;">할부기간 </span> 
												<span style="padding-right:35px;"> 
													<select id="installment-period">
															<option value="pay-in-full">일시불</option>
															<option>2개월(무이자)</option>
															<option>3개월(무이자)</option>
															<option>6개월(부분무이자)</option>
															<option>12개월(부분무이자)</option>
															<option>24개월(부분무이자)</option>
													</select>
												</span>
											</label>
											<span id="pay-in-full-note"> *할부는 50,000원 이상만 가능합니다.</span>
											<span id="interest-free-note"> *무이자 할부 적용 제외 대상 : 법인, 개인사업자, 체크, 기프트, 선불,하이브리드 카드</span>
										</div>
									</div> 
									
									<!-- 법인카드 선택시 옵션-->
									<div id="corporation-card-option" class="pay_select">
										<div>
											<label>
												 <span style="padding-right:35px;">카드선택 </span> 
												 <span> 
													 <select id = "coporation-card-choice">
													 		<option value="none">선택</option>
															<option>KB국민카드</option>
															<option>롯데카드</option>
															<option>신한카드</option>
													</select>
												</span>
											</label>
										</div>
										<div id="coporation-card-no-choice" class="choice-error" style="color: red; padding-left: 17px;">
											카드종류를 선택해주세요
										</div>
										<div style="border-top: 1px solid #e4e4e4; padding-top: 10px;">
											<label>
												 <span style="padding-right:35px;">할부기간  </span> 
												 <span> 
													 <select disabled="disabled">
															<option>일시불</option>
													</select>
												</span>
											</label> 
											<span>법인카드는 일시불 결제만 가능합니다.</span>
										</div>
									</div> 
									<!-- 휴대폰 결제 선택 시 옵션 -->
									<div id="phone-option" class="pay_select">
										<div>
											<label> 
												<span style="padding-right:35px;">통신사 종류 </span> 
												<select id="mobile-corp">
														<option value="none">선택</option>
														<option value="SKT">SKT</option>
														<option value="KT">KT</option>
														<option value="헬로모바일">헬로모바일</option>
														<option value="KCT">KCT</option>
												</select>
											</label>
										</div>
										
										<div id="mobile-corp-no-choice"  class="choice-error" style="color: red; padding-left: 17px;">
											통신사 정보를 추가해주세요.
										</div>
									</div> 
									<!-- 무통장입금(가상계좌) 선택 시 옵션 -->
									<div id="deposit-without-bankbook-option" class="pay_select">
										<div>
											<label> 
												<span style="padding-right:35px;">입금은행</span> 
												<select id="bank-choice">
														<option value="none">선택</option>
														<option>농협은행</option>
														<option>국민은행</option>
														<option>신한은행</option>
												</select>
											</label>
										</div>
										<div id="bank-no-choice" class="choice-error" style="color: red; padding-left: 17px;">
											은행을 선택해주세요
										</div>
										<div style="border-top: 1px solid #e4e4e4; padding-top: 10px;">
											<span style="padding-right:35px;">입금기한</span>
											<span>2023년 07월 12일 10시 00분까지</span>
										</div>
											
										<div>
											* 현금으로 결제한 모든 금액은 우리은행과 채무지급보증계약을 체결하여 고객님의 안전거래를 보장하고 있습니다.
										</div>
									</div>
											
									<div id="deposit-without-bankbook-option-caution">
										<span>무통장 입금 시 유의사항</span>
										<ul>
											<li>입금완료 후 상품품절로 인해 자동취소된 상품은 환불 처리해 드립니다.</li>
											<li>무통장입금 결제 시 부분취소가 불가하며 전체취소 후 다시 주문하시기 바랍니다.</li>
											<li>은행 이체 수수료가 발생될 수 있습니다. 입금시 수수료를 확인해주세요.</li>
										</ul>
									</div>	
											
									<div id="discount-info">
										카드할인 및 무이자 할부 안내
									</div>
									<div id="selectPay" style="margin-top:10px;">
										<label style="cursor: pointer;">
											<input type="checkbox" checked="checked"/> 
											선택한 결제수단 및 휴대폰번호로 향후 결제 이용에 동의합니다.(선택)
										</label>
									</div>
									<div  id="basicPay"  style="margin-top:10px;">
										<label style="cursor: pointer;">
											<input type="checkbox" checked="checked"> 
											기본 결제 수단으로 사용
										</label>
									</div>
								</td>
							</tr>
						</table>
					</div>
	
					<!-- 현금영수증 -->
					<div id="cash-receipt" class="">
						<h2>현금영수증</h2>
						<div id="cash-border">
							<div>
								<label>
									<input id="cash-receipt-application" type="checkbox" style="height: 17px; width: 17px;"> 
									현금 영수증 신청
								</label>
							</div>
							
							<div id="cash-receipt-type">
								<div style="border-top: 1px solid #ddd; padding-top: 10px;">
									<label style="padding-right: 20px;">
										<input id="income-deduction" type="radio"
											name="cash-receipt-type" value="income-deduction"
											checked="checked"/>
										소득 공제
									</label> 
										
									<label>
										<input id="proof-of-expenditure" type="radio" name="cash-receipt-type" value="proof-of-expenditure"/>
										지출 증빙
									</label>
								</div>
								<span>
									<select id="income-deduction-option">
										<option value="pnum">휴대폰번호</option>
										<option value="cash-card">현금영수증카드</option>
									</select> 
									
									<select id="proof-of-expenditure-option">
										<option value="cash-card">현금영수증카드</option>
										<option value="biznum">사업자번호</option>
									</select>
									<input id="numErr1" type="text" placeholder="휴대폰 번호만 입력해 주세요." name="휴대폰번호"/>
									<input id="numErr2" type="text" placeholder="현금영수증카드만 입력해 주세요." name="현금영수증카드"/>
									<input id="numErr3" type="text" placeholder="사업자번호만 입력해 주세요." name="사업자번호"/>
									
								</span>	
								<div id="biznumErr" style="color: red; padding-left: 17px;">
									<img class="cash-receipt__validation-message-icon" 
										src="//img1a.coupangcdn.com/image/coupang/subscription/cart/pc/ico/ico_notice_20161024.png" 
										width="12" height="12" style="margin-bottom:5px;"
									/>
									올바른 사업자번호를 입력해 주세요.
								</div>
								<div id="telnumErr" style="color: red; padding-left: 17px;">
									<img class="cash-receipt__validation-message-icon" 
										src="//img1a.coupangcdn.com/image/coupang/subscription/cart/pc/ico/ico_notice_20161024.png" 
										width="12" height="12" style="margin-bottom:5px;"
									/>
									올바른 휴대폰번호를 입력해 주세요.
								</div>
								<div id="cashnumErr" style="color: red; padding-left: 17px;">
									<img class="cash-receipt__validation-message-icon" 
										src="//img1a.coupangcdn.com/image/coupang/subscription/cart/pc/ico/ico_notice_20161024.png" 
										width="12" height="12" style="margin-bottom:5px;"
									/>
									올바른 현금영수증 카드를 입력해 주세요.
								</div>
							</div>
							
							<div  style="font-size: 12px; font-family: sans-serif; color: #555; margin-top: 10px;">
								* 해외구매대행 / 로켓직구 구매금액은 현금영수증 발행이 제외됩니다.
							</div>
							<div  style="font-size: 12px; font-family: sans-serif; color: #555;">
								* 쿠팡캐시 결제시 현금성 적립액에 한하여 현금영수증이 발행됩니다.
							</div>
						</div>
					</div>
	
					<!-- 주문 내용 확인, 동의 메시지 -->
					<div class="text-center" id="agreeMessage">
						위 주문 내용을 확인 하였으며, 회원 본인은 개인정보 이용 및 제공(해외직구의 경우 국외제공) 및 결제에 동의합니다.
					</div>
					<div class="text-center" id="payButton">
						<button class="payb" style="border: none; box-shadow: 0 0 0">
								<div>
									<img id = "maxCash"
									style="cursor: pointer; font-size: 11px; width: 96px;"
									class="paymentRocketpayBtn__tooltip-2percent-cashback"
									src="//image10.coupangcdn.com/image/rocketpay/checkout/ico_cashback_tip.png"
									width="96" height="36" alt="최대 캐시적립"/> 
								</div>
								<div>
									<img
									src="//image7.coupangcdn.com/image/rocketpay/checkout/btn_coupay_payment.png"
									width="250" height="60" alt="쿠페이 머니 결제"/>
								</div>
						</button>
						<button class="payb" style=" border: none; box-shadow: 0 0 0">
							<img
								src="//image7.coupangcdn.com/image/rocketpay-order-image/pc/btn_payment.gif"
								width="260" height="60" alt="결제하기"/>
						</button>
					</div>
				</form>
			</section>
			
<%@ include file="/WEB-INF/views/common/footer.jsp" %> 