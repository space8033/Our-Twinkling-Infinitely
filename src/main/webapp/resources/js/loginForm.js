function blink() {
		var click = document.getElementById('eye');
		var pwdType = document.getElementById("pwd").getAttribute("type");
			if(click.src.match("seyeb")) {
				click.src = "${pageContext.request.contextPath}/resources/image/sion/seye.JPG";
				 
			} else {
				click.src = "${pageContext.request.contextPath}/resources/image/sion/seyeb.JPG";
			}
			 if(pwdType === "password"){
			      document.getElementById("pwd").setAttribute("type", "text");
			   }
			   else if(pwdType === "text"){
			      document.getElementById("pwd").setAttribute("type", "password");
			   }
		
	}
	function line1() {
		var borderbottom = document.querySelector("#email-form");
		borderbottom.classList.remove("line-gray");
		borderbottom.classList.add("line-blue");
	}
	function line2() {
		var borderbottom = document.querySelector("#pwd-form");
		borderbottom.classList.remove("line-gray");
		borderbottom.classList.add("line-blue");
	}
	
	function checkValidation() {
   		var isValidation = true;
   		
   		
   		//모든 에러 메세지를 보여주지 않도록 초기화
   		var errorMsgs = document.querySelectorAll(".errorMsg");
   		errorMsgs.forEach(el => el.classList.add("d-none"));
   
			//uid 검사
			var uid = document.querySelector("#email").value;
			
			
			console.log("email: " + uid);
			if(uid === "") {
				isValidation = false;
				var uidErr1 = document.querySelector("#uidErr1");
				uidErr1.classList.remove("d-none");
				var borderbottom = document.querySelector("#email-form");
				borderbottom.classList.remove("line-gray");
				borderbottom.classList.remove("line-blue");
				borderbottom.classList.add("line-red");
				
				
			} else {
  				var pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	   			var result = pattern.test(email);
	   			if(!result) {
	   				isValidation = false;
	   				var uidErr2 = document.querySelector("#uidErr2");
	   				uidErr2.classList.remove("d-none");
	   				var borderbottom = document.querySelector("#email-form");
					borderbottom.classList.remove("line-gray");
					borderbottom.classList.add("line-red");
					borderbottom.classList.remove("line-blue");
	   			}
  			}
			
			
			
			
			//pwd검사
			var pwd = document.querySelector("#pwd").value;
 			if(pwd ==="") {
  				isValidation = false;
  				var pwdErr = document.querySelector("#pwdErr");
  				pwdErr.classList.remove("d-none");
  				
  				var borderbottom = document.querySelector("#pwd-form");
				borderbottom.classList.remove("line-gray");
				borderbottom.classList.add("line-red");
				borderbottom.classList.remove("line-blue");
  			} else if(pwd !== "") {
  				var borderbottom = document.querySelector("#pwd-form");
				borderbottom.classList.remove("line-red");
				borderbottom.classList.remove("line-blue");
				borderbottom.classList.add("line-gray");
				
  			}

		if(!isValidation) {
			event.preventDefault();
		
		}
}