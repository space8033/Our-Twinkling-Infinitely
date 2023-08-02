$(init);

function init() {
	loadTop();
	loadFooter();
	$(".sideimg").mouseover(mouseOnSideImage);
	$(".p").click(clickP);
	setTimeout(() => $(".sideimg").mouseover(mouseOnSideImage), 500);
	setTimeout(() => $(".p").click(clickP), 500);
	$("#p1").click(moveP1);
	$("#p2").click(moveP2);
	$("#p3").click(moveP3);
	$("#p4").click(moveP4);
}

function moveP1() {
	$(window).scrollTop(1200);
}

function moveP2() {
	$(window).scrollTop(10000);
}

function moveP3() {
	$(window).scrollTop(1000);
}

function moveP4() {
	$(window).scrollTop(1000);
}
function loadTop() {
	$.ajax({
		url:"detailView_content.jsp",
		method: "get",
		success: function(item) {
			let html="";
			item.forEach(function(data, index) {
				let price = data.price.toLocaleString("en");
				let coupangPrice = data.coupangPrice.toLocaleString("en");
				let wowPrice = data.wowPrice.toLocaleString("en");
				let point = Math.ceil((data.price * 0.05)).toLocaleString("en");
				let weekday = new Array(7);
				weekday[0] = "일";
				weekday[1] = "월";
				weekday[2] = "화";
				weekday[3] = "수";
				weekday[4] = "목";
				weekday[5] = "금";
				weekday[6] = "토";
				let today = new Date();
				let tomorrow = new Date(today.setDate(today.getDate() + 1));
				
				html +='<div id="lefttop" style="width: 50%;">';
				html +='<div id="sideimgs" class="mt-2">';
				for(let i = 0; i < data.images.length; i++) {
					html +='<div><img src="../common/image/coupang/' + data.images[i] + '.png" class="sideimg" name="' + i + '"></div>';
				}
				
				html +='</div>';
				html +='<div id="lefttopmainimg" class="my-2">';
				for(let i = 0; i < data.images.length; i++) {
					if(i == 0) {
						html +='	<img src="../common/image/coupang/' + data.images[i] + '.png" style="height: 400px; width: 400px; margin-left: 5px;" id="' + i +'" class="mainimg">';
						
					}
					html +='	<img src="../common/image/coupang/' + data.images[i] + '.png" style="height: 400px; width: 400px; margin-left: 5px;" id="' + i +'" class="mainimg d-none">';
				}
				
				html +='</div>';
				html +='<div>';
				html +='	<img src="../common/image/coupang/advts.png" style="height: 100px; width: 400px; margin-left: 5px;">';				
				html +='</div>';
				html +='</div>';
				html +='<div id="righttop" style="width: 50%;">';
				html +=' <img src="../common/image/coupang/recommand.png" style="height: 20px; width: 60px;">';
				html +='<br>';
				html +='<a href="#" id="company">' +  data.company + ' </a>';
				html +='			<div style="display: flex; flex-direction: row;">';
				html +='	<div>';
				html +='		<h4>' + data.title + '</h4>';
				html +='		<img src="../common/image/coupang/별점' + data.starCount + '.jpg" style="height: 20px; width: 80px; padding-top: 1px;">';
				html +='		<span id="star" onclick="#">' + data.reviewCount + '개 상품평</span>';
				html +='	</div>';
				html +='	<div class="d-flex">';
				html +='		<a href="#">';
				html +='			<img src="../common/image/coupang/heart.png" style="height: 50px; width: 50px;">';
				html +=	'	</a>';
				html +='		<a href="#">';
				html +='			<img src="../common/image/coupang/share.png" style="height: 50px; width: 50px;">';
				html +='		</a>';
				html +='	</div>';
				html +='</div>';
				html +='<hr class="hline">';
				
				html +='<div class="topmiddle">';
				html +='	<a style="font-size: 15px;">18%</a> <span style="color: gray; text-decoration: line-through;">' + price + '원</span> <br>';
				html +='	<span style="font-weight: bold; font-size: 20px;">' + coupangPrice + '원</span> <span>쿠팡판매가</span> <br>';
				html +='	<span style="font-weight: bold; font-size: 20px; color: #be1a00">' + wowPrice + '원</span> <span style="color: #be1a00">와우할인가</span>';
				if(data.isRocket == true) {
					html +='	<span><img src="../common/image/coupang/상품_로켓배송.jpg" style="height: 17px;"></span> <br>';				
				}
				html +='	<div class="lround">';
				html +='		<img src="../common/image/coupang/cash.png" class="lcash">';
				html +='		<span class="lspace">최대 ' + point + '원 적립  </span>';
				html +='	</div>';
				html +='</div>';
				html +='<hr class="hline">';
				
				html +='<div class="topmiddle">';
				html +='	<span style="font-weight: bold; font-size: 12px;">무료배송</span>';
				if(data.isRocket == true) {
					html +='	<span style="font-size: 12px;"> (로켓배송 상품 19,800원 이상 구매 시)</span> <br>';				
				}
				
				html +=	'<span style="font-weight: bold; font-size: 16px; color: #4c9657;">내일(' + weekday[tomorrow.getDay()] + ') </span>';
				html +=	'<span style="font-weight: bold; font-size: 15px; color: #4c9657;">' + (tomorrow.getMonth()+1) + '/' + (tomorrow.getDate()) + '</span>';
				html +=	'<span style="font-size: 13px;">(오후 9시 내 주문 시 / 서울⋅경기 기준) </span>';
				html +=	'<br>';
				html +='</div>';
				html +='<hr class="hline">';
				html +='<div>';
				html +='	<span style="font-size: 12px;">색상:</span>';
				html +='	<span style="font-size: 12px; font-weight: bold;">' + data.color + '</span>';
				html +='</div>';
				html +='<hr class="hline">	';
				html +='<div>';
				html +='	<img src="../common/image/coupang/bigcash.png" style="height: 30px; width: 30px; float: left;">';
				html +='	<div style="padding:5px; float: left;">캐시적립 혜택 </div> ';
				html +='	<div style="padding:5px;">| 최대 <span style="font-weight: bold;">' + point + '</span>원 적립</div>';
				html +='</div>';
				
				html +='<div id=detailbox>';
				html +='	<div class="boxin">쿠페이 머니 결제 시 1% 적립 </div>';
				
				html +=	'<div class="boxin">[로켓와우 + 쿠페이 계좌이체] 결제 시 2% 적립</div>';
				
				html +='	<div class="boxin">[로켓와우 + 쿠페이 머니] 결제 시 4% 추가적립 <span style="font-weight:bold">2807</span>일 남음</div>';
				
				html +=	'<div id="rocketwow"> <a href="#">로켓와우 무료체험 신청하기</a> </div>';
				html +='</div>';
				html +='<hr class="hline">	';
				
				html +='<div style="margin: 10px;">';
				html +=	'<input type="radio" id="price1" name="price" checked="checked" >';
				html +=	'<label for="price1"><span style="font-weight: bold">' + coupangPrice + '원</span> | 쿠팡판매가</label> <br>';
				html +='		<input type="radio" id="price2" name="price">';
				html +='		<label for="price2" style="color: #be1a00;"><span style="font-weight: bold">' + wowPrice + '원</span> | 와우회원가</label>';
				html +='</div>';
				html +='<hr class="hline">';
				html +='<div style="display:flex; flex-direction:row">';
				html +='	<input type="number" id=quantity value="1" min="1" style="height: 52px;">';
				html +='	<button name="cart" type="submit" id="cart">장바구니 담기</button>';
				html +='	<button name="buy" type="submit" id="buynow">바로구매＞</button>';
				html +='</div>';
				html +='<br/>';
				html +='<div>';
				html +='	<div id="details">';
				html +='		<div>● 조명 무선여부: 무선</div> ';
				html +='		<div>● 전구 포함여부: 전구일체형</div>';
				html +='		<div>● LED 여부: LED 발광</div>';
				html +='		<div>● 버튼방식: On/Off버튼식</div>';
				html +='		<div>● 구성품: 본체 + 타입C USB 케이블</div>';
				html +='		<div>● 쿠팡상품번호: 6761685642 - 15847736251</div>';
				html +='	</div>';
				html +='	<br/>';
				html +='</div>';
				
			});
			
			$("#top").html(html);
		},
		error: function(error) {
			console.log(error.message);
		}
	});
	
}

function mouseOnSideImage() {
	$(".sideimg").removeClass("selectedSideImg");
	$(".mainimg").addClass("d-none");
	$(event.target).addClass("selectedSideImg");
	
	$("#" + $(event.target).attr("name")).removeClass("d-none");
}

function clickP() {
	$(".p").removeClass("selectedP");
	$(event.target).addClass("selectedP");
}

function loadFooter() {
	$("#footer").load("coupangFooter.jsp");
}
