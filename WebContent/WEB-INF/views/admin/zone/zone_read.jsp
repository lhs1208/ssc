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
					<h1 class="page-header"><small>Zone 읽기</small>
					</h1>

					<!-- 제목, 작성자, 작성일시, 조회수 -->
					<div class="alert alert-info">
						<h3 style="margin: 0">
							${readZone.zoneName}<br /> 
						</h3>
					</div>

					<!-- 내용 -->
					<section style="padding: 0 10px 20px 10px">
						${readZone.zoneAddr}<br>
						${readZone.zoneLat}<br>
						${readZone.zoneLng}<br>
						${readZone.zoneRegion1Short}<br>
						</section>

					<!-- 다음글/이전글 -->
					<table class="table table-bordered">
						<tbody>
							<tr>
								<th class="success" style="width: 100px">다음글</th>
								<td><c:choose>
										<c:when test="${nextZone != null}">
											<c:url var="nextUrl" value="/zone/zone_read.do">
												<c:param name="zone_num" value="${nextZone.num}" />
											</c:url>
											<a href="${nextUrl}">${nextZone.zoneName}</a>
										</c:when>
										<c:otherwise>
							다음글이 없습니다.
						</c:otherwise>
									</c:choose></td>
							</tr>
							<tr>
								<th class="success" style="width: 100px">이전글</th>
								<td><c:choose>
										<c:when test="${prevZone != null}">
											<c:url var="prevUrl" value="/zone/zone_read.do">
												<c:param name="zone_num" value="${prevZone.num}" />
											</c:url>
											<a href="${prevUrl}">${prevZone.zoneName}</a>
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
							<a href="${pageContext.request.contextPath}/zone/zone_list.do" class="btn btn-info">목록보기</a> 
							<a href="${pageContext.request.contextPath}/zone/zone_write.do" class="btn btn-primary">글쓰기</a>
							<a href="${pageContext.request.contextPath}/zone/zone_edit.do?zone_num=${readZone.num}" class="btn btn-warning">수정하기</a> 
							<a href="${pageContext.request.contextPath}/zone/zone_delete_ok.do?zone_num=${readZone.num}" class="btn btn-danger">삭제하기</a>
						</div>
					</div>
				</div>
				
				<!-- class row 끝 -->
			</div>
			<!-- class col-sm-10 끝 -->
		</div>
		<!-- contain 끝-->
	</div>
	<!--main 끝-->
	<hr>
<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>
					
					