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
					<h1 class="page-header">
						<small>새 글 쓰기</small>
					</h1>

					<form class="form-horizontal" method="post"
						enctype="multipart/form-data"
						action="${pageContext.request.contextPath}/zone/zone_write_ok.do">
						
						<!-- 제목 -->
						<div class="form-group">
							<label for="zone_name" class="col-sm-2 control-label">ZoneName</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="zone_name" name="zone_name" />
							</div>
						</div>
						<!-- 주소 -->
						<div class="form-group">
							<label for="zone_addr" class="col-sm-2 control-label">Zone 주소</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="zone_addr" name="zone_addr" />
							</div>
						</div>
						
						<!-- 위도 -->
						<div class="form-group">
							<label for="zone_lat" class="col-sm-2 control-label">Zone 위도</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="zone_lat" name="zone_lat" />
							</div>
						</div>
						
						<!-- 경도 -->
						<div class="form-group">
							<label for="zone_lng" class="col-sm-2 control-label">Zone 경도</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="zone_lng" name="zone_lng" />
							</div>
						</div>
						
						<!-- 지역 위치 -->
						<div class="form-group">
							<label for="zone_region1_short" class="col-sm-2 control-label">Zone 도시이름</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="zone_region1_short" name="zone_region1_short" />
							</div>
						</div>
						
						<!-- 버튼들 -->
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-primary">저장하기</button>
								<button type="button" class="btn btn-danger"
									onclick="history.back();">작성취소</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- contain 끝-->
	</div>
	<!--main 끝-->
	<hr>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>
