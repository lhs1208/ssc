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
import com.ssc.model.User;
import com.ssc.service.UserService;
import com.ssc.service.impl.UserServiceImpl;




@WebServlet("/user/login_ok.do")
public class LoginOk extends BaseController {
	private static final long serialVersionUID = 7890853976013335208L;

	/** (1) 사용하고자 하는 Helper + Service 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	UserService userService;
	UploadHelper upload;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		upload = UploadHelper.getInstance();
		userService = new UserServiceImpl(sqlSession, logger);
		
		/** 3) 로그인 여부 검사 */
		// 로그인 중이라면 이 페이지를 동작시켜서는 안된다.
		if(web.getSession("loginInfo") != null){
		    // 이미 SqlSession 객체를 생성했으므로, 데이터베이스 접속을 해제해야 한다.
		    sqlSession.close();
		    web.redirect(web.getRootPath() + "/index.do", "이미 로그인 하셨습니다.");
		    return null;
		}
		
		/** (4) 파라미터 처리 */
		// --> topbar.jsp에 배치된 폼으로부터 전송되는 입력값.
		String uId = web.getString("u_id");
		String uPw = web.getString("u_pw");
		
		logger.debug("uId=" + uId);
		logger.debug("uPw=" + uPw);
		
		if (uId == null || uPw == null) {
			sqlSession.close();
			web.redirect(null, "아이디나 비밀번호가 없습니다.");
			return null;
		}
		
		
		/** (5) 전달받은 파라미터를 Beans에 설정한다. */
		User user = new User();
		user.setuId(uId);
		user.setuPw(uPw);
		
		/** (6) Service를 통한 회원 인증 */
		User loginInfo = null;
		
		try {
			// 아이디와 비밀번호가 일치하는 회원 정보를 조회하여 리턴한다.
			loginInfo = userService.selectLoginInfo(user);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		
		/** (7) 프로필 이미지 처리 */
		// 프로필 이미지가 있을 경우 썸네일을 생성하여 쿠키에 별도로 저장
		String profileImg = loginInfo.getProfileImg();
		if (profileImg != null) {
			try {


				String profileThumbnail = upload.createThumbnail(profileImg, 100, 100,true);
				web.setCookie("profileThumbnail", profileThumbnail, -1);
			} catch (Exception e) {
				web.redirect(null, e.getLocalizedMessage());
				return null;
			}
		}
		
		/** (8) 조회된 회원 정보를 세션에 저장 */
		web.setSession("loginInfo", loginInfo);	
		web.setSession("logId", loginInfo.getuId()); 
		web.setSession("logUid", loginInfo.getId()); 
		String a = loginInfo.getuId();
		String b = "admin";
		if(a.equals(b)){	
			System.out.println("22");
			web.redirect(web.getRootPath() + "/zone/zone_list.do", "로그인 되었습니다.");
		} else{
			System.out.println("33");
			web.redirect(web.getRootPath() + "/index.do", "로그인 되었습니다.");
		}
		
		/** (9) 페이지 이동 */
		String movePage = request.getHeader("referer");
		if (movePage == null) {
			//movePage = web.getRootPath() + "/index.do";
		}		
		
		sqlSession.close();
		
		return null;
	}
	

}
