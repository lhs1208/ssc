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
					<a href="${pageContext.request.contextPath}/sub1.do"
						class="list-group-item"><strong>이용방법</strong></a> <a
						href="${pageContext.request.contextPath}/sub2.do"
						class="list-group-item"><strong>이용규칙</strong></a> <a
						href="${pageContext.request.contextPath}/sub3.do"
						class="list-group-item"><strong>차량 정보</strong></a>

				</div>
			</div>
			<!--탭 bar 끝-->

			<div class="col-sm-10">

				<div class="row" id="c">
					<div class="media">
						<img src="${pageContext.request.contextPath}/img/bbs1.png" style="width: 100%">
					</div>
				</div>
			

			<!--서비스 안내 -> 이용규칙 테이블 -->
			<div class="box">
				<div id="sscar2" class="content" style="display: block">
					<h3>SSC 이용규칙</h3>

					<ul style="list-style: none">
						<li><span class="rule"><img src="img/rule-01.PNG"
								alt="이용 후 대여한 SSC존으로 반납 필수!" /></span> <span class="text"><strong>이용
									후 대여한 SSC존으로 반납 필수!</strong><br /> 편도 이용을 제외한 모든 차량 반납은 대여한 SSC존으로 하셔야
								합니다 <br /> 만약 다른 차량이 주차되어 있거나 부득이한 사정이 생기신 경우는 고객센터로 연락 바랍니다. </span>
						</li>
						<li><span class="rule"><img src="img/rule-02.PNG"
								alt="반납시간을 준수해주세요!" /></span> <span class="text"><strong>반납시간을
									준수해주세요!</strong><br /> 다음 사용자를 위해 반납시간을 꼭 지켜주세요. 반납이 늦어지는 경우 패널티 또는
								경고조치를 받을 수 있으며, 반납연장은 홈페이지에서 가능합니다. </span></li>
						<li><span class="rule"><img src="img/rule-03.PNG"
								alt="연료가50%이상 남았는지 확인해주세요!" /></span> <span class="text"><strong>연료가50%이상
									남아있는지 확인해주세요!</strong><br />다음 사용자를 위해 연료가 충분히 남았는지 확인해주세요.<br /> 모든
								주유소에서 주유가 가능하며,결제는 차량 내부에 비치된 주유카드로 진행하시면 됩니다.</span></li>
						<li><span class="rule"><img src="img/rule-04.PNG"
								alt="SSC에서 흡연은 꼭 참아주세요!" /></span> <span class="text"><strong>SSC에서
									흡연은 꼭 참아주세요!</strong><br /> 함께 사용하는 분들을 위해 SSC를 이용하는 동안 흡연은 꼭 참아주세요!<br />
								이용 후에는 차량 내부에 있는 쓰레기를 정리해 주시기 바랍니다.</span></li>
						<li><span class="rule"><img src="img/rule-05.PNG"
								alt="문제가 생긴 경우 고객센터로 즉시 연락주세요!" /></span> <span class="text"><strong>문제가
									생긴 경우 고객센터로 즉시 연락주세요!</strong><br />예약한 차량에 사고 흔적이 있거나 이용 중 사고 및 기타 문제로
								인해 긴급출동이 필요한 경우에는 신속하게<br /> 고객센터로 상황을 알려주시기 바랍니다.</span></li>
						<li><span class="rule"><img src="img/rule-06.PNG"
								alt="애완동물은 캐리어를 이용해주세요!" /></span> <span class="text"><strong>애완동물은
									캐리어를 이용해주세요!!</strong><br />애완동물은 캐리어를 이용해 SSC에 동반 탑승하실 수 있습니다. 단,장애인
								반려견은 캐리어 없이도 탑승 가능합니다.</span></li>
					</ul>
				</div>
			</div>
			<br>
			<!-- 패널티 규정 작성 시작 -->

			<h4>패널티 규정</h4>
			<table class="table">
				<thead>
					<tr>
						<th colspan="2" class="first">운전자 준수사항 미이행 내용</th>
						<th>페널티금액</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td rowspan="2" class="first">자동차 반납의 지연</td>
						<td>10분 이상 30분 미만</td>
						<td>10,000원</td>
					</tr>
					<tr>
						<td>30분 이상</td>
						<td>기본 반납 지연 페널티금액 10,000원과 자동차 반납 예정 시각까지의 시간 동안의 해당 자동차 이용
							기준 요금의 2배
					</tr>
					<tr>
						<td colspan="2" class="first">자동차 반납시 잔여연료의 부족</td>
						<td>20,000원</td>
					</tr>
					<tr>
						<td colspan="2" class="first">자동차 내에서의 흡엽</td>
						<td>300,000원</td>
					</tr>
					<tr>
						<td colspan="2" class="first">자동차 키 분실</td>
						<td>80,000원</td>
					</tr>
					<tr>
						<td colspan="2" class="first">헤드라이트 소등 미실시</td>
						<td>20,000원</td>
					</tr>
					<tr>
						<td colspan="2" class="first">SSC존 쓰레기 투기 및 자동차 내부 상태 불량</td>
						<td>50,000원</td>
					</tr>
					<tr>
						<td colspan="2" class="first">지정되지 않은 장소로의 반입</td>
						<td>페널티금액 50,000원 및 견인, 주차비 등 지정되지 않은 장소로의 자동차 반납으로 인하여 발생한
							실비 일체</td>
					</tr>
					<tr>
						<td colspan="2" class="first">차량의 파손이나 도난 발견시 본사로 즉시 연락하지 않은
							경우</td>
						<td>100,000원</td>
					</tr>
					<tr>
						<td colspan="2" class="first">동승운전자 미등록 운전</td>
						<td>100,000원</td>
					</tr>
					<tr>
						<td colspan="2" class="first">음주 및 양물복용 운전</td>
						<td>100,000원</td>
					</tr>
					<tr>
						<td colspan="2" class="first">편도 핫딜 미운행 시</td>
						<td>30,000원</td>
					</tr>
					<tr>
						<td colspan="2" class="first">핸들 미션 불이행 시</td>
						<td>30,000원</td>
					</tr>
					<tr>
				</tbody>
			</table>

			<!-- // 패널티 규정 끝-->
			<br> <br>

			<!-- 이용자제한 안내 -->
			<h4>이용자 제한 안내</h4>
			<table class="table" style="border: 1">
				<colgroup>
					<col width="260">

				</colgroup>
				<thead>
					<tr>
						<th class="first">운전자 준수사항 미이행 내용</th>
						<th>조치사항</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="first">위반횟수</td>
						<td>"1회 경고" <br> "2회 패널티금액 부과" <br> "3회 패널티금액 부과 및
							서비스 이용 1개월/영구 이용정지 조치"
						</td>
					</tr>
					<tr>
						<td class="first">운전면허 정지된 경우</td>
						<td>운전면허가 정상화되는 시점까지 서비스 이용 중지</td>
					</tr>
					<tr>
						<td class="first">체납요금이 발생한 경우</td>
						<td>미납요금,패널티금액,손해배상 등 채무가 모두정산될 때까지 서비스 이용 정지</td>
					</tr>
					<tr>
						<td class="first">사고가 발생한 경우</td>
						<td>해당 사고가 처리되는 시점까지 서비스 이용 중지</td>
					</tr>
					<tr>
						<td class="first">불법적인 용도로 차량을 이용한 경우</td>
						<td>서비스 이용 정지</td>
					</tr>
				</tbody>
			</table>
			<!-- 이용자제한 안내  끝 -->
			<br> <br>
			</div>
			<!--// col-sm-10 영역 끝  -->
		</div>
		<!--// 컨테이너 영역 끝 -->
	</div>
	<!--// main영역 끝 -->

	<!-- 푸터 -->
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>


</body>
</html>
