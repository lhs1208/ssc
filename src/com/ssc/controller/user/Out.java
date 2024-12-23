package com.ssc.controller.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssc.helper.BaseController;
import com.ssc.helper.WebHelper;


@WebServlet("/Out")
public class Out extends BaseController {

  
    private static final long serialVersionUID = -7413649535239553857L;
    
    WebHelper web;

    @Override
    public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	web = WebHelper.getInstance(request, response);
	
	if(web.getSession("loginInfo") == null){
	    web.redirect(web.getRootPath() + "/index.do", "로그인 후에 이용 가능합니다.");
	}
	return "member/mypage_ok";
    }
    
}
