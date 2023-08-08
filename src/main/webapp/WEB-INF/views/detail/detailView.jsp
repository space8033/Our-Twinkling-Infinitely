<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<form method="post" action="addCart">
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
						<div class="detail1-image m-4">
							<img src="data:MIME;base64, ${product.product_img}" width="500px"/> 
						</div>
				</c:if>
					<div class="detail1-content mt-4">
						<h4 class="m-2 d-flex justify-content-start"><small>${product.product_name}</small></h4>
						<h2 class="m-2 d-flex justify-content-start">
							<small>
								<fmt:formatNumber value="${product.product_price}" type="number"/>
							</small>
						</h2>
						<div class="custom-select-box">					
							옵션<select class="custom-select m-3">
								<option>---[필수]옵션을 선택해 주세요---</option>
								<c:forEach var="productOption" items="${options}">
									<option>${productOption}</option>
								</c:forEach>
							</select>
						</div>
						<div class="m-2">
						<c:if test="${loginIng != null}">
							 <div>
							 	<a class="dtailButton btn btn-outline-dark btn-block m-4">
							 		구매하기
							 	</a>
							 </div>
							 <div>
							 	<a href="${pageContext.request.contextPath}/cart/basket">
							 		<button type="submit" class="dtailButton btn btn-outline-dark btn-block m-4">장바구니</button>
							 	</a>
							 </div>
					 	</c:if>
					 	<c:if test = "${loginIng == null}">
					 		 <div>
							 	<a class="dtailButton btn btn-outline-dark btn-block m-4" href="${pageContext.request.contextPath}/loginForm">
							 		구매하기
							 	</a>
							 </div>
					 		<a href="${pageContext.request.contextPath}/loginForm">
						 		<button type="submit" class="dtailButton btn btn-outline-dark btn-block m-4">장바구니</button>
						 	</a>
					 	</c:if>
						</div>
					</div>
				</div>
			</form>
			<!-- 상품 메뉴 탭 -->
			<ul id="menu-tab" class="nav nav-tabs nav-justified m-3">
			    <li class="t-menu nav-item">
			      <a class="nav-link active" data-toggle="tab" href="#detail">상품 정보</a>
			    </li>
			    <li class="t-menu nav-item">
			      <a class="nav-link" data-toggle="tab" href="#menu1">구매 정보</a>
			    </li>
			    <li class="t-menu nav-item">
			      <a class="nav-link" data-toggle="tab" href="#menu2">상품문의</a>
			    </li>
			    <li class="t-menu nav-item">
			      <a class="nav-link" data-toggle="tab" href="#menu3">상품후기</a>
			    </li>
			</ul>
			<!-- Tab panes -->
			<div class="container mt-3">
				<div class="tab-content">
				    <div id="detail" class="container tab-pane active"><br>
					      <img src="data:MIME;base64, ${detailImg.image_fileName}"/>
				    </div>
				    <div id="menu1" class="container tab-pane fade"><br>
				      <h3>Menu 1</h3>
				    </div>
				    <div id="menu2" class="container tab-pane fade"><br>
				      <h3>Menu 2</h3>
				    </div>
				    <div id="menu3" class="container tab-pane fade"><br>
				      <h3>Menu 3</h3>
				    </div>
			  	</div>
			</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %> 