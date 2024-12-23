package com.ssc.controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssc.helper.BaseController;

@WebServlet("/loginpage.do")
public class Loginpage extends BaseController{

	private static final long serialVersionUID = 1L;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		return "join/loginpage";
	}

}
