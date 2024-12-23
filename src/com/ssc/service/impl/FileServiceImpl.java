package com.ssc.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import com.ssc.model.File;
import com.ssc.service.FileService;

public class FileServiceImpl implements FileService {

	/** 처리 결과를 기록할 Log4J 객체 생성 */
	Logger logger;
	/** MyBatis */
	SqlSession sqlSession;
	
	public FileServiceImpl(SqlSession sqlSession, Logger logger) {
		this.sqlSession = sqlSession;
		this.logger = logger;
	}

	@Override
	public void insertFile(File file) throws Exception {
		try{
			int result = sqlSession.insert("FileMapper.insertFile", file);
			if(result == 0){
				throw new NullPointerException();
			}
		}catch(NullPointerException e){
			sqlSession.rollback();
			throw new Exception("저장된 파일정보가 없습니다.");
		}catch(Exception e){
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("파일정보 등록에 실패했습니다.");
		}finally{
			sqlSession.commit();
		}
		
	}

	@Override
	public List<File> selectFileList(File file) throws Exception {
		List<File> result = null;
		try{
			result = sqlSession.selectList("FileMapper.selectFileList", file);
		}catch(Exception e){
			logger.error(e.getLocalizedMessage());
			throw new Exception("파일 정보 조회에 실패햇습니다.");
		}
		return result;
	}

	@Override
	public void deleteFileAll(File file) throws Exception {
		try{
			sqlSession.delete("FileMapper.deleteFileAll", file);
		}catch(Exception e){
			sqlSession.rollback();
			throw new Exception("첨부파일 정보 삭제에 실패했습니다.");
		}
	}

	@Override
	public File selectFile(File file) throws Exception {
		File result = null;
		try{
			result = sqlSession.selectOne("Filemapper.selectFile", file);
			if(result == null){
				throw new NullPointerException();
			}
		}catch(NullPointerException e){
			sqlSession.rollback();
			throw new Exception("존재하지 않는 파일에 대한 요청입니다.");
		}catch(Exception e){
			logger.error(e.getLocalizedMessage());
			throw new Exception("파일 정보 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public void deleteFile(File file) throws Exception {
		try{
			int result = sqlSession.delete("FileMapper.deleteFile", file);
			if(result == 0){
				throw new NullPointerException();
			}
		}catch(NullPointerException e){
			sqlSession.rollback();
			throw new Exception("삭제된 파일 정보가 없습니다.");
		}catch(Exception e){
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("첨부파일 정보 삭제에 실패했습니다.");
		}finally{
			sqlSession.commit();
		}
	}
}
