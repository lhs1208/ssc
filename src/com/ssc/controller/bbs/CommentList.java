package com.ssc.controller.bbs;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ssc.dao.MyBatisConnectionFactory;
import com.ssc.helper.BaseController;
import com.ssc.helper.WebHelper;
import com.ssc.model.Comment;
import com.ssc.service.CommentService;
import com.ssc.service.impl.CommentServiceImpl;

@WebServlet("/bbs/comment_list.do")
public class CommentList extends BaseController {
	private static final long serialVersionUID = 3617548501229774177L;
	
	/**(1)사용하고자 하는 helper 객체 선언*/
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	CommentService commentService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/**(2)페이지 형식 지정 + 사용하고자 하는 Helper+Service 객체 생성*/
		//페이지 형식을 JSON으로 설정한다.
		response.setContentType("application/json");
		
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		commentService = new CommentServiceImpl(sqlSession, logger);
				
		/**(3)파라미터 받기 */
		int documentId = web.getInt("document_id");
		logger.debug("document_id=" + documentId);
		
		/**(4)입력 받은 파라미터에 대한 유효성 검사 */
		//덧글이 소속될 게시물의 일련번호
		if(documentId == 0){
			sqlSession.close();
			web.printJsonRt("게시물 일련번호가 없습니다.");
			return null;
		}
		
		/**(5)입력 받은 파라미터를 Beans로 묶기 */
		Comment comment = new Comment();
		comment.setDocumentId(documentId);
		
		/**(6)Service를 통한 덧글 목록 조회 */
		//작성 결과를 저장할 객체
		List<Comment> item = null;
		try{
			item=commentService.selectCommentList(comment);
		}catch(Exception e){
			web.printJsonRt(e.getLocalizedMessage());
			return null;
		}finally{
			sqlSession.close();
		}
		/**(7)처리 결과를 Json으로 출력하기 */
		//줄바꿈이나 HTML특수문자에 대한 처리
		for(int i=0; i<item.size(); i++){
			Comment temp = item.get(i);
			temp.setWriterName(web.convertHtmlTag(temp.getWriterName()));
			temp.setEmail(web.convertHtmlTag(temp.getEmail()));
			temp.setContent(web.convertHtmlTag(temp.getContent()));
		}
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("rt", "OK");
		data.put("item", item);
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);
		
		return null;
	}
   
}
