$(init);

function init() {
	showAddress();
	showReviewByUser();
}

function showAddress(pageNo3) {
	$.ajax({
		url: "address",
		method: "get",
		data:{
			"pageNo": pageNo3
		},
		success: function(data) {
			$("#addressList").html(data);
		},
		error: function(error) {
			console.log("아왜");
		}
	});
}



function showModifyAddress(addressNo) {
	$.ajax({
		url: "modifyForm",
		method: "get",
		data:{
			"addressNo": addressNo
		},
		success: function(data) {
			$("#addressList").html(data);
		},
		error: function(error) {
			console.log("아왜");
		}
	});
}

function showReviewByUser(pageNo5) {
	$.ajax({
		url: "reviewByUser",
		method: "get",
		data:{
			"pageNo5": pageNo5
		},
		success: function(data) {
			$("#reviewList").html(data);
		},
		error: function(error) {
			console.log("아왜");
		}
	});
}
	
function myReviewDetail(review_no) {
	$.ajax({
		url: "myReviewDetail",
		method: "get",
		data:{"review_no": review_no},
		success: function(data) {
			$("#reviewList").html(data);
		},
		error: function(error) {
			console.log("아왜");
		}
	});
}

function showReviewModify(review_no) {
	$.ajax({
		url: "modifyReview",
		method: "get",
		data:{"review_no": review_no},
		success: function(data) {
			$("#reviewList").html(data);
		},
		error: function(error) {
			console.log("아왜");
		}
	});
}

function modifyForm() {
	var form = $("#modifyReview")[0];
	var formData = new FormData(form);
	$.ajax({
		url: "modifyReview",
		method: "post",
		data: formData,
		success: function(data) {
			$("#reviewList").html(data);
		},
		error: function(error) {
			console.log("아왜");
		},
		cache: false,
		contentType: false,
		processData: false
	});
}

function deleteReview(review_no) {
	$.ajax({
		url: "deleteReview",
		method: "post",
		data:{"review_no": review_no},
		success: function(data) {
			$("#reviewList").html(data);
			$("#showAlert").hide();
		},
		error: function(error) {
			console.log("아왜");
		}
	});
}

