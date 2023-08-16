<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link rel="icon" href="../../common/image/coupang/쿠팡아이콘.png" type="image/x-icon">
      <title>OTi | 장바구니</title>
      
      <!-- Bootstrap을 사용하기 위한 외부 라이브러리 가져오기 -->
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
      <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
      <!-- loading-overlay를 사용하기 위한 라이브러리 -->
      <script src="https://cdn.jsdelivr.net/npm/gasparesganga-jquery-loading-overlay@2.1.7/dist/loadingoverlay.min.js"></script>
      
      <script src="${pageContext.request.contextPath}/resources/js/basket.js"></script>
      <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cart.css"/>
      <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css"/>
   </head>
	   
   <body style="background-color: white;">
   		<div id="wrapper" width="980px">
   			<header id="header">
   				<div class="logo">
   					<a href="${pageContext.request.contextPath}">
   					  <img src="${pageContext.request.contextPath}/resources/yuimg/메인로고.png"/>
   					</a>
   				</div>
   			</header>
   			<form method="post" id="orderForm" name="addOrderProduct" action="addOrderProduct">
	   			<section id="contents" style="background-color: white;">
	   				<div  class="card-body">
			      		<section>
	   						<div class="c_title">
	   							<img src=""/>
	   						</div>
	   						<article>
	   							<div>
	   								<span class="tab1">일반구매</span>
	   							</div>
									<table id="table" class="table">
										<colgroup class="col">
											<col width="50">
											<col width="80">
											<col width="*">
											<col width="90">
											<col width="90">
										</colgroup>
									    <thead>
									     <tr class="head">
									       <th scope="col">
									           <label>	
												   <input title="모든 상품을 결제상품으로 설정" 
														type="checkbox" 
														id="cboxAll_top"
														class="cboxAll"  
														value="selectall"
														name="chk"
														onclick="checkAll()" />
					        				   </label>
		                                   </th>
									       <th></th>
									       <th scope="colgroup">상품정보</th>
									       <th scope="col">상품금액</th>
									       <th scope="col">배송비</th>
									       <th scope="col"></th>
									     </tr>
									    </thead>
											   
									    <tbody id ="basket_tbody">
											<tbody id ="basket_tbody">
											<!-- 상품 리스트(json) 불러오는 곳 -->  
										    </tbody>
									     </tbody>
							     	     <tr class="t3" colspan="5">
									         <td></td>
									         <td></td>
									         <td class="t3_td">
									        	 <div class="t3_td_contents">
										             <span class="t3_td_contents text-muted">장바구니에서 선택할 옵션을 선택하시고,</span>
												     <span class="t3_td_contents text-primary">구매하기</span>
												     <span class="t3_td_contents text-muted">버튼을 눌러보세요!</span>
									        	 </div>
									    		<div class="t3_td_contents text-muted">선택한 옵션을 모두 장바구니에 담을 수 있습니다</div>
									    	    <div class="t3_td_button">
												    <a href="${pageContext.request.contextPath}">										    	
											    		<button class="btn btn-primary">오늘의 추천 상품보기 ></button>
												    </a>
												</div>    
									       	</td>
								     		<td></td>
								     		<td></td>
								     		<td></td>
							    		</tr>
								    </table>
	   							
								<div id="lastselector" class="lastselector">
									<label>
						        		<input title="모든 상품을 결제상품으로 설정" 
						        				type="checkbox"
						    					id="cboxAll_bottom"
						        				class="cboxAll"  
						        				value="selectall"
						        				name="chk"
						        				onclick="checkAll()" />
						        	    <span class="selection">전체선택</span>
						        		<span class="selection">(</span>
						        		<span id="s_p_choice" class="selection"></span>
						        		<span class="selection">/</span>
						        		<span id="s_t_choice" class="selection"></span>
						        		<span class="selection" style="margin-right: 10px;">)</span>
					        	    </label>
						        	<button id="btn_delete" onclick=" AllDeleteConfirmDialog()" class="delete" style="margin-right: 10px;">전체삭제</button>   
							   </div>
							   <div class="cash_benefit_wrapper border rounded-sm">
					    		<div class="cash_benefit_contents">
					    			<img src="//img1a.coupangcdn.com/image/cart/generalCart/ico_cash_m_2x.png" width="24"/>
					    			<span class="cbc_title">캐시적립 혜택</span>
					    		</div>
					    		<div class="d-flex">
						    		<div class="cbc_details" style="width: 75%">
							    		<div>모든 상품 결제 시 5%  추가적립</div>
							    		<div>(oti는 전상품 <span class="text-danger">배송비 포함</span> 상품 입니다)</div>
						    		</div>
					    		</div>
	  				    	  </div>
	  				    	  <div class="total_order_price">
	  				    	  	<span class="top_text">총 상품가격</span>
	  				    	  	<span id="top_product" class="top_price">0</span>
	  				    	  	<span class="top_text" style="margin-right: 20px;">원</span>
	  				    	  	<span class="top_calculator" style="margin-right: 20px;">+</span>
	  				    	  	<span class="top_text">총 배송비</span>
	  				    	  	<span id="top_delivery" class="top_price">0</span>
	  				    	  	<span class="top_text" style="margin-right: 20px;">원</span>
	  				    	  	<span class="top_calculator" style="margin-right: 20px;">=</span>
	  				    	  	<span class="top_text">총 주문금액</span>
	  				    	  	<span id="top_total" class="top_price text-danger">0</span>
	  				    	  	<span class="top_text">원</span>
	  				    	  </div>
	   				    	</article>
	   				    	<div class="btns">
	   				    		<a href="${pageContext.request.contextPath}">   				    		
	   				    			<button class="btn1 btn btn-outline-primary m-1">계속 쇼핑하기</button>
	   				    		</a>
	   				    		<c:if test="${loginIng == null}">
	   				    			<a href="${pageContext.request.contextPath}/loginForm">   				    			
	   				    				<button class="btn2 btn btn-primary m-1">구매하기</button>
	   				    			</a>   				    		
	   				    		</c:if>
	   				    		<c:if test="${loginIng != null}">
	   				    			<button type="submit" class="btn2 btn btn-primary m-1">구매하기</button>
	   				    		</c:if>
	   				    	</div>
	   				    </section>
	      			</div>
	   			</section>
   			</form>
<%@ include file="/WEB-INF/views/common/footer.jsp" %> 