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

		<form class="form-horizontal" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/car_insert_ok.do">


			<div class="form-group">
				<label for="car_name" class="col-sm-2 control-label">차이름</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="car_name" name="car_name">
				</div>
			</div>
			<!-- 차종 -->
			<div class="form-group">
				<label for="car_kind" class="col-sm-2 control-label">차종</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="car_kind" name="car_kind">
				</div>
			</div>
			<!-- 차요금 -->
			<div class="form-group">
				<label for="car_pay" class="col-sm-2 control-label">차요금</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="car_pay" name="car_pay">
				</div>
			</div>
			<!-- 내용 -->
			<div class="form-group">
				<label for="zonelist" class="col-sm-2 control-label">존이름</label>
				<div class="col-sm-4">
					<input type="text" class="form-control" id="zonelist" name="zonelist">
				</div>
			</div>

			<!-- 파일업로드 -->
			<div class="form-group">
				<label for="car_img" class="col-md-2 control-label">차 사진</label>
				<div class="col-md-10">
					<input type="file" name="car_img" id="car_img" class="form-control">
				</div>
			</div>
			<!-- 버튼들 -->
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-primary">저장하기</button>
					<button type="button" class="btn btn-danger" onclick="history.back();">작성취소</button>
				</div>
			</div>

		</form>
	</div>
	
<script type="text/javascript">
$(function(){
    $("#zonelist").autocomplete({
    	source : function( request, response ) {
             $.ajax	({
                    type: 'post',
                    url: "${pageContext.request.contextPath}/book1.do",
                    dataType: "json",	                
                    data: {
                    	term : request.term
                    },
                    success: function(data) {
                    	response(
                    		$.map(data.item, function (json) {
                    			var zonelistval = $("#zonelist").val();
                    			//filtering results....
                    	        if (json.zoneName.indexOf(zonelistval) != -1) {
                    	            return {
                    	                label: json.zoneName,
                    	                value: json.num
                    	            };
                    	        }
							})  
                    	)
                    },
                    select: function( event, ui ) {
                    	$("#zonelist").val(json.zoneName);
                    },
                    error :function (data) {
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
