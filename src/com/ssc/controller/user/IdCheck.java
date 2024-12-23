package com.ssc.controller.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.ssc.dao.MyBatisConnectionFactory;
import com.ssc.helper.WebHelper;
import com.ssc.model.User;
import com.ssc.service.UserService;
import com.ssc.service.impl.UserServiceImpl;


@WebServlet("/id_check.do")
public class IdCheck extends HttpServlet {
    
    private static final long serialVersionUID = -1872316779010926387L;
    
    Logger logger;
    WebHelper web;
    SqlSession sqlSession;
    UserService userService;

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException{
	
	logger = LogManager.getFormatterLogger(request.getRequestURI());
	sqlSession = MyBatisConnectionFactory.getSqlSession();
	web = WebHelper.getInstance(request, response);
	userService = new UserServiceImpl(sqlSession, logger);
	User user = new User();
	
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	response.setContentType("text/html");
	
	String uId = web.getString("u_id");
	int result = 0;
	String str = "";
	
	user.setuId(uId);
	
	logger.debug("uidcount=" + uId);
		if(uId == null){
		    uId="";
		}
		if(!uId.equals("")){
		    try{
		    	result = userService.selectuIdCount(user);
		    } catch(Exception e){
		    	sqlSession.close();
		    }
		}
		
		PrintWriter out = response.getWriter();
		if(uId == ""){
			str = "NULL";
			out.print(str);
			System.out.println(str);
		}else if(result < 1){
		    str = "YES";
		    out.print(str);
		    System.out.println(str);
		}else{
		    str = "NO";
		    out.print(str);
		    System.out.println(str);
		}
    }
}
