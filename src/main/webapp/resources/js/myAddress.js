$(init);

function init() {
	addAddress();
	loadFooter();
	$("#addAddress").click(goAddPage);
	setTimeout(() => $(".modifyButton").click(goModifyPage), 500);
}

function loadFooter() {
	$("#footer").load("coupangFooter.jsp");
}

function addAddress() {
	$.ajax({
		url:"myAddress_content.jsp",
		method: "get",
		success: function(data) {
			let html="";
		
			data.forEach(function(item, index) {
				html +=	'<div class="myAddress">';
				html +=		'<div class="mt-4 mb-2 font-weight-bold">' + item.name + '</div>';
				if(item.isBasic === "true") {
					html +=		'<div id="standardAddress">기본배송지</div>';					
				}
				html +=		'<div class="mt-2">' + item.address + ' ' + item.detail + '</div>';
				html +=		'<div>' + item.phone + '</div>';
				html +=		'<div>' + item.content + '</div>';
				html +=		'<div><button class="modifyButton" value="' + index + '">수정</button></div>';
				html +=	'</div>';
				
			});
			$("#addressContainer").html(html);
		},
		error: function(error) {
			console.log("안됨");
		}
	});	
}

function goAddPage() {
	location.href="myAddressAdd.jsp";
}

function goModifyPage() {
	location.href="myAddressModify.jsp";
}