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
	<!-- 내용영역 -->
	<div class="main" id="c">
		<div class="container" id="b">

			<div class="col-sm-10">
				<div class="row"  id="c">
					<div class="page-header">
					    <h1 class="page-header">Car List</h1>
				    </div>
				</div>

				<div class="row">
					<table class="table table-striped">
						<thead>
							<tr>
								<th class="text-center" style="width: 100px">번호</th>
								<th class="text-center" style="width: 100px">이름</th>
								<th class="text-center" style="width: 100px">종류</th>
								<th class="text-center" style="width: 100px">이용요금</th>
								<th class="text-center" style="width: 100px">존이름</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${fn:length(carList) > 0}">
									<c:forEach var="car" items="${carList}">
										<tr>
											<td class="text-center">${car.id}</td>
											<td><c:url var="readUrl" value="/car_read.do">
													<c:param name="car_id" value="${car.id}" />
												</c:url> <a href="${readUrl}">${car.carName}</a></td>
											
											<td class="text-center">${car.carKind}</td>
											<td class="text-center">${car.carPay}</td>
											<td class="text-center">${car.zoneName}</td>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="5" class="text-center"
											style="line-height: 100px;">조회된 글이 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
				<!-- table row 끝-->
				<!-- 바텀 리스트 -->
				<%@ include file="/WEB-INF/views/admin/inc/car_list_bottom.jsp" %>
			</div>
			<!--게시판 bar 끝-->
		</div>
		<!-- contain 끝-->
	</div>
</body>
</html>
