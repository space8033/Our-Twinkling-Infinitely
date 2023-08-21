<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
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
	      		<tr>
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
	      		<tr>
	      			<td colspan="6">${pinquiry.pinquiry_content}</td>	
	      		</tr>
      		</c:forEach>
      	</tbody>
      </table>
      <div class="d-flex justify-content-center m-4">
		<a class="btn btn-sm" href="?pageNo=1">처음</a>
		<c:if test="${pager3.groupNo>1}">
			<a class="btn btn-sm" href="?pageNo=${pager3.startPageNo-1}">이전</a>
		</c:if>
		
		<c:forEach var="i" begin="${pager3.startPageNo}" end="${pager3.endPageNo}">
			<c:if test="${pager3.pageNo != i}">
				<a class="btn btn-sm" href="?pageNo=${i}">${i}</a>
			</c:if>
			<c:if test="${pager3.pageNo == i}">
				<a class="btn btn-sm" href="?pageNo=${i}">${i}</a>
			</c:if>
		</c:forEach>
		
		<c:if test="${page3r.groupNo<pager3.totalGroupNo}">
			<a class="btn btn-sm" href="?pageNo=${pager3.endPageNo+1}">다음</a>
		</c:if>
		<a class="btn btn-sm" href="?pageNo=${pager3.totalPageNo}">맨끝</a>
	  </div>
      <button onclick="openProductInquiryPopup()">작성하기</button>