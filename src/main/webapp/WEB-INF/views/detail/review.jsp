<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	<div class="card-body">
		<table class="table table-sm table-bordered">
			
			
			<c:forEach var="review" items="${reviews}" varStatus="i">
				<a href="javascript:reviewDetail(${review.review_no})">${review.review_title}</a>
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
			</c:forEach>
			<tr>
				<td colspan="4" class="text-center">
					<div>
						<a class="btn btn-outline-primary btn-sm" href="javascript:showReview(${productNum}, 1)">처음</a>
						<c:if test="${pager.groupNo>1}">
							<a class="btn btn-outline-info btn-sm" href="javascript:showReview(${productNum}, ${pager.startPageNo-1})">이전</a>
						</c:if>
						
						<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
							<c:if test="${pager.pageNo != i}">
								<a class="btn btn-outline-success btn-sm" href="javascript:showReview(${productNum}, ${i})">${i}</a>
							</c:if>
							<c:if test="${pager.pageNo == i}">
								<a class="btn btn-danger btn-sm" href="javascript:showReview(${productNum}, ${i})">${i}</a>
							</c:if>
						</c:forEach>
						
						<c:if test="${pager.groupNo<pager.totalGroupNo}">
							<a class="btn btn-outline-info btn-sm" href="javascript:showReview(${productNum}, ${pager.endPageNo+1})">다음</a>
						</c:if>
						<a class="btn btn-outline-primary btn-sm" href="javascript:showReview(${productNum}, ${pager.totalPageNo})">맨끝</a>
					</div>
				</td>
			</tr>
		</table>
		
		<div class="mt-2">
			<a href="javascript:writeReview(${productNum})" class="btn btn-sm btn-info">새글쓰기</a>
		</div>
	</div>      