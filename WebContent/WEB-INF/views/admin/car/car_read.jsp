<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<%@ include file="/WEB-INF/views/inc/head.jsp"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

</head>
<body>
	<%@ include file="/WEB-INF/views/admin/inc/admin_top.jsp"%>
	
	<div class="container" id="b">
	
	
	<div class="col-sm-10">
			<h1 class="page-header">
				<small>차 추가</small>
			</h1>
	
			<form class="form-horizontal">
				<div class="form-group">
					<label for="car_name" class="col-sm-2 control-label">차이름</label>
					<div class="col-sm-4">${readCar.carName }</div>
				</div>
				<!-- 차종 -->
				<div class="form-group">
					<label for="car_kind" class="col-sm-2 control-label">차종</label>
					<div class="col-sm-4">${readCar.carKind }</div>
				</div>
				<!-- 차요금 -->
				<div class="form-group">
					<label for="car_pay" class="col-sm-2 control-label">차요금</label>
					<div class="col-sm-4">${readCar.carPay }</div>
				</div>
				<!-- 내용 -->
				<div class="form-group">
					<label for="zonelist" class="col-sm-2 control-label">존이름</label>
					<div class="col-sm-4">${readCar.zoneName }</div>
				</div>
	
				<!-- 파일업로드 -->
				<div class="form-group">
					<label for="car_img" class="col-md-2 control-label">차 사진</label>
					<div class="col-md-10">
						<img src="${pageContext.request.contextPath}/download.do?file=${readCar.carImg}" />
					</div>
				</div>
	
	
				<!-- 다음글/이전글 -->
				<table class="table table-bordered">
					<tbody>
						<tr>
							<th class="success" style="width: 100px">다음글</th>
							<td>
								<c:choose>
									<c:when test="${nextCar != null}">
										<c:url var="nextUrl" value="/car_read.do">
											<c:param name="car_id" value="${nextCar.id}" />
										</c:url>
										<a href="${nextUrl}">${nextCar.carName}</a>
									</c:when>
									<c:otherwise>
								다음글이 없습니다.
							</c:otherwise>
								</c:choose>
							</td>
						</tr>
						<tr>
							<th class="success" style="width: 100px">이전글</th>
							<td>
								<c:choose>
									<c:when test="${prevCar != null}">
										<c:url var="prevUrl" value="/car_read.do">
											<c:param name="car_id" value="${prevCar.id}" />
										</c:url>
										<a href="${prevUrl}">${prevCar.carName}</a>
									</c:when>
									<c:otherwise>
										이전글이 없습니다.
									</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="pull-right">
							<a href="${pageContext.request.contextPath}/admin/car_list.do" class="btn btn-info">목록보기</a> 
							<a href="${pageContext.request.contextPath}/car_insert.do" class="btn btn-primary">차추가</a> 
							<a href="${pageContext.request.contextPath}/car_edit.do?car_id=${readCar.id}" class="btn btn-warning">차수정</a>
							<a href="${pageContext.request.contextPath}/car_delete_ok.do?car_id=${readCar.id}" class="btn btn-danger">삭제하기</a>
				</div>
			</form>
	</div>
</div>

	<script type="text/javascript">
		$(function() {
			$("#zonelist").autocomplete({
				source : function(request, response) {
					$.ajax({
						type : 'post',
						url : "${pageContext.request.contextPath}/book1.do",
						dataType : "json",
						data : {
							term : request.term
						},
						success : function(data) {
							response($.map(data.item, function(json) {
								var zonelistval = $("#zonelist").val();
								//filtering results....
								if (json.zoneName.indexOf(zonelistval) != -1) {
									return {
										label : json.zoneName,
										value : json.num
									};
								}
							}))
						},
						select : function(event, ui) {
							$("#zonelist").val(json.zoneName);
						},
						error : function(data) {
							alert("자동완성 ajax에러 발생");
						}
					});
				}
			});
		})
	</script>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>
