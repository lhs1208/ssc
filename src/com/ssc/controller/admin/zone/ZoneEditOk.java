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

@WebServlet("/zone/zone_edit_ok.do")
public class ZoneEditOk extends BaseController {
	private static final long serialVersionUID = 5031644699964396505L;

	/** (1)사용하고자 하는 Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BBSCommon bbs;
	UploadHelper upload;
	RegexHelper regex;
	ZoneService zoneService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/**(2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		bbs = BBSCommon.getInstance();
		upload = UploadHelper.getInstance();
		regex = RegexHelper.getInstance();
		zoneService = new ZoneServiceImpl(sqlSession, logger);
		
		/**(3) 파일이 포함된 POST 파라미터 받기*/
		try{
			upload.multipartRequest(request);
		}catch(Exception e){
			sqlSession.close();
			web.redirect(null, "multipart 데이터가 아닙니다.");
			return null;
		}
		
		/**(4) UploadHelper에서 텍스트 형식의 값을 추출*/
		Map<String, String> paramMap = upload.getParamMap();
		
		//글 번호 가져오기 --> Map에서 가져오는 값은 모두 String 이므로 형변환 필요
		int zoneNum = 0;
		try{
			zoneNum = Integer.parseInt(paramMap.get("zone_num"));
		}catch(NumberFormatException e){
			sqlSession.close();
			web.redirect(null, "zone 번호가 올바르지 않습니다.");
			return null;
		}
		
		String zoneName = paramMap.get("zone_name");
		String zoneAddr = paramMap.get("zone_addr");
		String zoneLat = paramMap.get("zone_lat");
		String zoneLng = paramMap.get("zone_lng");
		String zoneRegion1Short = paramMap.get("zone_region1_short");
		
		
		/**(7) 로그인 한 경우 자신의 글이라면 입력하지 않은 정보를 세션 데이터로 대처한다. */
		//전달된 파라미터는 로그로 확인한다.
		logger.debug("zone_num=" + zoneNum);
		logger.debug("zone_name=" + zoneName);
		logger.debug("zone_addr=" + zoneAddr);
		logger.debug("zone_lat=" +zoneLat);
		logger.debug("zone_lng=" +zoneLng);
		logger.debug("zone_region1_short=" +zoneRegion1Short);
		
		/**(8) 입력 받은 파라미터에 대한 유효성 검사 */
		
		//제목 및 내용 검사
		if(!regex.isValue(zoneName)){
			sqlSession.close();
			web.redirect(null, "zoneName을 입력하세요.");
			return null;
		}
		
		if(!regex.isValue(zoneLat)){
			sqlSession.close();
			web.redirect(null, "위도를 입력하세요.");
			return null;
		}
		
		if(!regex.isValue(zoneLng)){
			sqlSession.close();
			web.redirect(null, "경도를 입력하세요.");
			return null;
		}
		
		if(!regex.isValue(zoneRegion1Short)){
			sqlSession.close();
			web.redirect(null, "도시를 입력하세요.");
			return null;
		}
		
		/**(9) 입력 받은 파라미터를 Beans로 묶기 */
		Zone zone = new Zone();
		//UPDATE문의 WHERE절에서 사용해야 하므로 글 번호 추가
		//-->글 번호는 숫자로 변환해서 처리해야 한다.
		zone.setNum(zoneNum);
		zone.setZoneAddr(zoneAddr);
		zone.setZoneName(zoneName);
		zone.setZoneLat(zoneLat);
		zone.setZoneLng(zoneLng);
		zone.setZoneRegion1Short(zoneRegion1Short);
		logger.debug(zone.toString());
		
		/**(10) 게시물 변경을 위한 Service 기능을 호출 */
		try{
			zoneService.updateZone(zone);
		}catch(Exception e){
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		
		/**(13) 모든 절차가 종료되었으므로 DB접속 해제 후 페이지 이동 */
		sqlSession.close();
		
		String url = "%s/zone/zone_read.do?zone_num=%d";
		url = String.format(url, web.getRootPath(), zoneNum);
		web.redirect(url, null);
		return null;
	}
}