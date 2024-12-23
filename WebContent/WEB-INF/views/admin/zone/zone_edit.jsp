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
			<h1 class="page-header"><small>수정하기</small></h1>
	
	<form class="form-horizontal" method="post" enctype="multipart/form-data"
		action="${pageContext.request.contextPath}/zone/zone_edit_ok.do">
	<!-- 수정 대상에 대한 상태유지 -->
	<input type="hidden" name="zone_num" value="${readZone.num}" />
	

	<!-- 제목 -->
	<div class="form-group">
		<label for="zone_name" class="col-sm-2 control-label">ZoneName</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="zone_name" name="zone_name" 
				value="${readZone.zoneName}"/>
		</div>
	</div>
	<!-- 주소 -->
	<div class="form-group">
		<label for="zone_addr" class="col-sm-2 control-label">Zone 주소</label>
		<div class="col-sm-10">
			<textarea id="zone_addr" name="zone_addr" class="form-control">
				${readZone.zoneAddr}</textarea>
		</div>
	</div>

	<!-- 위도 -->
	<div class="form-group">
		<label for="zone_lat" class="col-sm-2 control-label">Zone 위도</label>
		<div class="col-sm-10">
			<textarea id="zone_lat" name="zone_lat" class="form-control">
				${readZone.zoneLat}</textarea>
		</div>
	</div>
	
	<!-- 경도 -->
	<div class="form-group">
		<label for="zone_lng" class="col-sm-2 control-label">Zone 경도</label>
		<div class="col-sm-10">
			<textarea id="zone_lng" name="zone_lng" class="form-control">
				${readZone.zoneLng}</textarea>
		</div>
	</div>
	
	<!-- 지역위치 -->
	<div class="form-group">
		<label for="zone_region1_short" class="col-sm-2 control-label">Zone 도시이름</label>
		<div class="col-sm-10">
			<textarea id="zone_region1_short" name="zone_region1_short" class="form-control">
				${readZone.zoneRegion1Short}</textarea>
		</div>
	</div>

	<!-- 버튼들 -->
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" class="btn btn-primary">저장하기</button>
			<button type="button" class="btn btn-danger" onclick="history.back();">
			작성취소</button>
		</div>
	</div>
	</form>
		</div>
		<!-- contain 끝-->
	</div>
	<!--main 끝-->
	<hr>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>

