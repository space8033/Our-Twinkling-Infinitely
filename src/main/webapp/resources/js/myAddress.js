$(init);

function init() {
}


function goAddPage() {
	location.href="registerForm";
}
$(document).ready(function(){
	$(".selectButton").click(function() {
	   
	      alert("배송지가 변경되었습니다.");
          opener.parent.location.reload();
          window.close();
	  
	});
});	
