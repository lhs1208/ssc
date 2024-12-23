package com.ssc.controller.admin.car;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ssc.helper.BaseController;
import com.ssc.helper.WebHelper;



@WebServlet("/car_insert.do")
public class CarInsert extends BaseController {

  
    private static final long serialVersionUID = 5977481452038807211L;
    
    WebHelper web;
    
    
   

    @Override
    public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	web = WebHelper.getInstance(request, response);
	
	
	
	return "admin/car/car_insert";
    }
    
}
