$(init);

function init() {
	showAddress();
}

function showAddress(pageNo3) {
	$.ajax({
		url: "address",
		method: "get",
		data:{
			"pageNo": pageNo3
		},
		success: function(data) {
			console.log("fgf");			
			$("#addressList").html(data);
		},
		error: function(error) {
			console.log("아왜");
		}
	});
}
