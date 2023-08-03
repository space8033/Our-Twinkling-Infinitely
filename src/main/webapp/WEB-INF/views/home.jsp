<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- 
1) header.jsp의 소스 코드를 복사해서 붙여넣기 
2) 절대경로/는 웹애플리케이션의 로컬루트(WebContent 폴더)
--%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<%-- index.jsp의 중앙 내용 --%>
		<!-- 메인 슬라이더 -->
		<div class="slideshow-container">
			<div class="mySlides fade">
			  <div class="numbertext">1 / 3</div>
			   <img src="${pageContext.request.contextPath}/resources/yuimg/메인슬라이드1.png" style="width:100%">
			</div>
			
			<div class="mySlides fade">
			  <div class="numbertext">2 / 3</div>
			   <img src="${pageContext.request.contextPath}/resources/yuimg/메인슬라이드2.png" style="width:100%">
			</div>
			
			<div class="mySlides fade">
			  <div class="numbertext">3 / 3</div>
			   <img src="${pageContext.request.contextPath}/resources/yuimg/메인슬라이드3.png" style="width:100%">
			</div>
			
		</div>
		<br>
		<div style="text-align:center">
		  <span class="dot"></span> 
		  <span class="dot"></span> 
		  <span class="dot"></span> 
		</div>
		<!-- 상품 리스트 불러오기-->
		<div id="productList">
			<div class="m-4">
				<h6 style="font-weight: bold; text-align: center">영원히 간직되는 반짝임</h5>
				<p style="text-align: center">Our twinkling infinitely</p>
			</div>
		</div>
		<!-- 스토리 -->
		<div class="story container">
		  <img src="${pageContext.request.contextPath}/resources/yuimg/메인스토리.jpg" alt="Avatar" class="image">
		  <div class="overlay container">
		    <div class="text">
		    	<h2>"Our twinkling infinitely"</h2>
		    	<p>영원히 간직되는 반짝임</p>
		    	<p>작은 빛 하나로 반짝이는 순간을 영원히 간직해보세요!</p>
		    	오티아이는 아즉함과 빛을 모티브로 일상의 색체를 바꿔줄 수 있는 소품들을 여러분에게 제한합니다.
		    	<div class="d-flex justify-content-center m-4">
			    	<img src="${pageContext.request.contextPath}/resources/yuimg/메인스토리내용1.jpg" width="300"/>
			    	<img src="${pageContext.request.contextPath}/resources/yuimg/메인스토리내용2.jpg" width="300"/>	    	
			    	<img src="${pageContext.request.contextPath}/resources/yuimg/메인스토리내용3.jpg" width="300"/>	    	
		    	</div>
		    </div>
		  </div>
		</div>

<%-- 
1) footer.jsp의 소스 코드를 복사해서 붙여넣기 
2) 절대경로/는 웹애플리케이션의 로컬루트(WebContent 폴더)
--%>
<%@ include file="/WEB-INF/views/common/footer.jsp" %> 