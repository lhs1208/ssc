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
			<c:choose>
				<c:when test="${category=='gallery' || category=='review'}">
					<div class="list-group">		
						<a href="${pageContext.request.contextPath}/bbs/document_list.do?category=gallery" class="list-group-item"><strong>추천지</strong></a>
						<a href="${pageContext.request.contextPath}/bbs/document_list.do?category=review" class="list-group-item"><strong>이용후기</strong></a>
					</div>	
				</c:when>
				<c:otherwise>
					<div class="list-group">		
						<a href="${pageContext.request.contextPath}/bbs/document_list.do?category=notice" class="list-group-item"><strong>공지사항</strong></a>
						<a href="${pageContext.request.contextPath}/center.do" class="list-group-item"><strong>자주묻는 질문</strong></a> 
						<a href="${pageContext.request.contextPath}/bbs/document_list.do?category=qna" class="list-group-item"><strong>1:1문의</strong></a>
					</div>
				</c:otherwise>
			</c:choose>
			</div>
			<!--탭 bar 끝-->

			<div class="col-sm-10">
				<div class="row" id="c">
					<h1 class="page-header">${bbsName}
						- <small>새 글 쓰기</small>
					</h1>

					<form class="form-horizontal" method="post"
						enctype="multipart/form-data"
						action="${pageContext.request.contextPath}/bbs/document_write_ok.do">
						<!-- 게시판 카테고리에 대한 상태유지 -->
						<input type="hidden" name="category" value="${category}" />
						<!-- 작성자, 비밀번호, 이메일은 로그인하지 않은 경우만 입력한다. -->
						<c:if test="${loginInfo == null}">
							<!-- 작성자 -->
							<div class="form-group">
								<label for="writer_name" class="col-sm-2 control-label">작성자</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="writer_name"
										name="writer_name">
								</div>
							</div>
							<!-- 비밀번호 -->
							<div class="form-group">
								<label for="wrtier_pw" class="col-sm-2 control-label">비밀번호</label>
								<div class="col-sm-10">
									<input type="password" class="form-control" id="writer_pw"
										name="writer_pw" />
								</div>
							</div>
							<!-- 이메일 -->
							<div class="form-group">
								<label for="email" class="col-sm-2 control-label">이메일</label>
								<div class="col-sm-10">
									<input type="email" class="form-control" id="email"
										name="email" />
								</div>
							</div>
						</c:if>
						<!-- 제목 -->
						<div class="form-group">
							<label for="subject" class="col-sm-2 control-label">제목</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="subject"
									name="subject" />
							</div>
						</div>
						<!-- 내용 -->
						<div class="form-group">
							<label for="content" class="col-sm-2 control-label">내용</label>
							<div class="col-sm-10">
								<textarea id="content" name="content" class="ckeditor" /></textarea>
							</div>
						</div>
						<!-- 파일업로드 -->
						<div class="form-group">
							<label for="file" class="col-sm-2 control-label">파일첨부</label>
							<div class="col-sm-10">
								<input type="file" class="form-control" id="file" name="file"
									multiple />
							</div>
						</div>
						<!-- 버튼들 -->
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="submit" class="btn btn-primary">저장하기</button>
								<button type="button" class="btn btn-danger"
									onclick="history.back();">작성취소</button>
							</div>
						</div>
					</form>
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
