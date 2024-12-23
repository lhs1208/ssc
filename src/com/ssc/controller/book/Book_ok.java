package com.ssc.controller.book;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ssc.dao.MyBatisConnectionFactory;
import com.ssc.helper.BaseController;
import com.ssc.helper.UploadHelper;
import com.ssc.helper.WebHelper;
import com.ssc.model.Book;
import com.ssc.service.BookService;
import com.ssc.service.impl.BookServiceImpl;

@WebServlet("/book_ok.do")
public class Book_ok extends BaseController {
    private static final long serialVersionUID = -4162323833938469930L;
	/** (1) 사용하고자 하는 Helper 객체 선언 */
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
		
		int carId = web.getInt("car_id");
		logger.debug("carId=" + carId);
		
		
		Book book = new Book();
		book.setCarId(carId);
		//book.setCarId(Integer.parseInt(car_id));
		List<Book> itemBook = null;
		try{
		    itemBook = bookService.selectBookCar(book);
		}catch(Exception e){
		    web.redirect(null, e.getLocalizedMessage());
		    return null;
		}finally{
		    sqlSession.close();
		}
		
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("rt", "OK");
		data.put("itemBook", itemBook);
		
		// --> import com.fasterxml.jackson.databind.ObjectMapper;
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);
		
		return null;
	}
}
