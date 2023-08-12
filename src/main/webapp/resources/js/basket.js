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
		for(var i=0; i<$(".pchk").length; i++){	
			var pchkPrice = Number($("#chk" + i).val());
			console.log("p: " + pchkPrice);
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
		$("#cboxAll_bottom").prop("checked", false);
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
		console.log("t: " + totalCheckedPrice);
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
    	image            : "../../common/image/coupang/s_spinner2.gif",
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
		$("#table").load("basket_content_empty.jsp");		
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
			 dataType: "Json",
			 success: function(list){
				 list.forEach((item, index) => {
		        	 let idNo = "customSelect" + index;
			       if(coPrice == idNo){
			    	   let targetPrice = item.price * schField;
			    	   let benefitPrice = Math.ceil(item.price * schField * 0.05);
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
			 }
		  });
		 
	//10+를 selected했을 경우 가격	
	}else if(schField == "10+"&& $(".select-option option:selected").length !== 0){
		let coPrice = $(event.target).prop("id");
		
		$.ajax({
			 url: "addCart",
			 method: "get",
			 dataType: "Json",
			 success: function(list){
		         list.forEach((item, index) => {
		        	 //select option id
		        	 let idNo = "customSelect" + index;
			       if(coPrice == idNo){
			    	   //input text id
			    	   let textid = "text-co-price" + index;
			    	   //수량변경 버튼 id
			    	   let btnid= "btn" + index
			    	   $("#" + idNo).hide();
			    	   $("#" + textid).parent().show();
			    	   //input박스를 클릭했을 때 버튼 나타나기
			    	   $("#" + textid).click(function(){
			    		   $("#" + btnid).parent().show();			    		   
			    	   });
			    	   //수량변경버튼을 클릭했을 때
			    	   $("#" + btnid).click(function () { 
			    		  var textField = $("#" + textid).val();
			    		  //10보다 작은 값을 입력하고 수량버튼을 눌렀을 때
			    		  if(textField < 10){
			    			  $("#" + textid).parent().hide();
			    			  $("#" + idNo).show();
			    			  $("#" + coPrice).val(textField).prop("selected", true);
			    			  $("#" + btnid).parent().hide();
			    			  let quty = $("#" + coPrice + " option:selected").text();
			    			  let targetPrice = item.price * quty;
			    			  let benefitPrice = Math.ceil(item.price * quty * 0.05);
			    			  let id = "co-price" + index;//상품가격1 id
			    			  let benefitId = "benefit" + index;//혜택id
			    			  let toPrId = "toPr" + index;//상품가격2 id
			    			  $("#" + id).html(targetPrice.toLocaleString("ko-KR"));
					    	  $("#" + benefitId).html(benefitPrice.toLocaleString("ko-KR"));
					    	  $("#" + toPrId).html(targetPrice.toLocaleString("ko-KR"));
					    	  $("#chk" + index).val(targetPrice);
					    	  console.log($("#chk" + index).val());
					      //10보다 큰 값을 입력하고 수량버튼을 클릭했을 때  
			    		  }else{
			    			  let id = "co-price" + index;//상품가격i id
			    			  let targetPrice = item.price * textField;
			    			  let benefitPrice = Math.ceil(item.price * textField * 0.05);
			    			  let benefitId = "benefit" + index;//혜택id
			    			  let toPrId = "toPr" + index;//상품가격2 id
			    			  
			    			  $("#" + id).html(targetPrice.toLocaleString("ko-KR"));
			    			  $("#" + benefitId).html(benefitPrice.toLocaleString("ko-KR"));
			    			  $("#" + toPrId).html(targetPrice.toLocaleString("ko-KR"));
			    			  $("#chk" + index).attr("value", targetPrice);
			    			  $("#chk" + index).val(targetPrice);
			    			  $("#" + btnid).parent().hide();
			    		  }
			    		  
			           });
			       }
		         }); 
		      
			 },
			 error: function(error){
				 console.log(error.status);
			 }
		  });      	
	}
	
}

//상품이 있을 경우 Json으로 상품 불러오기
function jsonProduct() {
	//오늘 날짜
	var now = new Date();
	//배송될 날짜
	var tomorrow = new Date(now.setDate(now.getDate() + 1));
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
	 dataType: "json",
	 success: function(list){
		 let html = "";
		 if(list<1){
			 html += '<tr class="t2">';
			 html += '	<td></td>';
			 html += '	<td></td>';
			 html += '	<td>';
			 html += '		<p class="t2_nonMessage">장바구니에 담은 상품이 없습니다.</p>';
			 html += '	</td>';
			 html += '</tr>';
		 }
			 $each(list, function(key,value){
				 var item_price = parseInt(value.product_price);
				 var benefit = item_price * 0.05;
				 var price = new Intl.NumberFormat('ko-KR',{
					 style:'currency',
					 currency:'KRW'
				 }).format(product_price)
			
			 var cart_no = parseInt(value.cart_no);
			 		
			 html += '<tr class="productRow">';	
			 html += '<td>';
			 html += '	<input id="chk'+ cart_no +'" title="' + value.product_name + ' 상품을 결제상픔으로 결정" type="checkbox" name="chk" class="pchk" value='+ item_price +' onclick="loading()"/>';
			 html += '</td>';
			 html += '<td class="p_img">';
			 html += '	<a href="#">';
			 html += '		<img src="data:MIME;base64,' + value.product_img + ' "width="78"/>';
			 html += '	</a>';
			 html += '</td>';
			 html += '<td class="product_contents">';
			 html += '	<div class="c_name">';
			 html += '		<a href="detailProduct?product_no= ' + value.product_no + '">' + value.product_name;		
			 html += '		</a>';		
			 html += '	</div>';
			 html += '	<div class="c_date&c_option d-flex">';
			 html += '		<div class="c_date">';
			 html += '			<span class="arrival d-day text-success">내일</span>';
			 html += '			<span class="arrival day text-success">(' + day + ')</span>';
			 html += '			<span class="arrival date text-success">'+ month +'/' + date +'</span>';
			 html += '			<span class="arrival time text-success">새벽 7시 전</span>';
			 html += '			<span class="arrival message text-success">도착 보장</span>';
			 html += '			<span class="condition text-muted"><small>(오후 9시 전 주문 시)</small></span>';
			 html += '		</div>';
			 html += '		<div class="c_option">';
			 html += '			<span>' + price + '</span>';
			 html += '			<span>원</span>';
			 html += '				<select id="customSelect'+ cart_no +'" class="select-option" onchange="setSelectBox();" title="' + value.product_name +' 수량 변경">';
			 html += '					<option value="1">1</option>';
			 html += '					<option value="2">2</option>';
			 html += '					<option value="3">3</option>';
			 html += '					<option value="4">4</option>';
			 html += '					<option value="5">5</option>';
			 html += '					<option value="6">6</option>';
			 html += '					<option value="7">7</option>';
			 html += '					<option value="8">8</option>';
			 html += '					<option value="9">9</option>';
			 html += '					<option value="10">10</option>';
			 html += '				</select>';
			 html += '			</span>';
			 html += '			<span id="co-price'+ cart_no +'" class="p_price" value="'+ cart_no +'" style="padding-left: 10px;">'+ price +'</span>';
			 html += '			<span>원</span>';
			 html += '			<button class="cancel" type="button" onclick="deleteRow()">X</button>';
			 html += '			<div class="select-text" style="display:none;">';
			 html += '				<button id="btn'+ cart_no +'" class="btn-quantity" type="button">수량변경</button>';
			 html += '			</div>';
			 html += '		</div>';
			 html += '	</div>';
			 html += '	<div class="benefit" style="padding-left:389px;">';
			 html += '		<span id="pointwrapper">';
			 html += '			<img src="//img1a.coupangcdn.com/image/cart/generalCart/ico_cash_m_2x.png" width="14">';
			 html += '			<span class="point">최대</span>';
			 html += '			<span id="benefit' + cart_no + '" class="point cash">' + benefit +'</span>';
			 html += '			<span class="point">원 적립</span>';
			 html += '		</span>';
			 html += '	</div>';
			 html += '</td>';
			 html += '<td class="discount">';
			 html += '   <div style="padding-top:20px;"></div>';
			 html += '	<div id="toPr' + cart_no + '" class="discounted_price">' +  price  +'원</div>';
			 html += '	<img src="//image10.coupangcdn.com/image/badges/rocket/rocket_logo.png" class="delivery-badge-img " style="width: 56px;">';
			 html += '</td>';
			 html += '<td class="delivery_fee" style="padding-top: 50px; text-align: center;">무료</td>';
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
	     	console.log("성공");
	     	
	 },
	 error: function(error){
		 empty();
		 $("#lastselector").hide();
		 console.log(error.status);
		 console.log("응아니야");
	 }
  });
  
}
