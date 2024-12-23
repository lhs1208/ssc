package com.ssc.controller.admin.car;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.ssc.dao.MyBatisConnectionFactory;
import com.ssc.helper.BaseController;
import com.ssc.helper.FileInfo;
import com.ssc.helper.RegexHelper;
import com.ssc.helper.UploadHelper;
import com.ssc.helper.WebHelper;
import com.ssc.model.Car;
import com.ssc.service.CarService;
import com.ssc.service.impl.CarServiceImpl;


@WebServlet("/car_edit_ok.do")
public class CarEditOk extends BaseController {

 
    private static final long serialVersionUID = -2785690097502839229L;
    
    Logger logger;
    SqlSession sqlSession;
    WebHelper web;
    RegexHelper regex;
    UploadHelper upload;
    CarService carService;
    @Override
    public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	logger = LogManager.getFormatterLogger(request.getRequestURL());
	sqlSession = MyBatisConnectionFactory.getSqlSession();
	web = WebHelper.getInstance(request, response);
	regex = RegexHelper.getInstance();
	upload = UploadHelper.getInstance();
	carService = new CarServiceImpl(sqlSession, logger);
	
	
	
	try{
	    upload.multipartRequest(request);
	}catch(Exception e){
	    sqlSession.close();
	    web.redirect(null, "multipart 데이터가 아닙니다.");
	    return null;
	}
	
	Map<String, String> paramMap = upload.getParamMap();
	
	String carId = paramMap.get("car_id");
	String carName = paramMap.get("car_name");
	String carKind = paramMap.get("car_kind");
	String carPay = paramMap.get("car_pay");
	String zoneNum = paramMap.get("zonelist");
	String imgDel = paramMap.get("img_del");
	String carImg = paramMap.get("car_img");
	
	logger.debug("carId=" + carId);
	logger.debug("carName=" + carName);
	logger.debug("carKind=" + carKind);
	logger.debug("carPay=" + carPay);
	logger.debug("zoneNum=" + zoneNum);
	logger.debug("imgDel=" + imgDel);
	
	// 유효성 검사
	
	if (!regex.isValue(carName)) {
		sqlSession.close();
		web.redirect(null, "차 이름를 입력하세요.");
		return null;
	}
	
	if (!regex.isValue(carKind)) {
		sqlSession.close();
		web.redirect(null, "차종을 입력하세요.");
		return null;
	}
	
	if (!regex.isValue(carPay)) {
		sqlSession.close();
		web.redirect(null, "차 요금을 입력하세요.");
		return null;
	}
	
	if (!regex.isValue(zoneNum)) {
		sqlSession.close();
		web.redirect(null, "존이름을 입력하세요.");
		return null;
	}
	
	if(regex.isValue(imgDel) && imgDel.equals("Y")){
	    upload.removeFile(carImg);
	}
	
	List<FileInfo> fileList = upload.getFileList();
	if(fileList.size() > 0){
	    FileInfo info = fileList.get(0);
	    carImg = info.getFileDir() + "/" + info.getFileName();
	    
	}
	
	logger.debug("carImg=" + carImg);
	
	Car car = new Car();
	
	car.setId(Integer.parseInt(carId));
	car.setCarName(carName);
	car.setCarKind(carKind);
	car.setCarPay(Integer.parseInt(carPay));
	car.setZoneNum(Integer.parseInt(zoneNum));
	car.setCarImg(carImg);
	
	if(carImg != null){
	    car.setCarImg(carImg);
	}else if(carImg == null){
	    if(imgDel != null && imgDel.equals("Y")){
		car.setCarImg("");
	    }
	}
	
	
	try{
	    carService.selectCarCount(car);
	    carService.updateCar(car);
	   
	}catch(Exception e){
	    web.redirect(null, e.getLocalizedMessage());
	    return null;
	}finally{
	    sqlSession.close();
	}
	
	web.redirect(web.getRootPath() +  "/car_list.do", "수정되었습니다.");
	
	
	
	
	
	
	
	
	
	return null;
    }
    
}
