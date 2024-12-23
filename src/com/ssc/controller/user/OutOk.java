package com.ssc.controller.user;
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
import com.ssc.helper.UploadHelper;
import com.ssc.helper.WebHelper;
import com.ssc.model.Book;
import com.ssc.model.Comment;
import com.ssc.model.Document;
import com.ssc.model.User;
import com.ssc.service.BookService;
import com.ssc.service.CommentService;
import com.ssc.service.DocumentService;
import com.ssc.service.UserService;
import com.ssc.service.impl.BookServiceImpl;
import com.ssc.service.impl.CommentServiceImpl;
import com.ssc.service.impl.DocumentServiceImpl;
import com.ssc.service.impl.UserServiceImpl;

@WebServlet("/user/out_ok.do")
public class OutOk extends BaseController {
	private static final long serialVersionUID = 6903489122297195477L;
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	UploadHelper upload;
	UserService userService;
	DocumentService documentService;
	CommentService commentService;
	BookService	bookService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		upload = UploadHelper.getInstance();
		userService = new UserServiceImpl(sqlSession, logger);
		documentService = new DocumentServiceImpl(sqlSession, logger);
		commentService = new CommentServiceImpl(sqlSession, logger);
		bookService = new BookServiceImpl(sqlSession, logger);
		
		/** (3) 로그인 여부 검사 */
		// 로그인 중이 아니라면 탈퇴할 수 없다.
		if (web.getSession("loginInfo") == null) {
			web.redirect(web.getRootPath() + "/index.do", "로그인 후에 이용 가능합니다.");
			return null;
		}
		
		/** (5) 서비스에 전달하기 위하여 파라미터를 Beans로 묶는다. */
		// 회원번호는 세션을 통해서 획득한 로그인 정보에서 취득.
		User loginInfo = (User) web.getSession("loginInfo");
		User user = new User();
		user.setuId(loginInfo.getuId());
		
		logger.debug(loginInfo.getId());
		
		// 게시판과의 참조 관계 해제를 위한 조건값 설정
		Document document = new Document();
		document.setUserId(loginInfo.getId());
		
		// 덧글과의 참조 관계 해제를 위한 조건값 설정
		Comment comment = new Comment();
		comment.setUserId(loginInfo.getId());
		
		// 예약과의 참조 관계 해제를 위한 조건값 설정
		Book book = new Book();
		book.setUserId(loginInfo.getId());
		
		logger.debug("==========="+loginInfo.getId());
		
		/** (6) Service를 통한 탈퇴 시도 */
		try {
			// 참조관계 해제
			commentService.updateCommentUserOut(comment);
			documentService.updateDocumentUserOut(document);
			bookService.updateBookUserOut(book);
			
			// 탈퇴처리
			userService.deleteUser(user);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		// 탈퇴되었다면 프로필 이미지를 삭제한다.
		upload.removeFile(loginInfo.getProfileImg());

		/** (7) 정상적으로 탈퇴된 경우 강제 로그아웃 및 페이지 이동 */
		web.removeAllSession();
		web.redirect(web.getRootPath() + "/index.do", "탈퇴되었습니다.");
		return null;
	}

}
