$(init);

function init() {
	makeOrderCard();
	showAddress();
	showReviewByUser();
}

function makeOrderCard() {
	$.ajax({
		url:"getOrderList",
		method: "get",
		success: function(data) {
			console.log(data.length);
			let html="";
			let date="";
		
			data.forEach(function(item, index) {
				let price = item.price.toLocaleString('ko-KR');
				let orderDate = makeDate(item.orderDate);
				let arrivalDate = makeDate(item.arrivalDate);
				if(item.orderDate != date) {
					date = item.orderDate;
					
					if(index !== 0) {
						html += '</div>';
						html += '<div class="classifyByDate">';
						html += 	'<div class="d-flex">';
						html += 		'<div style="width:70%; font-weight:bold; font-size: 20px; padding-left:12px;">' + orderDate + ' 주문</div>';
						html += 		'<div style="width:30%; text-align: right;"><a href="#" id="seeDetail">주문 상세보기> </a></div>';
						html += 	'</div>';
						html +=	 '<div class="orderCard my-3 d-flex">';
						html += 	'<div class="orderCardLeft pt-2 pl-4">';
						html += 		'<div class="upperCard d-flex">';
						html +=				'<div style="width: 20%; font-size: 18px; font-weight: bold;">' + item.deliveryStatus + '<span style="font-weight: bold; color: rgb(206, 206, 206);">·</span></div>';
						html +=				'<div class="ml-1" style="width: 70%; color: #108209; font-size: 18px;">' + arrivalDate +'도착</div>';
						html +=				'<div class="moreIcon" style="width: 10%; text-align: right; padding-right: 15px; color: rgb(180, 180, 180);"> ⠇</div>';
						html +=			'</div>';
						html +=			'<div class="lowerCard d-flex">';
						html +=				'<div class="productImg my-3" style="width: 15%;">';
						html +=					'<img src="data:MIME;base64, '+ item.image +'" width="100%" height="100%"/>';
						html +=				'</div>';
						html +=				'<div class="productDetail ml-4 mr-3" style="width: 85%;">';
						html +=					'<div class="detailUpper mt-2 mb-3 mr-2">';
						html +=						'<span style="margin-left: 5px; vertical-align: middle; font-size: 15px;">' + item.title + '</span>';
						html +=					'</div>';
						html +=					'<div class="detailDown mb-3 d-flex">';
						html +=						'<div style="text-align: left; width: 65%; color: #978b75">';
						html +=							price +'원 · ' + item.quantity + '개';
						html +=						'</div>';
						html +=					'</div>';
						html +=				'</div>';
						html +=			'</div>';
						html +=		'</div>';
						html +=		'<div class="orderCardRight d-flex">';
						html +=			'<button class="cardButton" >배송조회</button>';
						html +=			'<button class="cardButton">교환, 반품 신청</button>';
						html +=			'<button class="cardButton" onclick="writeReview(' + item.productNo + ')">리뷰 작성하기</button>';
						html +=		'</div>';
						html +=	'</div>';
					} else {
							html += '<div class="classifyByDate">';
							html += 	'<div class="d-flex">';
							html += 		'<div style="width:70%; font-weight:bold; font-size: 20px; padding-left:12px;">' + orderDate + ' 주문</div>';
							html += 		'<div style="width:30%; text-align: right;"><a href="#" id="seeDetail">주문 상세보기> </a></div>';
							html += 	'</div>';
							html +=	 '<div class="orderCard my-3 d-flex">';
							html += 	'<div class="orderCardLeft pt-2 pl-4">';
							html += 		'<div class="upperCard d-flex">';
							html +=				'<div style="width: 20%; font-size: 18px; font-weight: bold;">' + item.deliveryStatus + '<span style="font-weight: bold; color: rgb(206, 206, 206);">·</span></div>';
							html +=				'<div class="ml-1" style="width: 70%; color: #108209; font-size: 18px;">' + arrivalDate +'도착</div>';
							html +=				'<div class="moreIcon" style="width: 10%; text-align: right; padding-right: 15px; color: rgb(180, 180, 180);"> ⠇</div>';
							html +=			'</div>';
							html +=			'<div class="lowerCard d-flex">';
							html +=				'<div class="productImg my-3" style="width: 15%;">';
							html +=					'<img src="data:MIME;base64, '+ item.image +'" width="100%" height="100%"/>';
							html +=				'</div>';
							html +=				'<div class="productDetail ml-4 mr-3" style="width: 85%;">';
							html +=					'<div class="detailUpper mt-2 mb-3 mr-2">';
							html +=						'<span style="margin-left: 5px; vertical-align: middle; font-size: 15px;">' + item.title + '</span>';
							html +=					'</div>';
							html +=					'<div class="detailDown mb-3 d-flex">';
							html +=						'<div style="text-align: left; width: 65%; color: #978b75">';
							html +=							price +'원 · ' + item.quantity + '개';
							html +=						'</div>';
							html +=					'</div>';
							html +=				'</div>';
							html +=			'</div>';
							html +=		'</div>';
							html +=		'<div class="orderCardRight d-flex">';
							html +=			'<button class="cardButton">배송조회</button>';
							html +=			'<button class="cardButton">교환, 반품 신청</button>';
							html +=			'<button class="cardButton" onclick="writeReview(' + item.productNo + ')">리뷰 작성하기</button>';
							html +=		'</div>';
							html +=	'</div>';
					}
				}else {
					html +=	 '<div class="orderCard my-3 d-flex">';
					html += 	'<div class="orderCardLeft pt-2 pl-4">';
					html += 		'<div class="upperCard d-flex">';
					html +=				'<div style="width: 20%; font-size: 18px; font-weight: bold;">' + item.deliveryStatus + '<span style="font-weight: bold; color: rgb(206, 206, 206);">·</span></div>';
					html +=				'<div class="ml-1" style="width: 70%; color: #108209; font-size: 18px;">' + arrivalDate +'도착</div>';
					html +=				'<div class="moreIcon" style="width: 10%; text-align: right; padding-right: 15px; color: rgb(180, 180, 180);"> ⠇</div>';
					html +=			'</div>';
					html +=			'<div class="lowerCard d-flex">';
					html +=				'<div class="productImg my-3" style="width: 15%;">';
					html +=					'<img src="data:MIME;base64, '+ item.image +'" width="100%" height="100%"/>';
					html +=				'</div>';
					html +=				'<div class="productDetail ml-4 mr-3" style="width: 85%;">';
					html +=					'<div class="detailUpper mt-2 mb-3 mr-2">';
					html +=						'<span style="margin-left: 5px; vertical-align: middle; font-size: 15px;">' + item.title + '</span>';
					html +=					'</div>';
					html +=					'<div class="detailDown mb-3 d-flex">';
					html +=						'<div style="text-align: left; width: 65%; color: #978b75">';
					html +=							price +'원 · ' + item.quantity + '개';
					html +=						'</div>';
					html +=					'</div>';
					html +=				'</div>';
					html +=			'</div>';
					html +=		'</div>';
					html +=		'<div class="orderCardRight d-flex">';
					html +=			'<button class="cardButton">배송조회</button>';
					html +=			'<button class="cardButton">교환, 반품 신청</button>';
					html +=			'<button class="cardButton" onclick="writeReview(' + item.productNo + ')">리뷰 작성하기</button>';
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
			$("#orderList").html(html);
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
	html +=		'</div>';
	html +=		'<div class="d-flex">';
	html +=			'<div style="text-align: right; width: 60%";>';
	html +=				'최근 6개월간 주문하신 내역이 없습니다.';
	html +=			'</div>';
	html +=		'</div>';
	html += '</div>';
	
	$("#orderList").html(html);
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

function showAddress(pageNo3) {
	$.ajax({
		url: "address",
		method: "get",
		data:{
			"pageNo": pageNo3
		},
		success: function(data) {
			$("#addressList").html(data);
		},
		error: function(error) {
			console.log("아왜");
		}
	});
}



function showModifyAddress(addressNo) {
	$.ajax({
		url: "modifyForm",
		method: "get",
		data:{
			"addressNo": addressNo
		},
		success: function(data) {
			$("#addressList").html(data);
		},
		error: function(error) {
			console.log("아왜");
		}
	});
}

//리뷰 작성하기
function writeReview(productNum) {
	console.log("작성좀");
	$.ajax({
		url: "reviewWrite",
		method: "get",
		data:{"productNum": productNum},
		success: function(data) {
			$("#reviewList").html(data);
			$("#showAlert").hide();
			const reviewTabLink = document.querySelector('[data-toggle="tab"][href="#reviewList"]');
			reviewTabLink.click();
		},
		error: function(error) {
			console.log("아왜");
		}
	});
}
//폼 데이터를 비동기화로 넘기기 위한 스크립트.
//그림파일도 넘기기 위해 formData로 form을 받고 cache, contentType, processData를 false로 해줌 
function submitForm() {
	var form = $("#reviewWrite")[0];
	var formData = new FormData(form);
	$.ajax({
		url: "reviewWrite",
		method: "post",
		data: formData,
		success: function(data) {
			$("#reviewList").html(data);
		},
		error: function(error) {
			console.log("아왜");
		},
		cache: false,
      contentType: false,
      processData: false
	});
}

function showReviewByUser(pageNo5) {
	$.ajax({
		url: "reviewByUser",
		method: "get",
		data:{
			"pageNo5": pageNo5
		},
		success: function(data) {
			$("#reviewList").html(data);
		},
		error: function(error) {
			console.log("아왜");
		}
	});
}
	
function myReviewDetail(review_no) {
	$.ajax({
		url: "myReviewDetail",
		method: "get",
		data:{"review_no": review_no},
		success: function(data) {
			$("#reviewList").html(data);
		},
		error: function(error) {
			console.log("아왜");
		}
	});
}

function showReviewModify(review_no) {
	$.ajax({
		url: "modifyReview",
		method: "get",
		data:{"review_no": review_no},
		success: function(data) {
			$("#reviewList").html(data);
			$("#showAlert").hide();
		},
		error: function(error) {
			console.log("아왜");
		}
	});
}

function modifyForm() {
	var form = $("#modifyReview")[0];
	var formData = new FormData(form);
	$.ajax({
		url: "modifyReview",
		method: "post",
		data: formData,
		success: function(data) {
			$("#reviewList").html(data);
		},
		error: function(error) {
			console.log("아왜");
		},
		cache: false,
		contentType: false,
		processData: false
	});
}

function deleteReview(review_no) {
	$.ajax({
		url: "deleteReview",
		method: "post",
		data:{"review_no": review_no},
		success: function(data) {
			$("#reviewList").html(data);
		},
		error: function(error) {
			console.log("아왜");
		}
	});
}

