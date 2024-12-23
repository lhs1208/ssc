<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
					<a href="${pageContext.request.contextPath}/mypage1.do?log=${logUid}" class="list-group-item"><strong>예약내역</strong></a>
					<a href="${pageContext.request.contextPath}/mypage2.do" class="list-group-item"><strong>정보수정</strong></a> 
				</div>
			</div>
			<!--탭 bar 끝-->

			<div id="joinbox" class="col-sm-10">
				<form class="form-horizontal" role="form" name="myform" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/edit_ok.do">
					<fieldset>
						<legend>회원정보 수정</legend>

						<!-- 아이디 입력양식 -->
						<div class="form-group">
							<label id="label" for="user_id" class="col-md-2 control-label">아이디</label>
							<div class="col-md-4">
								<p class="form-control-static">${loginInfo.uId}</p>
							</div>
						</div>
						<!-- //아이디 입력양식 -->

						<!-- 비밀번호 입력양식 -->
						<div class="form-group">
							<label id="label" for="u_pw" class="col-md-2 control-label">현재 비밀번호</label>
							<div class="col-md-6">
								<input type="password" class="form-control" name="u_pw" id="u_pw" placeholder="비밀번호를 입력하세요.">
							</div>
						</div>
						<!-- //비밀번호 입력양식 -->

						<!-- 변경비밀번호 입력양식 -->
						<div class="form-group">
							<label id="label" for="pw_re" class="col-md-2 control-label">변경 비밀번호</label>
							<div class="col-md-6">
								<input type="password" class="form-control" name="new_u_pw" id="new_u_pw" placeholder="비밀번호 변경을 원하신다면 입력해주세요.">
							</div>
						</div>
						<!-- 변경비밀번호 입력양식 -->

						<!-- 변경비밀번호확인 입력양식 -->
						<div class="form-group">
							<label id="label" for="new_u_pw_re" class="col-md-2 control-label">변경 비밀번호 확인</label>
							<div class="col-md-6">
								<input type="password" class="form-control" name="new_u_pw_re" id="new_u_pw_re">
							</div>
						</div>
						<!-- 변경비밀번호확인 입력양식 -->

						<!-- 이름 입력양식 -->
						<div class="form-group">
							<label id="label" for="name" class="col-md-2 control-label">이름</label>
							<div class="col-md-2">
								<input type="text" class="form-control" name="name" id="name" value="${loginInfo.name}">
							</div>
						</div>
						<!-- //이름 입력양식 -->

						<!-- 생년월일 입력양식 -->
						<div class="form-group">
							<label id="label" for="birthdate" class="col-md-2 control-label">생년월일</label>
							<div class="col-md-4">
								<p class="form-control-static">${loginInfo.birthdate}</p>
							</div>
						</div>
						<!-- //생년월일 입력양식 -->

						<!-- 이메일 입력양식 -->
						<div class="form-group">
							<label id="label" for="email" class="col-md-2 control-label">이메일</label>
							<div class="col-md-4">
								<input type="email" class="form-control" name="email" id="email" value="${loginInfo.email}">
							</div>
						</div>
						<!-- //이메일 입력양식 -->

						<!-- 연락처 입력양식 -->
						<div class="form-group">
							<label id="label" for="tel" class="col-md-2 control-label">연락처</label>
							<div class="col-md-4">
								<input type="tel" class="form-control" name="tel" id="tel" value="${loginInfo.tel}">
							</div>
						</div>
						<!-- //연락처 입력양식 -->

						<!-- 주소 입력양식 -->
						<div class="form-group">
							<label id="label" for="" class="col-md-2 control-label">우편번호</label>
							<div class="col-md-8 clearfix">
								<input type="text" name="postcode" id="postcode" class="form-control pull-left" style="width: 120px; margin-right: 5px" value="${loginInfo.postcode}">
								<!-- 클릭 시 , javascript 함수 호출 : openDaumPostcode() -->
								<input type="button" value="우편번호 찾기" class="btn btn-warning" onclick='execDaumPostcode("postcode", "addr1", "addr2")'>
							</div>
						</div>
						<div class="form-group">
							<label id="label" for="addr1" class="col-md-2 control-label">주소</label>
							<div class="col-md-8">
								<input type="text" class="form-control" name="addr1" id="addr1" value="${loginInfo.addr1}">
							</div>
						</div>
						<div class="form-group">
							<label id="label" for="addr2" class="col-md-2 control-label"></label>
							<div class="col-md-8">
								<input type="text" class="form-control" name="addr2" id="addr2" value="${loginInfo.addr2}">
							</div>
						</div>


						<!-- 면허 입력양식 -->
						<div class="form-group">
							<label id="label" for="lic_num" class="col-md-2 control-label">운전면허번호*</label>
							<div class="col-md-5">
								<input type="text" class="form-control" name="lic_num" id="lic_num" value="${loginInfo.licNum}">
							</div>
							<div class="col-md-1">
								<button class="btn btn-primary">중복여부 확인</button>
							</div>
						</div>

						<!-- 성별 -->
						<div class="form-group">
							<label id="label" for="gender1" class="col-md-2 control-label"> 성별* </label>
							<div class="col-md-10">

								<label class="radio-inline"> <input type="radio" name="gender" id="gender1" value="M" <c:if test="${loginInfo.gender == 'M'}">checked</c:if> />남자
								</label> <label class="radio-inline"> <input type="radio" name="gender" id="gender2" value="F" <c:if test="${loginInfo.gender == 'F'}">checked</c:if> />여자
								</label>
							</div>
						</div>


						<!-- 체크박스 입력양식 -->
						<div class="form-group">
							<label id="label" for="email_yn" class="col-md-2 control-label"> 이메일 알림 받음 </label>
							<div class="col-md-10">
								<div class="checkbox">
									<label> <input name="email_yn" id="email_yn" type="checkbox" value="Y" <c:if test="${loginInfo.emailYn == 'Y'}">checked</c:if>> SSC의 새로운 소식을 이메일로 수신하시겠습니까?
									</label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label id="label" for="radio1" class="col-md-2 control-label"> 주 사용 지역 </label>
							<div class="col-md-10">
								<label class="radio-inline"> <input type="radio" name="use_area" id="radio1" value="option1">서울
								</label> <label class="radio-inline"> <input type="radio" name="use_area" id="radio2" value="option2">인천/경기
								</label> <label class="radio-inline"> <input type="radio" name="use_area" id="radio3" value="option3">대구/경북
								</label> <label class="radio-inline"> <input type="radio" name="use_area" id="radio4" value="option4">부산/경남
								</label> <label class="radio-inline"> <input type="radio" name="use_area" id="radio5" value="option5">대전/충남
								</label> <label class="radio-inline"> <input type="radio" name="use_area" id="radio6" value="option6">광주/전라
								</label> <label class="radio-inline"> <input type="radio" name="use_area" id="radio7" value="option7">제주
								</label>
							</div>
						</div>
						<!-- //체크박스 입력양식 -->

						<div class="form-group">
							<label for="profile_img" class="col-md-2 control-label">프로필 사진</label>
							<div class="col-md-10">
								<input type="file" name="profile_img" id="profile_img" class="form-control">
							</div>
						</div>

						<c:if test="${cookie.profileThumbnail != null}">
							<div class="form-group">
								<!-- 등록된 프로필 이미지 표시하기 -->
								<div class="col-md-8 col-md-offset-2">
									<p>
										<img src="${pageContext.request.contextPath}/download.do?file=${cookie.profileThumbnail.value}" class="img-circle" /> <label class="checkbox-inline"> <input type="checkbox" name="img_del" id="img_del" value="Y" /> 이미지 삭제
										</label>
									</p>
									<script type="text/javascript">
										$(function() {
											// 이미지가 등록된 상태이므로, 파일의 신규 등록을 방지
											$("#profile_img").prop("disabled", true);
											$("#img_del").change(
												function() {$("#profile_img").prop("disabled",!$(this).is(":checked"));
											});
										});
									</script>
								</div>
							</div>
						</c:if>

						<div class="form-group">
							<div class="col-md-offset-5 col-md-10">
								<button type="submit" class="btn btn-primary">수정하기</button>
								<a href="${pageContext.request.contextPath }/user/out_ok.do" class="btn btn-danger">탈퇴하기</a>
							</div>
						</div>


					</fieldset>
				</form>
			</div>

		</div>
		<!-- contain 끝-->
	</div>
	<!--main 끝-->
	<hr>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>

