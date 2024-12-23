package com.ssc.controller.admin.zone;

import java.io.IOException;
import java.util.Map;

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
import com.ssc.helper.RegexHelper;
import com.ssc.helper.UploadHelper;
import com.ssc.helper.WebHelper;
import com.ssc.model.Zone;
import com.ssc.service.ZoneService;
import com.ssc.service.impl.ZoneServiceImpl;

@WebServlet("/zone/zone_write_ok.do")
public class ZoneWriteOk extends BaseController {
	private static final long serialVersionUID = -7469249367927776896L;

	/** (1) 사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BBSCommon bbs;
	UploadHelper upload;
	RegexHelper regex;
	ZoneService zoneService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		bbs = BBSCommon.getInstance();
		upload = UploadHelper.getInstance();
		regex = RegexHelper.getInstance();
		zoneService = new ZoneServiceImpl(sqlSession, logger);
		
		/** (3) 파일이 포함된 POST 파라미터 받기 */
		try {
			upload.multipartRequest(request);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, "multipart 데이터가 아닙니다.");
			return null;
		}
		
		/** (4) UploadHelper에서 텍스트 형식의 값을 추출 */
		Map<String, String> paramMap = upload.getParamMap();
		String zoneName = paramMap.get("zone_name");
		String zoneAddr = paramMap.get("zone_addr");
		String zoneLat = paramMap.get("zone_lat");
		String zoneLng = paramMap.get("zone_lng");
		String zoneRegion1Short = paramMap.get("zone_region1_short");

		logger.debug("zone_name=" + zoneName);
		logger.debug("zone_addr=" + zoneAddr);
		logger.debug("zone_lat=" + zoneLat );
		logger.debug("zone_lng=" + zoneLng);
		logger.debug("zone_region1_short="  + zoneRegion1Short);


		/** (5) 입력 받은 파라미터에 대한 유효성 검사 */
		if (!regex.isValue(zoneName)) {
			sqlSession.close();
			web.redirect(null, "zoneName 입력하세요.");
			return null;
		}

		if (!regex.isValue(zoneAddr)) {
			sqlSession.close();
			web.redirect(null, "Zoneaddr을 입력하세요.");
			return null;
		}
		
		if (!regex.isValue(zoneLat)) {
			sqlSession.close();
			web.redirect(null, "ZoneLat을 입력하세요.");
			return null;
		}
		
		if (!regex.isValue(zoneLng)) {
			sqlSession.close();
			web.redirect(null, "ZoneLng을 입력하세요.");
			return null;
		}
		
		if (!regex.isValue(zoneRegion1Short)) {
			sqlSession.close();
			web.redirect(null, "도시이름을 입력하세요.");
			return null;
		}
		
		/** (6) 입력 받은 파라미터를 Beans로 묶기 */
		Zone zone = new Zone();
		zone.setZoneName(zoneName);
		zone.setZoneAddr(zoneAddr);
		zone.setZoneLat(zoneLat);
		zone.setZoneLng(zoneLng);
		zone.setZoneRegion1Short(zoneRegion1Short);
		logger.debug("zone >> " + zone.toString());

		/** (7) Service를 통한 게시물 저장 */
		try {
				zoneService.insertZone(zone);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		
		/** (8) 저장 완료 후 읽기 페이지로 이동하기 */
		// 읽어들일 게시물을 식별하기 위한 게시물 일련번호값을 전달해야 한다.
		String url = "%s/zone/zone_read.do?zone_num=%d";
		url = String.format(url, web.getRootPath(), zone.getNum());
		web.redirect(url, null);
		return null;
	}
}