<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/inc/head.jsp"%>

<script type="text/javascript">
$(function () {
	$("#id_check").click(function(e){
		e.preventDefault();
		
		$.ajax({
			type: "POST",
			url: "${pageContext.request.contextPath}/id_check.do",
			data: {
				u_id :$('#u_id').val()
			},
			dataType: 'html',
			success: function(data){
				if($.trim(data)=="NULL"){
					$('#id_check_result').html("<p>아이디를 입력하세요.</p>")
				}else if($.trim(data)=="YES"){
					$('#id_check_result').html("<p>사용 가능한 아이디입니다.</p>")
				}else{
					$('#id_check_result').html("<p>중복된 아이디입니다.</p>")
				}
			}
		});
	});
});

</script>

</head>

<body>
	<%@ include file="/WEB-INF/views/inc/topbar.jsp"%>

	<!-- 내용영역 -->
	<div class="main" id="c">
		<div class="container" id="b">
			<div class="col-sm-2" id="sidebar" role="navigation">
				<div class="list-group">
					<a href="${pageContext.request.contextPath}/join.do" class="list-group-item"><strong>회원가입</strong></a> <a href="${pageContext.request.contextPath}/join3.do" class="list-group-item"><strong>ID/PW 찾기</strong></a>
				</div>
			</div>
			<!--탭 bar 끝-->

			<div id="joinbox" class="col-sm-10">
				<form class="form-horizontal" role="form" name="myform" method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/join_ok.do">
					<fieldset>
						<legend>회원가입</legend>

						<!-- 아이디 입력양식 -->
						<div class="form-group">
							<label id="label" for="u_id" class="col-md-2 control-label">아이디*</label>
							<div class="col-md-6">
								<input type="text" class="form-control" name="u_id" id="u_id" placeholder="숫자, 영문의 조합으로 5~12자 가능합니다.">
							</div>
							<div class="col-md-4">
								<input type="button" id="id_check" value="아이디 중복 확인" class="btn btn-primary">
								
								<div id="id_check_result">
								</div>
							</div>
								
						</div>
						<!-- //아이디 입력양식 -->

						<!-- 비밀번호 입력양식 -->
						<div class="form-group">
							<label id="label" for="u_pw" class="col-md-2 control-label">비밀번호*</label>
							<div class="col-md-6">
								<input type="password" class="form-control" name="u_pw" id="u_pw" placeholder="특수문자,숫자,영문 조합으로 8~20자 가능합니다.">
							</div>
						</div>
						<!-- //비밀번호 입력양식 -->

						<!-- 비밀번호확인 입력양식 -->
						<div class="form-group">
							<label id="label" for="u_pw_re" class="col-md-2 control-label">비밀번호확인*</label>
							<div class="col-md-6">
								<input type="password" class="form-control" name="u_pw_re" id="u_pw_re" placeholder="동일한 비밀번호를 입력하세요.">
							</div>
						</div>
						<!-- //비밀번호확인 입력양식 -->

						<!-- 이름 입력양식 -->
						<div class="form-group">
							<label id="label" for="user_name" class="col-md-2 control-label">이름*</label>
							<div class="col-md-2">
								<input type="text" class="form-control" name="user_name" id="user_name">
							</div>
						</div>
						<!-- //이름 입력양식 -->

						<!-- 생년월일 입력양식 -->
						<div class="form-group">
							<label id="label" for="birthdate" class="col-md-2 control-label">생년월일*</label>
							<div class="col-md-2">
								<select class="form-control" name="birthdate1" id="birthdate1">
									<option>연도</option>
									<option>2016</option>
									<option>2015</option>
									<option>2014</option>
									<option>2013</option>
									<option>2012</option>
									<option>2011</option>
									<option>2010</option>
									<option>2009</option>
									<option>2008</option>
									<option>2007</option>
									<option>2006</option>
									<option>2005</option>
									<option>2004</option>
									<option>2003</option>
									<option>2002</option>
									<option>2001</option>
									<option>2000</option>
									<option>1999</option>
									<option>1998</option>
									<option>1997</option>
									<option>1996</option>
									<option>1995</option>
									<option>1994</option>
									<option>1993</option>
									<option>1992</option>
									<option>1991</option>
									<option>1990</option>
									<option>1989</option>
									<option>1988</option>
									<option>1987</option>
									<option>1986</option>
									<option>1985</option>
									<option>1984</option>
									<option>1983</option>
									<option>1982</option>
									<option>1981</option>
									<option>1980</option>
									<option>1979</option>
									<option>1978</option>
									<option>1977</option>
									<option>1976</option>
									<option>1975</option>
									<option>1974</option>
									<option>1973</option>
									<option>1972</option>
									<option>1971</option>
									<option>1970</option>
									<option>1969</option>
									<option>1968</option>
									<option>1967</option>
									<option>1966</option>
									<option>1965</option>
									<option>1964</option>
									<option>1963</option>
									<option>1962</option>
									<option>1961</option>
									<option>1960</option>
									<option>1959</option>
									<option>1958</option>
									<option>1957</option>
									<option>1956</option>
									<option>1955</option>
									<option>1954</option>
									<option>1953</option>
									<option>1952</option>
									<option>1951</option>
									<option>1950</option>
									<option>1949</option>
									<option>1948</option>
									<option>1947</option>
									<option>1946</option>
									<option>1945</option>
									<option>1943</option>
									<option>1942</option>
									<option>1941</option>
									<option>1940</option>
									<option>1939</option>
									<option>1938</option>
									<option>1937</option>
									<option>1936</option>
									<option>1935</option>
									<option>1934</option>
									<option>1933</option>
									<option>1932</option>
									<option>1931</option>
									<option>1930</option>
								</select>
							</div>
							<div class="col-md-2">
								<select class="form-control" name="birthdate2" id="birthdate2">
									<option>월</option>
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
									<option>6</option>
									<option>7</option>
									<option>8</option>
									<option>9</option>
									<option>10</option>
									<option>11</option>
									<option>12</option>
								</select>
							</div>
							<div class="col-md-2">
								<select class="form-control" name="birthdate3" id="birthdate3">
									<option>일</option>
									<option>1</option>
									<option>2</option>
									<option>3</option>
									<option>4</option>
									<option>5</option>
									<option>6</option>
									<option>7</option>
									<option>8</option>
									<option>9</option>
									<option>10</option>
									<option>11</option>
									<option>12</option>
									<option>13</option>
									<option>14</option>
									<option>15</option>
									<option>16</option>
									<option>17</option>
									<option>18</option>
									<option>19</option>
									<option>20</option>
									<option>21</option>
									<option>22</option>
									<option>23</option>
									<option>24</option>
									<option>25</option>
									<option>26</option>
									<option>27</option>
									<option>28</option>
									<option>29</option>
									<option>30</option>
									<option>31</option>
								</select>
							</div>
						</div>
						<!-- //생년월일 입력양식 -->

						<!-- 이메일 입력양식 -->
						<div class="form-group">
							<label id="label" for="email" class="col-md-2 control-label">이메일*</label>
							<div class="col-md-4">
								<input type="email" class="form-control" name="email" id="email">
							</div>
						</div>
						<!-- //이메일 입력양식 -->

						<!-- 연락처 입력양식 -->
						<div class="form-group">
							<label id="label" for="tel" class="col-md-2 control-label">연락처*</label>
							<div class="col-md-4">
								<input type="tel" class="form-control" name="tel" id="tel" placeholder="-없이 입력하세요.">
							</div>
						</div>
						<!-- //연락처 입력양식 -->

						<!-- 주소 입력양식 -->
						<div class="form-group">
							<label id="label" for="postcode" class="col-md-2 control-label">우편번호*</label>
							<div class="col-md-8 clearfix">
								<input type="text" name="postcode" id="postcode" class="form-control pull-left" style="width: 120px; margin-right: 5px">
								<!-- 클릭 시 , javascript 함수 호출 : openDaumPostcode() -->
								<input type="button" value="우편번호 찾기" class="btn btn-warning" onclick='execDaumPostcode("postcode", "addr1", "addr2")'>
							</div>
						</div>
						<div class="form-group">
							<label id="label" for="addr1" class="col-md-2 control-label">주소*</label>
							<div class="col-md-8">
								<input type="text" class="form-control" name="addr1" id="addr1">
							</div>
						</div>
						<div class="form-group">
							<label id="label" for="addr2" class="col-md-2 control-label"></label>
							<div class="col-md-8">
								<input type="text" class="form-control" name="addr2" id="addr2">
							</div>
						</div>
						

						<!-- 면허 입력양식 -->
						<div class="form-group">
							<label id="label" for="lic_num" class="col-md-2 control-label">운전면허번호</label>
							<div class="col-md-5">
								<input type="text" class="form-control" name="lic_num" id="lic_num">
							</div>
						</div>

						<!-- 성별 -->
						<div class="form-group">
							<label id="label" for="gender1" class="col-md-2 control-label"> 성별* </label>
							<div class="col-md-10">

								<label class="radio-inline">
									<input type="radio" name="gender" id="gender1" value="M">남자
								</label> 
								<label class="radio-inline">
									<input type="radio" name="gender" id="gender2" value="F">여자 
								</label>	
							</div>
						</div>


						<!-- 체크박스 입력양식 -->
						<div class="form-group">
							<label id="label" for="email_yn" class="col-md-2 control-label"> 이메일 알림 받음 </label>
							<div class="col-md-10">
								<div class="checkbox">
									<label> <input name="email_yn" id="email_yn" type="checkbox" value="Y"> SSC의 새로운 소식을 이메일로 수신하시겠습니까?
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
						
						<!-- 버튼 -->
						<div class="form-group">
							<div class="col-md-4 col-md-offset-4">
								<input type="button" value="이전단계" class="btn btn-danger" onclick="location.href='${pageContext.request.contextPath}/join.do'">
								<input type="submit" value="가입하기" class="btn btn-primary">
							</div>
						</div>


					</fieldset>
				</form>
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
