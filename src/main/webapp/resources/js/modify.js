$(init)

function init() {
	modifyCheck();
}

function modifyCheck() {
	var modifyMsg = $("#modifyMsg").val();
	console.log(modifyMsg);
	if(modifyMsg!="") {
		alert(modifyMsg);
		
	}
	
}

function unjoin() {
	if(window.confirm("탈퇴하시겠습니까?")){
		location.href="/our-twinkling-infinitely/unjoin";
	}
}


//폼 제출 시 유효성 검사
function checkValidation() {
	
    var isValidation = true;
    
   	//모든 에러 메세지를 보여주지 않도록 초기화
   	var errorMsgs = $(".errorMsg");
   	console.log(errorMsgs);
   	errorMsgs.each(function(index, item) {
   		$(item).addClass("d-none");
   		
   	});
  
	//pwd검사
	var pwd = $("#pwd").val();
	var pwdErr1 = $("#pwdErr1");
	var pwdErr2 = $("#pwdErr2");
	console.log("pwd: " + pwd);
		if(pwd ==="") {
			isValidation = false;
			pwdErr2.addClass("d-none");
			pwdErr1.removeClass("d-none");
		} else {
			var pattern = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,20}$/;
    		var result = pattern.test(pwd);
    		if(!result) {
    			isValidation = false;
    			pwdErr2.removeClass("d-none");
    			pwdErr1.addClass("d-none");
    		} else {
    			pwdErr2.addClass("d-none");
    			pwdErr1.addClass("d-none");
    		}
    	}
		

			
	//pwd-check 검사
	var pwdCheck = $("#pwd-check").val();
	var pwdCheckErr1 = $("#pwdCheckErr1");
	var pwdCheckErr2 = $("#pwdCheckErr2");
	
	console.log("pwdCheck: " + pwdCheck);
	if(pwdCheck === "") {
		isValidation = false;
		pwdCheckErr2.addClass("d-none");
		pwdCheckErr1.removeClass("d-none");
			
	} else {
		var result = $("#pwd").val();
		if(pwdCheck !== result) {
			isValidation = false;
			pwdCheckErr2.removeClass("d-none");
			pwdCheckErr1.addClass("d-none");
		} else {
			pwdCheckErr2.addClass("d-none");
			pwdCheckErr1.addClass("d-none");
		}
	}

    	
	
	
	//email 검사
	var email = $("#email").val();
	console.log("email: " + email);
	var emailErr1 = $("#emailErr1");
	var emailErr2 = $("#emailErr2");
	var emailErr3 = $("#emailErr3");
	if(email === "") {
		isValidation = false;
		emailErr2.addClass("d-none");
		emailErr3.addClass("d-none");
		emailErr1.removeClass("d-none");
			
	} else {
		var pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var result = pattern.test(email);
		if(!result) {
			isValidation = false;
			emailErr1.addClass("d-none");
			emailErr2.removeClass("d-none");
			emailErr3.addClass("d-none");
		} else {
			emailErr2.addClass("d-none");
			emailErr3.addClass("d-none");
			emailErr1.addClass("d-none");
		}
	}
	
	
	//name 검사
	var name = $("#name").val();
	console.log("name: " + name);
	var nameErr = $("#nameErr");
	if(name === "") {
		isValidation = false;
		nameErr.removeClass("d-none");
	} else {
		var pattern =/^[가-힣]{2,20}|[a-zA-Z]{2,20}\s[a-zA-Z]{2,20}$/;
		var result = pattern.test(name);
		if(!result) {
			isValidation = false;
			nameErr.removeClass("d-none");
		} else {
			nameErr.addClass("d-none");
		}
	}
	
	
	//tel 검사
	var tel = $("#tel").val();
	console.log("tel: " + tel);
	var telErr1 = $("#telErr1");
	var telErr2 = $("#telErr2");
	if(tel === "") {
		isValidation = false;
		telErr1.removeClass("d-none");
		telErr2.addClass("d-none");
	} else {
		var pattern = /^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
		var result = pattern.test(tel);
		if(!result) {
			isValidation = false;
			telErr1.removeClass("d-none");
    		telErr2.addClass("d-none");
		} else {
			telErr1.addClass("d-none");
			telErr2.addClass("d-none");
		}
	}
	
	tel = $("#tel").val($("#tel").val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
	
   
	if(!isValidation) {
		event.preventDefault();
		window.alert('test');
	} else {
		if(window.confirm("회원정보를 수정하시겠습니까?")){
			location.href="/our-twinkling-infinitely/modify";
			
		} else {
			event.preventDefault();
		}
	}
}		

