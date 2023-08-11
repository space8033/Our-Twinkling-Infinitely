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
							<span>번호:</span> 
							<span>${review.review_no}</span>
						</p>
						
						<p>
							<span>제목:</span> 
							<span>${review.review_title}</span>
						</p>
						
						<p>
							<span>글쓴이:</span>
							<span>${review.review_name}</span>
						<p>
						
						<p>
							<span>날짜:</span> 
							<span>${review.review_createdDate}</span> <br/>
						</p>
						
					</div>
					
					<div>
						<span class="title">내용:</span> <br/>
						<textarea style="width:100%" readonly>${review.review_contents}</textarea>
					</div>
					
					<a class="btn btn-info btn-sm mt-2" href="review">목록</a>
					
					<c:if test="${review.review_name == loginIng.users_id}">
						<a class="btn btn-info btn-sm mt-2" href="updateReview?review_no=${review.review_no}">수정</a>
						<a class="btn btn-info btn-sm mt-2" href="deleteReview?review_no=${review.review_no}">삭제</a>				
					</c:if>
				</div>
			</div>
		</div>
	</div>