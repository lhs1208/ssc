package com.ssc.service;

import java.util.List;

import com.ssc.model.Book;

public interface BookService {

	/**
	 * 예약 상세보기
	 */
	public Book selectBook(Book book) throws Exception;

	/**
	 * 예약 리스트 보기
	 */
	public List<Book> selectBookList(Book book) throws Exception;
	
	
	/**
	 * 예약 추가
	 */
	public void insertBook(Book book) throws Exception;

	/**
	 * 예약 수정
	 */
	public void updateBook(Book book) throws Exception;

	/**
	 * 예약 삭제
	 */
	public void deleteBook(Book book) throws Exception;
	
	/** 예약 카운트 검사 */
	public int selectBookCount(Book book) throws Exception; 
	
	/** 차 검색 관련 서비스 */
	public List<Book> selectBookList2(Book book) throws Exception;
	public List<Book> selectBookList3(Book book) throws Exception;
	
	/** 차로 예약 검색 */
	public List<Book> selectBookCar(Book book) throws Exception;
	
	/**참조*/
	public void updateBookUserOut(Book book) throws Exception;

}
