<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<div class="card-body">
		<table class="table table-sm table-bordered">
			<tr>
				<th style="width:30px">번호</th>
				<th style="width:300px">제목</th>
				<th style="width:70px">글쓴이</th>
				<th style="width:70px">날짜</th>
			</tr>
			
			<c:forEach var="review" items="${reviews}">
				<tr>
					<td>${review.review_no}</td>
					<td><a href="reviewDetail?review_no=${review.review_no}">${review.review_title}</a></td>
					<td>${review.review_name}</td>
					<td>${review.review_createdDate}</td>
				</tr>
			</c:forEach>
			
			<tr>
				<td colspan="4" class="text-center">
					<div>
						<a class="btn btn-outline-primary btn-sm" href="?product_no=${productNum}&pageNo2=1">처음</a>
						<c:if test="${pager.groupNo>1}">
							<a class="btn btn-outline-info btn-sm" href="?detailProduct?product_no=${productNum}&pageNo2=${pager.startPageNo-1}">이전</a>
						</c:if>
						
						<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
							<c:if test="${pager.pageNo != i}">
								<a class="btn btn-outline-success btn-sm" href="detailProduct?product_no=${productNum}&pageNo2=${i}">${i}</a>
							</c:if>
							<c:if test="${pager.pageNo == i}">
								<a class="btn btn-danger btn-sm" href="detailProduct?product_no=${productNum}&pageNo2=${i}">${i}</a>
							</c:if>
						</c:forEach>
						
						<c:if test="${pager.groupNo<pager.totalGroupNo}">
							<a class="btn btn-outline-info btn-sm" href="detailProduct?product_no=${productNum}&pageNo2=${pager.endPageNo+1}">다음</a>
						</c:if>
						<a class="btn btn-outline-primary btn-sm" href="detailProduct?product_no=${productNum}&pageNo2=${pager.totalPageNo}">맨끝</a>
					</div>
				</td>
			</tr>
		</table>
		
		<div class="mt-2">
			<a href="writeBoard" class="btn btn-sm btn-info">새글쓰기</a>
		</div>
	</div>      