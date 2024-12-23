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
import com.ssc.helper.PageHelper;
import com.ssc.helper.UploadHelper;
import com.ssc.helper.WebHelper;
import com.ssc.model.Document;
import com.ssc.service.DocumentService;
import com.ssc.service.impl.DocumentServiceImpl;

@WebServlet("/bbs/document_list.do")
public class DocumentList extends BaseController {
	private static final long serialVersionUID = 5236569087946278729L;
	/**(1)사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BBSCommon bbs;
	DocumentService documentService;
	PageHelper pageHelper;
	UploadHelper upload;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		/**(2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		bbs = BBSCommon.getInstance();
		documentService = new DocumentServiceImpl(sqlSession, logger);
		pageHelper = PageHelper.getInstance();
		upload = UploadHelper.getInstance();
		
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
		
		/**(5) 조회할 정보에 대한 Beans 생성 */
		String keyword = web.getString("keyword");
		
		Document document = new Document();
		document.setCategory(category);
		
		//현재 페이지 수 --> 기본값은 1페이지로 설정함
		int page = web.getInt("page", 1);
		
		document.setSubject(keyword);
		document.setContent(keyword);
		
		/**(6) 게시글 목록 조회 */
		int totalCount = 0;
		List<Document> documentList = null;
		
		//게시판 종류가 갤러리인 경우 사진목록을 함께 조회함을 요청
		document.setGallery(category.equals("gallery"));
		document.setReview(category.equals("review"));
		
		try{
			//전체 게시물 수
			totalCount = documentService.selectDocumentCount(document);
			
			//나머지 페이지 번호 계산하기
			//-->현재 페이지, 전체 게시물 수, 한 페이지의 목록 수, 그룹갯수
			pageHelper.pageProcess(page, totalCount, 12, 5);
			
			//페이지 번호 계산 결과에서 Limit절에 필요한 값을 Beans에 추가
			document.setLimitStart(pageHelper.getLimitStart());
			document.setListCount(pageHelper.getListCount());
			
			documentList = documentService.selectDocumentList(document);
		}catch(Exception e){
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}finally{
			sqlSession.close();
		}
		//조회결과가 존재할 경우 --> 갤러리라면 이미지 경로를 썸네일로 교체
		if((document.isGallery() || document.isReview()) && documentList != null){
			for(int i = 0; i<documentList.size(); i++){
				Document item = documentList.get(i);
				String imagePath = item.getImagePath();
				System.out.println(imagePath);
				if(imagePath != null){
					String thumbPath = upload.createThumbnail(imagePath, 480, 320, true);
					//글 목록 걸렉션 내의 Beans 객체가 갖는 이미지 경로를 썸네일로 변경한다.
					item.setImagePath(thumbPath);
					logger.debug("thumbnail create>" + item.getImagePath());
				}
			}
		} 
		
		/**(7) 조회 결과를 View에 전달 */
		request.setAttribute("documentList", documentList);
		request.setAttribute("keyword", keyword);
		request.setAttribute("pageHelper", pageHelper);
		
		//갤러리 종류라면 view의 이름을 다르게 설정한다.
		String view = "bbs/document_list";
		if(document.isReview() || document.isGallery()){
			view="bbs/gallery_list";
		} 
		return view;
	}
}
