package com.ssc.controller.admin.user;

import java.io.IOException;
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
import com.ssc.model.User;
import com.ssc.service.UserService;
import com.ssc.service.impl.UserServiceImpl;
@WebServlet("/admin/user_delete_ok.do")
public class UserDeleteOk extends BaseController {
	private static final long serialVersionUID = -4683566167830208227L;
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BBSCommon bbs;
	UploadHelper upload;
	UserService userService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		bbs = BBSCommon.getInstance();
		upload = UploadHelper.getInstance();
		userService = new UserServiceImpl(sqlSession, logger);
		
		/** (3) 게시글 번호와 비밀번호 받기 */
		int id = web.getInt("user_id");
		
		logger.debug("userId=" + id);
		
		if (id == 0) {
			sqlSession.close();
			web.redirect(null, "글 번호가 없습니다.");
			return null;
		}
		
		/** (4) 파라미터를 Beans로 묶기 */	
		
		User user = new User();
		user.setId(id);
		
		/** (5) 데이터 삭제 처리 */
		try {
			userService.deleteUser(user);	// 게시글 삭제
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		/** (6) 페이지 이동 */
		String url = "%s/admin/user_list.do";
		url = String.format(url, web.getRootPath());
		web.redirect(url, "삭제되었습니다.");
		return null;
	}

}
