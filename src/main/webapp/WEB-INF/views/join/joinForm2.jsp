<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="icon" href="favicon.ico" type="image/x-icon"> 
      <title>회원가입</title>
      <link rel="icon" href="../common/image/coupang/쿠팡회원가입.png" type="image/x-icon"> 
   </head>
   <style>
	      img {
	           margin: auto;
	           display: block;
	           margin-top: 47px;
	           width: 210px;
	         }
	       .class1 {
	         margin: 0 auto;
	         text-align: left;
	         margin-top: 20px;  
	         width: 500px;
	         height: 40px;
	         box-sizing: border-box;
	         font-size: medium;
	         font-family: dotum,sans-serif;
	      }   
	      
	   
	       ul li span {
	         margin-bottom: 10px;
	         position: relative;
	       }
	       ul li span input {
	           width: 500px;
	           height: 60px;
	      
	       }
	       ul li .id {
	           width: 80px;
	           height: 60px;
	           position: absolute;
	           left: 520px;
	           top: 127px; 
	           border: 1px solid #d7d7d7;    
	       }
	       ul li .pwd {
	         width: 80px;
	           height: 60px;
	           position: absolute;
	           left: 520px;
	           top: 200px;
	       } 
	       
	       ul li .pwdcheck {
	         width: 80px;
	           height: 60px;
	           position: absolute;
	           left: 520px;
	       }
	       ul li .name {
	         width: 80px;
	           height: 60px;
	           position: absolute;
	           left: 520px;
	       }
	       ul li .tel {
	         width: 80px;
	           height: 60px;
	           position: absolute;
	           left: 520px;
	       }
	       .allagree { 
	         display: flex;
	       /*   justify-content: flex-start; */
	         margin:auto;
	         width: 500px;
	         height: 40px;
	         padding: 10px;
	         box-sizing: border-box;
	         font-size: large;
	         font-family: dotum,sans-serif;
	       }
	       span {
	         display: flex;
	         justify-content: center;
	         margin:auto;
	         font-size: small;
	         margin-bottom: 20px;
	       }
	       input {
	         display: flex;
	         /* justify-content: center; */
	         margin:auto; /*box 중앙으로*/
	         width: 500px;
	         height: 40px;
	         border: 1px solid #d7d7d7;
	         color:#acb2a6;
	         padding: 10px;
	         box-sizing: border-box;
	         font-size: small;
	      }
	      
	      .agreementbox {
	         display: flex;
	         justify-content: left; /*체크박스 센터로 */
	         margin: 0 auto; /*체크박스 센터로 */
	         border: 1px solid #d7d7d7;
	         width: 500px;
	         height: 450px;
	           margin-bottom: 30px;
	      }
	   
	      input[type="checkbox"] {
	           float: left;
	           width: 20px; 
	           height: 20px; 
	           margin-right: 10px;
	           margin-left: 0px; /*모두 확인하였으며 동의합니다 체크박스 왼쪽으로*/
	      }
	      .agreement {
	          margin: 20px; 
	      }
	     .agreementlist {
	         padding: 30px;
	     }
	
	     hr {
	        width: 500px;
	        color: #d7d7d7;
	     }
	     
	     label{
	       cursor: pointer;
	     }
	     ul {
	        padding: 0px; /*체크박스 좌측으로  */
	        /* margin-left: 0px;/*체크박스 좌측으로?? */ */
	     }
	     #continue_btn {
	          display: flex;
	         justify-content: center; /*div안의 글자 수평정렬*/
	         align-items: center; /*div안의 글자 수직정렬*/
	         margin:auto;
	         width: 500px;
	         height: 50px;
	         color:white;
	         background-color: #0074E9;
	         font-size: large;
	         margin-bottom: 30px;
	         cursor:pointer;
	     }
	     p {
	        text-align: center;
	        font-size:13px;
	         margin: 0px; /*두 문장간의 사이 간격 */
	     }
	     
	    .biz {
	         text-align: center;
	         margin-top: 10px;
	      }
	     a {
	        text-decoration: none;
	        color: black;
	        font-weight: bold;
	        font-family: dotum,sans-serif;
	     }
	     footer {
	       text-align: center;
	        font-size:13px;
	        margin-top: 40px;
	        margin-bottom: 40px;
	     }
	     
	     .se {
	     	padding-left: 25px;
	     }
	     
		    #id {
	           background : url('../common/image/coupang/id.png');
	           background-repeat: no-repeat;
	           background-size: 40px;
	           padding-left: 50px;
	           height: 40px;
	        }
	        #pwd {
	           background : url('../common/image/coupang/pwd.png');
	           background-repeat: no-repeat;
	           background-size: 40px;
	           padding-left: 50px;
	           height: 40px;
	        }
	        #pwdcheck {
	          background : url('../common/image/coupang/pwdcheck.png');
	           background-repeat: no-repeat;
	           background-size: 40px;
	           padding-left: 50px;
	           height: 40px;
	        }
	        #name {
	          background : url('../common/image/coupang/name.png');
	           background-repeat: no-repeat;
	           background-size: 40px;
	           padding-left: 50px;
	           height: 40px;
	        }
	        #tel {
	          background : url('../common/image/coupang/tel.png');
	           background-repeat: no-repeat;
	           background-size: 40px;
	           padding-left: 50px;
	           height: 40px;
	        }
     
   </style>
   
   <body>
	      <a href="https://www.coupang.com/" target="_self">
	        <img src="../common/image/coupang/쿠팡글자.png"/>
	      </a>
	      <div class="class1">회원정보를 입력해주세요</div>
	     
	   <ul>
	      <li>
	         <span><input type="email" id="id" name="id" placeholder="아이디(이메일)" onfocus="this.placeholder=''" /></span>
	      </li>
	      <li>
	         <span><input type="password" id="pwd" name="pwd" placeholder="비밀번호" minlength="8" maxlength="20" onfocus="this.placeholder=''" /></span>
	      </li>
	      <li>
	         <span><input type="password" id="pwdcheck" name="pwdcheck" placeholder="비밀번호 확인" onfocus="this.placeholder=''" /></span>
	      </li>
	      <li>
	         <span><input type="text" id="name" name="name" placeholder="이름" onfocus="this.placeholder=''" /></span>
	      </li>
	      <li>
	         <!--클릭했을 때, placeholder 의 문구를 사라지게 함  --> 
	         <span><input type="tel" id="tel" pattern="010-[0-9]{3,4}-[0-9]{4}" placeholder="휴대폰 번호" onfocus="this.placeholder=''" /></span>   
	      </li>
	   </ul>
	
	   <hr>
	      <div class="allagree">
	          <input type="checkbox" id="agree" name="agree" value="agree"/>
	             <label for="agree">모두 확인하였으며 동의합니다.</label>
	      </div>
	      <span>전체 동의에는 필수 및 선택 정보에 대한 동의가 포함되어 있으며, 개별적으<br>로 동의를 선택 하실 수 있습니다. 선택 항목에 대한 동의를 거부하시는 경우<br>에도 서비스 이용이 가능합니다.</span>
	      
	      
	      <div class="agreementbox">
	       
	           <div class="agreement">
	              <input type="checkbox" id="agree1" name="agree" value="agree"/>
	               <label for="agree1">[필수] 만 14세 이상입니다</label>
	               <!--    <i class="fa-light fa-square-check"></i> -->
	           </div>     
	           <div class="agreement">
	               <input type="checkbox" id="agree2" name="agree" value="agree"/>
	               <label for="agree2">[필수] 쿠팡 이용약관 동의</label>
	           </div>     
	           <div class="agreement">
	               <input type="checkbox" id="agree3" name="agree" value="agree"/>
	               <label for="agree3">[필수] 전자금융거래 이용약관 동의 </label>
	           </div>     
	           <div class="agreement">
	               <input type="checkbox" id="agree4" name="agree" value="agree"/>
	               <label for="agree4">[필수] 개인정보 수집 및 이용 동의</label>
	           </div>     
	           <div class="agreement">
	               <input type="checkbox" id="agree5" name="agree" value="agree"/>
	               <label for="agree5">[필수] 개인정보 제3자 제공 동의</label>
	           </div>     
	           <div class="agreement">
	               <input type="checkbox" id="agree6" name="agree" value="agree"/>
	               <label for="agree6">[선택] 마케팅 목적의 개인정보 수집 및 이용 동의</label>
	           </div>     
	           <div class="agreement">
	               <input type="checkbox" id="agree7" name="agree" value="agree"/>
	               <label for="agree7">[선택] 광고성 정보 수신 동의</label>
	           </div>     
	           <div class="se">
		           <div class="agreement">
		               <input type="checkbox" id="agree8" name="agree" value="agree"/>
		               <label for="agree8">     [선택] 이메일 수신 동의</label>
		           </div>     
		           <div class="agreement">
		               <input type="checkbox" id="agree9" name="agree" value="agree"/>
		               <label for="agree9">     [선택] SMS, SNS 수신 동의</label>
		           </div>     
		           <div class="agreement">
		               <input type="checkbox" id="agree10" name="agree" value="agree"/>
		               <label for="agree10">     [선택] 앱 푸시 수신 동의</label>
		           </div>     
	           </div>
	     
	     </div>
	     
	     <button type="submit" id="continue_btn">동의하고 계속하기</button>
	     <p>법인 고객이신가요?</p>
	     <p>사업자 회원으로 전용 특가 혜택을 누려보세요.</p>
	     <div class="biz"><a href="https://pages.coupang.com/p/92079">쿠팡비즈 간편가입 > </a></div>
	     <footer> ©Coupang Corp. All rights reserved. </footer>
   </body>
</html>