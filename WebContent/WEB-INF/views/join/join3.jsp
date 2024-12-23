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
					<a href="${pageContext.request.contextPath}/join.do" class="list-group-item"><strong>회원가입</strong></a>
						<a href="${pageContext.request.contextPath}/join3.do" class="list-group-item"><strong>ID/PW 찾기</strong></a>
				</div>
			</div>
			<!--탭 bar 끝-->

			<div id="joinbox" class="col-sm-10">



				<div class="row">

					<div class="jumbotron col-md-12">
						<div class="col-md-6">
							<h2>아이디 찾기</h2>
							<p>간단하게 아이디를 찾아보아요.</p>
							<button class="btn btn-default" data-target="#layerpop"
								data-toggle="modal">아이디 찾기</button>
							<br />
							<div class="modal fade" id="layerpop">
								<div class="modal-dialog">
									<div class="modal-content">
										<!-- header -->
										<div class="modal-header">
											<!-- 닫기(x) 버튼 -->
											<button type="button" class="close" data-dismiss="modal">×</button>
											<!-- header title -->
											<h4 class="modal-title">아이디 찾기</h4>
										</div>
										<!-- body -->
										<div class="modal-body">
											<form role="form" method="post" action="${pageContext.request.contextPath}/user/find_id_ok.do">
												<label for="name">이름</label> <input type="text" id="name" name="name"
													class="form-control" placeholder="이름을 입력하세요." /> <label
													for="email">이메일</label> <input type="email" id="email" name="email"
													class="form-control" placeholder="이메일을 입력하세요." /><br>
												<button type="submit" class="btn">입력완료</button>
											</form>
										</div>
										<!-- Footer -->
										<div class="modal-footer">

											<button type="button" class="btn btn-default"
												data-dismiss="modal">닫기</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<h2>비밀번호 찾기</h2>
							<p>간단하게 비밀번호를 찾아보아요.</p>

							<button class="btn btn-default" data-target="#layerpop2"
								data-toggle="modal">비밀번호 찾기</button>
							<br />
							<div class="modal fade" id="layerpop2">
								<div class="modal-dialog">
									<div class="modal-content">
										<!-- header -->
										<div class="modal-header">
											<!-- 닫기(x) 버튼 -->
											<button type="button" class="close" data-dismiss="modal">×</button>
											<!-- header title -->
											<h4 class="modal-title">비밀번호 찾기</h4>
										</div>
										<!-- body -->
										<div class="modal-body">
											<form role="form" method="post" action="${pageContext.request.contextPath}/user/find_pw_ok.do">
												<label for="name">아이디</label> <input type="text" id="u_id" name="u_id"
													class="form-control" placeholder="아이디를 입력하세요." /> <label
													for="email">이메일</label> <input type="email" id="email" name="email"
													class="form-control" placeholder="이메일을 입력하세요." /><br>
													<button type="submit" class="btn">입력완료</button>
											</form>
										</div>
										<!-- Footer -->
										<div class="modal-footer">
											<button type="button" class="btn btn-default"
												data-dismiss="modal">닫기</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<br> <br> <br>
				<div>
				</div>
			</div>
			<!--게시판 bar 끝-->

		</div>
		<!-- contain 끝-->
	</div>
	<!--main 끝-->




	<hr>

	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>

</body>
</html>

