package com.ssc.service;


import java.util.List;

import com.ssc.model.Car;




public interface CarService {

	/**
	 * 차 상세보기
	 */
	public Car selectCar(Car car) throws Exception;

	/**
	 * 차 리스트 보기
	 */
	public List<Car> selectCarList(Car car) throws Exception;

	/**
	 * 차 추가
	 */
	public void insertCar(Car car) throws Exception;

	/**
	 * 차 수정
	 */
	public void updateCar(Car car) throws Exception;

	/**
	 * 차 삭제
	 */
	public void deleteCar(Car car) throws Exception;

	
	/**전체 게시글 수 조회 **/
	public int selectCarCount(Car car) throws Exception;
	
	/** 특정 존에 소속된 차 조회 */ 
	public List<Car> selectCarZone(Car car) throws Exception;

	/** 차 검색 관련 서비스 */
	public List<Car> selectCarList2(Car car) throws Exception;
	
	/** 이전글 */
	public Car selectPrevCar(Car car) throws Exception;
	
	/** 다음글 */
	public Car selectNextCar(Car car) throws Exception;
}
