$(init)

//결제 페이지 실행시 불러들이는 값
function init(){
	priceCalculate();
	couponList();
	date();
}
//basket에서 check 옵션을 선택 유효성 검사
$(document).ready(function() {
	//필수 옵션을 선택 안했을 때 유효성 검사(구매하기)
	$("#orderForm").submit(function(event) {
		if ($(".pchk:checked").length == 0) { // 옵션이 선택되지 않았을 경우
			alert("구매하실 상품을 선택해주세요");
			event.preventDefault(); // 폼 제출 막기
		}
		
	});
});
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

function date() {
	 var today = new Date();
     var futureDate = new Date(today);
     futureDate.setDate(today.getDate() + 3);
     
     var year = futureDate.getFullYear();
     var month = String(futureDate.getMonth() + 1).padStart(2, '0');
     var day = String(futureDate.getDate()).padStart(2, '0');
     var dayOfWeek = ['일', '월', '화', '수', '목', '금', '토'][futureDate.getDay()];
     
     var formattedDate = year + '/' + month + '/' + day + ' (' + dayOfWeek + ')까지 도착 예정';
     
     $("#date").val(formattedDate);
	
	
}

function validateForm() {
	consolelog("실행ssss");
	event.preventDefault();
    // 체크된 체크박스가 있는지 확인합니다.
    if (!$(".pchk:checked").length > 0) {
        alert("상품을 하나 이상 선택해주세요.");
        return false; // 폼 제출 방지
    }
    return true; // 폼 제출 허용
}
//결제 금액 계산
function priceCalculate() {
	
	var totalPrice = parseInt($('.totalPrice').text().replace(/,/gi, ""));
	console.log("totalPrice : "+ totalPrice);
	var discount =parseInt($('#discount').text().replace(/,/gi, ""));	
	console.log("discount : "+ discount);

	var delFee =parseInt($('#delFee').text().replace(/,/gi, ""));
	console.log("delFee : "+ delFee);
	
	var balance =$('#balance').val();
	console.log("balance : "+ balance);
	if(balance === ""){
		balance = 0;
		$('#balance').val(0);
	}
	var price = $('#price').val();
	console.log("price : "+price);
	
	
	
	price = totalPrice - discount + delFee - balance;
	
	
	point = parseInt(price * 0.005); 
	console.log("point : " + point);
	if(price <= 0) {
		$('#price').val(0);
		$('#point').val(0);
		
	} else {
		$('#price').val(price);
		$('#point').val(point);
	}
}

function openAdress() {
   	window.open("/our-twinkling-infinitely/addressSelect", "winLogin", "left=350, top=300, width=560, height=650");
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
	
	$("input[name='pay-method']").change(function(){
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
		  var selectedCouponValue = parseFloat($('input[name="coupon_coupon_no"]:checked').next().first().val());
		  console.log("selectedCouponValue는?", selectedCouponValue);
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
		$("#cashOver").css("display", "none"); 
		
	});
		
		
	//쿠팡캐시 모두사용 체크 이벤트
	$('#allUse').click(function(){
		var totalPrice = parseInt($('.totalPrice').text().replace(/,/gi, ""));
		var discount =parseInt($('#discount').text().replace(/,/gi, ""));	
		var delFee =parseInt($('#delFee').text().replace(/,/gi, ""));
		
		var limit = totalPrice - discount + delFee; 
		
		  if($("#allUse").prop("checked")){
	      var allCash = parseInt($('#cuBal').text());
	      	if(limit<allCash){
	      		$('#cuCash').val(limit);
	      	} else {
	      		$('#cuCash').val(allCash);
	      	}    
	      } else {
	        	$('#cuCash').val(0);
	      }
	});
		
	//쿠팡캐시 적용 클릭 이벤트
	$('#cuCashApply').click(function(){
		  $("#cashOver").css("display", "none"); 	
		  var balance = parseInt( $('#cuBal').text());
		  
		  var totalPrice = parseInt($('.totalPrice').text().replace(/,/gi, ""));
		  var discount =parseInt($('#discount').text().replace(/,/gi, ""));	
		  var delFee =parseInt($('#delFee').text().replace(/,/gi, ""));
			
		  var limit = totalPrice - discount + delFee; 
		  
			 	
		  if(($("#cuCash").val())>balance){
				console.log($("#cuCash").val());
				$("#cashOver").css("display", "block");
				
		  } else if(($("#cuCash").val())<=balance) {
			    if(($("#cuCash").val())<=limit){
				      $("#balance").val($('#cuCash').val());
				      $('#cuCashrow').hide();
				      priceCalculate();
			    } else {
			    	  console.log($("#cuCash").val());
					  $("#cashOver").css("display", "block");
			    }	    
		  } else {
				console.log($("#cuCash").val());
				$('#cuCash').val(0);
				priceCalculate();
				$("#balance").val($('#cuCash').val()); 
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
	
    
   	
   	var addressNo = $('#addressNo').val();
   	console.log(addressNo+"배송지번호");
   	if(addressNo == null) {
   		isValidation = false;
   		alert("배송지를 선택해주세요");
   	}
   	if(addressNo === "") {
   		isValidation = false;
   		alert("배송지를 선택해주세요");
   	}
	console.log(isValidation+"유효성");
	
	//계좌이체
	if($("input[name='pay-method']:checked").val() == '계좌이체'){
	   	var nonselect1 = $("#account-transfer-choice-bank option:selected").val();
		if(nonselect1 === "none") {
			isValidation = false;
			alert("은행을 선택해주세요");
		} 
	}	
	
	//신용/체크카드
	if($("input[name='pay-method']:checked").val() == '신용체크'){
		var nonselect2 = $("#credit-card-option option:selected").val();
		if(nonselect2 === "none") {
			isValidation = false;
			alert("카드를 선택해주세요");
		} 
	}
	
	//법인카드
	if($("input[name='pay-method']:checked").val() == '법인카드'){
		var nonselect3 = $("#coporation-card-choice option:selected").val();
		if(nonselect3 === "none") {
			isValidation = false;
			alert("카드를 선택해주세요");
		} 
	}	
	
	//휴대폰
	if($("input[name='pay-method']:checked").val() == '휴대폰'){
		var nonselect3 = $("#mobile-corp option:selected").val();
		if(nonselect3 === "none") {
			isValidation = false;
			alert("통신사를 선택해주세요");
		} 
	}	
	
	//무통장
	if($("input[name='pay-method']:checked").val() == '무통장입금'){
		var nonselect4 = $("#bank-choice option:selected").val();
		if(nonselect4 === "none") {
			isValidation = false;
			alert("은행을 선택해주세요");
		}
	}	
   	
   //현금 영수증 체크박스 유효성검사
	console.log(isValidation+"결제성공?");
	var checked = $('#cash-receipt-application').prop('checked');
	if (checked) {
		var check1 = $("#income-deduction-option option:selected").val();
		if(check1 === "pnum") {
			var numErr1 = $("#numErr1").val();
			if(numErr1 === "") {
				isValidation = false;
			}
		} else if(check2 === "cash-card") {
			var numErr2 = $("#numErr2").val();
			if(numErr2 === "") {
				isValidation = false;
			}
		}
		
		var check3 = $("#proof-of-expenditure-option option:selected").val();
		if(check3 === "cash-card") {
			var numErr2 = $("#numErr2").val();
			if(numErr1 === "") {
				isValidation = false;
			}
		} else if(check4 === "biznum") {
			var numErr3 = $("#numErr3").val();
			if(numErr3 === "") {
				isValidation = false;
			}
		}
	}
	console.log(isValidation+"결제성공?");
	
	if(!isValidation) {
		event.preventDefault();
		window.alert('결제에 실패하였습니다.');
	} else {
		if(window.confirm("결제하시겠습니까??")){
			location.href="/our-twinkling-infinitely/orderPay";
		} else {
			event.preventDefault();
		}
		
	}
    
}

