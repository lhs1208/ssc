<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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

						<div class="jumbotron">
				            <div class="font5"><h1>어서오세요~ <span>SSCar</span> 입니다.</h1></div>
				            <br>
				            <h3>언제나 어디서나 즐거운 드라이빙을 즐기시려면</h3>
				            <h3>지금 바로 가입하세요~!</h3>
			            </div>
			            <!-- //점보트론 -->
			        

			            <!-- 회원가입 -->
			            <div style="border-right: 1px solid #48BAE4; height: auto; padding:10px;" class="col-md-6">
				        <h2>개인회원</h2>
				            <p>간편하게 가입하고 편리하게 사용하세요.
				            <br> 회원가입으로 다양한 차량들을 몰아보세요.</p>
				            <a href="${pageContext.request.contextPath}/join1_1.do"><img src="img/joinbutton.jpg"></a>
                        </div>
			            <div class="col-md-6">
				            <h2>법인회원</h2>
				            <p>기업 가입시 다양한 혜택이 쾅쾅
				            <br>저희는 여러분의 회사와 같이 달려갑니다.</p>
				            <p><strong>현재 법인회원은 준비중입니다. 빠른시일내에 만나요!</strong></p>
				            
			            </div>
					</div>
					<br>
					<br>
					<br>
					<div id="joinbox_bottom">
						<h2>회원가입은 만 14세 이상만 가입이 가능합니다.</h2>
						<p><br>타인의 정보를 도용해 가입하거나 허위정보로 가입해 차량을 이용할 경우 법적 처벌의 대상이 될 수 있습니다.</p>
					</div>
					<!-- table row 끝-->
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

