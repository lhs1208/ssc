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
					<a
						href="${pageContext.request.contextPath}/bbs/document_list.do?category=notice"
						class="list-group-item"><strong>공지사항</strong></a> <a
						href="${pageContext.request.contextPath}/center.do"
						class="list-group-item"><strong>자주묻는 질문</strong></a> <a
						href="${pageContext.request.contextPath}/bbs/document_list.do?category=qna"
						class="list-group-item"><strong>1:1문의</strong></a>
				</div>
			</div>
			<!--탭 bar 끝-->
			<div class="col-sm-10">

				<div class="row" id="c">

					<img src="${pageContext.request.contextPath}/img/index1.png">
					<h1>자주묻는질문</h1>

					<h4>SSC가 궁금하세요? 자주찾는 질문을 이용하세요. 고객님의 궁금하신 사항을 빠르고 정확하게 해결하실 수
						있습니다.</h4>
					<hr />


				</div>


				<div class="row">
					<!-- 탭메뉴 -->
					<ul id="myTab" class="nav nav-tabs">
						<li class="active"><a href="#a6" data-toggle="tab">예약결제문의</a></li>
						<li><a href="#a7" data-toggle="tab">가입문의</a></li>
						<li><a href="#a3" data-toggle="tab">차량이용/사고</a></li>
						<li><a href="#a4" data-toggle="tab">탈퇴</a></li>
						<li><a href="#a5" data-toggle="tab">기타</a></li>
					</ul>
					<!-- //탭메뉴 -->

					<!-- 탭화면 -->
					<div class="tab-content">
						<div class="tab-pane fade in active" id="a6">
							<!-- 아코디언영역 -->
							<div class="panel-group" id="accordion1">
								<!-- 항목(1) -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a class="accordion-toggle" data-toggle="collapse"
												data-parent="#accordion1" href="#b1">주유 비용은 어떻게 계산하나요?</a>
										</h4>
									</div>
									<div id="b1" class="panel-collapse collapse in">
										<div class="panel-body">차량 이용 중 주유가 필요한 경우, 차량내부에 비치된
											주유카드를 이용해 주유해 주세요. 이 후 고객님의 운행거리 만큼 km당 주행요금이 계산되어 등록하신 결제카드로
											자동 결제됩니다.</div>
									</div>
								</div>
								<!-- 항목(2) -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a class="accordion-toggle" data-toggle="collapse"
												data-parent="#accordion1" href="#b2">이용 요금 계산은 어떻게 하나요?</a>
										</h4>
									</div>
									<div id="b2" class="panel-collapse collapse">
										<div class="panel-body">이용요금은 10분단위로 계산되며 SSC카의 이용요금은
											대여요금, 보험료, 주행요금으로 구성되어 있습니다. 차종에 따른 시간당 요금은 홈페이지내 요금 안내 페이지를
											참고해주세요.</div>
									</div>
								</div>


								<!-- 항목(3) -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a class="accordion-toggle" data-toggle="collapse"
												data-parent="#accordion1" href="#b3">어떤 종류의 차량이 있나요?</a>
										</h4>
									</div>
									<div id="b3" class="panel-collapse collapse">
										<div class="panel-body">SSC카에는 피아트500, 쏘나타 하이브리드, 레이,
											K3, 아반떼, 모닝, 스파크, 그랜드 스타렉스, 프라이드 해치백, 올란도, 미니쿠퍼, 프리우스, 액센트가
											있습니다.</div>
									</div>
								</div>


								<!-- 항목(4) -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a class="accordion-toggle" data-toggle="collapse"
												data-parent="#accordion1" href="#b4">예약 가능한 횟수가 정해져 있나요?</a>
										</h4>
									</div>
									<div id="b4" class="panel-collapse collapse">
										<div class="panel-body">예약은 최대 5건까지만 가능하며, 동일 시간에 중복예약은
											불가합니다. 실시간으로 예약 상황을 확인하신 후 필요하실 때 언제든지 이용해주세요.</div>
									</div>
								</div>


								<!-- 항목(5) -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a class="accordion-toggle" data-toggle="collapse"
												data-parent="#accordion1" href="#b5">홈페이지에서 차량 예약을 어떻게
												하나요?</a>
										</h4>
									</div>
									<div id="b5" class="panel-collapse collapse">
										<div class="panel-body">SSC카는 회원제 카셰어링 서비스로, 이용을 원하시는
											분들은 회원 가입 후 로그인을 하시면 홈페이지에서 차량 예약이 가능합니다. 로그인 후 상단 메뉴에서 예약을
											진행하실 수 있습니다.</div>
									</div>
								</div>


								<!-- 항목(6) -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a class="accordion-toggle" data-toggle="collapse"
												data-parent="#accordion1" href="#b6">주변에 예약 가능한 쏘카가 없을
												때는 어떻게 하나요?</a>
										</h4>
									</div>
									<div id="b6" class="panel-collapse collapse">
										<div class="panel-body">현재 SSC카존에는 1~3대의 차량이 주차되어 있으나,
											이용이 많을 때에는 예약이 불가능할 수 있습니다. 이런 경우에는 고객센터 1111-1111로 연락 주시면 이용
											가능한 차량이 있는지 확인해 드립니다.</div>
									</div>
								</div>


								<!-- 항목(7) -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a class="accordion-toggle" data-toggle="collapse"
												data-parent="#accordion1" href="#b7">예약 확인은 어떻게 하나요?</a>
										</h4>
									</div>
									<div id="b7" class="panel-collapse collapse">
										<div class="panel-body">예약완료 후 '마이페이지' - '결제내역'에서 확인
											가능합니다.</div>
									</div>
								</div>


								<!-- 항목(8) -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a class="accordion-toggle" data-toggle="collapse"
												data-parent="#accordion1" href="#b8">예약 취소나 변경에 대한 페널티가
												있나요?</a>
										</h4>
									</div>
									<div id="b8" class="panel-collapse collapse">
										<div class="panel-body">예약 취소할 경우 예약 시작 시간 3시간 이전까지는
											자유롭게 예약취소가 가능하며, 예약 시작 시간 3시간 이내로부터 예약 시작 시간 10분 전 사이에 취소를 한
											경우에는 예약하신 금액의 10%의 위약금이 부과됩니다. 단 예약 시작 시간 10분 전부터는 예약 취소가
											불가능합니다.</div>
									</div>
								</div>


								<!-- 항목(9) -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a class="accordion-toggle" data-toggle="collapse"
												data-parent="#accordion1" href="#b9">최소 예약 시간과 최대 예약 시간은
												얼마인가요?</a>
										</h4>
									</div>
									<div id="b9" class="panel-collapse collapse">
										<div class="panel-body">SSC카는 최소 30분부터 예약이 가능하며 최대 예약
											가능한 시간은 120시간입니다. 5일(120시간) 이상의 장기 사용에 관해서는 쏘카 고객센터
											1111-1111로 문의해주세요.</div>
									</div>
								</div>


								<!-- 항목(10) -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a class="accordion-toggle" data-toggle="collapse"
												data-parent="#accordion1" href="#b10">예약 연장이 가능한가요?</a>
										</h4>
									</div>
									<div id="b10" class="panel-collapse collapse">
										<div class="panel-body">회원님이 사용 중인 차량이 다른 회원이 대기 중인 차량이
											아닐 경우에는 차량 연장이 가능합니다. 예약연장은 SSC콜센터 상담원을 통해 가능합니다.</div>
									</div>
								</div>


							</div>
							<!-- //아코디언영역 -->
						</div>
						<div class="tab-pane fade" id="a7">
							<!-- 아코디언영역 -->
							<div class="panel-group" id="accordion2">
								<!-- 항목(1) -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a class="accordion-toggle" data-toggle="collapse"
												data-parent="#accordion2" href="#c1">회원이 되려면 얼마나 걸리나요?</a>
										</h4>
									</div>
									<div id="c1" class="panel-collapse collapse in">
										<div class="panel-body">SSC카 홈페이지에서 회원 가입하시면, 회원님의 개인정보,
											운전면허 정보 등을 확인하는 과정을 거칩니다. 정보에 문제가 없는 경우 회원가입 30분 이내 SSC카 회원으로
											승인됩니다.</div>
									</div>
								</div>
								<!-- 항목(2) -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a class="accordion-toggle" data-toggle="collapse"
												data-parent="#accordion2" href="#c2">연회비 제도가 있나요?</a>
										</h4>
									</div>
									<div id="c2" class="panel-collapse collapse">
										<div class="panel-body">SSC카에서는 별도 연회비가 없이 모든 서비스를 이용하실
											수 있습니다.</div>
									</div>
								</div>


								<!-- 항목(3) -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a class="accordion-toggle" data-toggle="collapse"
												data-parent="#accordion2" href="#c3">가입절차가 어떻게 되나요?</a>
										</h4>
									</div>
									<div id="c3" class="panel-collapse collapse">
										<div class="panel-body">회원가입은 SSC카 홈페이지에서 가능합니다. 회원가입 시
											실명인증 및 연락처, 이메일, 주소 등의 개인정보와 운전면허 정보를 모두 입력해 주셔야 합니다. 회원가입을
											완료하시면 입력하신 정보가 사실과 맞는지 검토하는 과정을 거쳐, 심사가 정상적으로 완료된 후부터 SSC카 예약
											및 이용이 가능합니다.</div>
									</div>
								</div>


								<!-- 항목(4) -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a class="accordion-toggle" data-toggle="collapse"
												data-parent="#accordion2" href="#c4">가입 후 바로 차를 이용할 수
												있나요?</a>
										</h4>
									</div>
									<div id="c4" class="panel-collapse collapse">
										<div class="panel-body">SSC카 회원 가입을 완료하시면 입력하신 정보가 사실과
											맞는지 소정의 심사과정을 진행하게 됩니다. 심사가 정상적으로 완료 된 후 SSC카 이용이 가능합니다.</div>
									</div>
								</div>


								<!-- 항목(5) -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a class="accordion-toggle" data-toggle="collapse"
												data-parent="#accordion2" href="#c5">꼭 회원가입해야 이용이 가능한가요?</a>
										</h4>
									</div>
									<div id="c5" class="panel-collapse collapse">
										<div class="panel-body">네, SSC카는 신뢰를 기반으로 한 회원제 서비스로 안전한
											이용을 위하여 회원으로 가입하셔야만 이용이 가능합니다.</div>
									</div>
								</div>

							</div>
							<!-- //아코디언영역 -->

						</div>
						<div class="tab-pane fade" id="a3">
							<!-- 아코디언영역 -->
							<div class="panel-group" id="accordion3">
								<!-- 항목(1) -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a class="accordion-toggle" data-toggle="collapse"
												data-parent="#accordion3" href="#d1">전기차 충전이 필요할 때는
												언제인가요?</a>
										</h4>
									</div>
									<div id="d1" class="panel-collapse collapse in">
										<div class="panel-body">주행 시 계기판 잔여 주행거리를 확인하여 주행 가능 거리가
											30km 미만인 경우 충전소를 찾아주세요!</div>
									</div>
								</div>
								<!-- 항목(2) -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a class="accordion-toggle" data-toggle="collapse"
												data-parent="#accordion3" href="#d2">차량 이용 중 사고가 나거나 긴급
												출동이 필요할 때는 어떻게 해야 하나요?</a>
										</h4>
									</div>
									<div id="d2" class="panel-collapse collapse">
										<div class="panel-body">차량 이용 중 고장이나 사고 발생 시
											고객센터(1111-1111)로 즉시 연락해 신고해야 하며 회사의 안내를 준수해야 합니다. 사고 후 신고하지
											않은 경우에는 보험 혜택을 적용받을 수 없으며 미신고 페널티 금액이 징구됩니다.</div>
									</div>
								</div>


								<!-- 항목(3) -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a class="accordion-toggle" data-toggle="collapse"
												data-parent="#accordion3" href="#d3">개인보험으로 차량손실비용을 처리
												가능한가요?</a>
										</h4>
									</div>
									<div id="d3" class="panel-collapse collapse">
										<div class="panel-body">특정 상품은 개인보험으로 렌터카 사고를 보장하는 경우가
											있습니다. 하지만 보장 예외 정책이 있기 때문에 자세히 확인이 필요합니다. 차량 이용 전에 보험사를 통해
											확인하시기 바랍니다.</div>
									</div>
								</div>


								<!-- 항목(4) -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a class="accordion-toggle" data-toggle="collapse"
												data-parent="#accordion3" href="#d4">사용하려고 하는데, 차량에 파손이
												있으면 어떻게 하나요?</a>
										</h4>
									</div>
									<div id="d4" class="panel-collapse collapse">
										<div class="panel-body">차량 예약 후 주행 전에 반드시 전반적인 차량 외관 및
											내부를 점검해 주시기 바랍니다. 차량이 파손 혹은, 문제가 있는경우 고객센터로 즉시 연락 주시기 바랍니다.
											이러한 절차는 고객님의 이용 전 일어난 사고에 대한 책임을 면책하기 위해 반드시 필요합니다.</div>
									</div>
								</div>


								<!-- 항목(5) -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a class="accordion-toggle" data-toggle="collapse"
												data-parent="#accordion3" href="#d5">사고를 당하면 어떻게 해야 하나요?</a>
										</h4>
									</div>
									<div id="d5" class="panel-collapse collapse">
										<div class="panel-body">사고 발생 시 부상자 및 차량 파손 여부를 확인해 경찰서에
											신고하고, SSC카 고객센터로도 곧바로 연락주시기 바랍니다. 본인 과실이 아닌 경우, 경찰 진술서가 보험적용에
											큰 영향을 미칩니다.</div>
									</div>
								</div>


								<!-- 항목(6) -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a class="accordion-toggle" data-toggle="collapse"
												data-parent="#accordion3" href="#d6">교통위반 고지서를 받으면 어떻게
												해야하죠?</a>
										</h4>
									</div>
									<div id="d6" class="panel-collapse collapse">
										<div class="panel-body">회사에서 교통위반 고지서를 받은 후 고객님께 개별
											통보드립니다. 교통위반으로 인한 벌금, 과태료 등의 비용은 당시 운전한 회원이 지불해야 합니다.</div>
									</div>
								</div>


								<!-- 항목(7) -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a class="accordion-toggle" data-toggle="collapse"
												data-parent="#accordion3" href="#d7">애완동물도 함께 탈 수 있나요?</a>
										</h4>
									</div>
									<div id="d7" class="panel-collapse collapse">
										<div class="panel-body">장애인을 위한 반려견을 제외한 모든 경우는 애완용 캐리어를
											이용해 이동해야 합니다. 애완동물과 동승한 경우에는 다음 이용자를 위해 실내 청소에 더욱 신경 써 주시기
											바랍니다.</div>
									</div>
								</div>


								<!-- 항목(8) -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a class="accordion-toggle" data-toggle="collapse"
												data-parent="#accordion3" href="#d8">차량에 개인소지품을 놓고 왔습니다.
												어디서 찾아야 하나요?</a>
										</h4>
									</div>
									<div id="d8" class="panel-collapse collapse">
										<div class="panel-body">고객센터로 연락주시면 차량 대여 여부 확인 후 분실물을
											찾으실 수 있도록 도와드립니다. 차량 반납 전 미리 트렁크나 서랍 등을 잘 살피시고 두고 내린 물건이 없는지
											확인해 주세요!</div>
									</div>
								</div>


								<!-- 항목(9) -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a class="accordion-toggle" data-toggle="collapse"
												data-parent="#accordion3" href="#d9">내가 예약한 동안 차량은 다른
												사람이 운전해도 되나요?</a>
										</h4>
									</div>
									<div id="d9" class="panel-collapse collapse">
										<div class="panel-body">예약한 회원 본인만 SSC카를 운전 할 수 있습니다. 이
											외 SSC카와 협의되지 않은 제 3자가 운전하거나 예약자 없이 동승 운전자가 단독운행하여 발생한 사고는 보험
											혜택 등을 적용 받을 수 없습니다.</div>
									</div>
								</div>


								<!-- 항목(10) -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a class="accordion-toggle" data-toggle="collapse"
												data-parent="#accordion3" href="#d10">차 안에서 흡연이 가능한가요?</a>
										</h4>
									</div>
									<div id="d10" class="panel-collapse collapse">
										<div class="panel-body">SSC카 차량 내에서는 흡연이 일절 금지되어있습니다. 이를
											위반한 경우는 30만원의 페널티금액이 부과됩니다. 다음 사용자를 위해 반드시 금연해 주시기 바랍니다.</div>
									</div>
								</div>


							</div>
							<!-- //아코디언영역 -->

						</div>

						<div class="tab-pane fade" id="a4">
							<!-- 아코디언영역 -->
							<div class="panel-group" id="accordion5">
								<!-- 항목(1) -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a class="accordion-toggle" data-toggle="collapse"
												data-parent="#accordion5" href="#e1">탈퇴 시 재가입이 가능한가요?</a>
										</h4>
									</div>
									<div id="e1" class="panel-collapse collapse in">
										<div class="panel-body">탈퇴 시 3개월간 재가입이 제한됩니다. 아이디/이름 변경
											등이 필요한 경우에는 고객센터로 문의주세요.</div>
									</div>
								</div>
								<!-- 항목(2) -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a class="accordion-toggle" data-toggle="collapse"
												data-parent="#accordion5" href="#e2">탈퇴를 하려면 어떻게 해야 하나요?</a>
										</h4>
									</div>
									<div id="e2" class="panel-collapse collapse">
										<div class="panel-body">SSC카 PC 홈페이지 로그인 후, 마이페이지>내정보
											하단의 탈퇴하기 버튼을 클릭하여, 탈퇴를 요청해주세요.</div>
									</div>
								</div>



							</div>
							<!-- //아코디언영역 -->

						</div>
						<div class="tab-pane fade" id="a5">
							<!-- 아코디언영역 -->
							<div class="panel-group" id="accordion6">
								<!-- 항목(1) -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a class="accordion-toggle" data-toggle="collapse"
												data-parent="#accordion6" href="#f1">세차가 하고 싶어요! 어떻게
												해야하나요?</a>
										</h4>
									</div>
									<div id="f1" class="panel-collapse collapse in">
										<div class="panel-body">이용 중 세차가 하고 싶으신가요? 자비부담으로 세차 진행
											시 이용후기에 세차 전후 사진을 촬영하여 남겨주시면 확인 후 소정의 보상을 드립니다.</div>
									</div>
								</div>
								<!-- 항목(2) -->
								<div class="panel panel-default">
									<div class="panel-heading">
										<h4 class="panel-title">
											<a class="accordion-toggle" data-toggle="collapse"
												data-parent="#accordion6" href="#f2">주변에 쏘카존이 없어서 이용이
												불편합니다. 요청은 어떻게 하나요?</a>
										</h4>
									</div>
									<div id="f2" class="panel-collapse collapse">
										<div class="panel-body">원하시는 SSC카존이 있는 경우 자세한 위치 및
											SSC카존이 생겼으면 하는 이유를 1:1문의를 통해 알려주시면 의견을 수렴해 SSC카존을 마련해 나가도록
											하겠습니다.</div>
									</div>
								</div>

							</div>
							<!-- //아코디언영역 -->

						</div>




















						<div class="tab-pane fade" id="hoogi">
							<table class="table">
								<tbody>
									<tr>
										<td>아주 만족스러운 여행</td>
									</tr>
									<tr>
										<td>차가 좀 후지네요</td>
									</tr>
									<tr>
										<td>이용해서 후기합니다.</td>
									</tr>
									<tr>
										<td>후기해서이용하구요</td>
									</tr>
									<tr>
										<td>카캉아란ㅇ란알ㄴ알ㅇ나</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<!-- //탭화면 -->
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
