package com.ssc.controller.mypage;

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

@WebServlet("/edit_ok.do")
public class EditOk extends BaseController {

    private static final long serialVersionUID = 2795858844506132691L;

    Logger logger;
    SqlSession sqlSession;
    WebHelper web;
    RegexHelper regex;
    UploadHelper upload;
    UserService userService;

    @Override
    public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	logger = LogManager.getFormatterLogger(request.getRequestURI());
	sqlSession = MyBatisConnectionFactory.getSqlSession();
	web = WebHelper.getInstance(request, response);
	regex = RegexHelper.getInstance();
	upload = UploadHelper.getInstance();
	userService = new UserServiceImpl(sqlSession, logger);

	// 로그인 검사
	User loginInfo = (User) web.getSession("loginInfo");

	if (loginInfo == null) {
	    sqlSession.close();
	    web.redirect(web.getRootPath() + "/index.do", "로그인 후에 이용 가능합니다.");
	    return null;
	}

	try {
	    upload.multipartRequest(request);
	} catch (Exception e) {
	    sqlSession.close();
	    web.redirect(null, "multipart 데이터가 아닙니다.");
	    return null;
	}

	// 맵에 값 추출
	Map<String, String> paramMap = upload.getParamMap();
	String uPw = paramMap.get("u_pw");
	String newUPw = paramMap.get("new_u_pw");
	String newUPwRe = paramMap.get("new_u_pw_re");
	String name = paramMap.get("name");
	String email = paramMap.get("email");
	String tel = paramMap.get("tel");
	String gender = paramMap.get("gender");
	String postcode = paramMap.get("postcode");
	String addr1 = paramMap.get("addr1");
	String addr2 = paramMap.get("addr2");
	String imgDel = paramMap.get("img_del");
	String emailYn = paramMap.get("email_yn");
	String useArea = paramMap.get("use_area");
	String licNum = paramMap.get("lic_num");

	logger.debug("uPw=" + uPw);
	logger.debug("newUPw=" + newUPw);
	logger.debug("newUPwRe=" + newUPwRe);
	logger.debug("name=" + name);
	logger.debug("email=" + email);
	logger.debug("tel=" + tel);
	logger.debug("gender=" + gender);
	logger.debug("postcode=" + postcode);
	logger.debug("addr1=" + addr1);
	logger.debug("addr2=" + addr2);
	logger.debug("imgDel=" + imgDel);
	logger.debug("emailYn=" + emailYn);
	logger.debug("useArea=" + useArea);
	logger.debug("licNum=" + licNum);
	
	/** 유효성 검사 */

	// 현재 비밀번호 검사
	if (!regex.isValue(uPw)) {
	    sqlSession.close();
	    web.redirect(null, "현재 비밀번호를 입력하세요.");
	    return null;
	}

	if (regex.isValue(newUPw)) {
	    if (newUPw.length() > 21 || newUPw.length() < 7) {
			sqlSession.close();
			web.redirect(null, "비밀번호는 특수문자,숫자,영문 조합으로 8자 이상 20자 이하만 가능합니다.");
			return null;
	    }
	    
	    if (!regex.isPassword(newUPw)) {
			sqlSession.close();
			web.redirect(null, "비밀번호는 특수문자,숫자,영문 조합으로 8자 이상 20자 이하만 가능합니다.");
			return null;
		}

	    // 비밀번호 확인
	    if (!newUPw.equals(newUPwRe)) {
		sqlSession.close();
		web.redirect(null, "비밀번호 확인이 잘못되었습니다.");
		return null;
	    }
	}

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

	

	// 성별 검사
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
	
	

	/** 6) 프로필 사진의 삭제가 요청된 경우 */
	if (regex.isValue(imgDel) && imgDel.equals("Y")) {
	    // 세션에 보관되어 있는 이미지 경로를 취득
	    upload.removeFile(loginInfo.getProfileImg());
	}
	
	/** 업로드 파일 정보 추출 */
	
	List<FileInfo> fileList = upload.getFileList();
	String profileImg = null;
	
	if(fileList.size() > 0){
	    // 단일 업로드이므로 0번째 항목만 가져온다.
	    FileInfo info = fileList.get(0);
	    profileImg = info.getFileDir() + "/" + info.getFileName();
	}
	
	logger.debug("profileImg=" + profileImg);
	
	// 빈즈 셋팅
	User user = new User();
	user.setId(loginInfo.getId());
	user.setuPw(uPw);
	user.setName(name);
	user.setEmail(email);
	user.setTel(tel);
	user.setGender(gender);
	user.setPostcode(postcode);
	user.setAddr1(addr1);
	user.setAddr2(addr2);
	user.setNewUPw(newUPw);
	user.setEmailYn(emailYn);
	user.setUseArea(useArea);
	user.setLicNum(licNum);
	
	if(profileImg != null){
	    user.setProfileImg(profileImg);
	}else if(profileImg == null){
	    if(imgDel != null && imgDel.equals("Y")){
		user.setProfileImg("");
	    }
	}
	
	// 서비스
	User editInfo = null;
	try{
	    userService.selectUserPasswordCount(user);
	    userService.updateUser(user);
	    editInfo = userService.selectUser(user);
	}catch(Exception e){
	    web.redirect(null, e.getLocalizedMessage());
	    return null;
	}finally{
	    sqlSession.close();
	}

	if(imgDel != null && imgDel.equals("Y")){
	    web.removeCookie("profileThumbnail");
	}
	
	// 프로필 이미지가 있을 경우 썸네일을 생성하여 쿠키에 별도로 저장
	String newProfileImg = editInfo.getProfileImg();
	if(newProfileImg != null){
	    try{
		String profileThumbnail = upload.createThumbnail(newProfileImg, 40, 40, true);
		web.setCookie("profileThumbnail", profileThumbnail, -1);
	    }catch(Exception e){
		web.redirect(null, e.getLocalizedMessage());
		return null;
	    }
	}
	
	// 세션을 갱신한다.
	web.removeSession("loginInfo");
	web.setSession("loginInfo", editInfo);
	/**11) 수정이 완료 되었으므로 다시 수정 페이지로 이동 */
	web.redirect(web.getRootPath() + "/index.do", "수정되었습니다.");
	
	
	return null;
    }

}
