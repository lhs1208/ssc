package com.ssc.controller.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssc.helper.BaseController;
import com.ssc.helper.WebHelper;


@WebServlet("/join.do")
public class Join extends BaseController {
	private static final long serialVersionUID = 5490500222691700848L;

	/** (1) 사용하고자 하는 Helper 객체 선언 */
	WebHelper web;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
	web = WebHelper.getInstance(request, response);
	
	/** (3) 로그인 여부 검사 */
	if (web.getSession("loginInfo") != null) {
		web.redirect(web.getRootPath() + "/index.do", "이미 로그인 하셨습니다.");
		return null;
	}
		return "join/join";
	}
}
