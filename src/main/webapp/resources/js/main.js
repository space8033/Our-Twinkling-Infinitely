$(init)

function init(){
	//header 검색바 숨기기
	$(".topnav").hide();
	//상품 메인페이지 광고
	showSlides();
}

let slideIndex = 0;
showSlides();

function showSlides() {
  let i;
  let slides = document.getElementsByClassName("mySlides");
  let dots = document.getElementsByClassName("dot");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}    
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
  setTimeout(showSlides, 1500); // Change image every 2 seconds
}

//검색창 보이기
function showSearchBar(){
	$(".topnav").show();
	$("#search-icon").width();
	$("#hideSearchBar").click(function(){
		  $(".topnav").hide();
	});
}

//상품의 옵션을 선택하고, 수량을 선택했을 때 가격 변화
function myOption1(){
	console.log($(event.target));
	if($(event.target).val() != "none"){
		var option = $(event.target).val();
		$("#select-p-option").html(option);
		$(".myOption").show();
	}else{
		$(".myOption").hide();
	}
} 
function myOption2(){
	console.log($(event.target));
	if($(event.target).val() != "none"){
		var qty = $(event.target).val();
		var no = Number(qty);
		var price = Number($("#product_price").val());
		var totalPrice = price * no;
		$("#select-p-qty").html(": " + qty + " 개");	
		$("#total-price").html(totalPrice.toLocaleString("ko-Kr") + "원");
		$(".myOption").show();
	}else{
		$(".myOption").hide();
	}
} 

