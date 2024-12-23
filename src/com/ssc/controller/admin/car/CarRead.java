package com.ssc.controller.admin.car;

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
import com.ssc.model.Car;

import com.ssc.service.CarService;
import com.ssc.service.impl.CarServiceImpl;


@WebServlet("/car_read.do")
public class CarRead extends BaseController {

    private static final long serialVersionUID = -1666378819167286671L;
    
    Logger logger;
    SqlSession sqlSession;
    WebHelper web;
    CarService carService;
    UploadHelper upload;

    @Override
    public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	logger = LogManager.getFormatterLogger(request.getRequestURL());
	sqlSession = MyBatisConnectionFactory.getSqlSession();
	web = WebHelper.getInstance(request, response);
	carService = new CarServiceImpl(sqlSession, logger);
	upload = UploadHelper.getInstance();
	
	int carId = web.getInt("car_id");
	logger.debug("carId" + carId);
	
	if(carId == 0){
	    web.redirect(null, "차 번호가 지정되지 않았습니다.");
	    sqlSession.close();
	    return null;
	}
	
	Car car = new Car();
	car.setId(carId);
	logger.debug("carId=" + carId);
	
	Car readCar = null;
	Car prevCar = null;
	Car nextCar = null;
	
	String cookieKey = "car_" + carId;
	String cookieVar = web.getCookie(cookieKey);
	
	
	
	
	try{
	    if(cookieVar == null){
		web.setCookie(cookieKey, "Y", 60*60*24);
	    }
	    readCar = carService.selectCar(car);
	    prevCar = carService.selectPrevCar(car); 
	    nextCar = carService.selectNextCar(car);
	    
	}catch(Exception e){
	    web.redirect(null, e.getLocalizedMessage());
	    return null;
	}finally{
	    sqlSession.close();
	}
	
	
	

	
	request.setAttribute("readCar", readCar);
	request.setAttribute("prevCar", prevCar);
	request.setAttribute("nextCar", nextCar);
	
	return "admin/car/car_read";
    }}
