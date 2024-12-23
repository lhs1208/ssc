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

		<div class="container">

			<div class="col-sm-offset-3 col-sm-9"
				style="margin-top: 100px; height: 200px;">
				<div>
					<div class="pull-left">
						<img src="img/1.png" width="200" height="100">
					</div>
					<form role="form">

							<h2>***님 SSC <br>회원가입을 축하드립니다.</h2>
							<p>회원정보 수정 및 탈퇴는 로그인 후에 이용 가능합니다.</p>
						<div class="col-sm-offset-3" style="margin-top: 30px;">
							<a href="index.do" class="btn btn-primary">메인페이지 바로가기</a>
							<a href="loginpage.do" class="btn btn-info">로그인페이지 바로가기</a>
						</div>
					
					</form>
				</div>

			</div>
			<!--게시판 bar 끝-->
		</div>


	<hr>

	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>

</body>
</html>

