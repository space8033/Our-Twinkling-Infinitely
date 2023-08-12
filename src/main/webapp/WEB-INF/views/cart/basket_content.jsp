<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
											<c:forEach var="product" items="${carts}">
												<tr class="productRow">
													<td>
											               <input id="chk" title="${product.product_name} 상품을 결제상픔으로 결정" type="checkbox" name="#" class="pchk" value="${product.product_price}"onclick="loading()" />
											           </td>
											           <td class="p_img">
											   		   		<c:if test="${product.product_img !=null}">
											           			<img src="data:MIME;base64, ${product.product_img}" width="78"/> 
											    			</c:if>
											           </td>
											           <td class="product_contents">
											         		<div class="c_name">
											         			<a href="detailProduct?product_no=${product.product_no}">
											         				${product.product_name}
											         			</a>
											         		</div>
											         		<div class="c_date&c_option d-flex">
											          		<div class="c_date">
											                     <span class="arrival d-day text-success">내일</span>
											                     <span class="arrival day text-success">(금)</span>
											                     <span class="arrival date text-success">08/11</span>
											                     <span class="arrival time text-success">새벽 7시 전</span>
											                     <span class="arrival message text-success">도착 보장</span>
											                     <span class="condition text-muted"><small>(오후 9시 전 주문 시)</small></span>
											                </div>
											                <div class="c_option">
											                    <span>
											                    	<fmt:formatNumber value="${product.product_price}" type="number"/>
											                    </span>
											                   	<span>원</span>    	
											                  		<select id="customSelect" class="qty custom-select  m-3" name="cart_qty">
																	<option value="none">---[필수]수량을 선택해 주세요---</option>
																	<c:forEach begin="1" end="10" var="i">
																		<option id="p-qty" value="${i}">${i}</option>
																	</c:forEach>
											                       </select>
											                       <span id="co-price" class="p_price" style="padding-left: 10px;">${product.product_price}</span>
											                    <span>원</span>
											                    <button class="cancel" type="button" onclick="deleteRow()">X</button>  
											                   </div>
											         		</div>
											         		<div class="benefit" style="padding-left:389px;">
											         			<span id="pointwrapper">
																<img src="//img1a.coupangcdn.com/image/cart/generalCart/ico_cash_m_2x.png" width="14">
																<span class="point">최대</span>
																<span id="benefit" class="point cash">100</span>
																<span class="point">원 적립</span>
											                </span>
											         		</div>
											         	</td>
											         	<td class="discount">
											              <div style="padding-top:20px;"></div>
											              <div id="toPr" class="discounted_price">10000원</div>
											              <img src="//image10.coupangcdn.com/image/badges/rocket/rocket_logo.png" class="delivery-badge-img " style="width: 56px;">
											           </td>
											          	<td class="delivery_fee" style="padding-top: 50px; text-align: center;">무료</td>
													</tr>
											</c:forEach>