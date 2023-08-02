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
});