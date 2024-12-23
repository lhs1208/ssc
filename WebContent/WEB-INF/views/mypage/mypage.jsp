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
					<a href="mypage1.do" class="list-group-item"><strong>예약내역</strong></a>
					<a href="mypage2.do" class="list-group-item"><strong>정보수정</strong></a>
				</div>
			</div>
			<!--탭 bar 끝-->






			<div class="col-sm-offset-2 col-sm-6"
				style="margin-top: 100px; height: 300px;">
				<div>
					<form role="form">
						<fieldset>
							<div class="form-group">
								<label for="user_pw">비밀번호를 다시 입력해주세요</label> <input
									type="password" id="user_pw" class="form-control"
									placeholder="비밀번호를 입력하세요." />
							</div>
							<div class="pull-right">
								<button type="submit" class="btn btn-warning pull-right">확인</button>
							</div>
						</fieldset>
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

