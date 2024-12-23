package com.ssc.controller.admin.zone;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssc.controller.bbs.BBSCommon;
import com.ssc.helper.BaseController;
import com.ssc.helper.WebHelper;

@WebServlet("/zone/zone_write.do")
public class ZoneWrite extends BaseController {
	private static final long serialVersionUID = -2138458144140756295L;
	
	WebHelper web;
	BBSCommon bbs;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		web = WebHelper.getInstance(request, response);
		bbs = BBSCommon.getInstance();
		
		return "admin/zone/zone_write";	
	}
}