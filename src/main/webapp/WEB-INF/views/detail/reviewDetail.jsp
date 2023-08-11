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
							<span style="font-weight: bold">한줄평</span> <br> 
							<span>${review.review_title}</span>
						</p>
						
						<p>
							<span>작성자:</span>
							<span>${review.review_name}</span>
						<p>
						
						<p>
							<span>${review.review_createdDate}</span> <br/>
						</p>
						
					</div>
					
					<div>
						<span class="title">내용</span> <br/>
						<div style="width:100%; border:1px solid #dadfe3">
							${review.review_contents}
						</div>
					</div>
					
					<a class="btn btn-info btn-sm mt-2" href="javascript:showReview(${productNum}, 1)">목록</a>
					
					<c:if test="${review.review_name == loginIng.users_id}">
						<a class="btn btn-info btn-sm mt-2" href="updateReview?review_no=${review.review_no}">수정</a>
						<a class="btn btn-info btn-sm mt-2" href="deleteReview?review_no=${review.review_no}">삭제</a>				
					</c:if>
				</div>
			</div>
		</div>
	</div>