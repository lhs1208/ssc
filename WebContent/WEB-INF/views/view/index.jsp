<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
 <%@ include file="/WEB-INF/views/inc/head.jsp"%>

<link type="text/css" rel="stylesheet" media="all" href="${pageContext.request.contextPath}/assets/css/main1.css" />


</head>

<body>
<%@ include file="/WEB-INF/views/inc/topbar.jsp"%> 

	


	<div id="container">
		<!-- 캐러셀 영역 구성 -->
		<div class="main-visualbox">
		<div id="sequence">
			<div class="visual_car" style="
			background:url(test/visual_car4.png) no-repeat 0 0;
			width:390px;
			height:208px;
			position:absolute;
			bottom:35px;
			left:50%;
			margin-left:-195px;
			z-index:33;
			">
				<div class="wheel_a">
					<div id="wheel1" class="wheel"><img src="test/wheels_1.png" alt="" /></div>
				</div>
				<div class="wheel_b">
					<div id="wheel2" class="wheel"><img src="test/wheels_1.png" alt="" /></div>
				</div>
			</div>
			<ul class="sequence-canvas">
				<li><img src="test/visual_01_02.png" alt="" />
					<div class="frame1_txt step">
						<img src="test/visual_01_txt_20160802.png" alt="" />
						<div class="gobtn" style="display:none;">
							<span><a href="/about/guide/"><img src="test/btn_guide_go.png" alt="이용방법" /></a></span>
							<span><a href="/member/index.jsp"><img src="test/main/btn_join_go.png" alt="회원가입" /></a></span>
						</div>
					</div>
					<div class="frame1_cloud step"><img src="test/visual_01_cloud.png" alt="" /></div>
					<div class="frame1_hand step"><img src="test/visual_01_03.png" alt="" /></div>
				</li>
				<li><img src="test/visual_02_01.png" alt="" />
					<div class="frame2_txt step">
						<img src="test/visual_02_txt.png" alt="" />
						<div class="gobtn" style="display:none;">
							<span><a href="/about/guide/"><img src="test/btn_guide_go.png" alt="이용방법" /></a></span>
							<span><a href="/member/index.jsp"><img src="test/btn_join_go.png" alt="회원가입" /></a></span>
						</div>
					</div>
					<div class="frame2_cloud step"><img src="test/visual_02_cloud.png" alt="" /></div>
				</li>
				<li><img src="test/visual_03_01.png" alt="" />
					<div class="frame3_txt step">
						<img src="test/visual_03_txt.png" alt="" />
						<div class="gobtn" style="display:none;">
							<span><a href="/about/guide/"><img src="test/btn_guide_go.png" alt="이용방법" /></a></span>
							<span><a href="/member/index.jsp"><img src="test/btn_join_go.png" alt="회원가입" /></a></span>
						</div>
					</div>
					<div class="frame3_cloud step"><img src="test/visual_03_cloud.png" alt="" /></div>
				</li>
				<li><img src="test/visual_04_01.png" alt="" />
					<div class="frame4_txt step">
						<img src="test/visual_04_txt.png" alt="" />
						<div class="gobtn" style="display:none;">
							<span><a href="/about/guide/"><img src="test/btn_guide_go.png" alt="이용방법" /></a></span>
							<span><a href="/member/index.jsp"><img src="test/btn_join_go.png" alt="회원가입" /></a></span>
						</div>
					</div>
					<div class="frame4_cloud step"><img src="test/visual_04_cloud.png" alt="" /></div>
				</li>
				<li><img src="test/visual_05_01.png" alt="" />
					<div class="frame5_txt step">
						<img src="test/visual_05_txt.png" alt="" />
						<div class="gobtn" style="display:none;">
							<span><a href="/about/guide/"><img src="test/btn_guide_go.png" alt="이용방법" /></a></span>
							<span><a href="/member/index.jsp"><img src="test/btn_join_go.png" alt="회원가입" /></a></span>
						</div>
					</div>
					<div class="frame5_cloud step"><img src="test/visual_04_cloud.png" alt="" /></div>
				</li>
			</ul>
			
			<div class="sequence-pagination">
				<a href="#1"><img src="test/visual_nav_on.png" alt="nav1" /></a>
				<a href="#1"><img src="test/visual_nav_off.png" alt="nav2" /></a>
				<a href="#1"><img src="test/visual_nav_off.png" alt="nav3" /></a>
				<a href="#1"><img src="test/visual_nav_off.png" alt="nav4" /></a>
				<a href="#1"><img src="test/visual_nav_off.png" alt="nav5" /></a>
			</div>
		</div>
	</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/main_visual.js"></script>
	
	
	<script type="text/javascript">
		$(function(){
			if ( $(".main-quickmenu a.join").length > 0) {
				var interVal = setInterval(flash, 1000);
			}
		});
		var flag = true;
		function flash(){
			if ( flag ){
				$(".join").addClass("on");
				flag = false;
			}else{
				$(".join").removeClass("on");
				flag = true;
			}
		}
	</script>
		
		<!-- 캐러셀 영역 끝 -->
	</div>

	<hr>


	<!-- 내용영역 -->
	<div class="main" >
	<div class="container">

		<!-- grid -->
		<div class="row">
			<!-- 메인영역 : 데스크탑까지 왼쪽 9 차지. 태블릿 이하에서 상단 라인 차지 -->


			<!-- 핸드폰/태블릿 에서의 여백용 -->
			<div class="clearfix visible-sm visible-xs height"></div>
			<!-- 사이드바 영역 : 데스크탑까지 오른쪽 3 차지. 태블릿 이하에서 하단 라인 차지 -->
		
			<div class="col-md-8">
				<!--  메인영역의 화면 분할 50%:50% - xs 클래스이므로 모바일까지도 유효함 -->

				<!-- 탭 메뉴 시작 -->
				<ul class="nav nav-tabs">
					<li class="active"><a href="#home" data-toggle="tab"><strong>공지사항</strong></a></li>
					<li><a href="#profile" data-toggle="tab"><strong>이용후기</strong></a></li>
					
				</ul>
				<!--// 탭 메뉴 끝 -->

				<!-- 탭 화면 시작 -->
				<div class="tab-content">
					<div class="tab-pane fade in active" id="home">
							<div class="col-md-12 article-item">
								<ul class="list-group">
									<c:forEach var="document" items="${noticeList}">
										<li class="list-group-item"><a
											href="${pageContext.request.contextPath}/bbs/document_read.do?category=${document.category}&document_id=${document.id}">${document.subject}</a>
										</li>
									</c:forEach>
								</ul>
								<div class="pull-right">
										<a href="${pageContext.request.contextPath}/bbs/document_list.do?category=notice" class="btn btn-primary btn-xs">more</a>
								</div>
							</div>
						</div>

					<div class="tab-pane fade" id="profile">
							<div class="col-md-12 article-item">
								<ul class="list-group">
									<c:forEach var="document" items="${reviewList}">
										<li class="list-group-item"><a
											href="${pageContext.request.contextPath}/bbs/document_read.do?category=${document.category}&document_id=${document.id}">${document.subject}</a>
										</li>
									</c:forEach>
								</ul>
								<div class="pull-right">
										<a href="${pageContext.request.contextPath}/bbs/document_list.do?category=review" class="btn btn-primary btn-xs">more</a>
									</div>
							</div>
						</div>
				</div>				
			</div>
			<!--// 탭 화면 끝 -->
	

			<div id="a1">
				<div class="col-md-3">
				<c:choose>
					<c:when test="${loginInfo != null }">
						<div>
						
							<fieldset>
							
							<legend>
								<c:if test="${cookie.profileThumbnail != null}">
									<img src="${pageContext.request.contextPath}/download.do?file=${cookie.profileThumbnail.value}"/>
								</c:if>
								${loginInfo.name}님 
							</legend>
						
							<div>
							<c:choose>
								<c:when test="${logId == 'admin' }">
									<a href="${pageContext.request.contextPath}/logout.do" class="btn btn-danger btn-block">로그아웃</a>
									<a href="${pageContext.request.contextPath}/mypage2.do" class="btn btn-warning btn-block">회원수정</a>
									<a href="${pageContext.request.contextPath}/mypage1.do?log=${logUid}" class="btn btn-primary btn-block">예약내역</a>
									<a href="${pageContext.request.contextPath}/zone/zone_list.do" class="btn btn-danger btn-block">관리자페이지</a>


								</c:when>
								<c:otherwise>
									<a href="${pageContext.request.contextPath}/logout.do" class="btn btn-danger btn-block">로그아웃</a>
									<a href="${pageContext.request.contextPath}/mypage2.do" class="btn btn-warning btn-block">회원수정</a>
									<a href="${pageContext.request.contextPath}/mypage1.do?log=${logUid}" class="btn btn-primary btn-block">예약내역</a>
								</c:otherwise>
							</c:choose>
							</div>
							</fieldset>
						</div>
					</c:when>
					<c:otherwise>
					<form role="form" method="post" action="${pageContext.request.contextPath }/user/login_ok.do">
						<fieldset>
							<legend><strong>로그인</strong></legend>		
							<div class="form-group">
								<label for="u_id">아이디</label>
								<input type="text" name="u_id" id="u_id" class="form-control" placeholder="아이디를 입력하세요."/>							
							</div>
							<div class="form-group">
								<label for="u_pw">비밀번호</label>
								<input type="password" name="u_pw" id="u_pw" class="form-control" placeholder="비밀번호를 입력하세요."/>							
							</div>
							<button type="submit" class="btn btn-warning">
								로그인
							</button>
							<a href="${pageContext.request.contextPath}/join.do" class="btn btn-danger">회원가입</a>
							<a href="${pageContext.request.contextPath}/join3.do" class="btn btn-info">ID/PW 찾기</a>				
						</fieldset>
					</form>
					</c:otherwise>
				</c:choose>
				</div>
			</div>
			<!--// login 끝 -->
		</div>
		<!--row 끝-->
	</div>
	<!-- contain 끝-->
	</div>
	<!--main 끝-->


		<hr>	

	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
	
</body>
</html>
