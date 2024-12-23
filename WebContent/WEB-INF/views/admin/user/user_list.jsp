<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			<div class="row">
				<%@ include file="/WEB-INF/views/admin/user/user_list_main.jsp"%>
			</div>	
		</div>
	<hr>
</body>
</html>
