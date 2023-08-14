$(init)

function init() {
   loading();
   jsonProduct();
   $("#btn_delete").hide();
}
//전체선택 체크 및 전체 상품 가격 계산
function checkAll() {
	if($(event.target).is(":checked") == true){
		if($("#cboxAll_top").is(":checked") == true){
			$(".pchk").prop("checked", true);
			$("#cboxAll_bottom").prop("checked", true);
			$("#s_p_choice").html($(".pchk").length);
			for(var i=0; i<$(".pchk").length; i++){	
				var pchkPrice = Number($("#chk" + i).val());
				totalCheckedPrice += pchkPrice;
			}
			$("#top_product").html(totalCheckedPrice.toLocaleString("ko-KR"));
			$("#top_total").html(totalCheckedPrice.toLocaleString("ko-KR"));
			$("#btn_delete").show();
		}else if($("#cboxAll_bottom").is(":checked") == true){
			$(".pchk").prop("checked", true);
			$("#cboxAll_top").prop("checked", true);
			$("#s_p_choice").html($(".pchk").length);
			for(var i=0; i<$(".pchk").length; i++){	
				var pchkPrice = Number($("#chk" + i).val());
				totalCheckedPrice += pchkPrice;
			}
			$("#top_product").html(totalCheckedPrice.toLocaleString("ko-KR"));
			$("#top_total").html(totalCheckedPrice.toLocaleString("ko-KR"));
			$("#btn_delete").show();
		}
	}else{
		totalCheckedPrice = 0;
		$(".pchk").prop("checked", false);
		$("#cboxAll_top").prop("checked", false);
		$("#cboxAll_bottom").prop("checked", false);
		$("#top_product").html(totalCheckedPrice);
		$("#top_total").html(totalCheckedPrice);
		$("#btn_delete").hide();
	}
}


//체크한 상품 가격 계산
var totalCheckedPrice = 0;
function chkCalculate(){
	if($(event.target).is(":checked")==true){
		var checkedPrice = 0;
		//체크한 상품 가격
		var checkedPrice = Number($(event.target).val());
		//체크한 상품 가격의 합
		totalCheckedPrice += checkedPrice;
		$("#tt_price_product").html(totalCheckedPrice.toLocaleString("ko-KR"));
		$("#tt-product-total").html(totalCheckedPrice.toLocaleString("ko-KR"));
		$("#top_product").html(totalCheckedPrice.toLocaleString("ko-KR"));
		$("#top_total").html(totalCheckedPrice.toLocaleString("ko-KR"));
		$(".cboxAll").prop("checked", false);
		$("#btn_delete").hide();
		if($(".pchk:checked").length == $(".pchk").length){			
			$(".cboxAll").prop("checked", true);
			$("#btn_delete").show();
		}		
	}else if($(event.target).is(":checked")==false){
		var checkedPrice = Number($(event.target).val());
		//체크 해제한 상품 가격 차감
		totalCheckedPrice -= checkedPrice;
		if(totalCheckedPrice<0){
			totalCheckedPrice = 0;
		}
		$("#tt_price_product").html(totalCheckedPrice.toLocaleString("ko-KR"));
		$("#tt-product-total").html(totalCheckedPrice.toLocaleString("ko-KR"));
		$("#top_product").html(totalCheckedPrice.toLocaleString("ko-KR"));
		$("#top_total").html(totalCheckedPrice.toLocaleString("ko-KR"));
		$(".cboxAll").prop("checked", false);
		$("#btn_delete").hide();
	}
}


//전체선택 버튼
function deleteButton1(){
	var btnContent = '';
	btnContent += "전체삭제";
	$("#btn_delete").html(btnContent);
}

//삭제 버튼을 클릭했을 때 알림창
function AllDeleteConfirmDialog(){
	if($(".pchk:checked").length != 0){		
		var result = window.confirm("선택한 상품을 삭제하시겠습니까?");
		if(result){
			$.ajax({
				url: "addCart",
				method: "get",
				dataType: "json",
				success: function(data){
					data.forEach((item, index) => {
						cartDelete(item.cart_no);
					});
				},
				error: function(error){
					console.log(error.status);
				}
			});
		}
	}
}

//전체선택 클릭시 로딩 스피너
function loading() {
    LoadingWithMask();
    setTimeout("closeLoadingWithMask()", 1000);
}

//체크박스 클릭 시 스피너와 마스크 표시
function LoadingWithMask() {
    //로딩중 이미지 표시
    $.LoadingOverlay("show", {
    	background       : "rgba(0, 0, 0, 0.5)",
    	image            : "https://upload.wikimedia.org/wikipedia/commons/c/c7/Loading_2.gif",
    	maxSize          : 100,
    	fontawesome      : "fa fa-spinner fa-pulse fa-fw",
    	fontawesomeColor : "#FFFFFF",
    });
   
}
//스피너와 마스크 종료
function closeLoadingWithMask() {
    $.LoadingOverlay("hide"); 
}
//체크박스 선택 개수
function numberOfChoice(){
	var $choice = $(".pchk:checked").length;
	$("#s_p_choice").html($choice);
}
//상품이 없을 경우 장바구니
function empty(){
	if($(".cancel").length === 0){
		$("#th_checkBox").hide();	
	}
}
//상품이 있을 경우 테이블 thead 추가항목
function isProductThead(){
	var th_all_content ='';
	th_all_content += "전체선택";
	$("#th_all_title").html(th_all_content);
}

//option(수량)중에서 선택한 값 
function setSelectBox(){
	//수량 선택에 따른 상품의 가격
	if($(".select-option option:selected").length !== 0){
		 $.ajax({
			 url: "addCart",
			 method: "get",
			 dataType: "json",
			 success: function(data){
				 data.forEach((item, index) => {
					 // 장바구니에 담은  상품 수량 옵션 selected
					 $('select[name="'+ item.cart_no +'"]').find('option[value="'+ item.cart_qty +'"]').attr("selected",true);
		         }); 
			 },
			 error: function(error){
				 console.log(error.status);
			 }
		  });
	}
	
}


//상품이 있을 경우 Json으로 상품 불러오기
let priceArr = new Array();
let selectedQty = "";
function jsonProduct() {
	//오늘 날짜
	var now = new Date();
	//배송될 날짜
	var tomorrow = new Date(now.setDate(now.getDate() + 3));
	//배송될 월
	let month = tomorrow.getMonth() + 1;
	//배송될 일
	let date = tomorrow.getDate();
	//배송될 요일
	let days = tomorrow.getDay();
	let weekday = new Array(7); //요일, 일요일(0)~토요일(6)
	weekday[0] = "일";
	weekday[1] = "월";
	weekday[2] = "화";
	weekday[3] = "수";
	weekday[4] = "목";
	weekday[5] = "금";
	weekday[6] = "토";
	let day = weekday[days];
	
  $.ajax({
	 url: "addCart",
	 method: "get",
	 success: function(data){
		 let html = "";
		 if(data<1){
			 html += '<tr class="t2">';
			 html += '	<td></td>';
			 html += '	<td></td>';
			 html += '	<td>';
			 html += '		<p class="t2_nonMessage">장바구니에 담은 상품이 없습니다.</p>';
			 html += '	</td>';
			 html += '</tr>';
			 $("#cboxAll_top").hide();
			 $("#lastselector").hide();
			 $(".total_order_price").hide();
		 }
         data.forEach((item, index) => {
        	priceArr.push(item.price);
        	let price = item.product_price.toLocaleString("ko-KR");
        	let benefit = Math.ceil(item.product_price*item.cart_qty * 0.04);
        	let totalProduct = (item.product_price*item.cart_qty).toLocaleString("ko-KR"); //장바구니에 넣을 상품 수량
        	
        	html += '<tr class="productRow">';	
        	html += '	<td>';
      	    html += '		<input id="chk' + index + '" title="' + item.product_name + ' 상품을 결제상픔으로 결정" type="checkbox" name="chk" class="pchk" value='+ item.product_price*item.cart_qty +' onclick="chkCalculate()"/>';
      	    html += '		<input type="hidden" name="cart_no" value="'+ item.cart_no +'"/>';
      		html += '	</td>';
      		html += '	<td class="p_img">';
      		html += '		<a href="#">';
      		html += '			 <img src="data:MIME;base64, '+ item.product_imgFile +'" width="78"/>';
      		html += '		</a>';
      		html += '	</td>';
      		html += '	<td class="product_contents">';
      		html += '		<div class="c_name">';
      		html += '			<a href="detailProduct?product_no="' + Number(item.product_no) + '>' + item.product_name + '(' + item.productOption_type + ')';		
      	    html += '			</a>';		
      		html += '		</div>';
      		html += '		<div class="c_date&c_option d-flex">';
      		html += '			<div class="c_date">';
      		html += '				<span class="arrival date text-success">'+ month +'/' + date +'</span>';
      		html += '				<span class="arrival day text-success">(' + day + ')</span>';
      		html += '				<span class="arrival time text-success">새벽 7시 전</span>';
      		html += '				<span class="arrival message text-success">도착 보장</span>';
      		html += '				<span class="condition text-muted"><small>(오후 9시 전 주문 시)</small></span>';
      		html += '			</div>';
      		html += '			<div class="c_option">';
      		html += '				<span>' + price + '</span>';
      		html += '				<span>원</span>';
      		html += '					<select id="customSelect'+ index +'" name="' + item.cart_no + '" class="select-option" onclick="setSelectQty()" title="' + item.product_name + ' 수량 변경">';
      		html += '						<option value="1">1</option>';
      		html += '						<option value="2">2</option>';
      		html += '						<option value="3">3</option>';
      		html += '						<option value="4">4</option>';
      		html += '						<option value="5">5</option>';
      		html += '						<option value="6">6</option>';
      		html += '						<option value="7">7</option>';
      		html += '						<option value="8">8</option>';
      		html += '						<option value="9">9</option>';
      		html += '						<option value="10">10</option>';
      		html += '					</select>';
      		html += '				</span>';
      		html += '				<span id="co-price'+ index +'" class="p_price" value="'+ index +'" style="padding-left: 10px;">'+ totalProduct +'</span>';
      		html += '				<span>원</span>';
      		html += '				<button class="cancel" type="button" onclick="cartDelete('+ item.cart_no +')">X</button>';
      		html += '				<div class="select-text" style="display:none;">';
      		html += '					<button id="btn'+ index +'" class="btn-quantity" type="button">수량변경</button>';
      		html += '				</div>';
      		html += '			</div>';
      		html += '		</div>';
      		html += '		<div class="benefit" style="padding-left:389px;">';
      		html += '			<span id="pointwrapper">';
      		html += '				<img src="//img1a.coupangcdn.com/image/cart/generalCart/ico_cash_m_2x.png" width="14">';
      		html += '				<span class="point">최대</span>';
      		html += '				<span id="benefit' + index + '" class="point cash">' + benefit +'</span>';
      		html += '				<span class="point">원 적립</span>';
      		html += '			</span>';
      		html += '		</div>';
      		html += '	</td>';
      		html += '	<td class="discount">';
      		html += '   	<div style="padding-top:20px;"></div>';
      		html += '		<div id="toPr' + index + '" class="discounted_price">' +  totalProduct  +'원</div>';
      		html += '		<img src="//image10.coupangcdn.com/image/badges/rocket/rocket_logo.png" class="delivery-badge-img " style="width: 56px;">';
      		html += '	</td>';
      		html += '	<td class="delivery_fee" style="padding-top: 50px; text-align: center;">무료</td>';
        	html += '</tr>';  
         });  
         $("#basket_tbody").html(html);
	       //선택항목 개수
	     	var $choice = $(".pchk:checked").length;
	     	$("#s_p_choice").html($choice);
	     	//전체선택 개수
	     	var $numberOfProducts = $(".pchk").length;
	     	$("#s_t_choice").html($numberOfProducts);
	     	//선택했던 수량
	     	setSelectBox();
	 },
	 error: function(error){
		 console.log(error.status);
	 }
  });
  
}
//X버튼 눌렀을 때 해당 상품 삭제
function cartDelete(cart_no){
	$.ajax({
		url : "cartDelete",
		method : "post",
		data : {"cart_no" : cart_no},
		success : function(data){
			jsonProduct();
			loading();
		}
	});
}

//장바구니 수량 변경
function setSelectQty(){
    $(".select-option").change(function() {
        var cartNo = Number($(this).attr("name"));
        var newQty = Number($(this).val()); 
        qtyUpdate(cartNo, newQty);
        loading();
    });
}

function qtyUpdate(cartNo, newQty) {
    $.ajax({
        url: "qtyUpdate", 
        method: "post",
        data: {
            "cart_no": cartNo,
            "cart_qty": newQty
        },
        success: function(response) {
            jsonProduct();
            setSelectBox();
        },
        error: function(error) {
            console.log(error);
        }
    });
}