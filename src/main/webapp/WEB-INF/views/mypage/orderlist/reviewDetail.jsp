<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<div class="card m-2">
		<div class="card-header">
			게시물 내용
		</div>
		<div class="card-body">
			<div>
				<div>
					<div>
						<p>
							<span style="font-weight: bold">한줄평</span>
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
							<span>${review.review_title}</span>
						</p>
						
						<div>
							<span class="title">리뷰 상세</span> <br/>
							<div style="width:100%; border:1px solid #dadfe3">
								<div class="d-flex">
									<c:forEach var="image" items="${base64Img}">
										<img src="data:MIME;base64, ${image}" height="75" width="75" class="mx-1">
									</c:forEach>
								</div>
								${review.review_contents}
							</div>
						</div>
						<br>
						<p>
							<span>${review.review_name}</span> <span>${review.review_createdDate}</span> <br/>
						</p>
						
					</div>
					
					<a class="btn btn-info btn-sm mt-2" href="javascript:showReviewByUser(1)">목록</a>
					
					<c:if test="${review.review_name == loginIng.users_id}">
						<a class="btn btn-info btn-sm mt-2" href="javascript:showReviewModify(${review.review_no})">수정</a>
						<a class="btn btn-info btn-sm mt-2" href="javascript:deleteReview(${review.review_no})">삭제</a>				
					</c:if>
				</div>
			</div>
		</div>
	</div>