<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/inc/head.jsp"%>
<!--스타일 시트 -->
<style type="text/css">
#gallery li{
	list-style: none;
	height: 170px;
}
</style>
</head>

<body>
<%@ include file="/WEB-INF/views/inc/topbar.jsp"%>

	

	<!-- 내용영역 -->
	<div class="main" id="c">
		<div class="container" id="b">
			<div class="col-sm-2" id="sidebar" role="navigation">
				<div class="list-group">
					<a href="${pageContext.request.contextPath}/sub1.do" class="list-group-item"><strong>이용방법</strong></a>
					<a href="${pageContext.request.contextPath}/sub2.do" class="list-group-item"><strong>이용규칙</strong></a>
					<a href="${pageContext.request.contextPath}/sub3.do" class="list-group-item"><strong>차량	정보</strong></a>

				</div>
			</div>
			<!--탭 bar 끝-->

			<div class="col-sm-10">

				<div class="row"  id="c">
						<div class="media">
							<%-- <img src="${pageContext.request.contextPath}/img/bbs1.png" style="width: 100%"> --%>
						</div>
					</div>
			
				
				<div class="box">
					<!--서비스 안내 -> 이용방법 테이블 -->
					<div id="sscar1" class="content col-sm-10">
						<h3>SSC 이용방법</h3>
						<p>
							가입에서 예약 사용까지 간편하게 이용할 수 있는 편리하고 경제적인 SSC카의 이용방법을 알려드립니다.<br />
							SSC카와 함께 스마트 카셰어링을 경험해 보세요!
						</p>
						<ul id="gallery">
							<li>
								<div>
									<div class="col-sm-3">
										<img src="img/thum-01.png" alt="회원가입" style="float: left; width: 100%"/>
									</div>
									<h3>회원가입</h3>
									카셰어링은 신뢰를 기반으로 한 회원제 서비스 입니다. 회원가입 후 SSC회원이 되시면 이용이 가능합니다.
								</div>
							</li>
							<li>
								<div>
									<div class="col-sm-3">
										<img src="img/thum-02.png" alt="차량예약" style="float: left; width: 100%"/>
									</div>
									<h3>차량예약</h3>
									SSC회원 가입 승인 후 예약이 가능합니다.홈페이지를 이용해 예약하실 수 있고 정상적으로
									예약완료된 경우 이메일로 예약 메시지가 전송됩니다.
								</div> 
							</li>
							<li>
								<div>
									<div class="col-sm-3">
										<img src="img/thum-03.png" alt="차량예약" style="float: left; width: 100%"/>
									</div>
									<h3>SSC이용</h3>
									예약한 시간에 예약한 존에 방문하여 차량 이용을 할 수 있습니다.
								</div> 
							</li>
							<li>
								<div>
									<div class="col-sm-3">
										<img src="img/thum-04.png" alt="차량예약" style="float: left; width: 100%"/>
									</div>
									<h3>차량반납</h3>
									반납시간에 맞추어 차량을 반납 장소에 주차하신 후 모바일앱 스마트키 및 회원카드로 차량 문을 잠가 주세요.
									제자리에 정상 반납 처리되면 휴대폰으로 확인 메시지가 발송됩니다.
								</div> 
							</li>
							<li>
								<div>
									<div class="col-sm-3">
										<img src="img/thum-05.png" alt="차량예약" style="float: left; width: 100%"/>
									</div>
									<h3>요금결제</h3>
									차량이용에 따른 요금은 대여료와 주행요금으로 구분되며,가입시 등록한 결제카드로 청구됩니다. 결제가 완료되지
									않으면 차량 사용에 제한이 있을 수 있으니, 미리 결제카드의 유효여부를 확인해 주세요.
								</div> 
							</li>
						</ul>
						<!-- gallery 영역 끝 -->
					</div>
					<!-- // 서비스 안내 -> 이용방법 테이블 끝-->
				</div>
				<!--// 박스영역-->
			</div>
			<!--// col-sm-10 영역 끝 -->	
		</div>
		<!--// contain 영역 끝 -->
	</div>
	<!--// main 영역 끝 -->
		




					<!-- 푸터 -->
<%@ include file="/WEB-INF/views/inc/footer.jsp"%>

</body>
</html>
