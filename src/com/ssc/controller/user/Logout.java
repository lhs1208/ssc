package com.ssc.controller.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssc.helper.BaseController;
import com.ssc.helper.WebHelper;
import com.ssc.model.User;


@WebServlet("/logout.do")
public class Logout extends BaseController {
	private static final long serialVersionUID = -501706206962368206L;

	/** (1) 사용하고자 하는 Helper + Service 객체 선언 */
	WebHelper web;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	/** (2) 필요한 헬퍼 객체 생성 */
	web = WebHelper.getInstance(request, response);
	
	/** (3) 로그인 여부 검사 */
	User loginInfo = (User) web.getSession("loginInfo");
	
	if (loginInfo == null) {
		web.redirect(web.getRootPath() + "/inex.do", "로그인 후에 이용 가능합니다.");
		return null;
	}
	
	/** (4) 로그아웃 */
	web.removeAllSession();
	
	/** (5) 페이지 이동 */
	web.redirect(web.getRootPath() + "/index.do", "로그아웃 되었습니다.");
		
	 
		return null;
	}
	
}
