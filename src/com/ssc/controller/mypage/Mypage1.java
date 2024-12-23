package com.ssc.controller.mypage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.ssc.dao.MyBatisConnectionFactory;
import com.ssc.helper.BaseController;
import com.ssc.helper.PageHelper;
import com.ssc.helper.WebHelper;
import com.ssc.model.Book;
import com.ssc.service.BookService;
import com.ssc.service.impl.BookServiceImpl;


@WebServlet("/mypage1.do")
public class Mypage1 extends BaseController {
	private static final long serialVersionUID = -8499682973049273322L;
	Logger logger;
    SqlSession sqlSession;
    WebHelper web;
    PageHelper pageHelper;
    BookService bookService;
	
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		pageHelper = PageHelper.getInstance();
		bookService = new BookServiceImpl(sqlSession, logger);
		
		String log = web.getString("log");
		request.setAttribute("log", log);
		
		String keyword = web.getString("keyword");
		Book book = new Book();
		int page = web.getInt("page",1);
		
		book.setUserId(Integer.parseInt(log));
		book.setStartDate(keyword);
		book.setEndDate(keyword);
		book.setCarName(keyword);
		book.setZoneName(keyword);
		
		int totalCount = 0;
		List<Book> bookList = null;
		
		try{
		    totalCount = bookService.selectBookCount(book);
		    pageHelper.pageProcess(page, totalCount, 15, 5);
		    book.setLimitStart(pageHelper.getLimitStart());
		    book.setListCount(pageHelper.getListCount());
		    bookList = bookService.selectBookList3(book);
		}catch(Exception e){
		    web.redirect(null, e.getLocalizedMessage());
		    return null;
		}finally{
		    sqlSession.close();
		}
		
		request.setAttribute("bookList", bookList);
		request.setAttribute("keyword", keyword);
		request.setAttribute("pageHelper", pageHelper);
		
		return "mypage/mypage1";
	    }
	}








