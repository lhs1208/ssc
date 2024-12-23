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
import com.ssc.helper.UploadHelper;
import com.ssc.helper.WebHelper;
import com.ssc.model.Book;
import com.ssc.service.BookService;
import com.ssc.service.impl.BookServiceImpl;

@WebServlet("/book_delete_ok.do")
public class BookDeleteOk extends BaseController {
	private static final long serialVersionUID = -4109507988514658935L;
	
	Logger logger;
    SqlSession sqlSession;
    WebHelper web;
    BookService bookService;
    UploadHelper upload;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		bookService = new BookServiceImpl(sqlSession, logger);
		upload = UploadHelper.getInstance();
		
		int bid = web.getInt("bid");
		
		logger.debug("bid=" + bid);
		
		if(bid == 0){
		    sqlSession.close();
		    web.redirect(null, "예약번호가 없습니다.");
		    return null;
		}
		
		Book book = new Book();
		book.setBid(bid);
		
		try{
		    bookService.deleteBook(book);
		}catch(Exception e){
		    web.redirect(null, e.getLocalizedMessage());
		    return null;
		}finally{
		    sqlSession.close();
		}
		
		web.redirect(web.getRootPath() + "/index.do", "삭제되었습니다.");
		
		return null;
	    }
	
}
