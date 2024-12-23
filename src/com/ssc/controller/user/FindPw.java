package com.ssc.controller.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssc.helper.BaseController;
import com.ssc.helper.WebHelper;


@WebServlet("/user/find_pw.do")
public class FindPw extends BaseController {
	private static final long serialVersionUID = -1193783814455972836L;

	WebHelper web;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		web = WebHelper.getInstance(request, response);
		
		/** 로그인 여부 검사 */
		// 로그인 중이라면 이 페이지를 이용할 수 없음.
		if (web.getSession("loginInfo") !=null) {
			web.redirect(web.getRootPath() + "/index.do", "이미 로그인 중입니다.");
			return null;
		}
		
		
		return "user/find_pw";
	}
	
}
