//ready 이벤트가 발생했을 때 실행할 핸들러 함수 설정.
$(init);

function init() {
	var joinForm = $("#joinForm");
	$("#submit").click(checkValidation);
	$("#uname").blur(onBlurName);
	$("#utel").blur(onBlurTel);
	$("#addButton").click(addContact);
	$("#modalButton").click(showModal);
	$("#close").click(closeModalByX);
	$("#selectRequest").click(selectRequest);
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

function checkValidation() {
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
	}else if(!result) {
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
	
	if(!isValidation) {
		event.preventDefault();
		console.log("제출 안됨");
	}
}

function addContact() {
	$("#contactBox").removeClass("d-none");
	$("#addButton").addClass("d-none");
	
	if (matchMedia("screen and (min-width: 1250px)").matches) {
		$("#utel").css("width", 750);
	}else if(matchMedia("screen and (max-width: 768px)").matches) {
		$("#utel").css("width", 440);		
	}
	
	window.onresize = function(){
		  document.location.reload();
	};
}

function removeContact() {
	$("#contactBox").addClass("d-none");
	$("#addButton").removeClass("d-none");
	
	if (matchMedia("screen and (min-width: 1250px)").matches) {
		$("#utel").css("width", 700);
	}else if(matchMedia("screen and (max-width: 768px)").matches) {
		$("#utel").css("width", 400);		
	}
	
	window.onresize = function(){
		  document.location.reload();
	};
}

function showModal() {
	$("#requestModal").css("display", "block");
}

function closeModalByX() {
	$("#requestModal").css("display", "none");
}

function selectRequest() {
	var listVar = $("input[name=requestType]:checked").val();
	$("#deliveryNotify").val(listVar);
	$("#requestModal").css("display", "none");
}
function findAddress() {
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