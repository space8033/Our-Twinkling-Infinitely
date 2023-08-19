<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script src="${pageContext.request.contextPath}/resources/js/orderList.js"></script>

<div id="#breakDown">

</div>

<div id="deliveryNotify" class="my-5 container">
	<div id="notifyTop " class="mb-3">
		<div class="d-flex mb-3">
			<div style="width: 80%; font-weight: bold; color: #99918e; padding-top: 5px;">배송상품 주문상태 안내</div>
			<div style="width: 20%; font-size: 12px; padding-top: 5px; ">
				<a id="deleteUnderline" style="color: rgb(100, 139, 214);" href="#">
					자세한 내용 더보기>
				</a>
			</div>
		</div>
		<div class="px-4">
			<img src="//img1a.coupangcdn.com/image/my/desktop/order-status.png" width="96%">
		</div>
		<div class="d-flex pr-4">
			<div style="width: 20%; font-size: 10px; text-align: center;">
				주문,결제,확인 <br>
				이 완료되었습니다.
			</div>
			<div style="width: 20%; font-size: 10px; text-align: center;">
				판매자가 발송할 <br>
				상품을 준비중입니다.
			</div>
			<div style="width: 20%; font-size: 10px; text-align: center;">
				상품준비가 완료되어 <br>
				곧 배송될 예정입니다.
			</div>
			<div style="width: 20%; font-size: 10px; text-align: center;">
				상품이 고객님께 <br>
				배송중입니다.
			</div>
			<div style="width: 20%; font-size: 10px; text-align: center;">
				상품이 주문자에게<br>
				전달완료되었습니다
			</div>
		</div>
	</div>
	<div id="notifyBottom" class="px-4">
		<div class="pt-3"> 
			<img src="../common/image/coupang/w경고.png" width="17" height="17">
			<span class="text-danger font-weight-bold" style="font-size: 13px; vertical-align: bottom;">취소/반품/교환 신청</span>
			<span style="font-size: 12px; vertical-align: bottom; font-weight:bold; color: #99918e;">전 확인해주세요!</span>
		</div>
		<div class="my-3"> 
			<span style="font-size: 12px font-weight:bold; color: #99918e;">취소</span> <br>
			<span style="font-size: 10px; color: #99918e;">- 여행/레저/숙박 상품은 취소 시 수수료가 발생할 수 있으며,</span> <br>
			<span style="font-size: 10px; color: #99918e;"> 취소수수료를 확인하여 2일 이내(주말,공휴일 제외) 처리결과를 문자로 안내해드립니다.(당일 접수 기준, 마감시간 오후 4시)</span> <br>
			<span style="font-size: 10px; color: #99918e;">- 문화 상품은 사용 전날 24시까지 취소 신청 시 취소수수료가 발생되지 않습니다.</span><br>
			
		</div>
		<div class="my-3"> 
			<span style="font-size: 12px font-weight:bold; color: #99918e;">반품</span> <br>
			<span style="font-size: 10px; color: #99918e;">- 상품 수령 후 7일 이내 신청하여 주세요.</span> <br>
			<span style="font-size: 10px; color: #99918e;">- 상품이 출고된 이후에는 배송 완료 후, 반품 상품을 회수합니다.</span> <br>
			<span style="font-size: 10px; color: #99918e;">- 설치상품/주문제작/해외배송/신선냉동 상품 등은 고객센터에서만 반품 신청이 가능합니다.</span>
			<span><a href="#" style="font-size: 10px; color: black; text-decoration: none;">
				1:1 문의하기>
			</a></span>
		</div>
		<div class="mt-3"> 
			<span style="font-size: 12px font-weight:bold; color: #99918e;">교환</span> <br>
			<span style="font-size: 10px; color: #99918e;">- 상품의 교환 신청은 고객센터로 문의하여 주세요.</span>
			<span><a href="#" style="font-size: 10px; color: black; text-decoration: none;">
					1:1 문의하기>
				</a></span>
			</div>
		</div>
</div>