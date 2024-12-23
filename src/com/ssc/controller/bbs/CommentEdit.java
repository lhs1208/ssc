package com.ssc.controller.bbs;

import java.io.IOException;
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
import com.ssc.model.Comment;
import com.ssc.service.CommentService;
import com.ssc.service.impl.CommentServiceImpl;

@WebServlet("/bbs/comment_edit.do")
public class CommentEdit extends BaseController {
	private static final long serialVersionUID = 1511335980019984299L;
	
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	CommentService commentService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		// --> import org.apache.logging.log4j.LogManager;
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		// --> import study.jsp.mysite.service.impl.MemberServiceImpl;
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		// --> import study.jsp.mysite.service.impl.BbsCommentServiceImpl;
		commentService = new CommentServiceImpl(sqlSession, logger);

		/** (3) 글 번호 파라미터 받기 */
		int commentId = web.getInt("comment_id");
		if (commentId == 0) {
			sqlSession.close();
			web.redirect(null, "덧글 번호가 지정되지 않았습니다.");
			return null;
		}

		// 파라미터를 Beans로 묶기
		Comment comment = new Comment();
		comment.setId(commentId);
		
		/** (4) 덧글 일련번호를 사용한 데이터 조회 */
		// 지금 읽고 있는 덧글이 저장될 객체
		Comment readComment = null;

		try {
			readComment = commentService.selectComment(comment);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}

		/** (5) 읽은 데이터를 View에게 전달한다. */
		request.setAttribute("comment", readComment);

		return "bbs/comment_edit";
	}

}
