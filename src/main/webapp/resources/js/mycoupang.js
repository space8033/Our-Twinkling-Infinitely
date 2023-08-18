$(init)

function init() {
	makeOrderCard();
	loadFooter();
	var box = $(".boxes");
	box.click(onClickBox);
	var classifyMine = $(".classifyMine");
	classifyMine.click(onClickMine);
	
}

function onClickBox() {
	//박스 초기화
	$(".boxes").each((index, el) =>
		$(el).removeClass("clickedBox")
	)
	
	$(event.target).addClass("clickedBox");
}

function loadFooter() {
	$("#footer").load("${pageContext.request.contextPath}/WEB-INF/views/common/coupangFooter.jsp");
}

function onClickMine() {
	$("#breakDown").empty();

	$(".classifyMine").each((index, el) =>
		$(el).removeClass("selectedClass")
	)
	
	$(event.target).addClass("selectedClass");
		
	if($(event.target).val() === $("#all").val()) {
		makeOrderCard();
	}else if($(event.target).val() === $("#deliver").val()) {
		makeOrderCard();		
	}else if($(event.target).val() === $("#travel").val()) {
		noContent();
	}else if($(event.target).val() === $("#ticket").val()) {
		noContent();
	}
}

function makeOrderCard() {
	$.ajax({
		url:"${pageContext.request.contextPath}/resources/json/mycoupangContent.json",
		method: "get",
		success: function(data) {
			let html="";
			let date="";
		
			data.forEach(function(item, index) {
				let price = item.price.toLocaleString('ko-KR');
				let made = makeDate(item.date);
				if(item.date != date) {
					date = item.date;
					
					if(index !== 0) {
						html += '</div>';
						html += '<div class="classifyByDate">'
						html += 	'<div class="d-flex">'
						html += 		'<div style="width:70%; font-weight:bold; font-size: 20px; padding-left:12px;">' + item.date + ' 주문</div>'
						html += 		'<div style="width:30%; text-align: right;"><a href="#" id="seeDetail">주문 상세보기> </a></div>'
						html += 	'</div>'
						html +=	 '<div class="orderCard my-3 d-flex">';
						html += 	'<div class="orderCardLeft pt-2 pl-4">';
						html += 		'<div class="upperCard d-flex">';
						html +=				'<div style="width: 20%; font-size: 18px; font-weight: bold;">배송 완료 <span style="font-weight: bold; color: rgb(206, 206, 206);">·</span></div>';
						html +=				'<div class="ml-1" style="width: 70%; color: #108209; font-size: 18px;">' + made +'도착</div>';
						html +=				'<div class="moreIcon" style="width: 10%; text-align: right; padding-right: 15px; color: rgb(180, 180, 180);"> ⠇</div>';
						html +=			'</div>';
						html +=			'<div class="lowerCard d-flex">';
						html +=				'<div class="productImg my-3" style="width: 15%;">';
						html +=					'<img src="../common/image/coupang/' + item.image + '" width="100%" height="100%">';
						html +=				'</div>';
						html +=				'<div class="productDetail ml-4 mr-3" style="width: 85%;">';
						html +=					'<div class="detailUpper mt-2 mb-3 mr-2">';
						html +=						'<img src="//image10.coupangcdn.com/image/badges/rocket/rocket_logo.png" width="50" height="15">';
						html +=						'<span style="margin-left: 5px; vertical-align: middle; font-size: 15px;">' + item.title + '</span>';
						html +=					'</div>';
						html +=					'<div class="detailDown mb-3 d-flex">';
						html +=						'<div style="text-align: left; width: 65%; color: #978b75">';
						html +=							price +'원 · ' + item.quantity + '개';
						html +=						'</div>';
						html +=						'<div>';
						html +=							'<button style="background-color: white; border: 1px solid rgb(196, 205, 213); border-radius: 3px;">장바구니 담기</button>';
						html +=						'</div>';
						html +=					'</div>';
						html +=				'</div>';
						html +=			'</div>';
						html +=		'</div>';
						html +=		'<div class="orderCardRight d-flex">';
						html +=			'<button class="cardButton">배송조회</button>';
						html +=			'<button class="cardButton">교환, 반품 신청</button>';
						html +=			'<button class="cardButton">리뷰 작성하기</button>';
						html +=		'</div>';
						html +=	'</div>';
					} else {
							html += '<div class="classifyByDate">'
							html += 	'<div class="d-flex">'
							html += 		'<div style="width:70%; font-weight:bold; font-size: 20px; padding-left:12px;">' + item.date + ' 주문</div>'
							html += 		'<div style="width:30%; text-align: right;"><a href="#" id="seeDetail">주문 상세보기> </a></div>'
							html += 	'</div>'
							html +=	 '<div class="orderCard my-3 d-flex">';
							html += 	'<div class="orderCardLeft pt-2 pl-4">';
							html += 		'<div class="upperCard d-flex">';
							html +=				'<div style="width: 20%; font-size: 18px; font-weight: bold;">배송 완료 <span style="font-weight: bold; color: rgb(206, 206, 206);">·</span></div>';
							html +=				'<div class="ml-1" style="width: 70%; color: #108209; font-size: 18px;">' + made +'도착</div>';
							html +=				'<div class="moreIcon" style="width: 10%; text-align: right; padding-right: 15px; color: rgb(180, 180, 180);"> ⠇</div>';
							html +=			'</div>';
							html +=			'<div class="lowerCard d-flex">';
							html +=				'<div class="productImg my-3" style="width: 15%;">';
							html +=					'<img src="../common/image/coupang/' + item.image + '" width="100%" height="100%">';
							html +=				'</div>';
							html +=				'<div class="productDetail ml-4 mr-3" style="width: 85%;">';
							html +=					'<div class="detailUpper mt-2 mb-3 mr-2">';
							html +=						'<img src="//image10.coupangcdn.com/image/badges/rocket/rocket_logo.png" width="50" height="15">';
							html +=						'<span style="margin-left: 5px; vertical-align: middle; font-size: 15px;">' + item.title + '</span>';
							html +=					'</div>';
							html +=					'<div class="detailDown mb-3 d-flex">';
							html +=						'<div style="text-align: left; width: 65%; color: #978b75">';
							html +=							price +'원 · ' + item.quantity + '개';
							html +=						'</div>';
							html +=						'<div>';
							html +=							'<button style="background-color: white; border: 1px solid rgb(196, 205, 213); border-radius: 3px;">장바구니 담기</button>';
							html +=						'</div>';
							html +=					'</div>';
							html +=				'</div>';
							html +=			'</div>';
							html +=		'</div>';
							html +=		'<div class="orderCardRight d-flex">';
							html +=			'<button class="cardButton">배송조회</button>';
							html +=			'<button class="cardButton">교환, 반품 신청</button>';
							html +=			'<button class="cardButton">리뷰 작성하기</button>';
							html +=		'</div>';
							html +=	'</div>';
					}
				}else {
					html +=	 '<div class="orderCard my-3 d-flex">';
					html += 	'<div class="orderCardLeft pt-2 pl-4">';
					html += 		'<div class="upperCard d-flex">';
					html +=				'<div style="width: 20%; font-size: 18px; font-weight: bold;">배송 완료 <span style="font-weight: bold; color: rgb(206, 206, 206);">·</span></div>';
					html +=				'<div class="ml-1" style="width: 70%; color: #108209; font-size: 18px;">' + made +'도착</div>';
					html +=				'<div class="moreIcon" style="width: 10%; text-align: right; padding-right: 15px; color: rgb(180, 180, 180);"> ⠇</div>';
					html +=			'</div>';
					html +=			'<div class="lowerCard d-flex">';
					html +=				'<div class="productImg my-3" style="width: 15%;">';
					html +=					'<img src="../common/image/coupang/' + item.image + '" width="100%" height="100%">';
					html +=				'</div>';
					html +=				'<div class="productDetail ml-4 mr-3" style="width: 85%;">';
					html +=					'<div class="detailUpper mt-2 mb-3 mr-2">';
					html +=						'<img src="//image10.coupangcdn.com/image/badges/rocket/rocket_logo.png" width="50" height="15">';
					html +=						'<span style="margin-left: 5px; vertical-align: middle; font-size: 15px;">' + item.title + '</span>';
					html +=					'</div>';
					html +=					'<div class="detailDown mb-3 d-flex">';
					html +=						'<div style="text-align: left; width: 65%; color: #978b75">';
					html +=							price +'원 · ' + item.quantity + '개';
					html +=						'</div>';
					html +=						'<div>';
					html +=							'<button style="background-color: white; border: 1px solid rgb(196, 205, 213); border-radius: 3px;">장바구니 담기</button>';
					html +=						'</div>';
					html +=					'</div>';
					html +=				'</div>';
					html +=			'</div>';
					html +=		'</div>';
					html +=		'<div class="orderCardRight d-flex">';
					html +=			'<button class="cardButton">배송조회</button>';
					html +=			'<button class="cardButton">교환, 반품 신청</button>';
					html +=			'<button class="cardButton">리뷰 작성하기</button>';
					html +=		'</div>';
					html += '</div>';
				}
				
				if(index == (data.length - 1)) {
					html += '</div>';
					html += '<div id="pagingButton" style="padding: auto; display: flex; justify-content: center;">';
					html += '<div style="width: 40%; padding-left: 60px;">';
					html +=	'<button style="display:inline; margin-right: 5px; background-color: rgb(238, 238, 238);" disabled="disabled">＜이전</button>';
					html +=	'<button style="display:inline; ">다음＞</button>';	
					html +='</div>'	;		
					html +='</div>';
				}
				
			});
			$("#breakDown").html(html);
		},
		error: function(error) {
			noContent();
		}
	});
}

function noContent() {
	let html = '';
	
	
	html += '<div class="pt-4">';
	html += 	'<div class="d-flex justify-content-center">';
	html +=			'<img src="../common/image/coupang/w노랑.png">';
	html +=		'</div>';
	html +=		'<div class="d-flex">';
	html +=			'<div style="text-align: right; width: 60%";>';
	html +=				'최근 6개월간 주문하신 내역이 없습니다.';
	html +=			'</div>';
	html +=			'<div class="ml-2">';
	html +=				'<a href="#" id="order2023">';
	html +=					'2023년 주문보기>';
	html +=				'</a>';
	html +=			'</div>';
	html +=		'</div>';
	html += '</div>';
	
	$("#breakDown").html(html);
}

function makeDate(date) {
	let res = date.substr(0,10);
	let d = res.split(".");
	
	let result= "";
	
	result += d[1];
	result += "/";
	result += d[2];
	
	return result;
}
