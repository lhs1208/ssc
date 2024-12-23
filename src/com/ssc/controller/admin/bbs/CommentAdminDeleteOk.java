package com.ssc.controller.admin.bbs;

import java.io.IOException;
import java.util.HashMap;
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

@WebServlet("/admin/comment_admin_delete_ok.do")
public class CommentAdminDeleteOk extends BaseController {
	private static final long serialVersionUID = -4831965922083926822L;
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	CommentService commentService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/** (2) 페이지 형식 지정 + 사용하고자 하는 Helper+Service 객체 생성 */
		response.setContentType("application/json");
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		commentService = new CommentServiceImpl(sqlSession, logger);
		
		/** (3) 덧글번호와 비밀번호 받기 */
		int commentId = web.getInt("comment_id");
		
		logger.debug("commentId=" + commentId);
		
		if (commentId == 0) {
			sqlSession.close();
			web.printJsonRt("덧글 번호가 없습니다.");
			return null;
		}
		
		/** (4) 파라미터를 Beans로 묶기 */	
		Comment comment = new Comment();
		comment.setId(commentId);
		
		/** (5) 데이터 삭제 처리 */
		
		try {
			commentService.deleteComment(comment);	// 덧글삭제
		} catch (Exception e) {
			web.printJsonRt(e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		/** (6) 처리 결과를 JSON으로 출력하기 */
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("rt", "OK");
		data.put("commentId", commentId);
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);
		
		return null;
	}

}

