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


@WebServlet("/car_edit.do")
public class CarEdit extends BaseController {


    private static final long serialVersionUID = -7357296657805089971L;
    
    WebHelper web;
    Logger logger;
    SqlSession sqlSession;
    CarService carService;
    UploadHelper upload;
    
    @Override
    public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	web = WebHelper.getInstance(request, response);
	logger = LogManager.getFormatterLogger(request.getRequestURI());
	sqlSession = MyBatisConnectionFactory.getSqlSession();
	carService = new CarServiceImpl(sqlSession, logger);
	upload = UploadHelper.getInstance();
	
	int carId = web.getInt("car_id");
	logger.debug("carId=" + carId);
	
	Car car = new Car();
	car.setId(carId);
	
	Car readCar = null;
	
	try{
	    readCar = carService.selectCar(car);
	}catch(Exception e){
	    web.redirect(null, e.getLocalizedMessage());
	    return null;
	}finally{
	    sqlSession.close();
	}
	
	request.setAttribute("readCar", readCar);
	
	
	
	return "admin/car/car_edit";
    }
    
}
