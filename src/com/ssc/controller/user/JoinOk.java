package com.ssc.controller.user;

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
import com.ssc.model.User;
import com.ssc.service.UserService;
import com.ssc.service.impl.UserServiceImpl;

// 가입 처리를 위한 컨트롤러
@WebServlet("/join_ok.do")
public class JoinOk extends BaseController {
	private static final long serialVersionUID = 8930229621781174513L;

	/** 사용하고자 하는 Helper + Service 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	RegexHelper regex;
	UploadHelper upload;
	UserService userService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		regex = RegexHelper.getInstance();
		upload = UploadHelper.getInstance();
		userService = new UserServiceImpl(sqlSession, logger);

		/** (3) 로그인 여부 검사 */

		/** (4) 파일이 포함된 POST 파라미터 받기 */
		try {
			upload.multipartRequest(request);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, "multipart 데이터가 아닙니다.");
			return null;
		}
		// id, reg_date 회원가입날짜 , edit_date 회원정보수정날짜 제외 나머지 작성.
		Map<String, String> paramMap = upload.getParamMap();
		String uId = paramMap.get("u_id");
		String uPw = paramMap.get("u_pw");
		String uPwRe = paramMap.get("u_pw_re"); 
		String name = paramMap.get("user_name");
		String postcode = paramMap.get("postcode");
		String addr1 = paramMap.get("addr1");
		String addr2 = paramMap.get("addr2");
		String tel = paramMap.get("tel");
		String email = paramMap.get("email");
		String gender = paramMap.get("gender");
		String email_yn = paramMap.get("email_yn");
		String use_area = paramMap.get("use_area");
		String lic_num = paramMap.get("lic_num");
		
		String birthdate1 = paramMap.get("birthdate1");
		String birthdate2 = paramMap.get("birthdate2");
		String birthdate3 = paramMap.get("birthdate3");
		String birthdate = birthdate1 + "-" + birthdate2 + "-" + birthdate3;
		
		
		
		// 전달받은 파라미터는 값의 정상여부 확인을 위해서 로그로 확인
		logger.debug("uId=" + uId);
		logger.debug("uPw=" + uPw);
		logger.debug("name=" + name);
		logger.debug("postcode=" + postcode);
		logger.debug("addr1=" + addr1);
		logger.debug("addr2=" + addr2);
		logger.debug("tel=" + tel);
		logger.debug("email=" + email);
		logger.debug("gender=" + gender);
		logger.debug("email_yn=" + email_yn);
		logger.debug("use_area=" + use_area);
		logger.debug("lic_num=" + lic_num);
		logger.debug("user_Pw_Re=" + uPwRe);
		logger.debug("birthdate=" + birthdate);
		
		/** (5) 입력값의 유효성 검사 */
		// 아이디 검사
		if (!regex.isValue(uId)) {
			sqlSession.close();
			web.redirect(null, "아이디를 입력하세요.");
			return null;
		}

		if (!regex.isEngNum(uId)) {
			sqlSession.close();
			web.redirect(null, "아이디는 숫자와 영문의 조합으로 5자 이상 12자까지만 가능합니다.");
			return null;
		}

		if (uId.length() < 4 || uId.length() > 13) {
			sqlSession.close();
			web.redirect(null, "아이디는 숫자와 영문의 조합으로 5자 이상 12자까지만 가능합니다.");
			return null;
		}

		// 비밀번호 검사
		if (!regex.isValue(uPw)) {
			sqlSession.close();
			web.redirect(null, "비밀번호를 입력하세요.");
			return null;
		}

//		if (!regex.isPassword(uPw)) {
//			sqlSession.close();
//			web.redirect(null, "비밀번호는 특수문자,숫자,영문 조합으로 8자 이상 20자 이하만 가능합니다.");
//			return null;
//		}
//
//		if (uPw.length() < 7 || uPw.length() > 21) {
//			sqlSession.close();
//			web.redirect(null, "비밀번호는 특수문자,숫자,영문 조합으로 8자 이상 20자 이하만 가능합니다.");
//			return null;
//		}
		
		// 비밀번호 확인
		if(!uPwRe.equals(uPwRe)) {
			sqlSession.close();
			web.redirect(null, "비밀번호 확인이 잘못되었습니다.");
			return null;
		}

		/**
		 * // 비밀번호 확인 if (!userPw.equals(userPwRe)) { sqlSession.close();
		 * web.redirect(null, "비밀번호 확인이 잘못되었습니다."); return null; }
		 */

		// 이름 검사
		if (!regex.isValue(name)) {
			sqlSession.close();
			web.redirect(null, "이름을 입력하세요.");
			return null;
		}

		if (!regex.isKor(name)) {
			sqlSession.close();
			web.redirect(null, "이름은 한글만 입력 가능합니다.");
			return null;
		}

		if (name.length() < 2 || name.length() > 5) {
			sqlSession.close();
			web.redirect(null, "이름은 2~5글자 까지만 가능합니다.");
			return null;

		}

		// 이메일 검사
		if (!regex.isValue(email)) {
			sqlSession.close();
			web.redirect(null, "이메일을 입력하세요.");
			return null;
		}

		if (!regex.isEmail(email)) {
			sqlSession.close();
			web.redirect(null, "이메일의 형식이 잘못되었습니다.");
			return null;
		}

		// 연락처 검사
		if (!regex.isValue(tel)) {
			sqlSession.close();
			web.redirect(null, "연락처를 입력하세요.");
			return null;
		}

		if (!regex.isCellPhone(tel) && !regex.isTel(tel)) {
			sqlSession.close();
			web.redirect(null, "연락처의 형식이 잘못되었습니다.");
			return null;
		}

		// 성별검사
		if (!regex.isValue(gender)) {
			sqlSession.close();
			web.redirect(null, "성별을 입력하세요.");
			return null;
		}

		if (!gender.equals("M") && !gender.equals("F")) {
			sqlSession.close();
			web.redirect(null, "성별이 잘못되었습니다.");
			return null;
		}
		
		// 우편번호 및 주소
		if (!regex.isValue(postcode)) {
			sqlSession.close();
			web.redirect(null, "주소를 입력하세요.");
			return null;
		}
		if (!regex.isValue(addr1)) {
			sqlSession.close();
			web.redirect(null, "주소를 입력하세요.");
			return null;
		}
		if (!regex.isValue(addr2)) {
			sqlSession.close();
			web.redirect(null, "주소를 입력하세요.");
			return null;
		}

		

		// 프로필 이미지

		// 운전면허 정보

		/** (6) 업로드 된 파일 정보 추출 */
		List<FileInfo> fileList = upload.getFileList();
		// 업로드 된 프로필 사진 경로가 저장될 변수
		String profileImg = null;

		// 업로드 된 파일이 존재할 경우만 변수값을 할당한다.
		if (fileList.size() > 0) {
			// 단일 업로드이므로 0번째 항목만 가져온다.
			FileInfo info = fileList.get(0);
			profileImg = info.getFileDir() + "/" + info.getFileName();
		}

		// 파일경로를 로그로 기록
		logger.debug("profileImg=" + profileImg);

		/** (7) 전달받은 파라미터를 Beans 객체에 담는다. */
		User user = new User();
		user.setuId(uId);
		user.setuPw(uPw);
		user.setName(name);
		user.setPostcode(postcode);
		user.setAddr1(addr1);
		user.setAddr2(addr2);
		user.setTel(tel);
		user.setEmail(email);
		user.setGender(gender);
		user.setEmailYn(email_yn);
		user.setUseArea(use_area);
		user.setProfileImg(profileImg);
		user.setLicNum(lic_num);
		user.setBirthdate(birthdate);

		/** (8) Service를 통한 데이터베이스 저장 처리 */
		try {
			userService.insertUser(user);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			// 예외가 발생한 경우이므로 , 더이상 진행하지 않는다.
			return null;
		}

		/** (9) 가입이 완료되었으므로 메인페이지로 이동 */
		sqlSession.close();
		web.redirect(web.getRootPath() + "/index.do", "회원가입이 완료되었습니다.로그인 해 주세요.");

		return null;
	}

}
