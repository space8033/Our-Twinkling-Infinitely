<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<div class="card m-2">
	   <div class="card-header">
	      	리뷰 작성하기
	   </div>
	   <div class="card-body">
	      <form id="writeBoardForm" method="post" action="writeBoard" enctype="multipart/form-data">
	         <div class="input-group">
	            <div class="input-group-prepend"><span class="input-group-text">한줄평</span></div>
	            <input id="btitle" type="text" name="btitle" class="form-control">
	         </div>
	         
	         <div class="input-group">
	            <div class="input-group-prepend"><span class="input-group-text">리뷰 상세</span></div>
	            <textarea id="bcontent" name="bcontent" class="form-control"></textarea>
	         </div>
	         
	         <div class="input-group">
	            <div class="input-group-prepend"><span class="input-group-text">작성자</span></div>
	            <input id="bwriter" type="text" name="mid" class="form-control" value="${user}" readonly>
	         </div>
	         <div class="input-group">
	            <div class="input-group-prepend"><span class="input-group-text">첨부이미지</span></div>
	            <input id="battach" type="file" name="battach" class="form-control">
	         </div>
	            
	         <div class="mt-3">
	            <button class="btn btn-info btn-sm mr-2">글쓰기</button>
	            <a class="btn btn-info btn-sm" href="javascript:showReview(${productNum}, 1)">목록보기</a>
	         </div>
	      </form>
	   </div>
	</div>