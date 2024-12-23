package com.ssc.controller.admin.zone;

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
import com.ssc.helper.WebHelper;
import com.ssc.model.Zone;
import com.ssc.service.ZoneService;
import com.ssc.service.impl.ZoneServiceImpl;

@WebServlet("/zone/zone_read.do")
public class ZoneRead extends BaseController {
	private static final long serialVersionUID = 5111524750336102572L;
	
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BBSCommon bbs;
	ZoneService zoneService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		bbs = BBSCommon.getInstance();
		zoneService = new ZoneServiceImpl(sqlSession, logger);
		
		/**(3)글 번호  파라미터 받기 */
		int zoneNum = web.getInt("zone_num");
		logger.debug("zoneNum=" + zoneNum);
		
		if(zoneNum == 0) {
			web.redirect(null, "글 번호가 지정되지 않았습니다.");
			sqlSession.close();
			return null;
		}
		
		Zone zone = new Zone();
		zone.setNum(zoneNum);
		logger.debug("zoneNum=" + zoneNum);
		
		Zone readZone = null;
		Zone prevZone = null;
		Zone nextZone = null;
		
		String cookieKey = "zone_" + zoneNum;
		String cookieVar = web.getCookie(cookieKey);
		
		try{
			if(cookieVar == null){
				web.setCookie(cookieKey, "Y", 60*60*24);
			}
			
			readZone = zoneService.selectZone(zone);
			prevZone = zoneService.selectPrevZone(zone);
			nextZone = zoneService.selectNextZone(zone);
			
		}catch(Exception e){
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}finally {
			sqlSession.close();
		}
		
		/**읽은 데이터를 View 에게 전달한다. */
		request.setAttribute("readZone", readZone);
		request.setAttribute("prevZone", prevZone);
		request.setAttribute("nextZone", nextZone);
		
		
		return "admin/zone/zone_read";
	}
}






