package com.ssc.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import com.ssc.model.Zone;
import com.ssc.service.ZoneService;

public class ZoneServiceImpl implements ZoneService {
    
    /** 로그 객체 생성 */
    Logger logger;
    /** 마이바티스 */
    SqlSession sqlSession;
    /** 생성자를 통한 객체 생성 */
    public ZoneServiceImpl(SqlSession sqlSession, Logger logger) {
	this.sqlSession = sqlSession;
	this.logger = logger;
    }

    @Override
    public Zone selectZone(Zone zone) throws Exception {
	Zone result = null;
	try{
	    result = sqlSession.selectOne("ZoneMapper.selectZone", zone);
	    if(result == null){
		throw new NullPointerException();
	    }
	}catch(NullPointerException e){
	    throw new Exception("조회된 존이 없습니다.");
	}catch(Exception e){
	    logger.error(e.getLocalizedMessage());
	    throw new Exception("존 조회에 실패했습니다.");
	}
	
	return result;
    }

    @Override
    public List<Zone> selectZoneList(Zone zone) throws Exception {
	List<Zone> result = null;
	try{
	    result = sqlSession.selectList("ZoneMapper.selectZoneList", zone);
	    if(result == null){
		throw new NullPointerException();
	    }
	}catch(NullPointerException e){
	    throw new Exception("조회된 존 목록이 없습니다.");
	}catch(Exception e){
	    logger.error(e.getLocalizedMessage());
	    throw new Exception("존 목록 조회에 실패했습니다.");
	}
	return result;
    }

    @Override
    public void insertZone(Zone zone) throws Exception {
	try{
	    int result = sqlSession.insert("ZoneMapper.insertZone", zone);
	    if(result == 0){
		throw new NullPointerException();
	    }
	}catch(NullPointerException e){
	    sqlSession.rollback();
	    throw new Exception("저장된 존이 없습니다.");
	}catch(Exception e){
	    sqlSession.rollback();
	    logger.error(e.getLocalizedMessage());
	    throw new Exception("존 등록에 실패했습니다");
	}finally{
	    sqlSession.commit();
	}

    }

    @Override
    public void updateZone(Zone zone) throws Exception {
	try{
	    int result = sqlSession.update("ZoneMapper.updateZone", zone);
	    if(result == 0){
		throw new NullPointerException();
	    }
	}catch(NullPointerException e){
	    sqlSession.rollback();
	    throw new Exception("존재하지 않는 존에 대한 요청입니다.");
	}catch(Exception e){
	    sqlSession.rollback();
	    logger.error(e.getLocalizedMessage());
	    throw new Exception("존 수정에 실패했습니다.");
	}finally{
	    sqlSession.commit();
	}

    }

    @Override
    public void deleteZone(Zone zone) throws Exception {
	try{
	    int result = sqlSession.delete("ZoneMapper.deleteZone", zone);
	    if(result == 0){
		throw new NullPointerException();
	    }
	}catch(NullPointerException e){
	    sqlSession.rollback();
	    throw new Exception("존재하지 않는 존입니다");
	}catch(Exception e){
	    sqlSession.rollback();
	    logger.error(e.getLocalizedMessage());
	    throw new Exception("존 삭제에 실패했습니다.");
	}finally{
	    sqlSession.commit();
	}

    }

	@Override
	public Zone selectPrevZone(Zone zone) throws Exception {
		Zone result = null;
		try {
			result = sqlSession.selectOne("ZoneMapper.selectPrevZone", zone);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("이전글 조회에 실패했습니다.");
		}
		return result;
	}


	@Override
	public Zone selectNextZone(Zone zone) throws Exception {
		Zone result = null;
		try {
			result = sqlSession.selectOne("ZoneMapper.selectNextZone", zone);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("다음글 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public int selectZoneCount(Zone zone) throws Exception {
		int result = 0;
		try {
			result = sqlSession.selectOne("ZoneMapper.selectZoneCount", zone);
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 수 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public List<Zone> selectZoneList2(Zone zone) throws Exception {
		List<Zone> result = null;
		try{
		    result = sqlSession.selectList("ZoneMapper.selectZoneList2", zone);
		    if(result == null){
			throw new NullPointerException();
		    }
		}catch(NullPointerException e){
		    throw new Exception("조회된 존 목록이 없습니다.");
		}catch(Exception e){
		    logger.error(e.getLocalizedMessage());
		    throw new Exception("존 목록 조회에 실패했습니다.");
		}
		return result;
	    }
}
