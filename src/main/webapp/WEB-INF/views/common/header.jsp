<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="icon" href="${pageContext.request.contextPath}/resources/images/logo-spring.png" type="image/x-icon">
      <title>Insert title here</title>
      
      <!-- Bootstrap을 사용하기 위한 외부 라이브러리 가져오기 -->
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
      <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
   </head>
   <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css"/>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/detailView.css"/>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <body>
	   <div class="container">
		   <div id="title"> 
		   	<div class="logo">		   	
			   <a href="${pageContext.request.contextPath}">	   
				  <img src="${pageContext.request.contextPath}/resources/yuimg/메인로고.png" width="180"/>
			   </a>	
		   	</div>
		   	<div class="logo">		   	
			   <p style="width: 200px;">Our-Twinkling-Infinitely</p>	   
		   	</div>
		   </div>
		   	<div class="menuBar" class="d-flex">
		   		<div id="search-icon" style="width: 40%">		   		
				    <span class="nav-item">
				       <a href="#"><i class="fa fa-search mt-2" onclick="showSearchBar()"></i></a>
				    </span>
		   		</div>
			  	<div class="topnav container">
				  <div class="search-container">
				    <form action="/action_page.php">
				      <input type="text" placeholder="Search.." name="search">
				      <button type="submit"><i class="fa fa-search"></i></button>
				    </form>
				  </div>
				<button id="hideSearchBar" class="btn btn-outline-light text-dark">X</button>
				</div>
		   		<div class="menu">		   		
			   		<ul class="nav justify-content-end">
					    <li class="nav-item">
					      <a class="nav-link" href="${pageContext.request.contextPath}/loginForm">LOGIN</a>
					    </li>
					    <li class="nav-item">
					      <a class="nav-link" href="${pageContext.request.contextPath}/joinForm">JOIN</a>
					    </li>
					    <li class="nav-item">
					      <a class="nav-link" href="${pageContext.request.contextPath}/modify">MODIFY</a>
					    </li>
					    <li class="nav-item">
					      <a class="nav-link" href="${pageContext.request.contextPath}/cart">CART</a>
					    </li>
					    <li class="nav-item">
					      <a class="nav-link" href="${pageContext.request.contextPath}/mypage">MYPAGE</a>
					    </li>
				  	</ul>
		   		</div>
	   		</div>

   </body>
</html>
   