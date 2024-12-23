<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/inc/head.jsp"%>
</head>
<body>
<%@ include file="/WEB-INF/views/admin/inc/admin_top.jsp"%>
	<!-- 내용영역 -->
	<div class="main" id="c">
		<div class="container" id="b">

			<div class="col-sm-10">
				<div class="row"  id="c">
					<div class="page-header">
					    <h1 class="page-header">Book List</h1>
				    </div>
				</div>

				<div class="row">
					<table class="table table-striped">
						<thead>
							<tr>
								<th class="text-center" style="width: 100px">번호</th>
								<th class="text-center" style="width: 100px">예약시작</th>
								<th class="text-center" style="width: 100px">예약종료</th>
								<th class="text-center" style="width: 100px">유저아이디</th>
								<th class="text-center" style="width: 100px">차번호</th>
								<th class="text-center" style="width: 100px">존이름</th>
								<th class="text-center" style="width: 100px">삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${fn:length(bookList) > 0}">
									<c:forEach var="book" items="${bookList}">
										<tr>
											<td class="text-center">${book.bid}</td>
											<td class="text-center">${book.startDate}</td>
											<td class="text-center">${book.endDate}</td>
											<td class="text-center">${book.uId}</td>
											<td class="text-center">${book.carId}</td>
											<td class="text-center">${book.zoneName}</td>
											<td class="text-center" style="width: 120px">
											<a href="${pageContext.request.contextPath}/book_delete_ok.do?bid=${book.bid}"  class='btn btn-danger btn-xs'><i class='glyphicon glyphicon-remove'></i></a>
											</td>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="10" class="text-center"
											style="line-height: 100px;">조회된 글이 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
				<!-- table row 끝-->
				
				
				<!-- 바텀 리스트 -->
				<%@ include file="/WEB-INF/views/admin/inc/book_list_bottom.jsp" %>
			</div>
			<!--게시판 bar 끝-->
		</div>
		<!-- contain 끝-->
	</div>
</body>
</html>
