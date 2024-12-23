package com.ssc.service;

import java.util.List;

import com.ssc.model.Zone;

public interface ZoneService {

	/**
	 * 존 하나의 게시물 읽어옴
	 */
	public Zone selectZone(Zone zone) throws Exception;

	/**존 리스트 보기 */
	public List<Zone> selectZoneList(Zone zone) throws Exception;

	/**존 리스트 보기2 */
	public List<Zone> selectZoneList2(Zone zone) throws Exception;
	
	/**현재글을 기준으로 이전글을 읽어들인다. **/
	public Zone selectPrevZone(Zone zone) throws Exception;
	
	/**다음글 읽어들인다. **/
	public Zone selectNextZone(Zone zone) throws Exception;
	
	/**전체 게시글 수 조회 **/
	public int selectZoneCount(Zone zone) throws Exception;
	
	/**존 추가 */
	public void insertZone(Zone zone) throws Exception;

	/**존 수정 */
	public void updateZone(Zone zone) throws Exception;

	/**
	 * 존 삭제
	 */
	public void deleteZone(Zone zone) throws Exception;

}
