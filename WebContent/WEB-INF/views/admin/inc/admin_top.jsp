<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header>
	<!-- 로고 -->
	<div id="a1">
		<a id="logo" href="${pageContext.request.contextPath}/index.do"><img src="${pageContext.request.contextPath}/img/1.png" width="100" height="50"></a>
	</div>
	<!--// 로고 -->

	<div>
		<!-- 메뉴바 -->
		<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<!-- 배경을 제외한 메뉴 항목의 영역 제한 -->
			<div class="container">
				<!-- 로고 영역 -->
				<div class="navbar-header">
					<!-- 반응형 메뉴 버튼 -->
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
					</button>
					<!--// 반응형 메뉴 버튼 -->

				</div>
				<!--// 로고 영역 -->
				<!-- 메뉴 영역 -->

				<div class="navbar-collapse collapse">
					<!-- 메인메뉴 -->
					<ul class="nav navbar-nav">
						<li class="active"><a href="${pageContext.request.contextPath}/index.do">Home</a></li>
						<li><a href="${pageContext.request.contextPath}/zone/zone_list.do">zone,car관리</a></li>
						<li><a href="${pageContext.request.contextPath}/book_list.do">예약관리</a></li>
						<li><a href="${pageContext.request.contextPath}/admin/user_list.do">회원관리</a></li>
						<li><a href="${pageContext.request.contextPath}/logout.do">admin logout</a></li>
					</ul>
					<!--// 메인메뉴 -->	
					

				</div>
				<!--// 메뉴 영역 -->


				<!--// 배경을 제외한 메뉴 항목의 영역 제한 -->
			</div>
		</div>
	</div>		
			<!--// 메뉴바 -->
</header>
<!-- 헤더영역 끝 -->

