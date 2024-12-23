package com.ssc.controller;

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
import com.ssc.service.DocumentService;
import com.ssc.service.impl.DocumentServiceImpl;


@WebServlet("/index.do")
public class Index extends BaseController {
	private static final long serialVersionUID = -5706801293429815939L;
	/**(1)사용하고자 하는 Helper 객체 선언*/
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	DocumentService documentService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/**(2) 사용하고자 하는 Helper+Service 객체 생성*/
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		documentService = new DocumentServiceImpl(sqlSession, logger);
		
		/**(3) 각 게시판 종류별로 최근 게시물을 조회한다. */
		List<Document> noticeList = null;
		List<Document> reviewList = null;
		
		try{
			noticeList = this.getDocumentList("notice", 5);
			reviewList = this.getDocumentList("review", 5);
		}catch(Exception e){
			web.redirect(null, e.getLocalizedMessage());
		}finally{
			sqlSession.close();
		}
		
		/**(4) 최신 글 목록을 View에 전달 */
		request.setAttribute("noticeList", noticeList);
		request.setAttribute("reviewList", reviewList);
		
		return "view/index";
	}
	
	/**
	 *	특정 카테고리에 대한 상위 n개의 게시물 가져오기
	 *	@param category - 가져올 카테고리
	 *	@param listCount - 가져올 게시물 수
	 * 	@return 
	 * 	@throws Exception
	 */
	private List<Document> getDocumentList(String category, int listCount) throws Exception{
		List<Document> list = null;
		
		//조회할 조건 생성하기
		//-->저장된 카테고리의 0번째부터 listCount개 만큼 조회
		Document document = new Document();
		document.setCategory(category);
		document.setLimitStart(0);
		document.setListCount(listCount);
		 
		list = documentService.selectDocumentList(document);

		return list;
	}
}