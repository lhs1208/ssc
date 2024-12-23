package com.ssc.controller.bbs;

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
import com.ssc.model.User;
import com.ssc.service.CommentService;
import com.ssc.service.impl.CommentServiceImpl;


@WebServlet("/bbs/comment_delete_ok.do")
public class CommentDeleteOk extends BaseController {
	private static final long serialVersionUID = -5538866263789044233L;
	
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	CommentService commentService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		/** (2) 페이지 형식 지정 + 사용하고자 하는 Helper+Service 객체 생성 */
		// 페이지 형식을 JSON으로 설정한다.
		response.setContentType("application/json");
		
		// --> import org.apache.logging.log4j.LogManager;
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		// --> import study.jsp.mysite.service.impl.BbsCommentServiceImpl;
		commentService = new CommentServiceImpl(sqlSession, logger);
		
		/** (3) 덧글번호와 비밀번호 받기 */
		int commentId = web.getInt("comment_id");
		String writerPw = web.getString("writer_pw");
		
		logger.debug("commentId=" + commentId);
		logger.debug("writerPw=" + writerPw);
		
		if (commentId == 0) {
			sqlSession.close();
			web.printJsonRt("덧글 번호가 없습니다.");
			return null;
		}
		
		/** (4) 파라미터를 Beans로 묶기 */	
		Comment comment = new Comment();
		comment.setId(commentId);
		comment.setWriterPw(writerPw);
		
		/** (5) 데이터 삭제 처리 */
		// 로그인 중이라면 회원일련번호를 Beans에 추가한다.
		User loginInfo = (User) web.getSession("loginInfo");
		if (loginInfo != null) {
			comment.setUserId(loginInfo.getId());
		}
		
		try {
			// Beans에 추가된 자신의 회원번호를 사용하여 자신의 덧글임을 판별한다.
			// --> 자신의 덧글이 아니라면 비밀번호 검사
			if (commentService.selectCommentCountByUserId(comment) < 1) {
				commentService.selectCommentCountByPw(comment);
			}
			commentService.deleteComment(comment);	// 덧글삭제
		} catch (Exception e) {
			web.printJsonRt(e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		/** (6) 처리 결과를 JSON으로 출력하기 */
		// --> import java.util.HashMap;
		// --> import java.util.Map;
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("rt", "OK");
		data.put("commentId", commentId);
		
		// --> import com.fasterxml.jackson.databind.ObjectMapper;
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);
		
		return null;
	}

}

