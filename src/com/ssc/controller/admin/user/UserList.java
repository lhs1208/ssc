package com.ssc.controller.admin.user;

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
import com.ssc.model.User;
import com.ssc.service.UserService;
import com.ssc.service.impl.UserServiceImpl;

@WebServlet("/admin/user_list.do")
public class UserList extends BaseController {
	private static final long serialVersionUID = 486914120918869628L;
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BBSCommon bbs;
	UserService userService;
	PageHelper pageHelper;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		/**(2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		bbs = BBSCommon.getInstance();
		userService = new UserServiceImpl(sqlSession, logger);
		pageHelper = PageHelper.getInstance();
		
		/**(3) 조회할 정보에 대한 Beans 생성 */
		String keyword = web.getString("keyword");
		User user = new User();
		int page = web.getInt("page", 1);
		
		user.setuId(keyword);
		user.setName(keyword);
		user.setGender(keyword);
		user.setBirthdate(keyword);
		user.setTel(keyword);
		
		/**(4)게시글 목록 조회*/
		int totalCount = 0;
		List<User> userList = null;
		try{
			//전체 게시물 수
			totalCount = userService.selectIdCount(user);
			//나머지 페이지 번호 계싼하기
			//-->현재 페이지, 전체 게시물 수, 한페이지의 목록수, 
			pageHelper.pageProcess(page, totalCount, 15, 5);
			user.setLimitStart(pageHelper.getLimitStart());
			user.setListCount(pageHelper.getListCount());
			userList = userService.selectuIdList(user);
			
		}catch(Exception e){
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}finally{
			sqlSession.close();
		}
		System.out.println();
		
		/**(5)조회결과를 view에 전달 */
		request.setAttribute("userList", userList);
		request.setAttribute("keyword", keyword);
		request.setAttribute("pageHelper", pageHelper);
		
		return "admin/user/user_list";
	}
       

}
