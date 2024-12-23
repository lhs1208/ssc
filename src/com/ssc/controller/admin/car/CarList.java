package com.ssc.controller.admin.car;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.ssc.controller.bbs.BBSCommon;
import com.ssc.dao.MyBatisConnectionFactory;
import com.ssc.helper.BaseController;
import com.ssc.helper.PageHelper;
import com.ssc.helper.WebHelper;
import com.ssc.model.Car;
import com.ssc.service.CarService;
import com.ssc.service.impl.CarServiceImpl;

@WebServlet("/admin/car_list.do")
public class CarList extends BaseController {
	private static final long serialVersionUID = -8889754019874967872L;
	Logger logger;
	SqlSession sqlSession;
	CarService carService;
	WebHelper web;
	BBSCommon bbs;
	PageHelper pageHelper;


	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		pageHelper = PageHelper.getInstance();
		carService = new CarServiceImpl(sqlSession, logger);

		/** 조회할 정보에 대한 Beans 생성 */
		String keyword = web.getString("keyword");

		Car car = new Car();

		int page = web.getInt("page", 1);

		car.setCarName(keyword);
		car.setCarKind(keyword);

		/** 게시글 목록 조회 */
		int totalCount = 0;
		List<Car> carList = null;

		try {
			// 전체 게시물 수
			totalCount = carService.selectCarCount(car);
			// 나머지 페이지 번호 계산하기
			// 현재 페이지,전체 게시물 수 , 한페이지의 목록수
			pageHelper.pageProcess(page, totalCount, 10, 5);

			car.setLimitStart(pageHelper.getLimitStart());
			car.setListCount(pageHelper.getListCount());

			carList = carService.selectCarList2(car);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		System.out.println();
		
		/** 조회결과를 view에 전달 */
		request.setAttribute("carList", carList);
		request.setAttribute("keyword", keyword);
		request.setAttribute("pageHelper", pageHelper);
				
		return "/admin/car/car_list";
	}

}
