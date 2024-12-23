package com.ssc.controller.admin.bbs;

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

@WebServlet("/admin/comment_admin_delete.do")
public class CommentAdminDelete extends BaseController {
	private static final long serialVersionUID = -5810575014624482799L;
	
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	CommentService commentService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		commentService = new CommentServiceImpl(sqlSession, logger);
		
		/** (3) 덧글 번호 받기 */
		int commentId = web.getInt("comment_id");
		if (commentId == 0) {
			sqlSession.close();
			web.redirect(null, "덧글 번호가 없습니다.");
			return null;
		}
		
		// 파라미터를 Beans로 묶기
		Comment comment = new Comment();
		comment.setId(commentId);
		
		/** (4) 게시물 일련번호를 사용한 데이터 조회 */	
		// 회원번호가 일치하는 게시물 수 조회하기
		int commentCount = 0; 
		try {
			commentCount = commentService.selectCommentCountByUserId(comment);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		/** (5) 자신의 글에 대한 요청인지에 대한 여부를 view에 전달 */
		boolean myComment = commentCount > 0;
		logger.debug("myComment = " + myComment);
		request.setAttribute("myComment", myComment);
		
		// 상태유지를 위하여 게시글 일련번호를 View에 전달한다.
		request.setAttribute("commentId", commentId);
		
		return "admin/bbsDelete/comment_admin_delete";
	}
}
