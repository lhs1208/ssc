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
import com.ssc.helper.MailHelper;
import com.ssc.helper.Util;
import com.ssc.helper.WebHelper;
import com.ssc.model.User;
import com.ssc.service.UserService;
import com.ssc.service.impl.UserServiceImpl;

@WebServlet("/user/find_id_ok.do")
public class FindIdOk extends BaseController {
	private static final long serialVersionUID = -4677230126507616318L;

	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	MailHelper mail;
	Util util;
	UserService userService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		mail = MailHelper.getInstance();
		util = Util.getInstance();
		userService = new UserServiceImpl(sqlSession, logger);

		/** 로그인 여부 검사 */
		// 로그인 중이라면 이 페이지를 이용할 수 없다.
		if (web.getSession("loginInfo") != null) {
			sqlSession.close();
			web.redirect(web.getRootPath() + "/index.do", "이미 로그인 중입니다.");
			return null;
		}

		/** 파라미터 받기 */
		// 입력된 아이디, 메일 주소를 받는다.
		String name = web.getString("name");
		String email = web.getString("email");
		logger.debug("email=" + email);
		logger.debug("name=" + name);
		

		if (name == null) {
			sqlSession.close();
			web.redirect(null, "이름을 입력하세요.");
			return null;
		}
		
		if (email == null) {
			sqlSession.close();
			web.redirect(null, "이메일 주소를 입력하세요.");
			return null;
		}
		
		/** 입력값을 빈즈에 저장하기 */
		User user = new User();
		user.setEmail(email);
		user.setName(name);

		/** Service를 통한 비밀번호 갱신 */
		try {
			user = userService.selectFindId(user);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		/** 결과 페이지로 이동 */
		web.redirect(null, "고객님의 ID는 " + user.getuId() + "입니다.");
		return null;
	}
}