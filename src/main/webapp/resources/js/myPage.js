$(init);

function init() {
	showAddress();
	showReviewByUser();
	showPoint(1);
	//마이페이지 이미지 변경 확인버튼 숨기기
	$("#imgSubmit").hide();
	$("#myCoupons").hide();
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

//마이페이지==============================================================
//마이페이지 이미지추가 확인버튼
function showSubmitBtn(){
	$("#imgSubmit").show();
}
//이미지 변경시 유효성 검사
$(document).ready(function() {	
	$("#addMyImg").submit(function(event) {
		if ($("#fileInput")[0].files.length === 0) { //이미지 파일을 추가하지 않았을 경우 
			alert("변경할 이미지를 선택해주세요.")
			event.preventDefault(); // 폼 제출 막기
		}
	});
});

//적립금 목록과 쿠폰리스트 목록
function showCouponList(){
	$("#myCoupons").toggle();
}

function showPointList(){
	$("#myPoints").toggle();
}

function showPoint(pageNo7) {
	  $.ajax({
	    url: "getHistory",
	    method: "get",
	    data: {
	      "pageNo7": pageNo7
	    },
	    success: function(data) {
	      $("#myPoints").html(data);
	      
	    },
	    error: function(error) {
	      console.log("에러 발생: " + error);
	    }
	  });
}

//리뷰아이콘 클릭했을 때 리뷰관리 탭 넘어가기
function showReview(){
	const reviewTabLink = document.querySelector('[data-toggle="tab"][href="#reviewList"]');
	reviewTabLink.click();
}

