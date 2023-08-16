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