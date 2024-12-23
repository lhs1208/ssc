<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<header>

<script type="text/javascript">
jQuery(function($){
    var $preview_zone = $('.nolink');
    var msg = '로그인 후 이용가능합니다.';
    $preview_zone
      .find('a, [onclick]').on('click', function(){
        alert(msg);
        return false;
      })
      .prop('onclick', null);
    ;
});

</script>


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
												<c:choose>
						<c:when test="${loginInfo == null}">
							<ul class="nav navbar-nav">
								<li class="active"><a href="${pageContext.request.contextPath}/index.do">Home</a></li>
								<li><a href="${pageContext.request.contextPath}/sub1.do">서비스안내</a></li>
								<li><a href="${pageContext.request.contextPath}/bbs/document_list.do?category=notice">고객센터</a></li>
								<li><a href="${pageContext.request.contextPath}/bbs/document_list.do?category=gallery">추천지</a></li>
								<li class="nolink">
									<a href="${pageContext.request.contextPath}/book.do">예약/찾기</a>
								</li>
								<c:choose>
									<c:when test="${loginInfo == null}">
										<li><a href="${pageContext.request.contextPath}/loginpage.do">로그인</a></li>
									</c:when>
									<c:otherwise>
										<ul class="nav navbar-nav navbar-right">
											<li class="dropdown">
											<a href="${pageContext.request.contextPath}/mypage1.do?log=${logUid}" class="dropdown-toggle" data-toggle="dropdown" >
												
												MyPage<span class="caret"></span>
											</a>
												
												<!-- 로그인한 경우 표시될 메뉴 -->
												<ul class="dropdown-menu">
													<li><a href="${pageContext.request.contextPath}/logout.do">
														로그아웃</a></li>
													<li><a href="${pageContext.request.contextPath}/mypage1.do?log=${logUid}">
														회원정보 수정</a></li>
												</ul>
											</li>
										</ul>
									</c:otherwise>
								</c:choose>
							</ul>
						</c:when>
						<c:otherwise>
							<ul class="nav navbar-nav">
								<li class="active"><a href="${pageContext.request.contextPath}/index.do">Home</a></li>
								<li><a href="${pageContext.request.contextPath}/sub1.do">서비스안내</a></li>
								<li><a href="${pageContext.request.contextPath}/bbs/document_list.do?category=notice">고객센터</a></li>
								<li><a href="${pageContext.request.contextPath}/bbs/document_list.do?category=gallery">추천지</a></li>
								<li><a href="${pageContext.request.contextPath}/book.do">예약/찾기</a></li>
								<c:choose>
									<c:when test="${loginInfo == null}">
										<li><a href="${pageContext.request.contextPath}/loginpage.do">로그인</a></li>
									</c:when>
									<c:otherwise>
										<ul class="nav navbar-nav navbar-right">
											<li class="dropdown">
											<a href="${pageContext.request.contextPath}/mypage1.do?log=${logUid}" class="dropdown-toggle" data-toggle="dropdown" >
												
												MyPage<span class="caret"></span>
											</a>
												
												<!-- 로그인한 경우 표시될 메뉴 -->
												<ul class="dropdown-menu">
													<li><a href="${pageContext.request.contextPath}/logout.do">
														로그아웃</a></li>
													<li><a href="${pageContext.request.contextPath}/mypage1.do?log=${logUid}">
														예약내역</a></li>
													<li><a href="${pageContext.request.contextPath}/mypage2.do">
														회원정보 수정</a></li>
												</ul>
											</li>
										</ul>
									</c:otherwise>
								</c:choose>
							</ul>
							<!--// 메인메뉴 -->
						</c:otherwise>
					</c:choose>


				</div>
				<!--// 메뉴 영역 -->


				<!--// 배경을 제외한 메뉴 항목의 영역 제한 -->
			</div>
		</div>
	</div>		
			<!--// 메뉴바 -->
</header>
<!-- 헤더영역 끝 -->

