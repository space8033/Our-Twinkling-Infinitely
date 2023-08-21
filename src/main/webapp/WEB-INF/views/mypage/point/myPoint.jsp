<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


		<%-- <script src="${pageContext.request.contextPath}/resources/js/myPage.js"></script>
		 --%>
		
	</head>
	
	<body class="container">
				<div id="point">
					  <span><img class="icon" src="${pageContext.request.contextPath}/resources/image/sion/free-icon-point.png" width="30"/></span>
				  	  <span>사용가능 포인트: <span id="num">${totalPoints}P</span></span>
		 	    </div>
				
				<div id="pointList" style="width: 100%; margin-top: 20px;">
				
		<!------------------------------------- 내용 들어갈 div -------------------------------------->
				
					<div id="pointContainer" style="width: 100%;">
						<table class="table">
							 <thead>
							   <tr>
							      <th>일자</th>
							      <th>관련주문번호</th>
							      <th>금액</th>
							      <th>적립 유형</th>
							      <th>처리 결과</th>
							   </tr>
							 </thead>
							 <tbody>
								  <c:forEach var="point" items="${pointList}">
									  <c:if test="${point.point_category == '주문시 사용된 포인트'}">
									    <tr>
									      <td>${point.date}</td>
									      <td>${point.order_number}</td>
									      <td style="color:red;">-${point.opoint}</td>
									      <td>${point.point_category}</td>
									      <td>${point.point_status}</td>
									    </tr>
									  </c:if> 
									  <c:if test="${point.point_category == '주문시 적립된 포인트'}">
									    <tr class="table-light">
									      <td>${point.date}</td>
									      <td>${point.order_number}</td>
									      <td class="text-primary">+${point.opoint}</td>
									      <td>${point.point_category}</td>
									      <td>${point.point_status}</td>
									    </tr>
									  </c:if> 
								  </c:forEach>
								</tbody>
								</table>
							</div>
								
					<div class="d-flex justify-content-center m-4">
						<a class="btn btn-sm" href="javascript:showPoint(1)">처음</a>
						<c:if test="${pager.groupNo>1}">
							<a class="btn btn-sm" href="javascript:showPoint(${pager.startPageNo-1})">이전</a>
						</c:if>
						
						<c:forEach var="i" begin="${pager.startPageNo}" end="${pager.endPageNo}">
							<c:if test="${pager.pageNo != i}">
								<a class="btn btn-sm" href="javascript:showPoint(${i})">${i}</a>
							</c:if>
							<c:if test="${pager.pageNo == i}">
								<a class="btn btn-sm" href="javascript:showPoint(${i})">${i}</a>
							</c:if>
						</c:forEach>
						
						<c:if test="${pager.groupNo<pager.totalGroupNo}">
							<a class="btn btn-sm" href="javascript:showPoint(${pager.endPageNo+1})">다음</a>
						</c:if>
						<a class="btn btn-sm" href="javascript:showPoint(${pager.totalPageNo}">맨끝</a>
					</div>
				</div>	
													
					
	</body>