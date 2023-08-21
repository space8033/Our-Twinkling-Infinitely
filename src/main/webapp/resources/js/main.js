$(init)
function init(){
	$("#idSearch").click(showSearch);
	showReview();
	//header 검색바 숨기기
	$(".topnav").hide();
	//상품 메인페이지 광고
	showSlides();
	changeImg();
}

let slideIndex = 0;
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
	$(".topnav").toggle();
	$("#search-icon").width();
}

//검색 기능
function showSearch() {
	$.ajax({
		url: "searchResult",
		method: "get",
		data:{
				"pageNo4": 1,
				"search": $("#search").val()
		},
		success: function(data) {
			var link = "searchResult?search=";
			link += $("#search").val();
			link += "&pageNo4=1";
			
			window.location.href=link;
		},
		error: function(error) {
			console.log("아왜");
		}
	});
}

//엔터키로 검색하기
function searchByEnter() {
	$.ajax({
		url: "searchResult",
		method: "get",
		data:{
				"pageNo4": 1,
				"search": $("#search").val()
		},
		success: function(data) {
			var link = "searchResult?search=";
			link += $("#search").val();
			link += "&pageNo4=1";
			
			window.location.href=link;
		},
		error: function(error) {
			console.log("아왜");
		}
	});
}

//detailView=======================================================================
//상품의 옵션을 선택하고, 수량을 선택했을 때 가격 변화
function myOption1(){
	//선택된 옵션 id
	var selectedOptionId = $(event.target).find('option:selected').attr('id');
	if($(event.target).val() != "none"){
		var option = $(event.target).val();
		//선택된 옵션 값 표시
		$("#select-p-option").html(option);
		$(".myOption").show();
		//폼에 value 값 넣어주기
		$("#submitOrderProduct1").prop("value", selectedOptionId);
	}else{
		$(".myOption").hide();
	}
} 
function myOption2(){
	if($(event.target).val() != "none"){
		//선택된 옵션 값 표시
		var qty = $(event.target).val();
		var no = Number(qty);
		var price = Number($("#product_price").val());
		var totalPrice = price * no;
		$("#select-p-qty").html(": " + qty + " 개");	
		$("#total-price").html(totalPrice.toLocaleString("ko-Kr") + "원");
		$(".myOption").show();
		//폼에 value 값 넣어주기
		$("#submitOrderProduct2").prop("value", qty);
	}else{
		$(".myOption").hide();
	}
}

//주요 상품 이미지와 호버한 이미지의 위치를 바꾸는 함수 
function changeImg(){
	const mainImage = document.getElementById('main-image'); // 주요 상품 이미지의 엘리먼트를 가져옴
	const hoverImages = document.querySelectorAll('.hover-image'); // 호버 이미지들의 엘리먼트를 가져옴
	
	hoverImages.forEach(image => {
		image.addEventListener('mouseover', () => { // 각 호버 이미지에 호버 이벤트 리스너를 추가
			const currentMainImage = mainImage.src; // 현재 주요 상품 이미지의 URL을 저장
			mainImage.src = image.src; // 주요 상품 이미지의 URL을 호버한 이미지의 URL로 바꿈
			image.src = currentMainImage; // 호버한 이미지의 URL을 이전 주요 상품 이미지의 URL로 바꿈
		});
	});
}

//review=======================================================================
//리뷰 리스트 보여주기
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

//포토리뷰만 보여주기
function showReview(productNum, pageNo2, filter) {
	$.ajax({
		url: "review",
		method: "get",
		data:{
			"productNum": productNum,
			"pageNo2": pageNo2,
			"filter": filter
		},
		success: function(data) {
			$("#menu3").html(data);
		},
		error: function(error) {
			console.log("아왜");
		}
	});
}

//리뷰 수정 요청하기
function modifyForm() {
	var form = $("#modifyReview")[0];
	var formData = new FormData(form);
	$.ajax({
		url: "modifyReview",
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
//리뷰번호로 리뷰 상세정보 찾기
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

//리뷰 수정하기
function showReviewModify(review_no) {
	$.ajax({
		url: "modifyReview",
		method: "get",
		data:{"review_no": review_no},
		success: function(data) {
			$("#menu3").html(data);
			$("#showAlert").hide();
		},
		error: function(error) {
			console.log("아왜");
		}
	});
}
//리뷰 삭제하기
function deleteReview(review_no) {
	$.ajax({
		url: "deleteReview",
		method: "post",
		data:{"review_no": review_no},
		success: function(data) {
			$("#menu3").html(data);
		},
		error: function(error) {
			console.log("아왜");
		}
	});
}

//파일 업로드 칸 삭제
$(document).ready(function() {
    $("a[name='file-delete']").on("click", function(e) {
        e.preventDefault();
        deleteFile($(this));
    });
})
//파일 업로드 칸 추가하기
function addFile() {
	var count = $(".file-group").length;
	if(count >= 5) {
		$("#showAlert").show();
	}else {
		var str = '<div class="file-group mt-2"><input type="file" name="file" style="width:45%; border: solid 1px #f0f0f0;"> <a href="#this" name="file-delete" class="btn btn-danger m-1">삭제</a></div>';
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
