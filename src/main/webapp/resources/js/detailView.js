$(init)
function init(){
	myOption();
}

//상품의 옵션을 선택하고, 수량을 선택했을 때 가격 변화
function myOption (){
	console.log("시작");
	if($("#p=option:selected").length !=0 && $("#p-qty:selected").length !=0 ){
		console.log("시작2");
		$("#select-p-option").html($("#p-option:selected").val());
		console.log($("#p-option:selected").val());
		console.log($("#p-qty:selected").val());
		$("#select-p-qty").html($("#p-qty:selected").val() + "개");
	}else{
		$(".myOption").hide();
	}
} 