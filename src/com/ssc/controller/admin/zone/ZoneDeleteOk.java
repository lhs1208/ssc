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
import com.ssc.helper.UploadHelper;
import com.ssc.helper.WebHelper;
import com.ssc.model.Zone;
import com.ssc.service.ZoneService;
import com.ssc.service.impl.ZoneServiceImpl;

@WebServlet("/zone/zone_delete_ok.do")
public class ZoneDeleteOk extends BaseController {
	private static final long serialVersionUID = 4388612747624869092L;
	
	/** (1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BBSCommon bbs;
	UploadHelper upload;
	ZoneService zoneService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		bbs = BBSCommon.getInstance();
		upload = UploadHelper.getInstance();
		zoneService = new ZoneServiceImpl(sqlSession, logger);
		
		/** (3) 게시글 번호와 비밀번호 받기 */
		int zoneNum = web.getInt("zone_num");
		
		logger.debug("zoneNum=" + zoneNum);
		
		if (zoneNum == 0) {
			sqlSession.close();
			web.redirect(null, "글 번호가 없습니다.");
			return null;
		}
		
		/** (4) 파라미터를 Beans로 묶기 */	
		Zone zone = new Zone();
		zone.setNum(zoneNum);
		
		/** (5) 데이터 삭제 처리 */
		try {
			zoneService.deleteZone(zone);	// 게시글 삭제
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		/** (6) 페이지 이동 */
		String url = "%s/zone/zone_list.do";
		url = String.format(url, web.getRootPath());
		web.redirect(url, "삭제되었습니다.");
		return null;
	}

}
