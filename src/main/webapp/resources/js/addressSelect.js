$(init)
	
function init(){
	fun1();
}

function modifyAddress() {
   	window.open("/our-twinkling-infinitely/addressModify", "winLogin", "left=350, top=300, width=500, height=650");
}

function selectAddress() {
	window.open("/our-twinkling-infinitely/addressRequest", "winLogin", "left=350, top=300, wi${pageContext.request.contextPath}/views/orderPay/dth=530, height=650");
}

function addAddress() {
	window.open("/our-twinkling-infinitely/addressAdd", "winLogin", "left=350, top=300, wi${pageContext.request.contextPath}/views/orderPay/dth=530, height=650");
}


function fun1() {
	$.ajax({
		url: "addressSelect_content.jsp",
			method: "get",
			success: function(data) {
				console.log(data);
			    let html = "";
			    data.forEach(function(item, index) {
		   		html +=	'<div id="addressContainer" style="width: 100%;">';
		   		html +=	'	<div class="myAddress">';
		   		html +=	'		<div class="mt-3 mb-2 font-weight-bold">' + item.name + '</div>';
		   		html +=	'		<div class="mt-2">' + item.address + '</div>';
		   		html +=	'		<div>' + item.tel + '</div>';
		   		html +=	'		<div>' + item.message + '</div>';
		   		html += '		<div class="buttonClass">';
		   		html += '			<div><button class="abutton" id="modifyButton">수정</button></div>';
		   		html += '			<div><button class="abutton" id="select">선택</button></div>';
		   		html += '		</div>';
		   		html += '</div>';
			    });
	   	    $("#container").html(html);
			},
			error: function(error) {
				console.log(err.status);
			}
	});

} 
