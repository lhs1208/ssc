package com.ssc.service;

import java.util.List;

import com.ssc.model.File;

public interface FileService {
	
	/**
	 * 파일 정보를 저장한다.
	 * @param file - 파일 데이터
	 * @throws Exception
	 */
	public void insertFile(File file) throws Exception;

	
	/**
	 * 하나의 게시물에 종속된 파일 목록을 조회한다
	 * @param file - 게시물 일렬번호를 저장하고 있는 Beans
	 * @return 파일데이터 컬렉션
	 * @throws Exception
	 */
	public List<File> selectFileList(File file) throws Exception;
	
	
	/**
	 * 하나의 게시물에 종속된 파일 목록을 삭제한다.
	 * @param document
	 * @throws Exception
	 */
	public void deleteFileAll(File file) throws Exception;
	
	/**
	 * 하나의 단일 파일에 대한 정보를 조회한다
	 * @param file
	 * @throws Exception
	 */
	public File selectFile(File file) throws Exception;
	
	/**
	 * 하나의 단일 파일에 대한 정보를 삭제한다
	 * @param file
	 * @throws Exception
	 */
	public void deleteFile(File file) throws Exception;
	
	
}
