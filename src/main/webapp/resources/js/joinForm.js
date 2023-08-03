

$(document).ready(function(){
	
	//input 클릭시 회색 border-bottom => 파란색 border-bottom
    $("input").click(function(){
		   const name = $(event.target).parent('div');
		   const parent = name.parent('div');
		   parent.removeClass("line-gray");
		   parent.addClass("line-blue");
	});

    //유효성 검사
    function checkValidation() {
   		var isValidation = true;
   		
   		
   		//모든 에러 메세지를 보여주지 않도록 초기화
   		var errorMsgs = $(".errorMsg");
   		errorMsgs.each(function(index, item) {
   			errorMsgs.addClass("d-none");
   		});
   		
    }		
   		
    //
    $("input").change(function(){
    	const name = $(event.target).parent('div');
		const parent = name.parent('div');
		parent.removeClass("line-gray");
		parent.addClass("line-blue");

		var nonselect = $("#coporation-card-choice option:selected").val();
		
		if(nonselect === "none") {
			$('#coporation-card-no-choice').show();
		} else {
			$('#coporation-card-no-choice').hide();
		}
		
		
	});
    
});
