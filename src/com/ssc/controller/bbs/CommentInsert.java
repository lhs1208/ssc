package com.ssc.controller.bbs;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.ssc.dao.MyBatisConnectionFactory;
import com.ssc.helper.BaseController;
import com.ssc.helper.RegexHelper;
import com.ssc.helper.WebHelper;
import com.ssc.model.Comment;
import com.ssc.model.User;
import com.ssc.service.CommentService;
import com.ssc.service.impl.CommentServiceImpl;

@WebServlet("/bbs/comment_insert.do")
public class CommentInsert extends BaseController {

    private static final long serialVersionUID = -5942065365179911350L;

    Logger logger; // 로그 선언
    SqlSession sqlSession; // SqlSession 선언
    WebHelper web; // 웹펠퍼 선언
    RegexHelper regex; // RegexHelper 선언
    CommentService commentService; // 서비스 선언

    @Override
    public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    response.setContentType("application/json");
    	
	logger = LogManager.getFormatterLogger(request.getRequestURI());
	sqlSession = MyBatisConnectionFactory.getSqlSession();
	web = WebHelper.getInstance(request, response);
	regex = RegexHelper.getInstance();
	commentService = new CommentServiceImpl(sqlSession, logger);

	// 파라미터 수신
	int documentId = web.getInt("document_id");
	String writerName = web.getString("writer_name");
	String writerPw = web.getString("writer_pw");
	String email = web.getString("email");
	String content = web.getString("content");
	String ipAddress = web.getClientIP();

	// 유저번호 선언및 초기화
	int userId = 0;

	// 로그인의 경우 세션정보 대체
	User loginInfo = (User) web.getSession("loginInfo");
	if (loginInfo != null) {
	    writerName = loginInfo.getName();
	    email = loginInfo.getEmail();
	    writerPw = loginInfo.getuPw();
	    userId = loginInfo.getId();
	}

	// 로그 확인
	logger.debug("document_id=" + documentId);
	logger.debug("writer_name=" + writerName);
	logger.debug("writer_pw=" + writerPw);
	logger.debug("email=" + email);
	logger.debug("content=" + content);
	logger.debug("ipAddress=" + ipAddress);
	logger.debug("userId=" + userId);

	// 유효성 검사
	if (documentId == 0) {
	    sqlSession.close();
	    web.printJsonRt("게시글이 없습니다.");
	    return null;
	}

	// 이름 + 비밀번호
	if (!regex.isValue(writerName)) {
	    sqlSession.close();
	    web.printJsonRt("작성자 이름을 입력하세요.");
	    return null;
	}

	if (!regex.isValue(writerPw)) {
	    sqlSession.close();
	    web.printJsonRt("비밀번호를 입력하세요.");
	    return null;
	}

	// 이메일
	if (!regex.isValue(email)) {
	    sqlSession.close();
	    web.printJsonRt("이메일을 입력하세요.");
	    return null;
	}

	if (!regex.isEmail(email)) {
	    sqlSession.close();
	    web.printJsonRt("이메일의 형식이 잘못되었습니다.");
	    return null;
	}

	// 내용검사
	if (!regex.isValue(content)) {
	    sqlSession.close();
	    web.printJsonRt("내용을 입력하세요.");
	    return null;
	}

	// 파라미터 빈즈 셋팅
	Comment comment = new Comment();
	comment.setDocumentId(documentId);
	comment.setWriterName(writerName);
	comment.setWriterPw(writerPw);
	comment.setEmail(email);
	comment.setContent(content);
	comment.setIpAddress(ipAddress);
	comment.setUserId(userId);
	logger.debug("comment빈즈 = " + comment.toString());

	// 서비스 실행
	Comment item = null;
	try {
	    commentService.insertComment(comment);
	    item = commentService.selectComment(comment);
	} catch (Exception e) {
	    web.printJsonRt(e.getLocalizedMessage());
	    return null;
	} finally {
	    sqlSession.close();
	}

	// 제이슨 출력
	// 줄바꿈이나 HTML특수문자에 대한 처리
	item.setWriterName(web.convertHtmlTag(item.getWriterName()));
	item.setEmail(web.convertHtmlTag(item.getEmail()));
	item.setContent(web.convertHtmlTag(item.getContent()));

	Map<String, Object> data = new HashMap<String, Object>();
	data.put("rt", "OK");
	data.put("item", item);

	ObjectMapper mapper = new ObjectMapper();
	mapper.writeValue(response.getWriter(), data);

	return null;
    }

}
