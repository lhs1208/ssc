package com.ssc.controller.admin.zone;

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
import com.ssc.model.Zone;
import com.ssc.service.ZoneService;
import com.ssc.service.impl.ZoneServiceImpl;

@WebServlet("/zone/zone_list.do")
public class ZoneList extends BaseController {
	private static final long serialVersionUID = 83280457088951733L;
	Logger logger;
	SqlSession sqlSession;
	ZoneService zoneService; 
	WebHelper web;
	BBSCommon bbs;
	PageHelper pageHelper;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/**(2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		bbs = BBSCommon.getInstance();
		zoneService = new ZoneServiceImpl(sqlSession, logger);
		pageHelper = PageHelper.getInstance();
		
		/**(3) 조회할 정보에 대한 Beans 생성 */
		String keyword = web.getString("keyword");	
				
		Zone zone = new Zone();
		
		int page = web.getInt("page", 1);
		
		zone.setZoneName(keyword);
		zone.setZoneAddr(keyword);
		zone.setZoneLat(keyword);
		zone.setZoneLng(keyword);
		zone.setZoneRegion1Short(keyword);
		
		
		/**(4)게시글 목록 조회*/
		int totalCount = 0;
		List<Zone> zoneList = null;
		try{
			//전체 게시물 수
			totalCount = zoneService.selectZoneCount(zone);
			//나머지 페이지 번호 계싼하기
			//-->현재 페이지, 전체 게시물 수, 한페이지의 목록수, 
			pageHelper.pageProcess(page, totalCount, 15, 5);
			zone.setLimitStart(pageHelper.getLimitStart());
			zone.setListCount(pageHelper.getListCount());
			zoneList = zoneService.selectZoneList2(zone);
			
		}catch(Exception e){
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}finally{
			sqlSession.close();
		}
		System.out.println();
		
		/**(5)조회결과를 view에 전달 */
		request.setAttribute("zoneList", zoneList);
		request.setAttribute("keyword", keyword);
		request.setAttribute("pageHelper", pageHelper);
		
		
		return "admin/zone/zone_list";
	}

}
