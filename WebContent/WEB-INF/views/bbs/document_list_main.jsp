<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

	<!-- 내용영역 -->
	<div class="main" id="c">
		<div class="container" id="b">

			<div class="col-sm-10">
				<div class="row"  id="c">
					<div class="page-header">
					    <h1 class="page-header">${bbsName} - <small>글 목록</small></h1>
				    </div>
				</div>

				<div class="row">
					<table class="table table-striped">
						<thead>
							<tr>
								<th class="text-center" style="width: 100px">번호</th>
								<th class="text-center">제목</th>
								<th class="text-center" style="width: 120px">작성자</th>
								<th class="text-center" style="width: 100px">조회수</th>
								<th class="text-center" style="width: 120px">작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${fn:length(documentList) >0}">
									<c:forEach var="document" items="${documentList}">
										<tr>
											<td class="text-center">${document.id}</td>
											<td><c:url var="readUrl" value="/bbs/document_read.do">
													<c:param name="category" value="${document.category}" />
													<c:param name="document_id" value="${document.id}" />
												</c:url> <a href="${readUrl}">${document.subject}</a></td>
											<td class="text-center">${document.writerName}</td>
											<td class="text-center">${document.hit}</td>
											<td class="text-center">${document.regDate}</td>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="5" class="text-center"
											style="line-height: 100px;">조회된 글이 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
				<!-- table row 끝-->
				<!-- 바텀 리스트 -->
				<%@ include file="/WEB-INF/views/inc/bbs_list_bottom.jsp" %>
			</div>
			<!--게시판 bar 끝-->
		</div>
		<!-- contain 끝-->
	</div>

