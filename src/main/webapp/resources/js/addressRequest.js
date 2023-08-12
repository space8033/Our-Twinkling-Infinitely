$(document).ready(function(){
	
	
	
	$("input[name='select']").change(function(){
		$('#show1').css('display', 'none');
		$('#show2').css('display', 'none');
		// 계좌이체 선택 시.
		if($("input[name='select']:checked").val() == '택배함'){
			$('#show1').css('display', 'block');
			$('#show2').css('display', 'none');
		}else if($("input[name='select']:checked").val() == '기타사항'){
			$('#show2').css('display', 'block');
			$('#show1').css('display', 'none');
		} else {
			$('#show1').css('display', 'none');
			$('#show2').css('display', 'none');
			
		}
		
	});
	
	$("#pwdNo").click(function(){
		$("#pwdY").prop('checked', true);
	});
	
    $("#agreeSave").click(function() {
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
            url: "/our-twinkling-infinitely/orderPay/addressRequest", // 보낼 곳의 URL
            data: postData,
            success: function(response) {
                // 서버 응답 처리 (예: 성공 메시지 표시)
                alert("배송 요청사항이 변경되었습니다.");
                opener.parent.location.reload();
            	window.close();
            },
            error: function() {
                // 오류 처리
                alert("데이터 전송 중 오류가 발생했습니다.");
            }
        });
    });
	
	
	
});

