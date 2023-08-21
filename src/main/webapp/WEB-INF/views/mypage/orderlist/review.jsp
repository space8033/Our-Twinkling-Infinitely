<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	<div class="card-body">
		<table class="table table-sm table-bordered">
			
			<c:set var="myReview" value="${reviews}" /> <!-- yourList는 컨트롤러에서 넘겨준 List 객체입니다. -->

			<c:if test="${empty myReview}">
			    <div style="text-align: center">
				    <p>리뷰가 없습니다.</p>
				</div>
			</c:if>
			<c:if test="${not empty myReview}">
				<c:forEach var="review" items="${myReview}">
					<div class="d-flex">
						<a href="javascript:myReviewDetail(${review.review_no})">${review.review_title}</a>
						<c:if test="${review.review_images != 0}">
							<img src="${pageContext.request.contextPath}/resources/oimg/camera.png" width="25" height="25" class="ml-2">
						</c:if>
					</div>
					<br>
					<c:if test="${review.review_rating == 0}">
						<span class="fa fa-star"></span>
						<span class="fa fa-star"></span>
						<span class="fa fa-star"></span>
						<span class="fa fa-star"></span>
						<span class="fa fa-star"></span>
					</c:if>
					<c:if test="${review.review_rating == 1}">
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star"></span>
						<span class="fa fa-star"></span>
						<span class="fa fa-star"></span>
						<span class="fa fa-star"></span>
					</c:if>
					<c:if test="${review.review_rating == 2}">
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star"></span>
						<span class="fa fa-star"></span>
						<span class="fa fa-star"></span>
					</c:if>
					<c:if test="${review.review_rating == 3}">
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star"></span>
						<span class="fa fa-star"></span>
					</c:if>
					<c:if test="${review.review_rating == 4}">
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star"></span>
					</c:if>
					<c:if test="${review.review_rating == 5}">
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
						<span class="fa fa-star checked"></span>
					</c:if>
					
					<br>
					${review.review_name}<br>
					${review.review_createdDate}<br>
					<br>
					
					<hr style="color: #e8e9eb">
				</c:forEach>
			    
			</c:if>
			<tr>
				<td colspan="4" class="text-center">
					<div>
						<a class="btn btn-outline-primary btn-sm" href="javascript:showReviewByUser(1)">처음</a>
						<c:if test="${pager.groupNo>1}">
							<a class="btn btn-outline-info btn-sm" href="javascript:showReviewByUser(${pager.startPageNo-1})">이전</a>
						</c:if>
						
						<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
							<c:if test="${pager.pageNo != i}">
								<a class="btn btn-sm" href="javascript:showReviewByUser(${i})" style="color: black;">${i}</a>
							</c:if>
							<c:if test="${pager.pageNo == i}">
								<a class="btn btn-sm" href="javascript:showReviewByUser(${i})" style="color: #53aeff; font-weight: bold;">${i}</a>
							</c:if>
						</c:forEach>
						
						<c:if test="${pager.groupNo<pager.totalGroupNo}">
							<a class="btn btn-outline-info btn-sm" href="javascript:showReviewByUser(${pager.endPageNo+1})">다음</a>
						</c:if>
						<a class="btn btn-outline-primary btn-sm" href="javascript:showReviewByUser(${pager.totalPageNo})">맨끝</a>
					</div>
				</td>
			</tr>
		</table>
		
	</div>      