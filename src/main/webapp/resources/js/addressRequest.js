$(document).ready(function(){
	
	
	
	$("input[name='reqMsg']").change(function(){
		$('#show1').css('display', 'none');
		$('#show2').css('display', 'none');
		// 계좌이체 선택 시.
		if($("input[name='reqMsg']:checked").val() == '택배함'){
			$('#show1').css('display', 'block');
			$('#show2').css('display', 'none');
		}else if($("input[name='reqMsg']:checked").val() == '기타사항'){
			$('#show2').css('display', 'block');
			$('#show1').css('display', 'none');
		} else {
			$('#show1').css('display', 'none');
			$('#show2').css('display', 'none');
			
		}
		
	});
});

function requestPost() {

    const reqMsg = $("#requestForm input[name=reqMsg]:checked").val();
    
    //contentType: "application/xxx-www-form-urlencoded"
    //요청 본문
    //param1=문자열&param2=2&param3=3.14&param4=true&param5=2030-12-05
    $.ajax({
       url:"orderPay",
       method:"post",
       data: {
    	   reqMsg: reqMsg
       },
       success: function(data) {
    	   
       }
    })
 }