$(init)
function init(){
	showReview();
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

function showReview(productNum, pageNo2) {
	$.ajax({
		url: "review",
		method: "get",
		data:{
				"productNum": productNum,
				"pageNo2": pageNo2
		},
		success: function(data) {
			$("#menu3").html(data);
		},
		error: function(error) {
			console.log("아왜");
		}
	});
}

//폼 데이터를 비동기화로 넘기기 위한 스크립트.
//그림파일도 넘기기 위해 formData로 form을 받고 cache, contentType, processData를 false로 해줌 
function submitForm() {
	var form = $("#reviewWrite")[0];
	var formData = new FormData(form);
	$.ajax({
		url: "reviewWrite",
		method: "post",
		data: formData,
		success: function(data) {
			$("#menu3").html(data);
		},
		error: function(error) {
			console.log("아왜");
		},
		cache: false,
        contentType: false,
        processData: false
	});
}

function reviewDetail(review_no) {
	$.ajax({
		url: "reviewDetail",
		method: "get",
		data:{"review_no": review_no},
		success: function(data) {
			$("#menu3").html(data);
		},
		error: function(error) {
			console.log("아왜");
		}
	});
}

function writeReview(productNum) {
	$.ajax({
		url: "reviewWrite",
		method: "get",
		data:{"productNum": productNum},
		success: function(data) {
			$("#menu3").html(data);
			$("#showAlert").hide();
		},
		error: function(error) {
			console.log("아왜");
		}
	});
}

$(document).ready(function() {
    $("a[name='file-delete']").on("click", function(e) {
        e.preventDefault();
        deleteFile($(this));
    });
})

function addFile() {
	var count = $(".file-group").length;
	if(count >= 5) {
		$("#showAlert").show();
	}else {
		var str = '<div class="file-group mt-2"><input type="file" name="file" style="width:80%; border: solid 1px #f0f0f0"> <a href="#this" name="file-delete" class="btn btn-danger m-1">삭제</a></div>';
		$("#file-list").append(str);
		$('a[name="file-delete"]').on("click", function(e) {
			e.preventDefault();
			deleteFile($(this));
		});		
	}
}

function deleteFile(obj) {
	$("#showAlert").hide();
    obj.parent().remove();
}
