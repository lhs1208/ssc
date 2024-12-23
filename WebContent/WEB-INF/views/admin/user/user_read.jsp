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
				<div class="row" id="c">
					<h1 class="page-header"><small>User 읽기</small>
					</h1>

					<!-- 제목, 작성자, 작성일시, 조회수 -->
					<div class="alert alert-info">
						<h3 style="margin: 0">
							${readUser.name}<br /> 
						</h3>
					</div>

					<!-- 내용 -->
					<section style="padding: 0 10px 20px 10px">
						${readUser.uId}<br>
						${readUser.uPw}<br>
						${readUser.name}<br>
						${readUser.postcode}<br>
						${readUser.addr1}<br>
						${readUser.addr2}<br>
						${readUser.tel}<br>
						${readUser.email}<br>
						${readUser.gender}<br>
						${readUser.emailYn}<br>
						${readUser.useArea}<br>
						<img src="${pageContext.request.contextPath}/download.do?file=${readUser.profileImg}" /><br>
						${readUser.licNum}<br>
						${readUser.birthdate}<br>
					</section>

					<!-- 다음글/이전글 -->
					<table class="table table-bordered">
						<tbody>
							<tr>
								<th class="success" style="width: 100px">다음글</th>
								<td><c:choose>
										<c:when test="${nextUser != null}">
											<c:url var="nextUrl" value="admin/user/user_read.do">
												<c:param name="user_id" value="${nextUser.id}" />
											</c:url>
											<a href="${nextUrl}">${nextUser.name}</a>
										</c:when>
										<c:otherwise>
							다음글이 없습니다.
						</c:otherwise>
									</c:choose></td>
							</tr>
							<tr>
								<th class="success" style="width: 100px">이전글</th>
								<td><c:choose>
										<c:when test="${prevUser != null}">
											<c:url var="prevUrl" value="admin/user/user_read.do">
												<c:param name="user_id" value="${prevUser.id}" />
											</c:url>
											<a href="${prevUrl}">${prevuser.naem}</a>
										</c:when>
										<c:otherwise>
							이전글이 없습니다.
						</c:otherwise>
									</c:choose></td>
							</tr>
						</tbody>
					</table>
					<!-- 버튼들 : category값에 대한 상태유지 필요함 -->
					<div class="clearfix">
						<div class="pull-right">
							<a href="${pageContext.request.contextPath}/admin/user_list.do" class="btn btn-info">목록보기</a> 
							<a href="${pageContext.request.contextPath}/admin/user_out_ok.do?user_id=${readUser.id}" class="btn btn-danger">탈퇴하기</a>
						</div>
					</div>
				</div>
				
				<!-- class row 끝 -->
			</div>
		</div>
		<!-- contain 끝-->
	</div>
	<!--main 끝-->
	<hr>
<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>
					
					