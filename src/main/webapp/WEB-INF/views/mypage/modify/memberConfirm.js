$(init);

function init() {
}

function completeSubmit() {
	var isCorrect = false;
	console.log($("#password").val());
	if($("#password").val() === "1234") {
		event.preventDefault();
		isCorrect = true;
	}else {
	}
	
	if(isCorrect) {
		location.href="modifyMember.jsp";
	}else {
	}
}

function cancelSubmit() {
	event.preventDefault();
	history.back();
}