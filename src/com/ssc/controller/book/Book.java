package com.ssc.controller.book;

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
import com.ssc.helper.WebHelper;
import com.ssc.service.BookService;
import com.ssc.service.impl.BookServiceImpl;


@WebServlet("/book.do")
public class Book extends BaseController {
	
    private static final long serialVersionUID = 1L;
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BookService bookService;
 

	    @Override
	    public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	logger = LogManager.getFormatterLogger(request.getRequestURI());
			sqlSession = MyBatisConnectionFactory.getSqlSession();
			web = WebHelper.getInstance(request, response);
			bookService = new BookServiceImpl(sqlSession, logger);
			
		return "book/book";
	}
}
