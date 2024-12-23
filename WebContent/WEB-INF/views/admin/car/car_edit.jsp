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

	<div class="container">
		<h1 class="page-header">
			<small>차 추가</small>
		</h1>
		
		

		<form class="form-horizontal"role="form" name="myform" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/car_edit_ok.do">
<input type="hidden" name="car_id" value="${readCar.id}" />

			<div class="form-group">
				<label for="car_name" class="col-sm-2 control-label">차이름</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="car_name" id="car_name" value="${readCar.carName }">
				</div>
			</div>
			<!-- 차종 -->
			<div class="form-group">
				<label for="car_kind" class="col-sm-2 control-label">차종</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="car_kind" id="car_kind" value="${readCar.carKind }">

				</div>
			</div>
			<!-- 차요금 -->
			<div class="form-group">
				<label for="car_pay" class="col-sm-2 control-label">차요금</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" name="car_pay" id="car_pay" value="${readCar.carPay }">

				</div>
			</div>
			<!-- 내용 -->
			<div class="form-group">
				<label for="zonelist" class="col-sm-2 control-label">존이름</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="zonelist" name="zonelist" value="${readCar.zoneNum }">

				</div>
			</div>

			<!-- 파일업로드 -->
			<div class="form-group">
				<label for="car_img" class="col-md-2 control-label">차 사진</label>
				<div class="col-md-10">
					<input type="file" name="car_img" id="car_img" class="form-control" />
				</div>
			</div>
			<c:if test="${readCar.carImg != null}">
				<div class="form-group">
					<!-- 등록된 프로필 이미지 표시하기 -->
					<div class="col-md-8 col-md-offset-2">
						<p>
							<img src="${pageContext.request.contextPath}/download.do?file=${readCar.carImg}" class="img-circle" /> <label class="checkbox-inline"> <input type="checkbox" name="img_del" id="img_del" value="Y" /> 이미지 삭제
							</label>
						</p>
						<script type="text/javascript">
							$(function() {
								// 이미지가 등록된 상태이므로, 파일의 신규 등록을 방지
								$("#car_img").prop("disabled", true);
								$("#img_del").change(
										function() {
											$("#car_img").prop("disabled",
													!$(this).is(":checked"));
										});
							});
						</script>
					</div>
				</div>
			</c:if>


			<!-- 버튼들 -->
			<div class="form-group">
				<div class="col-md-offset-5 col-md-10">
					<button type="submit" class="btn btn-primary">수정하기</button>
					
				</div>
			</div>

		</form>
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
