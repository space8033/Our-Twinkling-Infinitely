
//유효성 검사
function checkValidation() {
   	var isValidation = true;
   	
   	
   	//모든 에러 메세지를 보여주지 않도록 초기화
   	var errorMsgs = $(".errorMsg");
   	console.log(errorMsgs);
   	errorMsgs.each(function(index, item) {
   		$(item).addClass("d-none");
   		$(item).addClass("d-none");
   		
   	});
   	
   	//모든 밑줄 초기화
   	$(".form-group").children('div').removeClass("line-red");
	$(".form-group").children('div').removeClass("line-blue");
	$(".form-group").children('div').addClass("line-gray");
   	
    //uid 검사
	var uid = $("#id").val();
	console.log("id: " + uid);
	if(uid === "") {
		isValidation = false;
		var uidErr1 = $("#uidErr1");
		uidErr1.removeClass("d-none");
		var borderbottom = $("#id-form");
		
	} else {
		var pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var result = pattern.test(uid);
		if(!result) {
			isValidation = false;
			var uidErr2 = $("#uidErr2");
			uidErr2.removeClass("d-none");
			var borderbottom = $("#id-form");
		}
	}
	
	//pwd검사
	var pwd = $("#pwd").val();
	console.log("pwd: " + pwd);
		if(pwd ==="") {
			isValidation = false;
			var pwdErr1 = $("#pwdErr1");
			pwdErr1.removeClass("d-none");
			var borderbottom = $("#pwd-form");
		} else if(pwd !== "") {
			var borderbottom = $("#pwd-form");
		
	}

		
	//pwd-check 검사
	var pwdCheck = $("#pwd-check").val();
	console.log("pwdCheck: " + pwdCheck);
	if(pwdCheck === "") {
		isValidation = false;
		var pwdCheckErr1 = $("#pwdCheckErr1");
		pwdCheckErr1.removeClass("d-none");
		var borderbottom = $("#pwd-form-check");
			
	} else {
		var pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var result = pattern.test(pwdCheckErr2);
		if(!result) {
			isValidation = false;
			var pwdCheckErr2 = $("#pwdCheckErr2");
			pwdCheckErr2.removeClass("d-none");
			var borderbottom = $("#pwd-form-check");
		}
	}	
	
	//email 검사
	var email = $("#email").val();
	console.log("email: " + email);
	if(email === "") {
		isValidation = false;
		var emailErr1 = $("#emailErr1");
		emailErr1.removeClass("d-none");
		var borderbottom = $("#email-form");
		
	} else {
		var pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var result = pattern.test(email);
		if(!result) {
			isValidation = false;
			var emailErr2 = $("#emailErr2");
			emailErr2.removeClass("d-none");
			var borderbottom = $("#email-form");
		}
	}
	
	
	//name 검사
	var name = $("#name").val();
	console.log("name: " + name);
	if(name === "") {
		isValidation = false;
		var nameErr = $("#nameErr");
		nameErr.removeClass("d-none");
		var borderbottom = $("#name-form");
		
	} else {
		var pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var result = pattern.test(name);
		if(!result) {
			isValidation = false;
			var nameErr = $("#nameErr");
			nameErr.removeClass("d-none");
			var borderbottom = $("#name-form");
		}
	}		
	
	//tel 검사
	var tel = $("#tel").val();
	console.log("tel: " + tel);
	if(tel === "") {
		isValidation = false;
		var telErr1 = $("#telErr1");
		telErr1.removeClass("d-none");
		var borderbottom = $("#tel-form");
		
	} else {
		var pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var result = pattern.test(tel);
		if(!result) {
			isValidation = false;
			var telErr2 = $("#telErr2");
			telErr2.removeClass("d-none");
			var borderbottom = $("#tel-form");
		}
	 }	
	
		
	if(!isValidation) {
		event.preventDefault();
	}
}		

$(document).ready(function(){
	
	//input 포커스 시 회색 border-bottom => 파란색 border-bottom
    $("input").focus(function(event){
		   const name = $(event.target).parent('div');
		   const parent = name.parent('div');
		   parent.removeClass("line-gray");
		   parent.removeClass("line-red");
		   parent.addClass("line-blue");
	});
    
    //input 블러 시 유효성 검사 및 밑줄 처리
    $("input").blur(function(event) {
        //유효성 검사
        var isValidation = true;
       	//모든 에러 메세지를 보여주지 않도록 초기화
       	var errorMsgs = $(".errorMsg");
       	console.log(errorMsgs);
       	errorMsgs.each(function(index, item) {
       		$(item).addClass("d-none");
       		$(item).addClass("d-none");
       		
       	});
       	
       	//모든 밑줄 회색처리
    	$(".form-group").children('div').removeClass("line-blue");
    	$(".form-group").children('div').addClass("line-gray");
       	
        //uid 검사
    	if($(event.target).attr('id') == "id") {
	    	var uid = $("#id").val();
	    	console.log("id: " + uid);
	    	if(uid === "") {
	    		isValidation = false;
	    		var uidErr1 = $("#uidErr1");
	    		uidErr1.removeClass("d-none");
	    		
	    	} else {
	    		var pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	    		var result = pattern.test(uid);
	    		if(!result) {
	    			isValidation = false;
	    			var uidErr2 = $("#uidErr2");
	    			uidErr2.removeClass("d-none");
	    		}
	    	}
	    	
	    	if(!isValidation) {
	    		var borderbottom = $("#id-form");
	    		borderbottom.removeClass("line-gray");
	    		borderbottom.removeClass("line-blue");
	    		borderbottom.addClass("line-red");
	    	} else {
	    		var borderbottom = $("#id-form");
	    		borderbottom.removeClass("line-gray");
	    		borderbottom.removeClass("line-red");
	    		borderbottom.addClass("line-gray");
	    	}
	    	
    	}	
    	
    	//pwd검사
    	if($(event.target).attr('id') == "pwd") {
	    	var pwd = $("#pwd").val();
	    	console.log("pwd: " + pwd);
	    		if(pwd ==="") {
	    			isValidation = false;
	    			var pwdErr1 = $("#pwdErr1");
	    			pwdErr1.removeClass("d-none");
	    		} else if(pwd !== "") {
	    			isValidation = false;
	    		}
	    		
	    	if(!isValidation) {
	    		var borderbottom = $("#pwd-form");
	    		borderbottom.removeClass("line-gray");
	    		borderbottom.removeClass("line-blue");
	    		borderbottom.addClass("line-red");
		    } else {
	    		var borderbottom = $("#id-form");
	    		borderbottom.removeClass("line-gray");
	    		borderbottom.removeClass("line-red");
	    		borderbottom.addClass("line-gray");
	    	}
    	}	

    			
    	//pwd-check 검사
    	if($(event.target).attr('id') == "pwd-check") {
	    	var pwdCheck = $("#pwd-check").val();
	    	console.log("pwdCheck: " + pwdCheck);
	    	if(pwdCheck === "") {
	    		isValidation = false;
	    		var pwdCheckErr1 = $("#pwdCheckErr1");
	    		pwdCheckErr1.removeClass("d-none");
	    			
	    	} else {
	    		var pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	    		var result = pattern.test(pwdCheckErr2);
	    		if(!result) {
	    			isValidation = false;
	    			var pwdCheckErr2 = $("#pwdCheckErr2");
	    			pwdCheckErr2.removeClass("d-none");
	    			
	    		}
	    	}
	    	
	    	if(!isValidation) {
	    		var borderbottom = $("#pwd-form-check");
	    		borderbottom.removeClass("line-gray");
	    		borderbottom.removeClass("line-blue");
	    		borderbottom.addClass("line-red");
		    } else {
	    		var borderbottom = $("#id-form");
	    		borderbottom.removeClass("line-gray");
	    		borderbottom.removeClass("line-red");
	    		borderbottom.addClass("line-gray");
	    	}	
	    	
    	}	
    	
    	//email 검사
    	if($(event.target).attr('id') == "email") {
	    	var email = $("#email").val();
	    	console.log("email: " + email);
	    	if(email === "") {
	    		isValidation = false;
	    		var emailErr1 = $("#emailErr1");
	    		emailErr1.removeClass("d-none");
	    		
	    	} else {
	    		var pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	    		var result = pattern.test(email);
	    		if(!result) {
	    			isValidation = false;
	    			var emailErr2 = $("#emailErr2");
	    			emailErr2.removeClass("d-none");
	    			
	    		}
	    	}
	    	
	    	if(!isValidation) {
	    		var borderbottom = $("#email-form");
	    		borderbottom.removeClass("line-gray");
	    		borderbottom.removeClass("line-blue");
	    		borderbottom.addClass("line-red");
		    } else {
	    		var borderbottom = $("#id-form");
	    		borderbottom.removeClass("line-gray");
	    		borderbottom.removeClass("line-red");
	    		borderbottom.addClass("line-gray");
	    	}	
    	}
    	
    	//name 검사
    	
    	if($(event.target).attr('id') == "name") {
	    	var name = $("#name").val();
	    	console.log("name: " + name);
	    	if(name === "") {
	    		isValidation = false;
	    		var nameErr = $("#nameErr");
	    		nameErr.removeClass("d-none");
	    		
	    	} else {
	    		var pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	    		var result = pattern.test(name);
	    		if(!result) {
	    			isValidation = false;
	    			var nameErr = $("#nameErr");
	    			nameErr.removeClass("d-none");
	    			
	    		}
	    	}
	    	if(!isValidation) {
	    		var borderbottom = $("#name-form");
	    		borderbottom.removeClass("line-gray");
	    		borderbottom.removeClass("line-blue");
	    		borderbottom.addClass("line-red");
		    } else {
	    		var borderbottom = $("#id-form");
	    		borderbottom.removeClass("line-gray");
	    		borderbottom.removeClass("line-red");
	    		borderbottom.addClass("line-gray");
	    	}	
    	}	
    	
    	//tel 검사
    	if($(event.target).attr('id') == "tel") { 
	    	var tel = $("#tel").val();
	    	console.log("tel: " + tel);
	    	if(tel === "") {
	    		isValidation = false;
	    		var telErr1 = $("#telErr1");
	    		telErr1.removeClass("d-none");
	    	} else {
	    		var pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	    		var result = pattern.test(tel);
	    		if(!result) {
	    			isValidation = false;
	    			var telErr2 = $("#telErr2");
	    			telErr2.removeClass("d-none");
	    		}
	    	}
	    	if(!isValidation) {
	    		var borderbottom = $("#tel-form");
	    		borderbottom.removeClass("line-gray");
	    		borderbottom.removeClass("line-blue");
	    		borderbottom.addClass("line-red");
		    } else {
	    		var borderbottom = $("#id-form");
	    		borderbottom.removeClass("line-gray");
	    		borderbottom.removeClass("line-red");
	    		borderbottom.addClass("line-gray");
	    	}	
    	}	
        
        
    });

});
