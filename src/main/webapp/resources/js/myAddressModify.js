//ready 이벤트가 발생했을 때 실행할 핸들러 함수 설정.
$(init);

function init() {
	$("#uname").blur(onBlurName);
	$("#utel").blur(onBlurTel);
	$("#modalButton").click(showModal);
	$("#close").click(closeModalByX);
	$("#agreeSave").click(agreeSave);
}

const autoHyphen = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
}
	
function onBlurName() {
	var uname = $("#uname").val();
	var namePattern = /^[가-힣a-zA-Z]+$/;
	var result = namePattern.test(uname);
	
	var unameErr1 = $("#unameErr1");
	var unameErr2 = $("#unameErr2");
	
	unameErr1.addClass("d-none");
	unameErr2.addClass("d-none");
	
	if(uname === "") {
		unameErr1.removeClass("d-none");
		unameErr1.addClass("redLine");
	}else if(!result) {
		unameErr2.removeClass("d-none");
	}
}

function onBlurTel() {
	var utel = $("#utel").val();
	var telPattern = /^\d{3}-\d{3,4}-\d{4}$/;
	var result = telPattern.test(utel);
	
	var utelErr1 = $("#utelErr1");
	var utelErr2 = $("#utelErr2");
	
	utelErr1.addClass("d-none");
	utelErr2.addClass("d-none");

	if(utel === "") {
		utelErr1.removeClass("d-none");
		utelErr1.addClass("redLine");
	}else if(!result) {
		utelErr2.removeClass("d-none");
	}
}

function checkValidation(event) {
	let isValidation = true;
	var errorMsgs = $(".errorMsg");
	errorMsgs.each((index, el) => $(el).addClass("d-none"));
	
	var uname = $("#uname").val();
	var namePattern = /^[가-힣a-zA-Z]+$/;
	var result = namePattern.test(uname);
	
	var unameErr1 = $("#unameErr1");
	var unameErr2 = $("#unameErr2");
	
	unameErr1.addClass("d-none");
	unameErr2.addClass("d-none");
	
	if(uname === "") {
		unameErr1.removeClass("d-none");
		unameErr1.addClass("redLine");
		isValidation = false;
	} else if(!result) {
		unameErr2.removeClass("d-none");
		isValidation = false;
	}
	
	var roadAddress = $("#roadAddress").val();
	
	var uaddressErr = $("#uaddressErr");
	
	uaddressErr.addClass("d-none");
	
	if(roadAddress == "도로명주소") {
		uaddressErr.removeClass("d-none");
		uaddressErr.addClass("redLine");
		isValidation = false;
	}
	
	var utel = $("#utel").val();
	var telPattern = /^\d{3}-\d{3,4}-\d{4}$/;
	var result = telPattern.test(utel);
	
	var utelErr1 = $("#utelErr1");
	var utelErr2 = $("#utelErr2");
	
	utelErr1.addClass("d-none");
	utelErr2.addClass("d-none");

	if(utel === "") {
		utelErr1.removeClass("d-none");
		utelErr1.addClass("redLine");
		isValidation = false;
	}else if(!result) {
		utelErr2.removeClass("d-none");
		isValidation = false;
	}
	
	var deliveryNotify = $("#deliveryNotify").val();
	
	var deliveryNotifyErr = $("#deliveryNotifyErr");
	
	deliveryNotifyErr.addClass("d-none");
	
	if(deliveryNotify === "") {
		deliveryNotifyErr.removeClass("d-none");
		deliveryNotifyErr.addClass("redLine");
		isValidation = false;
	}
	
	if(!isValidation) {
		event.preventDefault();
		console.log("제출 안됨");
	}
}

function showModal() {
	$("#requestModal").css("display", "block");
}

function closeModalByX() {
	$("#requestModal").css("display", "none");
}

function agreeSave() {
	var listVar = $("input[name=select]:checked").val() + " " +  $("#boxNo").val() + " " + $("#etcName").val() + " " + $("input[name=pwdselect]:checked").val() + $("#pwdNo").val();
	$("#deliveryNotify").val(listVar);
	$("#requestModal").css("display", "none");
}
function findAddress() {
	var uaddressErr = $("#uaddressErr");
	uaddressErr.addClass("d-none");
	
    new daum.Postcode({
        oncomplete: function(data) {
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            extraRoadAddr += data.bname;
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            extraRoadAddr = ' (' + extraRoadAddr + ')';

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("roadAddress").value = roadAddr;
            if(data.jibunAddress == null) {
            	document.getElementById("jibunAddress").value = "";            	
            }else {
            	document.getElementById("jibunAddress").value = data.jibunAddress;            	
            }
            document.getElementById("extraAddress").value = extraRoadAddr;

        }
    }).open();
}

$(document).ready(function(){
	 $("input").blur(function(event) {
		 if($(event.target).attr('id') == "deliveryNotify") { 
		      let isValidation = true;
	 
		      utel = $("#utel").val( $("#utel").val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
		  	
		  	  var deliveryNotify = $("#deliveryNotify").val();
		  	  var deliveryNotifyErr = $("#deliveryNotifyErr");
		      deliveryNotifyErr.addClass("d-none");
		  	
		      if(deliveryNotify === "") {
		  	  	  deliveryNotifyErr.removeClass("d-none");
		  		  deliveryNotifyErr.addClass("redLine");
		  		  isValidation = false;
		   	  }
		  	  if(!isValidation) {
				  event.preventDefault();
				  console.log("제출 안됨");
			}
		 }
	 });
	 
	 $("input[name='select']").change(function(){
			$('#show1').css('display', 'none');
			$('#show2').css('display', 'none');
			// 계좌이체 선택 시.
			if($("input[name='select']:checked").val() == '택배함'){
				$('#show1').css('display', 'block');
				$('#show2').css('display', 'none');
			}else if($("input[name='select']:checked").val() == '기타사항'){
				$('#show2').css('display', 'block');
				$('#show1').css('display', 'none');
			} else {
				$('#show1').css('display', 'none');
				$('#show2').css('display', 'none');
			}
				
		});
			
		$("#pwdNo").click(function(){
			$("#pwdY").prop('checked', true);
		});
});		

function modifyAddress() {
	var event = new Event("submit");
	checkValidation(event);
	var form1 = $("#modifyForm").serialize();
	$.ajax({
		url: "modifyForm",
		type: "post",
		data: form1,
		success: function(data) {
			$("#addressList").html(data);
		},
		error: function(error) {
			console.log(error);
		}
	});
}

function deleteAddress(address_no) {
	
	$.ajax({
		url: "deleteAddress",
		type: "post",
		data: {
			"address_no" : address_no
		},
		success: function(data) {
			$("#addressList").html(data);
		},
		error: function(error) {
			console.log(error);
		}
	});
}
