package com.ssc.controller.admin.bbs;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.ssc.controller.bbs.BBSCommon;
import com.ssc.dao.MyBatisConnectionFactory;
import com.ssc.helper.BaseController;
import com.ssc.helper.UploadHelper;
import com.ssc.helper.WebHelper;
import com.ssc.model.Comment;
import com.ssc.model.Document;
import com.ssc.model.File;
import com.ssc.service.CommentService;
import com.ssc.service.DocumentService;
import com.ssc.service.FileService;
import com.ssc.service.impl.CommentServiceImpl;
import com.ssc.service.impl.DocumentServiceImpl;
import com.ssc.service.impl.FileServiceImpl;

@WebServlet("/admin/document_admin_delete_ok.do")
public class DocumentAdminDeleteOk extends BaseController {
	private static final long serialVersionUID = 7544457095250275083L;
	
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BBSCommon bbs;
	UploadHelper upload;
	DocumentService documentService;
	CommentService commentService;
	FileService fileService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		bbs = BBSCommon.getInstance();
		upload = UploadHelper.getInstance();
		documentService = new DocumentServiceImpl(sqlSession, logger);
		commentService = new CommentServiceImpl(sqlSession, logger);
		fileService = new FileServiceImpl(sqlSession, logger);
		
		/** (3) 게시판 카테고리 값을 받아서 View에 전달 */
		String category = web.getString("category");
		request.setAttribute("category", category);
		
		/** (4) 존재하는 게시판인지 판별하기 */
		try {
			String bbsName = bbs.getBbsName(category);
			request.setAttribute("bbsName", bbsName);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		
		/** (5) 게시글 번호와 비밀번호 받기 */
		int documentId = web.getInt("document_id");
		
		logger.debug("documentId=" + documentId);
		
		if (documentId == 0) {
			sqlSession.close();
			web.redirect(null, "글 번호가 없습니다.");
			return null;
		}
		
		/** (6) 파라미터를 Beans로 묶기 */	
		Document document = new Document();
		document.setId(documentId);
		document.setCategory(category);
		
		File file = new File();
		file.setDocumentId(documentId);
		
		// 게시물에 속한 덧글 삭제를 위해서 생성
		Comment comment = new Comment();
		comment.setDocumentId(documentId);
		
		/** (7) 데이터 삭제 처리 */
		
		List<File> fileList = null;	// 게시물에 속한 파일 목록에 대한 조회결과
			
		try {
			// Beans에 추가된 자신의 회원번호를 사용하여 자신의 글임을 판별한다.
			
			fileList = fileService.selectFileList(file);	// 게시글에 포함된 파일목록을 조회
			fileService.deleteFileAll(file);				// 게시물에 속한 파일목록 모두 삭제
			
			// 덧글이 게시물을 참조하므로, 덧글이 먼저 삭제되어야 한다.
			commentService.deleteCommentAll(comment);
			
			documentService.deleteDocument(document);	// 게시글 삭제
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		/** (8) 실제 파일을 삭제한다. */
		// DB에서 파일 정보가 삭제되더라도 실제 저장되어 있는 파일 자체가 삭제되는 것은 아니다.
		// 실제 파일도 함께 삭제하기 위해서 (7)번 절차에서 파일정보를 삭제하기 전에 미리
		// 조회해 둔 것이다.
		// 조회한 파일 목록만큼 반복하면서 저장되어 있는 파일을 삭제한다.
		if (fileList != null) {
			for (int i=0; i<fileList.size(); i++) {
				File f = fileList.get(i);
				String filePath = f.getFileDir() + "/" + f.getFileName();
				logger.debug("fileRemove: " + filePath);
				upload.removeFile(filePath);
			}
		}
		
		/** (9) 페이지 이동 */
		String url = "%s/bbs/document_list.do?category=%s";
		url = String.format(url, web.getRootPath(), category);
		
		web.redirect(url, "삭제되었습니다.");
		return null;
	}

}