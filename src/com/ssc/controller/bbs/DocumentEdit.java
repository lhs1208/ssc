package com.ssc.controller.bbs;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.ssc.dao.MyBatisConnectionFactory;
import com.ssc.helper.BaseController;
import com.ssc.helper.WebHelper;
import com.ssc.model.Document;
import com.ssc.model.File;
import com.ssc.service.DocumentService;
import com.ssc.service.FileService;
import com.ssc.service.impl.DocumentServiceImpl;
import com.ssc.service.impl.FileServiceImpl;


@WebServlet("/bbs/document_edit.do")
public class DocumentEdit extends BaseController {
	private static final long serialVersionUID = 7978721213656084487L;
	
	/**(1)사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BBSCommon bbs;
	DocumentService documentService;
	FileService fileService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/**(2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		bbs = BBSCommon.getInstance();
		documentService = new DocumentServiceImpl(sqlSession, logger);
		fileService = new FileServiceImpl(sqlSession, logger);
		
		/**(3) 게시판 카테고리 값을 받아서 View에 전달 */
		String category = web.getString("category");
		request.setAttribute("category", category);
		
		/**(4) 존재하는 게시판인지 판별하기 */
		try{
			String bbsName = bbs.getBbsName(category);
			request.setAttribute("bbsName", bbsName);
		}catch(Exception e){
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}	
		
		/**(5)글 번호 파라미터 받기 */
		int documentId = web.getInt("document_id");
		logger.debug("documentId=" + documentId);
		
		if(documentId == 0){
			web.redirect(null, "글 번호가 지정되지 않았습니다.");
			sqlSession.close();
			return null;
		}
		
		//파라미터를 Beans로 묶기
		Document document = new Document();
		document.setId(documentId);
		document.setCategory(category);
		
		File file = new File();
		file.setDocumentId(documentId);
		logger.debug("documentId=" + documentId);
		
		/**(6)게시물 일련번호를 사용한 데이터 조회 */
		//지금 읽고 있는 게시물이 저장될 객체
		Document readDocument = null;
		//첨부파일 정보가 저장될 객체
		List<File> fileList = null;
		
		try{
			readDocument = documentService.selectDocument(document);
			fileList = fileService.selectFileList(file);
		}catch(Exception e){
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}finally{
			sqlSession.close();
		}
		
		/**(7)읽은 데이터를 View에게 전달한다.*/
		request.setAttribute("readDocument", readDocument);
		request.setAttribute("fileList", fileList);

		return "bbs/document_edit";
	}
}