<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/inc/head.jsp"%>
<style type="text/css">
.first {
	margin: auto;
	text-align: center;
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

				<!-- 회원안내 시작 -->


				<h3>SSC 요금안내</h3>
				<table class="table">
					<colgroup>
						<col>
						<col width="600" span="2">
					</colgroup>
					<thead>
						<tr>
							<th><strong>구&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;분</strong></th>
							<th><strong>상세내용</strong></th>
						</tr>
					</thead>

					<tbody>
						<tr>
							<th>연&nbsp;회&nbsp;비</th>
							<td>무료</td>
						</tr>
						<tr>
							<th>가입조건</th>
							<td>만 21세 이상, 운전면허 취득 후 1년 이상 경과</td>
						</tr>
						<tr>
							<th>필수조건</th>
							<td>본인 명의 운전면허증 등록</td>
						</tr>
						<tr>
							<th>대여요금</th>
							<td>차종별 차등 할인</td>
						</tr>
						<tr>
							<th>가입혜택</th>
							<td>없음</td>
						</tr>
						<tr>
							<th>이용혜택</th>
							<td>이용 횟수에 따라 다양한 혜택 지급</td>
						</tr>
					</tbody>
				</table>

				<h5>가입 및 이용 혜택은 당사 정책에 따라 변경될 수 있습니다.</h5>

				<!-- // 회원 안내 끝-->

				<br> <br>


				<!-- 전국 SSC존 대여/주행요금 안내 -->

				<h4>전국 SSC존 대여/주행요금 안내</h4>
				<h5>타면된다,SSC! 자유롭게 신나는 드라이빙을 즐기세요!</h5>
				<br>
				<table class="table" style="text-align: center">
					<thead>
						<tr>
							<th style="text-align: center" rowspan="2">차종</th>
							<th style="text-align: center" rowspan="2">모델</th>
							<th style="text-align: center" rowspan="2">기준 대여요금</th>
							<th style="text-align: center" rowspan="2">주행요금 <br />(주행거리
								Km당)
							</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th rowspan="3" class="first">경형</th>
							<td class="tal">모닝</td>
							<td>1,200원</td>
							<td class="strong">720원~</td>
						</tr>
						<tr>
							<td class="tal">스파크</td>
							<td>1,200원</td>
							<td class="strong">720원~</td>

						</tr>
						<tr>
							<td class="tal">넥스트스파크</td>
							<td>1,200원</td>
							<td class="strong">720원~</td>

						</tr>
						<tr>
							<th class="first">경형B</th>
							<td class="tal">레이</td>
							<td>1,250원</td>
							<td class="strong">720원~</td>

						</tr>
						<tr>
							<th rowspan="2" class="first">소형</th>
							<td class="tal">프라이드</td>
							<td>1,430원</td>
							<td class="strong">850원~</td>

						</tr>
						<tr>
							<td class="tal">엑센트</td>
							<td>1,430원</td>
							<td class="strong">850원~</td>

						</tr>
						<tr>
							<th rowspan="3" class="first">준중형</th>
							<td class="tal">K3</td>
							<td>1,580원</td>
							<td class="strong">950원~</td>

						</tr>
						<tr>
							<td class="tal">아반떼</td>
							<td>1,580원</td>
							<td class="strong">950원~</td>

						</tr>
						<tr>
							<td class="tal">아반떼AD</td>
							<td>1,580원</td>
							<td class="strong">950원~</td>

						</tr>
						<tr>
							<th rowspan="5" class="first">중형</th>
							<td class="tal">K5(LPG)</td>
							<td>2,160원</td>
							<td class="strong">1,300원~</td>

						</tr>
						<tr>
							<td class="tal">LF 쏘나타</td>
							<td>2,160원</td>
							<td class="strong">1,300원~</td>

						</tr>
						<tr>
							<td class="tal">LF 쏘나타(LPG)</td>
							<td>2,160원</td>
							<td class="strogn">1,300원~</td>

						</tr>
						<tr>
							<td class="tal">SM5</td>
							<td>2,160원</td>

							<td class="strong">1,300원~</td>

						</tr>
						<tr>
							<td class="tal">말리부</td>
							<td>2,660원</td>
							<td class="strong">1,600원~</td>

						</tr>
						<tr>
							<th rowspan="2" class="first">대형</th>
							<td class="tal">그랜저HG</td>
							<td>4,160원</td>
							<td class="strong">2,080원~</td>

						</tr>
						<tr>
							<td class="tal">그랜저HG(LPG)</td>
							<td>4,160원</td>
							<td class="strong">2,080원~</td>

						</tr>
						<tr>
							<th rowspan="5" class="first">SUV</th>
							<td class="tal">올란도(경유)</td>
							<td>3,000원</td>
							<td class="strong">1,800원~</td>

						</tr>
						<tr>
							<td class="tal">티볼리(경유)</td>
							<td>3,000원</td>
							<td class="strong">1,800원~</td>

						</tr>
						<tr>
							<td class="tal">트랙스(경유)</td>
							<td>3,000원</td>
							<td class="strong">1,800원~</td>

						</tr>
						<tr>
							<td class="tal">스포티지(경유)</td>
							<td>3,000원</td>
							<td class="strong">1,800원~</td>

						</tr>
						<tr>
							<td class="tal">QM3(경유)</td>
							<td>3,000원</td>
							<td class="strong">1,800원~</td>

						</tr>
						<tr>
							<th rowspan="2" class="first">승합차</th>
							<td class="tal">카니발 11인승(경유)</td>
							<td>3,360원</td>
							<td class="strong">1,830원~</td>

						</tr>
						<tr>

							<td class="tal">그랜드 스타렉스(경유)</td>
							<td>3,830원</td>
							<td class="strogn">1,910원~</td>

						</tr>
						<tr>
							<th rowspan="7" class="first">수입차</th>
							<td class="tal">피아트500</td>
							<td>3,330원</td>
							<td class="strong">1,660원~</td>

						</tr>
						<tr>
							<td class="tal">미니쿠퍼</td>
							<td>3,500원</td>
							<td class="strong">1,750원~</td>

						</tr>
						<tr>
							<td class="tal">미니5도어</td>
							<td>3,660원</td>
							<td class="string">1,830원~</td>

						</tr>
						<tr>
							<td class="tal">프리우스</td>
							<td>3,660원</td>
							<td class="strong">1,830원~</td>

						</tr>
						<tr>
							<td class="tal">비틀(경유)</td>
							<td>3,830원</td>
							<td class="strong">1,910원~</td>

						</tr>
						<tr>
							<td class="tal">BMW 520D(경유)</td>
							<td>7,330원</td>
							<td class="strogn">3,660원~</td>

						</tr>
						<tr>
							<td class="tal">BMW X3(경유)</td>
							<td>7,500원</td>
							<td class="strong">3,750원~</td>

						</tr>
					</tbody>
				</table>

				<ul style="list-style: none">
					<li>대여요금은 지역별,성수기/비수기 등에 따라 탄력요금제로 운영하므로,위에 안내된 요금은 결제 시 요금과
						다를 수 있습니다.</li>
					<li>주행요금은 차량 이용 후 실제 주행거리에 따라 부과됩니다.</li>
					<li>대여요금 및 주행요금은 당사 내부정책/유가변동에 따라 변경될 수 있습니다.</li>
				</ul>
				<div
					style="margin-top: 30px; display: span; overflow: hidden; width: 100%;"></div>
			</div>
			<!--// col-sm-10 영역 끝  -->
		</div>
		<!--// contain 영역 끝 -->
	</div>
	<!--// 메인 영역 끝-->










	<!-- 푸터 -->

	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>

</body>
</html>
