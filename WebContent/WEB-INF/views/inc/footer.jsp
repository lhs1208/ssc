<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 공통 하단 영역 -->
<!-- 푸터 -->


<footer class="footer" style="background-color: #fff; padding-bottom: 0px;" >
	<div class="container">

		<div>
			&copy; 2016 <a class="link color-3" href="#">Privacy Policy</a>
		</div>
		<div>
		<p>
		 	이 세상 모든 사람들이 SSC를 사용하는 그날까지 SSC카는 계속 달려갑니다!!! 
		 	
			이모든 저작권은 주식회사 <strong>SoftShareCarCorp</strong>에 있습니다.
		</p>
		</div>
		

	</div>
	<img src="${pageContext.request.contextPath}/img/foot.png" style="width: 100%">
</footer>
<!--// 푸터 -->

<div class="floating">
	<div>
		<a href="http://www.kweather.co.kr/main/main.html" target="_blank"><img src="${pageContext.request.contextPath}/img/날씨.png" title="날씨" ></a>
	</div>
	<div>
		<a href="${pageContext.request.contextPath}/join.do"> <img src="${pageContext.request.contextPath}/img/a.png" title="회원가입"></a>
	</div>
	<div>
		<a href="${pageContext.request.contextPath}/bbs/document_list.do?category=gallery"> <img src="${pageContext.request.contextPath}/img/추천.png" title="추천지"></a>
	</div>
	<div>
		<a href="${pageContext.request.contextPath}/book.do"> <img src="${pageContext.request.contextPath}/img/예약.png" title="온라인 예약"></a>
	</div>
</div>
<!-- //공통 하단 영역 -->


