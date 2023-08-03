<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <body>
	   <div id="title" class="mt-3 ml-5"> 
		  <h2>Oti</h2>
	   </div>
	   <div class="container">
	   	<div id="menuBar">
	   		<ul class="nav justify-content-end">
			    <li class="nav-item">
			      <a class="nav-link" href="#">LOGIN</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link" href="#">MODIFY</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link" href="#">CART</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link" href="#">ORDER</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link" href="#">MYPAGE</a>
			    </li>
			    <li class="nav-item">
			       <a href="#"><i class="fa fa-search mt-2" onclick="showSearchBar()"></i></a>
			    </li>
		  	</ul>
		  	<div class="topnav container">
			  <div class="search-container">
			    <form action="/action_page.php">
			      <input type="text" placeholder="Search.." name="search">
			      <button type="submit"><i class="fa fa-search"></i></button>
			    </form>
			  </div>
			<button id="hideSearchBar" class="btn btn-outline-light text-dark">X</button>
			</div>
	   	</div>

   </body>
</html>
   