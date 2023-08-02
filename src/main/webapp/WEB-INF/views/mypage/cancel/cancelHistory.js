$(init);

function init() {
	loadFooter();
	$(".refundMenu").click(onClickMine);
	makeOrderCard();
}

function loadFooter() {
	$("#footer").load("coupangFooter.jsp");
}

function onClickMine() {
	$(".refundMenu").each((index, el) =>
		$(el).removeClass("selectedRefundMenu")
	)
	
	$(event.target).addClass("selectedRefundMenu");	
}

function makeOrderCard() {
	$.ajax({
		url:"cancelHistory_content.jsp",
		method: "get",
		success: function(data) {
			let html="";
			let orderNum = "";
			
			data.forEach(function(item, index) {
				var price = item.price.toLocaleString("ko-KR");
				if(item.orderNumber == orderNum ) {
					html += '			<div class="refundBottomLeft d-flex pl-4">';
					html += '				<div class="refundContent py-5" style="border-left: none;">';
					html += '					<span>' + item.title + '</span> <br>';
					html += 							item.detail;
					html += '				</div>';
					html += '				<div class="refundInfo">';
					html += 					item.quantity + '개 <br>';
					html += '					<span>' + price + '원</span>';
					html += '				</div>';
					html += '			</div>';
				}else {
					orderNum = item.orderNumber;
					if(index == 0) {
						html +=' 	<div class="refundTop">'+ item.type + '접수일 : <span>' + item.registerDate + '</span> | 주문일 : <span>' + item.orderDate + '</span> | 주문번호 : <span>' + item.orderNumber + '</span></div>';
						html += '		<div class="refundBottom d-flex">';
						html += '         <div style="width:75%">'
						html += '			<div class="refundBottomLeft d-flex pl-4">';
						html += '				<div class="refundContent py-5" style="border-left: none; ">';
						html += '					<span>' + item.title + '</span> <br>';
						html += 							item.detail;
						html += '				</div>';
						html += '				<div class="refundInfo">';
						html += 					item.quantity + '개 <br>';
						html += '					<span>' + price + '원</span>';
						html += '				</div>';
						html += '			</div>';
					}else {
						html += '       </div>'
						html +=' 		<div class="refundStatus d-flex">';
						html += '			<div style="width: 50%; display: flex; align-items: center; padding-left: 10px;">';
						html += '                 <div>'
						html += '				<span>'+ item.type + '완료</span> <br>';
						html += '					6/16(금) 이내 카드사 환불 완료 예정';
						html += '                 </div>'
						html += '			</div>';
						html += '			<div style="width: 50%; display: flex; align-items: center;">';
						html += '				<button style="width: 100px; background-color: white; border: 2px solid #7890d0; color: #7890d0;">' + item.type + '상세</button>';
						html += '			</div>';
						html += '		</div>';
						html += '	</div>';
						html += '<div class="refundTop">' + item.type + '접수일 : <span>' + item.registerDate + '</span> | 주문일 : <span>' + item.orderDate + '</span> | 주문번호 : <span>' + item.orderNumber + '</span></div>';
						html += '<div class="refundBottom d-flex">';
						html += '         <div style="width:75%">'
						html += '	<div class="refundBottomLeft d-flex pl-4">';
						html += '		<div class="refundContent py-5" style="border-left: none;">';
						html += '			<span>' + item.title + '</span> <br>';
						html += 			item.detail;
						html += '		</div>';
						html += '		<div class="refundInfo">';
						html += 			item.quantity + '개 <br>';
						html += '			<span>' + price + '원</span>';
						html += '		</div>';
						html += '	</div>';
					}
				}
				if(index == (data.length - 1)) {
					html += '       </div>'
					html +=' 		<div class="refundStatus d-flex">';
					html += '			<div style="width: 50%; padding-left:10px; display: flex; align-items: center;">';
					html += '                 <div>'
					html += '				<span>'+ item.type + '완료</span> <br>';
					html += '					6/16(금) 이내 카드사 환불 완료 예정';
					html += '                 </div>'
					html += '           </div>';
					html += '			<div style="width: 50%; display: flex; align-items: center;">';
					html += '				<button style="width: 100px; background-color: white; border: 2px solid #7890d0; color: #7890d0;">' + item.type + '상세</button>';
					html += '			</div>';
					html += '		</div>';
					html += '	</div>';
					html += '<div id="pagingButton" style="padding: auto; display: flex; justify-content: center;">'
					html += '<div style="width: 40%; padding-left: 60px;">'
					html +=	'<button style="display:inline; margin-right: 5px; background-color: rgb(238, 238, 238);" disabled="disabled">＜이전</button>'
					html +=	'<button style="display:inline; ">다음＞</button>					'	
					html +='</div>'					
					html +='</div>'
				}
				
			});
			$("#refundContainer").html(html);
		},
		error: function(error) {
			console.log("에러임");
		}
	});
}