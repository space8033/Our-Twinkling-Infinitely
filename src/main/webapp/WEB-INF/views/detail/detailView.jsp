<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

		<div class="detail1 d-flex">
			<div>
				<c:forEach var="image" items="${images}">				
					<c:if test="${image.image_fileName != null}">
						<div class="m-2">
							<img src="data:MIME;base64, ${image.image_fileName}" width="100"/>
						</div>			
					</c:if>
				</c:forEach>
			</div>
			<c:if test="${product.product_img !=null}">
					<div class="detail1-image">
						<img src="data:MIME;base64, ${product.product_img}" width="500px"/> 
					</div>
			</c:if>
			<div class="detail1-content">
				<h4 class="m-2 d-flex justify-content-start"><small>${product.product_name}</small></h4>
				<h2 class="m-2 d-flex justify-content-start">
					<small>
						<fmt:formatNumber value="${product.product_price}" type="number"/>
					</small>
				</h2>
				<div class="m-2">
					 <span>
					 	<a class="btn btn-outline-dark">구매하기</a>
					 </span>
					 <span>
					 	<a href="${pageContext.request.contextPath}/cart/basket" class="btn btn-outline-dark">장바구니</a>
					 </span>
				</div>
			</div>
		</div>
		
<%@ include file="/WEB-INF/views/common/footer.jsp" %> 