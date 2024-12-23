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

@WebServlet("/zone/zone_edit.do")
public class ZoneEdit extends BaseController {
	private static final long serialVersionUID = -5908066433524607963L;
	
	/**(1)사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BBSCommon bbs;
	ZoneService zoneService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/**(2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		bbs = BBSCommon.getInstance();
		zoneService = new ZoneServiceImpl(sqlSession, logger);
		
		/**(5)글 번호 파라미터 받기 */
		int zoneNum = web.getInt("zone_num");
		logger.debug("zoneNum=" + zoneNum);
		
		if(zoneNum == 0){
			web.redirect(null, "zone 번호가 지정되지 않았습니다.");
			sqlSession.close();
			return null;
		}
		
		//파라미터를 Beans로 묶기
		Zone zone = new Zone();
		zone.setNum(zoneNum);
		logger.debug("zoneNum=" + zoneNum);
		
		/**(6)게시물 일련번호를 사용한 데이터 조회 */
		//지금 읽고 있는 게시물이 저장될 객체
		Zone readZone = null;
		
		try{
			readZone = zoneService.selectZone(zone);
		}catch(Exception e){
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}finally{
			sqlSession.close();
		}
		
		/**(7)읽은 데이터를 View에게 전달한다.*/
		request.setAttribute("readZone", readZone);

		return "admin/zone/zone_edit";
	}
}