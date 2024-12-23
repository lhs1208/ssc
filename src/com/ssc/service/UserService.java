package com.ssc.service;

import java.util.List;

import com.ssc.model.User;

/** 회원 관련 기능을 제공하기 위한 Service 계층 */
public interface UserService {
	
	/**
	 * 아이디 중복검사
	 * @param member - 아이디
	 * @throws Exception - 중복된 데이터인 경우 예외 발생함
	 */
	public void selectUserIdCount(User user) throws Exception;
	
	
	/**
	 * 아이디 찾기
	 * @param user
	 * @return
	 * @throws Exception
	 */
	public int selectuIdCount(User user) throws Exception;
	

	/**
	 * 이메일 중복검사
	 * @param member - 이메일
	 * @throws Exception - 중복된 데이터인 경우 예외 발생함
	 */
	public void selectEmailCount(User user) throws Exception;
	
	/**
	 * 회원가입(아이디, 이메일 중복검 사 후 가입철)
	 * @param member - 일렬번호, 가입일시, 변경일시를 제외한 모든 정보
	 * @throws Exception
	 */
	public void insertUser(User user) throws Exception;
	/**
	 * 로그인하기
	 * @param member
	 * @return
	 * @throws Exception
	 */
	public User selectLoginInfo(User user) throws Exception;
	/**
	 * 비밀번호 변경
	 * @param member - 이메일주소, 비밀번호
	 * @throws Exception
	 */
	public void updateUserPasswordByEmail(User user) throws Exception;

	
	/**
	 * 비밀번호 검사
	 * @param member
	 * @throws Exception
	 */
	public void selectUserPasswordCount(User user) throws Exception;
	
	/** 회원탈퇴 */
	public void deleteUser(User user) throws Exception;
	
	public void deleteUser2(User user) throws Exception;

	
	/**
	 * 회원정보 수정
	 * @param member
	 * @throws Exception
	 */
	public void updateUser(User user) throws Exception;
	/**
	 * 일련번호에 의한 회원정보 조회
	 * @param member
	 * @throws Exception
	 */
	public User selectUser(User user) throws Exception;
	
	
	/**
	 * 운전면허 중복 검사
	 * @param user
	 * @throws Exception
	 */
	public void selectLicenseCount(User usser) throws Exception;
	
	// 아이디 찾기
	public User selectFindId(User user) throws Exception;
	
	/** admin user 구문 추가 */
	public List<User> selectuIdList(User user) throws Exception;
	public int selectIdCount (User user) throws Exception;
	public User selectPrevUser(User user) throws Exception;
	public User selectNextUser(User user) throws Exception;
	
	
	
	
	
}
