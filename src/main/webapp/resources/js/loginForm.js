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



function blink() {
	var click = document.getElementById('eye');
	var pwdType = document.getElementById("pwd").getAttribute("type");
		if(click.src.match("seyeb")) {
			click.src = "/our-twinkling-infinitely/resources/image/sion/seye.JPG";
		} else {
			click.src = "/our-twinkling-infinitely/resources/image/sion/seyeb.JPG";
		}
		if(pwdType === "password"){
		    document.getElementById("pwd").setAttribute("type", "text");
		}
		 else if(pwdType === "text"){
		    document.getElementById("pwd").setAttribute("type", "password");
		}
}

function checkValidation() {
   	var isValidation = true;
   		
   		
   	//모든 에러 메세지를 보여주지 않도록 초기화
   	var errorMsgs = $(".errorMsg");
   	console.log(errorMsgs);
   	errorMsgs.each(function(index, item) {
   		$(item).addClass("d-none");
   	});
   	
	//모든 밑줄 회색처리
    $(".form-group").children('div').removeClass("line-red");
    $(".form-group").children('div').removeClass("line-blue");
    $(".form-group").children('div').addClass("line-gray");
    	
   
		//uid 검사
	var uid = $("#uid").val();

	if(uid ==="") {
		isValidation = false;
		uidErr2.addClass("d-none");
		uidErr1.removeClass("d-none");
	} else {
		var pattern = /^[a-z]+[a-z0-9]{4,19}$/g;
    	var result = pattern.test(uid);
    	if(!result) {
    		isValidation = false;
    		uidErr2.removeClass("d-none");
    		uidErr1.addClass("d-none");
    	} else {
    		uidErr2.addClass("d-none");
    		uidErr1.addClass("d-none");
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
		
	//pwd검사
	var pwd = $("#pwd").val();
	var pwdErr1 = $("#pwdErr1");
	var pwdErr2 = $("#pwdErr2");
		if(pwd ==="") {
			isValidation = false;
			pwdErr2.addClass("d-none");
			pwdErr3.addClass("d-none");
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
		
	if(!isValidation) {
		var borderbottom = $("#pwd-form");
		borderbottom.removeClass("line-gray");
		borderbottom.removeClass("line-blue");
		borderbottom.addClass("line-red");
    } else {
		var borderbottom = $("#pwd-form");
		borderbottom.removeClass("line-gray");
		borderbottom.removeClass("line-red");
		borderbottom.addClass("line-gray");
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

       	
       	//모든 밑줄 회색처리
    	$(".form-group").children('div').removeClass("line-blue");
    	$(".form-group").children('div').addClass("line-gray");
	
    	//uid 검사
    	if($(event.target).attr('id') == "uid") {
    		var uid = $("#uid").val();
	    	var uidErr1 = $("#uidErr1");
	    	var uidErr2 = $("#uidErr2");
	    		if(uid ==="") {
	    			isValidation = false;
	    			uidErr2.addClass("d-none");
	    			uidErr1.removeClass("d-none");
	    		} else {
	    			var pattern = /^[a-z]+[a-z0-9]{4,19}$/g;
		    		var result = pattern.test(uid);
		    		if(!result) {
		    			isValidation = false;
		    			uidErr2.removeClass("d-none");
		    			uidErr1.addClass("d-none");
		    		} else {
		    			uidErr2.addClass("d-none");
		    			uidErr1.addClass("d-none");
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
	    	var pwdErr1 = $("#pwdErr1");
	    	var pwdErr2 = $("#pwdErr2");
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
	    		
	    	if(!isValidation) {
	    		var borderbottom = $("#pwd-form");
	    		borderbottom.removeClass("line-gray");
	    		borderbottom.removeClass("line-blue");
	    		borderbottom.addClass("line-red");
		    } else {
	    		var borderbottom = $("#pwd-form");
	    		borderbottom.removeClass("line-gray");
	    		borderbottom.removeClass("line-red");
	    		borderbottom.addClass("line-gray");
	    	}
    	}	
    });
});    