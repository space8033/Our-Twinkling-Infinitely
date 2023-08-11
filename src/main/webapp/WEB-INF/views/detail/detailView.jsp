<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<form method="post" id="addCart" name="addCart" action="addCart">
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
						<h4 id="product_name" class="m-2 d-flex justify-content-start"><small>${product.product_name}</small></h4>
						<h2 class="m-2 d-flex justify-content-start">
							<small>
								<fmt:formatNumber value="${product.product_price}" type="number"/>
								<input id="product_price" type="hidden" value="${product.product_price}"/>
								<!-- submit: 해당 상품 번호 -->
								<input type="hidden" id="product_price" name="product_product_no" value="${product.product_no}"/>
							</small>
						</h2>
						<div class="custom-select-box">					
							옵션
							<select class="option custom-select m-3" name="cart_optionContent" onclick="myOption1()">
								<option value="none">---[필수]옵션을 선택해 주세요---</option>
								<c:forEach var="productOption" items="${options}">
									<option id="p-option" value="${productOption}">${productOption}</option>
								</c:forEach>
							</select>
						</div>
						<div class="custom-qty">
							수량
							<select class="qty custom-select  m-3" name="cart_qty" onclick="myOption2()">
								<option value="none">---[필수]수량을 선택해 주세요---</option>
								<c:forEach begin="1" end="10" var="i">
									<option id="p-qty" value="${i}">${i}</option>
								</c:forEach>
							</select>
						</div>
						<div class="myOption">
							${product.product_name}
							<div class="d-flex">							
								<div id="select-p-option"></div>
								<div id="select-p-qty"></div>
								<div id="total-price"></div>
							</div>
						</div>
						<div class="m-2">
							<c:if test="${loginIng != null}">
								 <div>
								 	<a class="dtailButton btn btn-outline-dark btn-block m-4" href="${pageContext.request.contextPath}/orderPay">
								 		구매하기
								 	</a>
								 </div>
						 	</c:if>
						 	<c:if test = "${loginIng == null}">
						 		 <div>
								 	<a class="dtailButton btn btn-outline-dark btn-block m-4" href="${pageContext.request.contextPath}/loginForm">
								 		구매하기
								 	</a>
								 </div>
						 	</c:if>
							<div>
								<c:if test="${loginIng != null}">
									<input type="hidden" name="users_users_id" value="${loginIng.users_id}">
								</c:if>
									<button type="submit" class="dtailButton btn btn-outline-dark btn-block m-4">장바구니</button>
							</div>
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