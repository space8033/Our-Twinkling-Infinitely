<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
		<form method="post" id="addCart" name="addCart" action="addCart">
			<div class="detail1 d-flex">
				<div>
					<c:forEach var="image" items="${images}">				
						<c:if test="${image.image_fileName != null}">
							<div class="m-2">
								<img class="hover-image" src="data:MIME;base64, ${image.image_fileName}" width="100"/>
							</div>			
						</c:if>
					</c:forEach>
				</div>
				<c:if test="${product.product_img !=null}">
					<div class="detail1-image m-4">
						<img id="main-image" src="data:MIME;base64, ${product.product_img}" width="500px"/> 
						<!-- submit: product_img (해당 상품 base64로 인코딩 된 이미지) -->
						<input type="hidden" name="product_img" value="${product.product_img}"/> 
					</div>
				</c:if>
					<div class="detail1-content mt-4">
						<h4 id="product_name" class="m-2 d-flex justify-content-start"><small>${product.product_name}</small></h4>
						<h2 class="m-2 d-flex justify-content-start">
							<small>
								<fmt:formatNumber value="${product.product_price}" type="number"/>
								<!-- submit: product_price(해당 상품 가격) -->
								<input id="product_price" name="product_price" type="hidden" value="${product.product_price}"/>
								<!-- submit: product_product_no(해당 상품 번호) -->
								<input type="hidden" id="product_price" name="product_product_no" value="${product.product_no}"/>
							</small>
						</h2>
						<div class="custom-select-box">					
							옵션
							<select id="option1" class="option custom-select m-3" name="cart_optionContent" onclick="myOption1()">
								<option value="none">---[필수]옵션을 선택해 주세요---</option>
								<c:forEach var="productOption" items="${options}">
									<option id="${productOption.productOption_no}" value="${productOption.productOption_type}">${productOption.productOption_type}</option>
								</c:forEach>
							</select>
						</div>
						<div class="custom-qty">
							수량
							<!-- submit: cart_qty(상품 수량) -->
							<select id="option2" class="qty custom-select  m-3" name="cart_qty" onclick="myOption2()">
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
							<div>
								<!-- submit: users_users_id (로그인 한 유저 아이디) -->
								<input type="hidden" name="users_users_id" value="${loginIng.users_id}">
								<button type="submit" class="dtailButton btn btn-outline-dark btn-block m-4">장바구니</button>
							</div>
						</div>
					</form>
					<form method="post" id="addOrderProduct" name="addOrderProduct" action="addOrderProduct">		
						<input type="hidden" name="productCheckBox" value="1">			
						<input id="submitOrderProduct1" type="hidden" name="productOption_productOption_no" value="">			
						<input id="submitOrderProduct2" type="hidden" name="orderProduct_qty" value="">				
						<input id="submitOrderProduct3" type="hidden" name="product_product_no" value="${productOption.product_product_no}">			
						<button type="submit" class="dtailButton btn btn-outline-dark btn-block m-4">구매하기</button>
					</form>
				</div>
			</div>
			<!-- 유효성 검사 -->
			<div class="alert alert-info alert-dismissible" id="detailAlert">
			    <button type="button" class="close">&times;</button>
			    <strong>필수 옵션이 선택되지 않았습니다!</strong> 
			    <div>해당 상품의 필수 옵션을 선택해 주세요.</div>
		    </div>
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
				    <div id="detail" class="tabMenu-content container tab-pane active"><br>
					      <img src="data:MIME;base64, ${detailImg.image_fileName}"/>
				    </div>
				    <div id="menu1" class="tabMenu-content container tab-pane fade"><br>
				    	<div class="content-all">
							<div class="cont d-flex">
								<div class="cont_inner">
							    	<h3>상품결제정보</h3>
								         고액결제의 경우 안전을 위해 카드사에서 확인전화를 드릴 수도 있습니다. 확인과정에서 도난 카드의 사용이나 타인 명의의 주문등
								       정상적인 주문이 아니라고 판단될 경우 임의로 주문을 보류 또는 취소할 수 있습니다. &nbsp; <br/>
								      무통장 입금은 상품 구매 대금은 PC뱅킹, 인터넷뱅킹, 텔레뱅킹 혹은 가까운 은행에서 직접 입금하시면 됩니다. &nbsp;<br/>
								      주문시 입력한&nbsp;입금자명과 실제입금자의 성명이 반드시 일치하여야 하며, 7일 이내로 입금을 하셔야 하며&nbsp;입금되지
								      않은 주문은 자동취소 됩니다. <br/>
								</div>
						        <div class="cont_inner">
						            <h3>배송정보</h3>
								    <ul class="delivery">
										<li>배송 방법 : 택배</li>
								        <li>배송 지역 : 전국지역</li>
								        <li>배송 비용 : 2,500원</li>
								        <li>배송 기간 : 1일 ~ 7일</li>
								        <li>배송 안내 : 산간벽지나 도서지방은 별도의 추가금액을 지불하셔야 하는 경우가 있습니다.<br>
								   		 고객님께서 주문하신 상품은 입금 확인후 배송해 드립니다. 다만, 상품종류에 따라서 상품의 배송이 다소 지연될 수 있습니다.<br>
										</li>
								     </ul>
								 </div>
							</div>
						     <div class="cont_inner">
								 <h3>교환 및 반품정보</h3>
								 <strong>교환 및 반품 주소</strong>
								 <br>&nbsp;- [091928] 서울시 여기구 저기동 안아파트 강호동 강백호
								 <br>&nbsp;
								 <br><strong>교환 및 반품이 가능한 경우</strong>
								 <br>&nbsp;-&nbsp;계약내용에 관한 서면을 받은 날부터&nbsp;7일.&nbsp;단,&nbsp;그 서면을 받은 때보다 재화등의 공급이 늦게 이루어진 경우에는 재화등을 공급받거나 재화등의 공급이 시작된 날부터&nbsp;7일 이내
								 <br>&nbsp; -&nbsp;공급받으신 상품 및 용역의 내용이 표시.광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 재화 등을 공급받은 날 부터&nbsp;3월이내,&nbsp;그사실을 알게 된 날 또는 알 수 있었던 날부터&nbsp;30일이내
							 	 <br>&nbsp;
								 <br><strong>교환 및 반품이 불가능한 경우</strong>
								 <br>&nbsp;-&nbsp;이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우(다만,&nbsp;재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다)
								 <br>&nbsp; -&nbsp;이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우
								 <br>&nbsp; -&nbsp;시간의 경과에 의하여 재판매가 곤란할 정도로 재화등의 가치가 현저히 감소한 경우
								 <br>&nbsp; -&nbsp;복제가 가능한 재화등의 포장을 훼손한 경우
								 <br>&nbsp; -&nbsp;개별 주문 생산되는 재화 등 청약철회시 판매자에게 회복할 수 없는 피해가 예상되어 소비자의 사전 동의를 얻은 경우
								 <br>&nbsp; -&nbsp;디지털 콘텐츠의 제공이 개시된 경우, (다만,&nbsp;가분적 용역 또는 가분적 디지털콘텐츠로 구성된 계약의 경우 제공이 개시되지 아니한 부분은 청약철회를 할 수 있습니다.)
								 <br>&nbsp;
								 <br>※ 고객님의 마음이 바뀌어 교환,&nbsp;반품을 하실 경우 상품반송 비용은 고객님께서 부담하셔야 합니다.
								 <br>&nbsp;(색상 교환,&nbsp;사이즈 교환 등 포함)
								 <br>
							</div>	
				    	</div>
				    </div>
				    <div id="menu2" class="tabMenu-content container tab-pane fade"><br>
				       <table>
				       	<colgroup>
				      		<col width="7%">
				      		<col width="8%">
				      		<col width="10%">
				      		<col width="auto">
				      		<col width="12%">
				      		<col width="13%">
				      	</colgroup>
				      	<thead>
				      		<tr>
				      			<th scope="col">번호</th>
				      			<th scope="col">답변여부</th>
				      			<th scope="col">구분</th>
				      			<th scope="col">내용</th>
				      			<th scope="col">작성자</th>
				      			<th scope="col">등록일자</th>
				      		</tr>
				      	</thead>
				      	<tbody>
				      		<c:forEach var="pinquary" items="${pinquirys}">
				      			<c:if test="${pinquirys == null}">
				      				<tr>
				      					<td colspan="6">등록된 상품문의가 없습니다.</td>
				      				</tr>
				      			</c:if>				      		
					      		<tr onclick="showInquiryContent(this)">
					      			<td>${pinquary.pinquiry_no}</td>
					      			<td>답변예정</td>
					      			<td>
					      				<c:if test="${pinquary.pinquiry_type == 1}">
					      					크기
					      				</c:if>
					      				<c:if test="${pinquary.pinquiry_type == 2}">
					      					배송
					      				</c:if>
					      				<c:if test="${pinquary.pinquiry_type == 3}">
					      					재입고
					      				</c:if>
					      				<c:if test="${pinquary.pinquiry_type == 4}">
					      					상품상세문의
					      				</c:if>
					      				<c:if test="${pinquary.pinquiry_type == 5}">
					      					기타
					      				</c:if>
					      			</td>
					      			<td>${pinquary.pinquiry_title}</td>
					      			<td>${pinquary.users_users_id}</td>
					      			<td>${pinquary.pinquiry_createdDate}</td>
					      		</tr>
					      		<tr class="content-row">
					      			<td colspan="6">
					      				<div class="content">${pinquiry.pinquiry_content}</div>
					      			</td>	
					      		</tr>
				      		</c:forEach>
				      	</tbody>
				      </table>
				      <div class="d-flex justify-content-center m-4">
						<a class="btn btn-sm" href="?product_no=${product.product_no}&pageNo=1">처음</a>
						<c:if test="${pager3.groupNo>1}">
							<a class="btn btn-sm" href="?product_no=${product.product_no}&pageNo=${pager3.startPageNo-1}">이전</a>
						</c:if>
						
						<c:forEach var="i" begin="${pager3.startPageNo}" end="${pager3.endPageNo}">
							<c:if test="${pager3.pageNo != i}">
								<a class="btn btn-sm" href="?product_no=${product.product_no}&pageNo=${i}">${i}</a>
							</c:if>
							<c:if test="${pager3.pageNo == i}">
								<a class="btn btn-sm" href="?product_no=${product.product_no}&pageNo=${i}">${i}</a>
							</c:if>
						</c:forEach>
						
						<c:if test="${page3.groupNo<pager3.totalGroupNo}">
							<a class="btn btn-sm" href="?product_no=${product.product_no}&pageNo=${pager3.endPageNo+1}">다음</a>
						</c:if>
						<a class="btn btn-sm" href="?product_no=${product.product_no}&pageNo=${pager3.totalPageNo}">맨끝</a>
					  </div>
				      <button class="btn btn-primary" type="submit" onclick="openProductInquiryPopup()">작성하기</button>
				    </div>
				    <div id="menu3" class="tabMenu-content container tab-pane fade"><br>
				      
				    </div>
			  	</div>
			</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %> 