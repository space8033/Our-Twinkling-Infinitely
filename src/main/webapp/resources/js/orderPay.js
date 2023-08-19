$(init)

//결제 페이지 실행시 불러들이는 값
function init(){
	priceCalculate();
	couponList();
}

function couponList() {
	 var totalPrice = parseFloat($('.totalPrice').text().replace(/,/g, ""));
	    
	    $('.couponUse').each(function() {
	        var couponCondition = parseFloat($(this).nextAll('.couponCondition').first().text());
	      
	        if (totalPrice < couponCondition) {
	            $(this).prop('disabled', true);
	        }
	    });
}
/*var isRefreshButtonClicked = false;
window.addEventListener("keydown", function(event) {
    // F5 키를 누를 경우에 isRefreshButtonClicked를 true로 설정
    if (event.keyCode === 116) {
        isRefreshButtonClicked = true;
    }
});

window.reload = function() {
    isRefreshButtonClicked = true;
    location.reload();
};*/
/*
window.addEventListener("beforeunload", function(event) {

	    // 페이지를 벗어난 경우 처리
	
	        event.preventDefault();
	        var addressNo = $('#addressNo').val();
	        // 서버로 전송할 데이터 생성
	        var postData = {
	            addressNo: addressNo
	        };

	        // AJAX 요청 등의 작업 수행
	        $.ajax({
	            type: "POST",
	            url: "/our-twinkling-infinitely/delete-data", // 보낼 곳의 URL
	            data: postData,
	            success: function(response) {
	                // 서버 응답 처리 (예: 성공 메시지 표시)
	                alert("데이터가 성공적으로 전달 완료되었습니다.");
	            },
	            error: function() {
	                // 오류 처리
	                alert("데이터 전송 중 오류가 발생했습니다.");
	            }
	        });

	        // 변경사항 저장 여부 메시지
	        event.returnValue = "변경사항을 저장하지 않으셨습니다. 페이지를 떠나시겠습니까?";
	    
	
});

*/


//결제 금액 계산
function priceCalculate() {
	
	var totalPrice = parseInt($('.totalPrice').text().replace(/,/gi, ""));
	console.log("totalPrice : "+ totalPrice);
	var discount =parseInt($('#discount').text().replace(/,/gi, ""));	
	console.log("discount : "+ discount);

	var delFee =parseInt($('#delFee').text().replace(/,/gi, ""));
	console.log("delFee : "+ delFee);
	
	var balance =parseInt($('#balance').text().replace(/,/gi, ""));
	console.log("balance : "+ balance);
	if(isNaN(balance)){
		balance =0;
		parseInt($('#balance').text(0));
	}
	var price = parseInt($('#price').text().replace(/,/gi, ""));
	console.log("price : "+price);
	
	
	var selectedCouponValue = parseFloat($('input[name=coupon_no]:checked').next().first().val());
	if(selectedCouponValue == "2500") {
		price = totalPrice + delFee + balance;
		
	} else {

		price = totalPrice - discount + delFee + balance;
	
	}
	point = parseInt(price*0.01);
	$('#price').text(price);
	$('#point').text(point);
	
}

function openAdress() {
   	window.open("/our-twinkling-infinitely/addressSelect", "winLogin", "left=350, top=300, width=500, height=650");
}

function openRequest() {
	window.open("/our-twinkling-infinitely/addressRequest", "winLogin", "left=350, top=300, width=530, height=650");
}

$(document).ready(function(){
	
	
	
	
   	// 초깃값 설정
    $('#credit-card-option').hide();
	$('#coupay-money-option').hide();
	$('#corporation-card-option').hide();
	$('#phone-option').hide();
	$('#deposit-without-bankbook-option').hide();
	$('#account-transfer-option').show();
	$('#deposit-without-bankbook-option-caution').hide();
	$('#selectPay').hide();
	$('#basicPay').show();
	$('#discount-info').hide();
	$('#expectPoint').css('display', 'none');
	
	$("input[name='pay-method']").change(function(){
		$('#expectPoint').css('display', 'none');
		// 계좌이체 선택 시.
		if($("input[name='pay-method']:checked").val() == '계좌이체'){
			$('#credit-card-option').hide();
			$('#coupay-money-option').hide();
			$('#corporation-card-option').hide();
			$('#phone-option').hide();
			$('#deposit-without-bankbook-option').hide();
			$('#account-transfer-option').show();
			$('#cash-receipt').show();
			$('#deposit-without-bankbook-option-caution').hide();
			$('#selectPay').hide();
			$('#basicPay').show();
			$('#discount-info').hide();
			
			
			$('#L_account-transfer').addClass("payMethod-arrow");
			$("#L_coupay-money").removeClass("payMethod-arrow");
			$("#L_credit-card").removeClass("payMethod-arrow");
			$("#L_corporation-card").removeClass("payMethod-arrow");
			$("#L_phone").removeClass("payMethod-arrow");
			$("#L_deposit-without-bankbook").removeClass("payMethod-arrow");
		}	
		
		// 쿠페이머니 선택 시.
		else if($("input[name='pay-method']:checked").val() == '쿠페이머니'){
			$('#credit-card-option').hide();
			$('#coupay-money-option').show();
			$('#corporation-card-option').hide();
			$('#phone-option').hide();
			$('#deposit-without-bankbook-option').hide();
			$('#account-transfer-option').hide();
			$('#cash-receipt').show();
			$('#deposit-without-bankbook-option-caution').hide();
			$('#selectPay').hide();
			$('#basicPay').show();
			$('#discount-info').hide();
			$('#expectPoint').css('display', 'inline-block');
			
			
			$("#L_coupay-money").addClass("payMethod-arrow");
			$('#L_account-transfer').removeClass("payMethod-arrow");
			$("#L_credit-card").removeClass("payMethod-arrow");
			$("#L_corporation-card").removeClass("payMethod-arrow");
			$("#L_phone").removeClass("payMethod-arrow");
			$("#L_deposit-without-bankbook").removeClass("payMethod-arrow");
		}
		
		// 신용/체크카드 결제 선택 시.
		else if($("input[name='pay-method']:checked").val() == '신용/체크카드'){
			$('#credit-card-option').show();
			$('#coupay-money-option').hide();
			$('#corporation-card-option').hide();
			$('#phone-option').hide();
			$('#deposit-without-bankbook-option').hide();
			$('#account-transfer-option').hide();
			$('#cash-receipt').hide();
			$('#deposit-without-bankbook-option-caution').hide();
			$('#selectPay').hide();
			$('#basicPay').show();
			$('#discount-info').show();
			$('#cash-receipt').prop('checked', false);
			
			$("#L_credit-card").addClass("payMethod-arrow");
			$("#L_coupay-money").removeClass("payMethod-arrow");
			$('#L_account-transfer').removeClass("payMethod-arrow");
			$("#L_corporation-card").removeClass("payMethod-arrow");
			$("#L_phone").removeClass("payMethod-arrow");
			$("#L_deposit-without-bankbook").removeClass("payMethod-arrow");
		}
		
		// 법인카드 선택 결제 시
		else if($("input[name='pay-method']:checked").val() == '법인카드'){
			$('#credit-card-option').hide();
			$('#coupay-money-option').hide();
			$('#corporation-card-option').show();
			$('#phone-option').hide();
			$('#deposit-without-bankbook-option').hide();
			$('#account-transfer-option').hide();
			$('#cash-receipt').hide();
			$('#cash-receipt').prop('checked', false);
			$('#deposit-without-bankbook-option-caution').hide();
			$('#selectPay').hide();
			$('#basicPay').show();
			$('#discount-info').hide();
			
			$("#L_corporation-card").addClass("payMethod-arrow");
			$("#L_credit-card").removeClass("payMethod-arrow");
			$("#L_coupay-money").removeClass("payMethod-arrow");
			$('#L_account-transfer').removeClass("payMethod-arrow");
			$("#L_phone").removeClass("payMethod-arrow");
			$("#L_deposit-without-bankbook").removeClass("payMethod-arrow");
		}
		
		// 휴대폰 선택 결제 시
		else if($("input[name='pay-method']:checked").val() == '휴대폰'){
			$('#credit-card-option').hide();
			$('#coupay-money-option').hide();
			$('#corporation-card-option').hide();
			$('#phone-option').show();
			$('#deposit-without-bankbook-option').hide();
			$('#account-transfer-option').hide();
			$('#cash-receipt').hide();
			$('#deposit-without-bankbook-option-caution').hide();
			$('#selectPay').show();
			$('#basicPay').hide();
			$('#discount-info').hide();
			$("#L_phone").addClass("payMethod-arrow");
			$('#cash-receipt').prop('checked', false);
			
			$("#L_credit-card").removeClass("payMethod-arrow");
			$("#L_corporation-card").removeClass("payMethod-arrow");
			$("#L_coupay-money").removeClass("payMethod-arrow");
			$('#L_account-transfer').removeClass("payMethod-arrow");
			$("#L_corporation-card").removeClass("payMethod-arrow");
			$("#L_deposit-without-bankbook").removeClass("payMethod-arrow");
		}
		
		// 무통장입금 선택 결제 시
		else if($("input[name='pay-method']:checked").val() == '무통장입금'){
			$('#credit-card-option').hide();
			$('#coupay-money-option').hide();
			$('#corporation-card-option').hide();
			$('#phone-option').hide();
			$('#deposit-without-bankbook-option').show();
			$('#account-transfer-option').hide();
			$('#cash-receipt').show();
			$('#deposit-without-bankbook-option-caution').show();
			$('#selectPay').hide();
			$('#basicPay').show();
			$('#discount-info').hide();
			
			$("#L_phone").removeClass("payMethod-arrow");
			$("#L_corporation-card").removeClass("payMethod-arrow");
			$("#L_coupay-money").removeClass("payMethod-arrow");
			$('#L_account-transfer').removeClass("payMethod-arrow");
			$("#L_corporation-card").removeClass("payMethod-arrow");
			$("#L_credit-card").removeClass("payMethod-arrow");
			
			$("#L_deposit-without-bankbook").addClass("payMethod-arrow");
		}
	});
	
	
	//현금 영수증 체크박스에 따라 아래 요소 숨기기
	$('#cash-receipt-type').hide();
	$('#cash-receipt-application').click(function(){
		   
		var checked = $('#cash-receipt-application').prop('checked');
		if (checked) {
			 $('#cash-receipt-type').show();
			 
	 	} else if (!checked) {
			 
			 $('#cash-receipt-type').hide();
 	 	}
	});
	
	//현금 영수증 라디오박스에 따라 요소 바꾸기
	$('#proof-of-expenditure-option').hide();
	$("input[name='cash-receipt-type']").change(function(){
		// 계좌이체 선택 시.
		if($("input[name='cash-receipt-type']:checked").val() == 'income-deduction'){
			$('#income-deduction-option').show();
			$('#proof-of-expenditure-option').hide();
			
			var select = $("#income-deduction-option option:selected").val();
			if(select === "pnum") {
				$('#numErr1').show();
				$('#numErr2').hide();
				$('#numErr3').hide();
			} else if(select === "cash-card"){
				$('#numErr1').hide();
				$('#numErr2').show();
				$('#numErr3').hide();
			}
			
		} else if($("input[name='cash-receipt-type']:checked").val() == 'proof-of-expenditure'){
			$('#proof-of-expenditure-option').show();
			$('#income-deduction-option').hide();
			var select = $("#proof-of-expenditure-option option:selected").val();
			
			if(select === "cash-card") {
				$('#numErr1').hide();
				$('#numErr2').show();
				$('#numErr3').hide();
			} else if(select === "biznum"){
				$('#numErr1').hide();
				$('#numErr2').hide();
				$('#numErr3').show();
			}
		}
	});
	
	//현금 영수증 체크박스에 따라 인풋 넘버 바꾸기
	$('#numErr1').show();
	$('#numErr2').hide();
	$('#numErr3').hide();
	
	$('#income-deduction-option').change(function(){
		$('#numErr1').hide();
		$('#numErr2').hide();
		$('#numErr3').hide();
		var select = $("#income-deduction-option option:selected").val();
		if(select === "pnum") {
			$('#numErr1').show();
			$('#numErr2').hide();
			$('#numErr3').hide();
		} else if(select === "cash-card"){
			$('#numErr1').hide();
			$('#numErr2').show();
			$('#numErr3').hide();
		}
	});

	$('#proof-of-expenditure-option').change(function(){
		$('#numErr1').hide();
		$('#numErr2').show();
		$('#numErr3').hide();
		var select = $("#proof-of-expenditure-option option:selected").val();
		if(select === "cash-card") {
			$('#numErr1').hide();
			$('#numErr2').show();
			$('#numErr3').hide();
		} else if(select === "biznum"){
			$('#numErr1').hide();
			$('#numErr2').hide();
			$('#numErr3').show();
		}
	});
	

	//할인쿠폰 입력 클릭 이벤트
	$('#dicountRow').hide();
	$('#couponSelect').click(function(){
		  $('#dicountRow').toggle();
		  
	});
	
	
    

	$('.couponUse').change(function(){
		  var selectedCouponValue = parseFloat($('input[name=coupon_no]:checked').next().first().val());

		  if (selectedCouponValue !== 0) {
		        var totalPrice = parseFloat($('.totalPrice').text());
		        var couponPrice;

		        if (selectedCouponValue >= 100) {
		            if(selectedCouponValue == 2500) {
		            	 var delFee = $('#delFee').text(0);
		            	 couponPrice = selectedCouponValue;
		            } else {
		            	couponPrice = selectedCouponValue;
		        		var delFee = $('#delFee').text(2500);
		            }
		        } else {
		            couponPrice = Math.floor(totalPrice * (selectedCouponValue / 100));
		        }

		        $('#discount').text(couponPrice);
		        priceCalculate();
		  } else {
		        $('#discount').text('0');
		        priceCalculate();
		  }
	});
		
	//쿠팡캐시 입력 클릭 이벤트
	$('#cuCashrow').hide();
	$('#cuCashInput').click(function(){
		$('#cuCashrow').toggle();
		
	});
		
		
	//쿠팡캐시 모두사용 체크 이벤트
	$('#allUse').click(function(){
		  if($("#allUse").is(":checked")){
	      var allCash = parseInt($('#cuBal').text());
	        //$('#cuCash').attr('value', allCash);
	      $('#cuCash').val(allCash);
	            console.log(allCash);
	            console.log(cuCash);
	      } else if(!$("#allUse").is(":checked")){
	        	$('#cuCash').val(0);
	      }
	});
		
	//쿠팡캐시 적용 클릭 이벤트
	$('#cuCashApply').click(function(){
		  $("#cashOver").css("display", "none"); 	
		  var balance = parseInt( $('#cuBal').text())
			 	
		  if(($("#cuCash").val())>balance){
				console.log($("#cuCash").val());
				$("#cashOver").css("display", "block");
				
		  } else if(($("#cuCash").val())<=balance) {
				$("#balance").text('-' + $('#cuCash').val()); 
				$('#cuCashrow').hide();
				priceCalculate();
				
		  } else {
				console.log($("#cuCash").val());
				$('#cuCash').val(0);
				priceCalculate();
				$("#balance").text($('#cuCash').val()); 
		  }
	});
		
	//계좌이체 선택 유효성 검사
	$('#account-transfer-no-choice').hide();
	$('#account-transfer-choice-bank').change(function(){

		  $('#account-transfer-no-choice').hide();
		  var nonselect = $("#account-transfer-choice-bank option:selected").val();
		
		  if(nonselect === "none") {
				$('#account-transfer-no-choice').show();
		  } else {
				$('#account-transfer-no-choice').hide();
		  }
	});
	
	//할부기간 알림 메세지
	$('#interest-free-note').hide();
	$('#installment-period').change(function(){
		
		$('#interest-free-note').hide();
		var select = $("#installment-period option:selected").val();
		
		if(select === "pay-in-full") {
			$('#interest-free-note').hide();
			$('#pay-in-full-note').show();
			
		} else if(select !== "pay-in-full"){
			$('#interest-free-note').show();
			$('#pay-in-full-note').hide();
		}
	});
	//법인카드 선택 유효성 검사
	$('#coporation-card-no-choice').hide();
	$('#coporation-card-choice').change(function(){
		
		$('.account-transfer-no-choice').hide();
		var nonselect = $("#coporation-card-choice option:selected").val();
		
		if(nonselect === "none") {
			$('#coporation-card-no-choice').show();
		} else {
			$('#coporation-card-no-choice').hide();
		}
	});
	
	//통신사 선택 유효성 검사
	$('#mobile-corp-no-choice').hide();
	$('#mobile-corp').change(function(){
		
		$('mobile-corp-no-choice').hide();
		var nonselect = $("#mobile-corp option:selected").val();
		
		if(nonselect === "none") {
			window.alert("통신사를 선택해주세요");
			$('#mobile-corp-no-choice').show();
		} else {
			$('#mobile-corp-no-choice').hide();
		}
	});
	
	//무통장입금 계좌 선택 유효성 검사
	$('#bank-no-choice').hide();
	$('#bank-choice').change(function(){
		
		$('bank-no-choice').hide();
		var nonselect = $("#bank-choice option:selected").val();
		
		if(nonselect === "none") {
			$('#bank-no-choice').show();
		} else {
			$('#bank-no-choice').hide();
		}
	});
	
	//무통장입금 계좌 선택 유효성 검사
	$('#bank-no-choice').hide();
	$('#bank-choice').change(function(){
		
		$('bank-no-choice').hide();
		var nonselect = $("#bank-choice option:selected").val();
		
		if(nonselect === "none") {
			$('#bank-no-choice').show();
		} else {
			$('#bank-no-choice').hide();
		}
	});
	
	//현금영수증 선택 유효성 검사
	$('#biznumErr').hide();
	$('#telnumErr').hide();
	$('#cashnumErr').hide();
		
		$('.payb').click(function(){
			//현금 영수증 수정 유효성 검사
			$('#biznumErr').hide();
			$('#telnumErr').hide();
			$('#cashnumErr').hide();
			if($("input[name='cash-receipt-type']:checked").val() == 'income-deduction'){
				var select = $("#income-deduction-option option:selected").val();
				if(select === "pnum") {
					var tel = $("#numErr1").val();
					console.log(tel);
					if(tel ==="") {
						console.log(tel);
						$('#biznumErr').hide();
						$('#cashnumErr').hide();
						$('#telnumErr').show();
						console.log(select);
					} else{
						var pattern = /^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
						var result = pattern.test(tel);
						if(!result) {
				   			$('#biznumErr').hide();
				   			$('#cashnumErr').hide();
				   			$('#telnumErr').show();
						}
				}
				
				} else if(select === "cash-card"){
					var cashnum = $("#numErr2").val();
					if(cashnum ==="") {
						$('#biznumErr').hide();
						$('#telnumErr').hide();
						$('#cashnumErr').show();
					} else {
						var pattern = /^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
						var result = pattern.test(cashnum);
						if(!result) {
				   			$('#biznumErr').hide();
				   			$('#telnumErr').hide();
				   			$('#cashnumErr').show();
						}
					}
				}
			} else {
				
				$('#biznumErr').hide();
				$('#telnumErr').hide();
				$('#cashnumErr').hide();
				
				var select = $("#proof-of-expenditure-option option:selected").val();
					
					if(select === "cash-card") {
						//현금영수증카드번호 수정 유효성 검사	
						var cashnum = $("#numErr2").val();
						if(cashnum ==="") {
							$('#biznumErr').hide();
							$('#telnumErr').hide();
							$('#cashnumErr').show();
						} else {
							var pattern = /^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
							var result = pattern.test(cashnum);
							if(!result) {
				   				$('#biznumErr').hide();
				   				$('#telnumErr').hide();
				   				$('#cashnumErr').show();
							}
						}
					} else if(select === "biznum"){
						//사업자번호 수정 유효성 검사
						var biznum = $("#numErr3").val();	
							if(biznum ==="") {
								$('#telnumErr').hide();
								$('#cashnumErr').hide();
								$('#biznumErr').show();
							} else {
								var pattern = /^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
								var result = pattern.test(biznum);
								if(!result) {
					   				$('#telnumErr').hide();
					   				$('#cashnumErr').hide();
					   				$('#biznumErr').show();
								}
							}
						}
				}
			})
});


function checkValidation() {
	
    var isValidation = true;
   	
   	var addressNo = $('#addressNo').val();
   	if(addressNo == null) {
   		isValidation = false;
   	}
	console.log(isValidation+"결제성공?");
	//계좌이체
	if($("input[name='pay-method']:checked").val() == '계좌이체'){
	   	var nonselect1 = $("#account-transfer-choice-bank option:selected").val();
		if(nonselect1 === "none") {
			isValidation = false;
		} 
	}	
	
	//신용/체크카드
	if($("input[name='pay-method']:checked").val() == '신용체크'){
		var nonselect2 = $("#credit-card-option option:selected").val();
		if(nonselect2 === "none") {
			isValidation = false;
		} 
	}
	
	//법인카드
	if($("input[name='pay-method']:checked").val() == '법인카드'){
		var nonselect3 = $("#coporation-card-choice option:selected").val();
		if(nonselect3 === "none") {
			isValidation = false;
		} 
	}	
	
	//휴대폰
	if($("input[name='pay-method']:checked").val() == '휴대폰'){
		var nonselect3 = $("#mobile-corp option:selected").val();
		if(nonselect3 === "none") {
			isValidation = false;
		} 
	}	
	
	//무통장
	if($("input[name='pay-method']:checked").val() == '무통장입금'){
		var nonselect4 = $("#bank-choice option:selected").val();
		if(nonselect4 === "none") {
			isValidation = false;
		}
	}	
   	
   //현금 영수증 체크박스 유효성검사
	console.log(isValidation+"결제성공?");
	var checked = $('#cash-receipt-application').prop('checked');
	if (checked) {
		var check1 = $("#income-deduction-option option:selected").val();
		if(check1 === "pnum") {
			var numErr1 = $("#numErr1").val();
			if(numErr1 === null) {
				isValidation = false;
			}
		} else if(check2 === "cash-card") {
			var numErr2 = $("#numErr2").val();
			if(numErr2 === null) {
				isValidation = false;
			}
		}
		
		var check3 = $("#proof-of-expenditure-option option:selected").val();
		if(check3 === "cash-card") {
			var numErr2 = $("#numErr2").val();
			if(numErr1 === null) {
				isValidation = false;
			}
		} else if(check4 === "biznum") {
			var numErr3 = $("#numErr3").val();
			if(numErr3 === null) {
				isValidation = false;
			}
		}
	}
	console.log(isValidation+"결제성공?");
	if(!isValidation) {
		event.preventDefault();
		window.alert('결제에 실패하였습니다.');
	}/* else {
		var coupon_no = $('input[name=coupon]:checked').next().first().val();
		
		if (coupon_no === undefined) {
		    coupon_no = 0;
		} else {
		    coupon_no = parseInt(coupon_no);
		}
		
		var address_no = $("input[name='address_no']").val();
		var address_request = $("input[name='address_request']").val();
		var order_cashReceipt = $("input[name='order_cashReceipt']").val();
		if(order_cashReceipt === "on") {
			order_cashReceipt = true
		} else {
			order_cashReceipt = false;
		}
		var order_del_fee = $("input[name='order_del_fee']").val();
		
		
		
	    // 서버로 전송할 데이터 생성
	    var postData = {
	    	address_no: address_no,
	    	address_request: address_request,
	    	order_cashReceipt: order_cashReceipt,
	    	order_del_fee: order_del_fee,
	    	coupon_no: coupon_no
	    };
	    
	    // AJAX 요청으로 데이터 전송
	    $.ajax({
	    	 type: "POST",
	    	    url: "/our-twinkling-infinitely/orderPay",
	    	    contentType: "application/json", // JSON 형식으로 전송
	    	    data: JSON.stringify(postData),   // 데이터를 JSON 문자열로 변환
	    	    dataType: "json",                // 응답 데이터 형식 지정
	    	    success: function(response) {
	    	        // 서버 응답 처리
	    	        alert("데이터가 성공적으로 전달 완료되었습니다.");
	    	    },
	    	    error: function() {
	    	        // 오류 처리
	    	        alert("데이터 전송 중 오류가 발생했습니다.");
	    	    }
	    	});
	}*/
    
}

