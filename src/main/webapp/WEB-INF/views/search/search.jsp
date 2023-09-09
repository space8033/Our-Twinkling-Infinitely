<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
		
		<!-- 상품 리스트 불러오기-->
		<br>
		<c:if test="${empty products}">
			<div class="d-flex justify-content-center mt-5">
				<div>조건에 맞는 상품이 없습니다.</div>
			</div>
		</c:if>
			<br>
			
		<c:if test="${not empty products}">
			<div id="product-list" class="container d-flex flex-wrap m-2">	
				<c:forEach var="product" items="${products}">
					<a href="detailProduct?product_no=${product.product_no}">
						<div>
							<div class="m-2">
							    <div class="product-image">
							    	<c:if test="${product.product_img !=null}">
										<img src="data:MIME;base64, ${product.product_img}" width="250"/> 
									</c:if>
							    </div> 
							    <div class="product-content">
							    	<div class="product-title d-flex justify-content-center text-dark m-2">${product.product_name}</div>
							    	<div class="d-flex justify-content-center product-price">
							    		<fmt:formatNumber value="${product.product_price}" type="number"/>
							    	</div>
							     </div>
							</div>
						</div>
					</a>
				</c:forEach>
			</div>
			<div class="d-flex justify-content-center m-4">
				<a class="btn btn-sm" href="?search=${search}&pageNo4=1">처음</a>
				<c:if test="${pager.groupNo>1}">
					<a class="btn btn-sm" href="?search=${search}&pageNo4=${pager.startPageNo-1}">이전</a>
				</c:if>
				
				<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
					<c:if test="${pager.pageNo != i}">
						<a class="btn btn-sm" href="?search=${search}&pageNo4=${i}">${i}</a>
					</c:if>
					<c:if test="${pager.pageNo == i}">
						<a class="btn btn-sm" href="?search=${search}&pageNo4=${i}">${i}</a>
					</c:if>
				</c:forEach>
				
				<c:if test="${pager.groupNo<pager.totalGroupNo}">
					<a class="btn btn-sm" href="?search=${search}&pageNo4=${pager.endPageNo+1}">다음</a>
				</c:if>
				<a class="btn btn-sm" href="?search=${search}&pageNo4=${pager.totalPageNo}">맨끝</a>
			</div>
		</c:if>
		<!-- 페이지 -->  	

<%-- 
1) footer.jsp의 소스 코드를 복사해서 붙여넣기 
2) 절대경로/는 웹애플리케이션의 로컬루트(WebContent 폴더)
--%>
<%@ include file="/WEB-INF/views/common/footer.jsp" %> 