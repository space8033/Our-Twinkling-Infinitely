<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Bootstrap을 사용하기 위한 외부 라이브러리 가져오기 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"/>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/pinquiryForm.css"/>
<body class="pop">
	<header>
		<h2>상품문의</h2>
	</header>
	<form id="productInquiryWrite" method="post" action="productInquiryWrite" onsubmit="parent.parentClosePopup();">
		<div class="qa-product d-flex">
			<img src="data:MIME;base64, ${product.product_img}" width="95"/>
			<input type="hidden" name="product_product_no" value="${product.product_no}"/>
			<input type="hidden" name="product_no" value="${product.product_no}"/>
			<input type="hidden" name="users_users_id" value="${user.users_id}"/>
			<div class="qa-product-info">
				<div id="p-name" class="p-info">${product.product_name}</div>
				<div id="p-price" class="p-info">
					<fmt:formatNumber value="${product.product_price}" type="number"/>원
				</div>
			</div>
		</div>
		<table class="qa-write-table">
			<tbody>
				<tr>
					<th>문의유형</th>
					<td class="qa-type-area">
						<input type="radio" id="type_0" name="pinquiry_type" value="1">
						<label for="type_0">크기</label>
						<input type="radio" id="type_1" name="pinquiry_type" value="2">
						<label for="type_1">배송</label>
						<input type="radio" id="type_2" name="pinquiry_type" value="3">
						<label for="type_2">재입고</label>
						<input type="radio" id="type_3" name="pinquiry_type" value="4">
						<label for="type_3">상품상세문의</label>
						<input type="radio" id="type_4" name="pinquiry_type" value="5">
						<label for="type_4">기타</label>
						<div class="notify">
							클레임(교환/환불/취소)관련 문의는 <span class="emphasis">마이페이지>교환/환불/취소 내역</span>에서 문의 바랍니다.
						</div>
					</td>
				</tr>
				<tr>
					<th>문의옵션</th>
					<td class="qa-type-area">
						<div>
							<select id="option1" class="option custom-select m-3" name="cart_optionContent">
								<option value="none">---[필수]옵션을 선택해 주세요---</option>
								<c:forEach var="productOption" items="${options}">
									<option id="${productOption.productOption_no}" value="${productOption.productOption_type}">${productOption.productOption_type}</option>
								</c:forEach>
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td class="qa-title-area">
						<input type="text" name="pinquiry_title" maxlength="15" placeholder="15자 이내 입력" >
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td class="qa-subject-area">
						<textarea name="pinquiry_content" rows="10" cols="45" placeholder="내용 입력"></textarea>
					</td>
				</tr>
				<tr></tr>
			</tbody>
		</table>
		<div>
			<div id="guide">상품문의 안내</div>
			<ul>
				<li class="notify">상품문의는 재입교, 크기, 배송 등 상품에 대해 담당자에게 문의하는 게시판입니다.</li>
				<li class="emphasis">욕설, 비방, 거래 글, 분쟁유발, 명예회손, 허위사실 유포, 타 소핑몰 언급, 광고성 등의 부적절한 게시글은 금지합니다</li>
			</ul>
		</div>
		<div class="d-flex justify-content-center">
			<button type="button" class="btn btn-outline-primary">취소하기</button>
			<button type="submit" class="btn btn-primary">작성하기</button>
		</div>
	</form>
</body>
