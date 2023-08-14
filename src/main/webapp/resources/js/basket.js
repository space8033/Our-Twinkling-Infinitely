$(init)

function init() {
   jsonProduct();
   $("#allDelete").click(removeProduct);
}
//전체선택 체크 및 전체 상품 가격 계산
function checkAll() {
	if($(".cboxAll").is(":checked") == true){
		$(".pchk").prop("checked", true);
		$("#cboxAll_top").prop("checked", true);
		$("#cboxAll_bottom").prop("checked", true);
		deleteButton1();
		$("#s_p_choice").html($(".pchk").length);
		for(var i=0; i<$(".pchk").length; i++){	
			var pchkPrice = Number($("#chk" + i).val());
			totalCheckedPrice += pchkPrice;
			$("#tt_price_product").html(totalCheckedPrice.toLocaleString("ko-KR"));
			$("#tt-product-total").html(totalCheckedPrice.toLocaleString("ko-KR"));
			$("#top_product").html(totalCheckedPrice.toLocaleString("ko-KR"));
			$("#top_total").html(totalCheckedPrice.toLocaleString("ko-KR"));
		}
		if($(".cboxAll:checked").length != 2){
			totalCheckedPrice = 0;
			$("#tt_price_product").html(totalCheckedPrice);
			$("#tt-product-total").html(totalCheckedPrice);
			$("#top_product").html(totalCheckedPrice);
			$("#top_total").html(totalCheckedPrice);
			$("#s_p_choice").html(0);
			$(".pchk").prop("checked", false);
			$("#cboxAll_top").prop("checked", false);
			$("#cboxAll_bottom").prop("checked", false);
			deleteButton2();
		}
	}else if($(".cboxAll:checked").length < 2){
		totalCheckedPrice = 0;
		$("#tt_price_product").html(totalCheckedPrice);
		$("#tt-product-total").html(totalCheckedPrice);
		$("#top_product").html(totalCheckedPrice);
		$("#top_total").html(totalCheckedPrice);
		$(".pchk").prop("checked", false);
		$("#cboxAll_top").prop("checked", false);
		deleteButton2();
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
		if($(".pchk:checked").length == $(".pchk").length){			
			$(".cboxAll").prop("checked", true);
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
	}
}

$(document).ready(function() {
	//default 선택삭제 버튼
	deleteButton2();
});

//전체선택 버튼
function deleteButton1(){
	var btnContent = '';
	btnContent += "전체삭제";
	$("#btn_delete").html(btnContent);
}
//선택삭제 버튼
function deleteButton2(){
	var btnContent = '';
	btnContent += "선택삭제";
	$("#btn_delete").html(btnContent);
}
//상품삭제버튼
function removeProduct(){
	//체크박스 유효성 검사
	//아무 것도 선택하지 않았을 때
	if($("input[name=chk]:checked").length == 0){
		window.alert("삭제할 상품을 선택해주세요.");
	//전체선택일 경우
	}else if($(".cboxAll:checked").length !== 0){
		deleteButton1();
		isProductThead();
		$(".productRow").remove();
		//선택항목 개수
		var $choice = $(".pchk:checked").length;
		$("#s_p_choice").html($choice);
		//전체선택 개수
		var $numberOfProducts = $(".pchk").length;
		$("#s_t_choice").html($numberOfProducts);
		AllDeleteConfirmDialog();
		
	//선택삭제일 경우
	}else{
		deleteButton2();
		isProductThead();
		var td = $(".pchk:checked").parent();
		var tr = td.parent();
		tr.remove();
		//선택항목 개수
		var $choice = $(".pchk:checked").length;
		$("#s_p_choice").html($choice);
		//전체선택 개수
		var $numberOfProducts = $(".pchk").length;
		$("#s_t_choice").html($numberOfProducts);
		//아래 가격
		totalCheckedPrice = 0;
		$("#tt_price_product").html(totalCheckedPrice);
		$("#tt-product-total").html(totalCheckedPrice);
		$("#top_product").html(totalCheckedPrice);
		$("#top_total").html(totalCheckedPrice);
	}	
}

function deleteRow(){
    var div = $(event.target).parent();
    var div2 = div.parent();
    var td = div2.parent();
    var tr = td.parent();
    tr.remove();
    //선택항목 개수
	var $choice = $(".pchk:checked").length;
	$("#s_p_choice").html($choice);
	//전체선택 개수
	var $numberOfProducts = $(".pchk").length;
	$("#s_t_choice").html($numberOfProducts);
	empty();
}
//전체삭제 버튼을 클릭했을 때 알림창
function AllDeleteConfirmDialog(){
	var result = window.confirm("선택한 상품을 삭제하시겠습니까?");
	if(result){
		empty();
		$("#lastselector").hide();
	}else{
		init();
	}
}

//전체선택 클릭시 로딩 스피너
function loading() {
    LoadingWithMask();
    setTimeout("closeLoadingWithMask()", 500);
    numberOfChoice();
    chkCalculate();
}

//체크박스 클릭 시 스피너와 마스크 표시
function LoadingWithMask() {
    //로딩중 이미지 표시
    $.LoadingOverlay("show", {
    	background       : "rgba(0, 0, 0, 0.5)",
    	image            : "../yuimg/spinner.gif",
    	maxSize          : 60,
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
	let coPrice = $(event.target).prop("id");
	//옵션에서 selected된 값
	var schField = $("#" + coPrice + " option:selected").text();
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
		        	 let idNo = "customSelect" + index;
			       if(coPrice == idNo){
			    	   let targetPrice = item.product_price * schField;
			    	   let benefitPrice = Math.ceil(item.product_price * schField * 0.05);
			    	   let id = "co-price" + index;//가격1 id
			    	   let benefitId = "benefit" + index;//적립 id
			    	   let toPrId = "toPr" + index;//가격2 id
			    	   $("#" + id).html(targetPrice.toLocaleString("ko-KR"));
			    	   $("#" + benefitId).html(benefitPrice.toLocaleString("ko-KR"));
			    	   $("#" + toPrId).html(targetPrice.toLocaleString("ko-KR"));
			    	   $("#chk" + index).val(targetPrice);
			       }
		         }); 
			 },
			 error: function(error){
				 console.log(error.status);
				 console.log("응 아냐");
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
		 }
         data.forEach((item, index) => {
        	priceArr.push(item.price);
        	let price = item.product_price.toLocaleString("ko-KR");
        	let benefit = Math.ceil(item.product_price * 0.05);
        	let totalProduct = (item.product_price*item.cart_qty).toLocaleString("ko-KR"); //장바구니에 넣을 상품 수량
        	selectedQty = item.cart_qty;
        	
        	html += '<tr class="productRow">';	
        	html += '	<td>';
      	    html += '		<input id="chk' + index + '" title="' + item.product_name + ' 상품을 결제상픔으로 결정" type="checkbox" name="chk" class="pchk" value='+ item.product_price +' onclick="loading()"/>';
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
      		html += '					<select id="customSelect'+ index +'" name="' + item.cart_no + '" class="select-option" onchange="setSelectBox();" title="' + item.product_name + ' 수량 변경">';
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
      		html += '				<span id="select-text" class="select-text" style="display:none;">';
      		html += '					<input id="text-co-price' + index + '" type="number" class="quantity-text" min="10" max="100" title="'+ item.product_name +' 수량변경" maxlength="4" style="width:52px; ">';
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
	     	isProductThead();
	     	setSelectBox();//선택한 상품의 가격 변화 함수
	 },
	 error: function(error){
		 empty();
		 $("#lastselector").hide();
		 console.log(error.status);
	 }
  });
  
}

function cartDelete(cart_no){
	$.ajax({
		url : "cartDelete",
		method : "post",
		data : {"cart_no" : cart_no},
		success : function(data){
			jsonProduct();
		}
	});
}
