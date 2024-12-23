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
					<a href="${pageContext.request.contextPath}/bbs/document_list.do?category=notice" class="list-group-item"><strong>공지사항</strong></a>
					<a href="${pageContext.request.contextPath}/center.do" class="list-group-item"><strong>자주묻는 질문</strong></a> 
					<a href="${pageContext.request.contextPath}/bbs/document_list.do?category=qna" class="list-group-item"><strong>1:1문의</strong></a>
				</div>
			</div>
			<!--탭 bar 끝-->

			<div class="col-sm-10">

				<div class="row"  id="c">
						<div class="media">
							<img src="${pageContext.request.contextPath}/img/index1.png" style="width: 100%">
						</div>
					</div>


				<div class="row">
					<%@ include file="/WEB-INF/views/bbs/document_list_main.jsp"%>
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
