package com.ssc.controller.admin.user;

import java.io.IOException;
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
import com.ssc.helper.UploadHelper;
import com.ssc.helper.WebHelper;
import com.ssc.model.User;
import com.ssc.service.UserService;
import com.ssc.service.impl.UserServiceImpl;
@WebServlet("/admin/user_read.do")
public class UserRead extends BaseController {
	private static final long serialVersionUID = 3519087983161501945L;
	
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BBSCommon bbs;
	UserService userService;
	UploadHelper upload;
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		bbs = BBSCommon.getInstance();
		userService = new UserServiceImpl(sqlSession, logger);	
		upload = UploadHelper.getInstance();
		
		/**(3)글 번호  파라미터 받기 */
		int Id = web.getInt("user_id");
		logger.debug("user_Id=" + Id);
		
		if(Id == 0) {
			web.redirect(null, "id번호가 지정되지 않았습니다.");
			sqlSession.close();
			return null;
		}
		
		User user = new User();
		user.setId(Id);
		logger.debug("user_Id=" + Id);
		
		User readUser = null;
		User prevUser = null;
		User nextUser = null;
		
		String cookieKey = "user_" + Id;
		String cookieVar = web.getCookie(cookieKey);
		
		try{
			if(cookieVar == null){
				web.setCookie(cookieKey, "Y", 60*60*24);
			}
			
			readUser = userService.selectUser(user);
			prevUser = userService.selectPrevUser(user);
			nextUser = userService.selectNextUser(user);
			
		}catch(Exception e){
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}finally {
			sqlSession.close();
		}
		
		/**읽은 데이터를 View 에게 전달한다. */
		request.setAttribute("readUser", readUser);
		request.setAttribute("prevUser", prevUser);
		request.setAttribute("nextUser", nextUser);
		
		
		return "admin/user/user_read";
	}
}

