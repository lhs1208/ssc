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
import com.ssc.model.Car;
import com.ssc.service.BookService;
import com.ssc.service.CarService;
import com.ssc.service.impl.BookServiceImpl;
import com.ssc.service.impl.CarServiceImpl;


@WebServlet("/book2.do")
public class Book2 extends BaseController {
	private static final long serialVersionUID = -1186301444288244115L;

	/** (1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	CarService carService;
	BookService bookService;
	UploadHelper upload;
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		carService = new CarServiceImpl(sqlSession, logger);
		bookService = new BookServiceImpl(sqlSession, logger);
		upload = UploadHelper.getInstance();
		
		String zonelist = web.getString("zonelist");
		logger.debug("zonelist=" + zonelist);
		
		Car car = new Car();
		car.setZoneName(zonelist);
		
		List<Car> item = null;

		try {
			item = carService.selectCarZone(car);
		} catch (NullPointerException e) {
			web.redirect(null, "Null값");
			return null;
		} catch (Exception e) {
			web.redirect(null, "오류" + e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();	
		}
		
		
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("rt", "OK");
		data.put("item", item);
		
		// --> import com.fasterxml.jackson.databind.ObjectMapper;
		ObjectMapper mapper = new ObjectMapper();
		mapper.writeValue(response.getWriter(), data);
		
		return null;
	}
}
