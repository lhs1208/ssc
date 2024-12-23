package com.ssc.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import com.ssc.model.User;
import com.ssc.service.UserService;

public class UserServiceImpl implements UserService {

	/** 처리 결과를 기록할 Log4j 객체 생성 */
	Logger logger;
	SqlSession sqlSession;

	public UserServiceImpl(SqlSession sqlSession, Logger logger) {
		this.sqlSession = sqlSession;
		this.logger = logger;
	}

	@Override // 아이디 예외처리
	public void selectUserIdCount(User user) throws Exception {
		try {
			int result = sqlSession.selectOne("UserMapper.selectuIdCount", user);

			if (result > 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("이미 사용중인 아이디 입니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("아이디 중복검사에 실패했습니다.");
		}

	}
	
	

	@Override // 이메일 예외처리
	public void selectEmailCount(User user) throws Exception {
		try {
			int result = sqlSession.selectOne("UserMapper.selectEmailCount", user);

			if (result > 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("이미 사용중인 이메일 입니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("이메일 중복검사에 실패했습니다.");
		}

	}

	@Override // 아이디 이메일 중복검사 예외처리
	public void insertUser(User user) throws Exception {
		selectUserIdCount(user);
		selectEmailCount(user);

		// 데이터 저장처리 = 가입
		// not null 로 설정된 값이 설정되지 않았다면 예외 발생됨.
		try {
			int result = sqlSession.insert("UserMapper.insertUser", user);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("저장된 회원정보가 없습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("회원가입에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}

	}

	@Override // 조회된 로그인 정보 예외처리
	public User selectLoginInfo(User user) throws Exception {
		User result = null;

		try {
			result = sqlSession.selectOne("UserMapper.selectLoginInfo", user);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("아이디나 비밀번호가 잘못되었습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("로그인에 실패했습니다.");
		}
		return result;
	}

	@Override // 비번,이메일 수정
	public void updateUserPasswordByEmail(User user) throws Exception {
		try {
			int result = sqlSession.update("UserMapper.updateUserPasswordByEmail", user);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("가입된 이메일이 아닙니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("비밀번호 변경에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}

	}

	@Override // 회원번호,비밀번호 일치 예외처리
	public void selectUserPasswordCount(User user) throws Exception {
		try {
			int result = sqlSession.selectOne("UserMapper.selectUserPasswordCount",user);
			
			if(result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("잘못된 비밀번호 입니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("비밀번호 검사에 실패했습니다.");
		}

	}

	@Override // 삭제예외처리
	public void deleteUser(User user) throws Exception {
		try {
			int result = sqlSession.delete("UserMapper.deleteUser",user);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch(NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("이미 탈퇴한 회원입니다.");
		} catch(Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("회원탈퇴에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}

	}

	@Override // 회원정보 수정
	public void updateUser(User user) throws Exception {
		try {
			int result = sqlSession.update("UserMapper.updateUser",user);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch(NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("변경된 회원정보가 없습니다.");
		} catch(Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("회원정보 수정에 실패했습니다.");
		} finally{
			sqlSession.commit();
		}

	}

	@Override // 회원검색 예외처리
	public User selectUser(User user) throws Exception {
		User result = null;
		try {
			result = sqlSession.selectOne("UserMapper.selectUser",user);
			if (result == null) {
				throw new NullPointerException();
			}
		} catch(NullPointerException e) {
			throw new Exception("조회된 정보가 없습니다.");
		} catch(Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("회원정보 조회에 실패했습니다.");
		}
		return result;
	}

	@Override	// 운전면허 예외처리
	public void selectLicenseCount(User user) throws Exception {
		try {
			int result = sqlSession.selectOne("UserMapper.selectLicenseCount",user);
			
			if(result > 0) {
				throw new NullPointerException();
			}
		} catch(NullPointerException e) {
			throw new Exception("이미 사용중인 운전면허 입니다.");
		} catch(Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("운전면허 중복검사에 실패했습니다."	);
		}

	}

	@Override
	public int selectuIdCount(User user) throws Exception {
	    int result = 0;
	    try{
	    	result = sqlSession.selectOne("UserMapper.selectuIdCount", user);
	    } catch(Exception e){
			logger.error(e.getLocalizedMessage());
			throw new Exception("아이디 중복검사에 실패");
	    }
	    return result;
	}
	
	/**admin **/
	
	
	@Override
	public List<User> selectuIdList(User user) throws Exception {
		List<User> result = null;
		try{
		    result = sqlSession.selectList("UserMapper.selectuIdList", user);
		    if(result == null){
			throw new NullPointerException();
		    }
		}catch(NullPointerException e){
		    throw new Exception("조회된 존 id가 없습니다.");
		}catch(Exception e){
		    logger.error(e.getLocalizedMessage());
		    throw new Exception("id 목록 조회에 실패했습니다.");
		}
		return result;
	    }

	@Override
	public int selectIdCount(User user) throws Exception {
		int result = 0;
		try {
			result = sqlSession.selectOne("UserMapper.selectIdCount", user);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 수 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public User selectPrevUser(User user) throws Exception {
		User result = null;
		try {
			result = sqlSession.selectOne("UserMapper.selectPrevUser", user);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("이전글 조회에 실패했습니다.");
		}
		return result;
	}
	
	
	@Override
	public User selectNextUser(User user) throws Exception {
		User result = null;
		try {
			result = sqlSession.selectOne("UserMapper.selectNextUser", user);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("다음글 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public void deleteUser2(User user) throws Exception {
		try {
			int result = sqlSession.delete("UserMapper.deleteUser2",user);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch(NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("이미 탈퇴한 회원입니다.");
		} catch(Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("회원탈퇴에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
	}

	@Override
	public User selectFindId(User user) throws Exception {
		User result = null;
		try {
			result = sqlSession.selectOne("UserMapper.selectFindId", user);
		} catch (NullPointerException e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("Null");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("회원조회에 실패했습니다.");
		}
		return result;
	}

	

}
