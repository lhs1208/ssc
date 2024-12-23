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
	<%@ include file="/WEB-INF/views/inc/topbar.jsp"%>
	<!-- 내용영역 -->
	<div class="main" id="c">
		<div class="container" id="b">
			<div class="col-sm-2" id="sidebar" role="navigation">
				<div class="list-group">
					<a href="${pageContext.request.contextPath}/mypage1.do?log=${logUid}" class="list-group-item"><strong>예약내역</strong></a>
					<a href="${pageContext.request.contextPath}/mypage2.do" class="list-group-item"><strong>정보수정</strong></a>
				</div>
			</div>
			<!--탭 bar 끝-->

			<div id="joinbox" class="col-sm-10">



				<div class="row">

					<div class="jumbotron col-md-12">
						<ul>
							<li>예약변경은 반납연장만 가능합니다. 대여기간 수정, 지역 및 차종 변경은 취소 후 새로 예약해주세요.</li>
							<li>반납연장은 반납 예정 시각 30분 이전까지만 가능하며, 다른 회원의 예약이 이미 존재하는 경우에는
								반납연장이 불가합니다.</li>
							<li>예약취소 시 대여요금과 보험료의 각 10%에 해당하는 수수료가 부과될 수 있습니다.</li>
						</ul>
					</div>
				</div>
				<div id="bookhistory" class="row">
					<table class="table table-striped">
						<thead>
							<tr>
								<th class="text-center" style="width: 100px">예약시작</th>
								<th class="text-center" style="width: 100px">예약종료</th>
								<th class="text-center" style="width: 100px">차이름</th>
								<th class="text-center" style="width: 100px">존이름</th>
								<th class="text-center" style="width: 100px">삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${fn:length(bookList) > 0}">
									<c:forEach var="book" items="${bookList}">
										<tr>
											<td class="text-center">${book.startDate}</td>
											<td class="text-center">${book.endDate}</td>
											<td class="text-center">${book.carName}</td>
											<td class="text-center">${book.zoneName}</td>
											<td class="text-center" style="width: 120px">
											<a href="${pageContext.request.contextPath}/book_delete_ok.do?bid=${book.bid}"  class='btn btn-danger btn-xs'><i class='glyphicon glyphicon-remove'></i></a>
											</td>
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
			</div>
		</div>
	</div>
	




	<hr>

	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>

</body>
</html>

