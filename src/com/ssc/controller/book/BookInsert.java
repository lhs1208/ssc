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
import com.ssc.model.User;
import com.ssc.service.BookService;
import com.ssc.service.impl.BookServiceImpl;

@WebServlet("/book_insert.do")
public class BookInsert extends BaseController {
	private static final long serialVersionUID = 3622791265889449901L;
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	UploadHelper upload;
	BookService bookService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		upload = UploadHelper.getInstance();
		bookService = new BookServiceImpl(sqlSession, logger);
		
		String startDate = web.getString("startDate");
		String startTime = web.getString("valueA");
		logger.debug("startDate=" + startDate );
		logger.debug("valueA=" + startTime);
		
		String endDate = web.getString("endDate");
		String endTime = web.getString("valueB");
		logger.debug("endDate=" + endDate );
		logger.debug("valueB=" + endTime);
		
		int carId = web.getInt("carId");
		logger.debug("carId=" + carId);
		
		int userId = 0; 
		// 로그인의 경우 세션정보 대체
		User loginInfo = (User) web.getSession("loginInfo");
		if (loginInfo != null) {
		    userId = loginInfo.getId();
		}
		logger.debug("userId=" + userId);
		// 저장될 대여일
		String a = startDate.substring(0,4);
		String b = startDate.substring(4,6);
		String c = startDate.substring(6,8);
		String f = a + "-" + b + "-" + c + " " + startTime; 
		System.out.println(f);
		
		// 저장될 반납일
		String a1 = endDate.substring(0,4);
		String b1 = endDate.substring(4,6);
		String c1 = endDate.substring(6,8);
		String f1 = a1 + "-" + b1 + "-" + c1 + " " + endTime;
		System.out.println(f1);
		
		Book book = new Book();
		book.setCarId(carId);
		book.setUserId(userId);
		book.setStartDate(f);
		book.setEndDate(f1);
		
		
		try{
			bookService.insertBook(book);
		}catch(Exception e){
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}

		String url = "mypage1.do?log=" + userId;
		web.redirect(url, "예약이 완료되었습니다.	");
		return null;
	}
}
