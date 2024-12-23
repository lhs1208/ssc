package com.ssc.controller.user;

import java.io.IOException;

import javax.mail.MessagingException;
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

@WebServlet("/user/find_pw_ok.do")
public class FindPwOk extends BaseController {
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
		String uId = web.getString("u_id");
		String email = web.getString("email");
		logger.debug("email=" + email);
		logger.debug("uId=" + uId);
		

		if (uId == null) {
			sqlSession.close();
			web.redirect(null, "아이디를 입력하세요.");
			return null;
		}
		
		if (email == null) {
			sqlSession.close();
			web.redirect(null, "이메일 주소를 입력하세요.");
			return null;
		}
		
		/** 임시 비밀번호 생성하기 */
		String newPassword = Util.getInstance().getRandomPassword();

		/** 입력값을 빈즈에 저장하기 */
		User user = new User();
		user.setEmail(email);
		user.setuId(uId);
		user.setuPw(newPassword);

		/** Service를 통한 비밀번호 갱신 */
		try {
			userService.updateUserPasswordByEmail(user);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}

		/** 발급된 비밀번호를 메일로 발송하기 */
		String sender = "ssc2car@gmail.com";
		String subject = "SSCSite 비밀번호 변경 안내 입니다.";
		String content = "회원님의 새로운 비밀번호는 <strong>" + newPassword + "</strong>입니다.";

		try {
			// 사용자가 입력한 메일주소를 수신자로 설정하여 메일 발송하기
			mail.sendMail(sender, email, subject, content);
		} catch (MessagingException e) {
			web.redirect(null, "메일 발송에 실패했습니다.관리자에게 문의 바랍니다.");
			return null;
		}
		/** 결과 페이지로 이동 */
		web.redirect(null, "새로운 비밀번호가 메일로 발송되었습니다.");
		return null;
	}
}