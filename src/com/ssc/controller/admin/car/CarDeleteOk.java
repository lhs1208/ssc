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


@WebServlet("/car_delete_ok.do")
public class CarDeleteOk extends BaseController {

    
    private static final long serialVersionUID = 7699500309275003866L;

    Logger logger;
    SqlSession sqlSession;
    WebHelper web;
    CarService carService;
    UploadHelper upload;
    @Override
    public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	logger = LogManager.getFormatterLogger(request.getRequestURI());
	sqlSession = MyBatisConnectionFactory.getSqlSession();
	web = WebHelper.getInstance(request, response);
	carService = new CarServiceImpl(sqlSession, logger);
	upload = UploadHelper.getInstance();
	
	int carId = web.getInt("car_id");
	
	logger.debug("carId=" + carId);
	
	if(carId == 0){
	    sqlSession.close();
	    web.redirect(null, "차번호가 없습니다.");
	    return null;
	}
	
	Car car = new Car();
	car.setId(carId);
	
	try{
	    carService.deleteCar(car);
	}catch(Exception e){
	    web.redirect(null, e.getLocalizedMessage());
	    return null;
	}finally{
	    sqlSession.close();
	}
	
	upload.removeFile(car.getCarImg());
	
	web.redirect(web.getRootPath() + "/car_list.do", "삭제되었습니다.");
	
	return null;
    }}
