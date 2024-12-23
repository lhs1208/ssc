package com.ssc.controller.mypage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssc.helper.BaseController;

@WebServlet("/mypage_lock.do")
public class MypageLock extends BaseController {
	private static final long serialVersionUID = 1720827487602166314L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		return "mypage/mypage_lock";
	}
}
