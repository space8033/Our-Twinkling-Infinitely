<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

		<div class="detail1 d-flex">
			<div>
				<c:forEach var="image" items="${images}">				
					<c:if test="${image.image_fileName != null}">
						<div>
							<img src="data:MIME;base64, ${image.image_fileName}" width="100"/>
						</div>			
					</c:if>
				</c:forEach>
			</div>
			<c:if test="${product.product_img !=null}">
					<div class="detail1-image">
						<img src="data:MIME;base64, ${product.product_img}" width="100%"/> 
					</div>
			</c:if>
			<div class="detail1-content">
				<h4><small>${product.product_name}</small></h4>
				<h2><small>${product.product_price}</small></h2>
				<div>
					 <span>
					 	<a class="btn btn-outline-dark">구매하기</a>
					 </span>
					 <span>
					 	<a class="btn btn-outline-dark">장바구니</a>
					 </span>
				</div>
			</div>
		</div>
		
<%@ include file="/WEB-INF/views/common/footer.jsp" %> 