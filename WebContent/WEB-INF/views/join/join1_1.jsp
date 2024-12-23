<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/inc/head.jsp"%>
<script type="text/javascript">
		function chk() {
			var req = document.form.req.checked;
			var num = 0;
			if (req == true) {
				num = 1;
			}
			if (num == 1) {
				document.form.submit();
			} else {
				alert("개인정보 약관에 동의하셔야 합니다.");
			}
		}
		function nochk() {
			alert("동의하지 않으면 가입하실 수 없습니다");
			location.href = "${pageContext.request.contextPath}/index.do";
		}
</script>
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
					<div class="col-md-8 col-md-offset-2">
						<div class="box-static box-transparent box-bordered padding-30">
							<div class="box-title margin-bottom-30">
								<h2 class="size-20">이용 약관 및 개인정보 수집 및 이용 안내</h2>
							</div>
							
							<form class="default-form nomargin sky-form codeplus-custom" action="${pageContext.request.contextPath}/join1_2.do"  name="form" method="post">
								<fieldset>
									<div class="row margin-bottom-20">
										<div class="form-group">
											<div class="col-md-12">
												<label for="register:site_term">SSC 이용약관 동의(필수)</label>
												<textarea class="form-control margin-bottom-10" rows="10"
													readonly="readonly">
														제 1조 (목적)

이 이용약관(이하 '약관'이라 합니다)은 SSC(이하 '회사'라 합니다)가 제공하는 SSC 서비스(이하 '서비스'라 합니다)를 이용고객(이하 '회원'이라 합니다)이 이용함에 있어 회사와 회원과의 권리, 의무 및 책임사항, 기타 필요한 사항을 구체적으로 규정함을 목적으로 합니다.

제 2조 (용어의 정의)
(1) 이 약관에서 사용하는 용어의 정의는 다음과 같습니다
- 서비스: 구현되는 단말기와 상관없이 회원 혹은 웹사이트 방문자가 이용할 수 있는 SSC 서비스를 의미합니다.
- 회원 : 회사의 서비스에 접속하여 본 약관에 따라 회사와 이용계약을 체결하고 회사가 제공하는 서비스를 이용하는 고객을 말합니다.
- 이용계약 : 이 약관을 포함하여 서비스 이용과 관련하여 회사와 회원 간에 체결하는 모든 계약을 말합니다.
- 해지 : 회사 또는 회원이 이용계약을 해약하는 것을 말합니다.
- 강좌 : 강의들의 묶음으로 판매하는 단위입니다.
- 강의 : 강좌를 구성하는 개별 영상으로 연속된 영상 1개 혹은 수강을 하기 위해 조작을 해야하는 단위를 말합니다.

(2) 이 약관에서 사용하는 용어 중 제1항에서 정하지 아니한 것은 관계 법령 및 서비스 별 안내에서 정하는 바에 따르며, 그 외에는 일반 관례에 따릅니다.

제3조 (약관 효력 및 변경)
(1) 이 약관은 그 내용을 회사의 웹사이트에 게시하거나 기타의 방법으로 회원에게 공지함으로 효력이 발생합니다.
(2) 회사는 약관의규제에관한법률, 정보통신망이용촉진및정보보호등에관한법률(이하 정보통신망법) 등 관련법을 위배하지 않는 범위에서 사전 고지 없이 이 약관의 내용을 변경할 수 있으며, 변경된 약관은 제1항과 같은 방법으로 공지 또는 통지함으로 효력이 발생됩니다.
(3) 회원은 정기적으로 웹사이트에 방문하여 약관의 변경사항을 확인하여야 합니다. 변경된 약관에 대한 정보를 알지 못해 발생하는 회원의 피해는 회사에서 책임지지 않습니다. 단 회원에게 불리한 약관의 개정의 경우에는 공지 외에 일정기간 전자우편, 쪽지, 로그인시 동의양식 등의 전자적 수단을 통해 따로 명확히 통지하도록 합니다.
(4) 회원은 변경된 약관에 동의하지 않을 경우 회원탈퇴를 요청할 수 있습니다. 변경된 약관의 효력발생일 이후에도 서비스를 계속 이용할 경우 약관의 변경사항에 동의한 것으로 간주됩니다.

제4조 (약관 외 준칙)
회사는 필요한 경우 서비스 내의 개별항목에 대하여 개별약관 또는 운영원칙(이하 '서비스 별 안내'라 합니다.)를 정할 수 있으며, 회원은 각 서비스 별 안내에 대해 회원가입과 동시에 동의한 것으로 간주합니다. 본 약관과 서비스 별 안내의 내용이 상충되는 경우에는 서비스 별 안내의 내용을 우선하여 적용합니다.

본 약관에 명시되지 않은 사항에 대해서는 관련법령에 의하고, 법에 명시되지 않은 부분에 대하여는 관습에 의합니다.
부칙
본 약관은 2016년 8월 8일부터 적용됩니다.</textarea>
											<hr />
											</div>
										</div>
									</div>
									<div class="row">
										<div class="form-group">
											<div class="col-md-12">
												<label for="register:privacy_term">개인정보 수집 및 이용에 대한
													안내(필수)</label>
												<textarea class="form-control margin-bottom-10" rows="10" readonly="readonly">
SSC(이하 &quot;회사&quot;라 함) 는 제공되는 SSC서비스 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 개인정보보호법, 통신비밀보호법, 전기통신사업법, 등 정보통신서비스제공자가 준수하여야 할 관련 법령상의 개인정보보호 규정을 준수하며, 관련 법령에 의거한 개인정보취급방침을 정하여 이용자 권익 보호에 최선을 다하고 있습니다
1. 수집하는 개인정보의 항목 및 수집방법

2. 개인정보의 수집 및 이용 목적

3. 개인정보 공유 및 제공

4. 개인정보의 취급위탁

5. 개인정보의 보유 및 이용기간

6. 개인정보의 파기절차 및 방법

7. 이용자 및 법정대리인의 권리와 그 행사방법

8. 개인정보 자동 수집 장치의 설치/운영 및 거부에 관한 사항

1. 수집하는 개인정보의 항목 및 수집방법

가. 수집하는 개인정보의 항목

첫째, 회사는 회원가입, 원활한 고객상담, 각종 서비스의 제공을 위해 최초 회원가입 당시 아래와 같은 최소한의 개인정보를 필수항목으로 수집하고 있습니다.
일반회원 가입 : 사용자 ID, 이름, 이메일, 비밀번호, 관심카테고리, 사진
강사로 등록 : 계좌정보, 연락처, 직장, 학력, 저서, 세금 정산을 위한 고유식별번호
둘째, 서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이 자동으로 생성되어 수집될 수 있습니다.
IP Address, 쿠키, 방문 일시, 서비스 이용 기록, 불량 이용 기록
셋째, 회사 아이디를 이용한 부가 서비스 및 맞춤식 서비스 이용 또는 이벤트 응모 과정에서 해당 서비스의 이용자에 한해서만 아래와 같은 정보들이 수집될 수 있습니다.
개인정보 추가 수집에 대해 동의를 받는 경우
넷째, 유료 서비스 이용 과정에서 아래와 같은 결제 정보들이 수집될 수 있습니다.
신용카드 결제시 : 카드사명, 카드번호 등
휴대전화 결제시 : 이동전화번호, 통신사, 결제승인번호 등
계좌이체시 : 은행명, 계좌번호 등
상품권 이용시 : 상품권 번호
나. 개인정보 수집방법

회사는 다음과 같은 방법으로 개인정보를 수집합니다.
홈페이지, 서면양식, 팩스, 전화, 상담 게시판, 이메일, 이벤트 응모, 배송요청
협력회사로부터의 제공
생성정보 수집 툴을 통한 수집
2. 개인정보의 수집 및 이용목적

가. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산

컨텐츠 제공, 특정 맞춤 서비스 제공, 물품배송 또는 청구서 등 발송, 본인인증, 구매 및 요금 결제, 요금추심
나. 회원관리

회원제 서비스 제공, 개인식별, 불량회원의 부정 이용방지와 비인가 사용방지, 가입의사 확인, 가입 및 가입횟수 제한, 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 추후 법정 대리인 본인확인, 분쟁 조정을 위한 기록보존, 불만처리 등 민원처리, 고지사항 전달, 회원탈퇴 의사의 확인
다. 신규 서비스 개발 및 마케팅•광고에의 활용

신규 서비스 개발 및 맞춤 서비스 제공, 통계학적 특성에 따른 서비스 제공 및 광고 게재, 서비스의 유효성 확인, 이벤트 및 광고성 정보 제공 및 참여기회 제공, 접속빈도 파악, 회원의 서비스이용에 대한 통계
3. 개인정보의 공유 및 제공

회사는 이용자들의 개인정보를 &quot;2. 개인정보의 수집목적 및 이용목적&quot;에서 고지한 범위 내에서 사용하며, 이용자의 사전 동의 없이는 동 범위를 초과하여 이용하거나 원칙적으로 이용자의 개인정보를 외부에 공개하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.
가. 이용자가 사전에 동의 한 경우


현 개인정보취급방침 내용 추가, 삭제 및 수정이 있을 시에는 개정 최소 7일전부터 홈페이지의 '공지사항'을 통해 고지할 것입니다. 다만, 개인정보의 수집 및 활용, 제3자 제공 등과 같이 이용자 권리의 중요한 변경이 있을 경우에는 최소 30일 전에 고지합니다.
공고일자 : 2016년 8월 8일
시행일자 : 2016년 8월 8일
												</textarea>
												<label class="checkbox weight-300 checkbox-custom">
												<input type="checkbox" name="req"><i></i>위 이용안내에 동의합니다.</label><br>
												
												 <input type="button" value="동의" onclick="chk()"/>
  												 <input type="button" value="동의하지 않습니다" onclick="nochk()"/>
											</div>
										</div>
									</div>
								</fieldset>
							</form>
						</div>
					</div>
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
