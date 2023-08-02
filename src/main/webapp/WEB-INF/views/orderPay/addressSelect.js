$(init)
	
function init(){
	fun1();
}
function fun1() {
	$.ajax({
		url: "addressSelect_content.jsp",
			method: "get",
			success: function(data) {console.log(data);
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
