<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<div class="card m-2">
	   <div class="card-header">
	      	리뷰 수정하기
	   </div>
	   <div class="card-body">
	      <form id="modifyReview" method="post" action="javascript:modifyForm()" enctype="multipart/form-data">
	         <div class="input-group">
	            <div class="input-group-prepend"><span class="input-group-text">한줄평</span></div>
	            <input id="btitle" type="text" name="reviewTitle" class="form-control" value="${review.review_title}">
	         </div>
	         
	         <div class="input-group">
	            <div class="input-group-prepend"><span class="input-group-text">별점</span></div>
					 <c:if test="${review.review_rating == 1}">
				         <div class="rate">
				         	 <input type="radio" id="rating5" name="reviewRating" value="5"><label for="rating5" title="5점"></label>
			                 <input type="radio" id="rating4" name="reviewRating" value="4"><label for="rating4" title="4점"></label>
			                 <input type="radio" id="rating3" name="reviewRating" value="3"><label for="rating3" title="3점"></label>
			                 <input type="radio" id="rating2" name="reviewRating" value="2"><label for="rating2" title="2점"></label>
			                 <input type="radio" id="rating1" name="reviewRating" value="1" checked="checked"><label for="rating1" title="1점"></label>
				         </div>
						
					 </c:if>
					 <c:if test="${review.review_rating == 2}">
				         <div class="rate">
				         	 <input type="radio" id="rating5" name="reviewRating" value="5"><label for="rating5" title="5점"></label>
			                 <input type="radio" id="rating4" name="reviewRating" value="4"><label for="rating4" title="4점"></label>
			                 <input type="radio" id="rating3" name="reviewRating" value="3"><label for="rating3" title="3점"></label>
			                 <input type="radio" id="rating2" name="reviewRating" value="2" checked="checked"><label for="rating2" title="2점"></label>
			                 <input type="radio" id="rating1" name="reviewRating" value="1"><label for="rating1" title="1점"></label>
				         </div>
						
					 </c:if>
					 <c:if test="${review.review_rating == 3}">
				         <div class="rate">
				         	 <input type="radio" id="rating5" name="reviewRating" value="5"><label for="rating5" title="5점"></label>
			                 <input type="radio" id="rating4" name="reviewRating" value="4"><label for="rating4" title="4점"></label>
			                 <input type="radio" id="rating3" name="reviewRating" value="3" checked="checked"><label for="rating3" title="3점"></label>
			                 <input type="radio" id="rating2" name="reviewRating" value="2"><label for="rating2" title="2점"></label>
			                 <input type="radio" id="rating1" name="reviewRating" value="1"><label for="rating1" title="1점"></label>
				         </div>
						
					 </c:if>
					 <c:if test="${review.review_rating == 4}">
				         <div class="rate">
				         	 <input type="radio" id="rating5" name="reviewRating" value="5"><label for="rating5" title="5점"></label>
			                 <input type="radio" id="rating4" name="reviewRating" value="4" checked="checked"><label for="rating4" title="4점"></label>
			                 <input type="radio" id="rating3" name="reviewRating" value="3"><label for="rating3" title="3점"></label>
			                 <input type="radio" id="rating2" name="reviewRating" value="2"><label for="rating2" title="2점"></label>
			                 <input type="radio" id="rating1" name="reviewRating" value="1"><label for="rating1" title="1점"></label>
				         </div>
						
					 </c:if>
					 <c:if test="${review.review_rating == 5}">
				         <div class="rate">
				         	 <input type="radio" id="rating5" name="reviewRating" value="5" checked="checked"><label for="rating5" title="5점"></label>
			                 <input type="radio" id="rating4" name="reviewRating" value="4"><label for="rating4" title="4점"></label>
			                 <input type="radio" id="rating3" name="reviewRating" value="3"><label for="rating3" title="3점"></label>
			                 <input type="radio" id="rating2" name="reviewRating" value="2"><label for="rating2" title="2점"></label>
			                 <input type="radio" id="rating1" name="reviewRating" value="1"><label for="rating1" title="1점"></label>
				         </div>
						
					 </c:if>
	         </div>
	         
	         <div class="input-group">
	            <div class="input-group-prepend"><span class="input-group-text">리뷰 상세</span></div>
	            <textarea id="bcontent" name="reviewContents" class="form-control"> ${review.review_contents} </textarea>
	         </div>
	         
	         <div class="input-group">
	            <div class="input-group-prepend"><span class="input-group-text">작성자</span></div>
	            <input id="bwriter" type="text" name="reviewWriter" class="form-control" value="${review.review_name}" readonly>
	         </div>
	         
	         <div class="form-group" id="file-list">
	         	<br>
	         	<div class="d-flex">
			        <a href="#this" onclick="addFile()" class="btn btn-info mr-2">이미지 추가</a>
			        <div id="showAlert" style="color: red;">
			        	<span> 이미지는 최대 5개까지 등록 가능합니다.</span>
			        </div>	         	
	         	</div>
		        <br>
		        <div class="file-group mt-2">
		            <input type="file" name="file" style="width:45%; border: solid 1px #f0f0f0">
		        </div>
		    </div>
	            
	         <div class="mt-3">
	            <button class="btn btn-info btn-sm mr-2" >수정하기</button>
	            <a class="btn btn-info btn-sm" href="javascript:showReview(${productNum}, 1)">목록보기</a>
	         </div>
	      </form>
	   </div>
	</div>