//ready 이벤트가 발생했을 때 실행할 핸들러 함수 설정.
$(init);

function init() {
	loadFooter();
	var joinForm = $("#joinForm");
	$("#submit").click(checkValidation);
	$("#uname").blur(onBlurName);
	$("#utel").blur(onBlurTel);
	$("#contact").blur(onBlurContact);
	$("#addButton").click(addContact);
	$("#removeButton").click(removeContact);
}

function loadFooter() {
	$("#footer").load("coupangFooter.jsp");
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

function onBlurContact() {
	var contact = $("#contact").val();
	var contactPattern = /^\d{2,3}-\d{3,4}-\d{4}$/;
	var result = contactPattern.test(contact);
	
	var contactErr = $("#contactErr");
	
	contactErr.addClass("d-none");
	
	if(contact === "") {
	}else if(!result) {
		contactErr.removeClass("d-none");
		contactErr.addClass("redLine");
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
	
	var contact = $("#contact").val();
	var contactPattern = /^\d{2,3}-\d{3,4}-\d{4}$/;
	var result = contactPattern.test(contact);
	
	var contactErr = $("#contactErr");
	
	contactErr.addClass("d-none");
	
	if(contact === "") {
	}else if(!result) {
		contactErr.removeClass("d-none");
		contactErr.addClass("redLine");
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
	$("#utel").css("width", 750);
}

function removeContact() {
	$("#contactBox").addClass("d-none");
	$("#addButton").removeClass("d-none");
	$("#utel").css("width", 700);
}