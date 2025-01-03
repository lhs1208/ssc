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
<h1 class="page-header">${bbsName} - <small>수정하기</small></h1>
	
	<form class="form-horizontal" method="post" enctype="multipart/form-data"
		action="${pageContext.request.contextPath}/bbs/document_edit_ok.do">
	<!-- 게시판 카테고리에 대한 상태유지 -->
	<input type="hidden" name ="category" value="${category}" />
	<!-- 수정 대상에 대한 상태유지 -->
	<input type="hidden" name="document_id" value="${readDocument.id}" />
	
	
	<!-- 작성자, 비밀번호, 이메일은 자신의 글을 수정하는 경우만 생략한다. -->
	<c:if test="${loginInfo == null || loginInfo.id != readDocument.userId}">
		<!-- 작성자 -->
		<div class="form-group">
			<label for="writer_name" class="col-sm-2 control-label">작성자</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="writer_name" 
					name="writer_name" value="${readDocument.writerName}">
			</div>
		</div>
		<!-- 비밀번호 -->		
		<div class="form-group">
			<label for="wrtier_pw" class="col-sm-2 contril-label">비밀번호</label>
			<div class="col-sm-10">
				<input type="password" class="form-control" id="writer_pw" name="writer_pw"
					placeholder="글 작성시 설정하신 비밀번호를 입력하세요." />
			</div>
		</div>
		<!-- 이메일 -->
		<div class="form-group">
			<label for="email" class="col-sm-2 control-label">이메일</label>
			<div class="col-sm-10">
				<input type="email" class="form-control" id="email" name="email"
					value="${readDocument.email}" />
			</div>
		</div>		
	</c:if>
	<!-- 제목 -->
	<div class="form-group">
		<label for="subject" class="col-sm-2 control-label">제목</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="subject" name="subject" 
				value="${readDocument.subject}"/>
		</div>
	</div>
	<!-- 내용 -->
	<div class="form-group">
		<label for="content" class="col-sm-2 control-label">내용</label>
		<div class="col-sm-10">
			<textarea id="content" name="content" class="ckeditor">
				${readDocument.content}</textarea>
		</div>
	</div>
	<!-- 파일업로드 -->
	<div class="form-group">
		<label for="file" class="col-sm-2 control-label">파일첨부</label>
		<div class="col-sm-10">
			<input type="file" class="form-control" id="file" name="file" multiple />
			
			<!-- 첨부파일 리스트가 존재할 경우만 삭제할 항목 선택 가능 -->
			<c:if test="${fileList != null}">
				<c:forEach var="file" items="${fileList}">
					<!-- 이미지를 다운받기 위한 URL 구성 -->
					<c:url value="/download.do" var="downloadUrl">
						<c:param name="file" value="${file.fileDir}/${file.fileName}" />
					</c:url>
					
					<div class="checkbox">
						<label>
							<input type="checkbox" name="del_file" id="img_del" value="${file.id}" />
							${file.originName}삭제하기
							<a href="${downloadUrl}">[다운받기]</a>
						</label>
					</div>				
				</c:forEach>
			</c:if>
		</div>
	</div>
	<!-- 버튼들 -->
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<button type="submit" class="btn btn-primary">저장하기</button>
			<button type="button" class="btn btn-danger" onclick="history.back();">
			작성취소</button>
		</div>
	</div>
	</form>
		</div>
		<!-- contain 끝-->
	</div>
	<!--main 끝-->
	<hr>
	<%@ include file="/WEB-INF/views/inc/footer.jsp"%>
</body>
</html>

