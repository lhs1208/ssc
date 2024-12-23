package com.ssc.controller.mypage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssc.helper.BaseController;


@WebServlet("/mypage.do")
public class Mypage extends BaseController {

    private static final long serialVersionUID = -2007723635345784568L;

    @Override
    public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	return "mypage/mypage";
    }
    
}
