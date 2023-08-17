$(init);

function init() {
	//$(".selectButton").click(selectButton);
}

$(document).ready(function(){
	$(".selectButton").click(function() {
	   
	      // 선택된 라디오 버튼의 값 가져오기
	      var selectedValue = $("input[name='select']:checked").val() + " " +  $("#boxNo").val() + " " + $("#etcName").val();
	      var selectedPwdValue = $("input[name='pwdselect']:checked").val() + " " +  $("#pwdNo").val();
	      console.log(selectedValue);
	      console.log(selectedPwdValue);
	          
	      // 서버로 전송할 데이터 생성
	      var postData = {
	            selectedValue: selectedValue,
	            selectedPwdValue: selectedPwdValue
	      };
	          
	      // AJAX 요청으로 데이터 전송
	      $.ajax({
	          type: "POST",
	          url: "/our-twinkling-infinitely/addressRequest", // 보낼 곳의 URL
	          data: postData,
	          success: function(response) {
	          // 서버 응답 처리 (예: 성공 메시지 표시)
	          alert("배송 요청사항이 변경되었습니다.");
	          window.close();
	       },
	          error: function() {
	             // 오류 처리
	          alert("데이터 전송 중 오류가 발생했습니다.");
	          }
	     });
	});
});	

function select(addressNo) {
	
	var addressNo = String(addressNo);
	console.log(addressNo);
	var postData = {
			addressNo: addressNo
    };
	$.ajax({
		url: "/our-twinkling-infinitely/addressSelect", 
		type: "POST",
		data: postData, 
		success: function(response) {
			alert("배송지가 변경되었습니다.");
			opener.location.reload();
			window.close();
		},
		error: function(error) {
			alert("데이터 전송 중 오류가 발생했습니다.");
		}
	});
}

function showAddressAdd() {
	$.ajax({
		url: "registerForm",
		method: "get",
		success: function(data) {
			$("#addressList").html(data);
		},
		error: function(error) {
			console.log("아왜");
		}
	});
}



