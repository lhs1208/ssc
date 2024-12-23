package com.ssc.service;

import java.util.List;

import com.ssc.model.Document;

public interface DocumentService {
	
	/**하나의 게시물 저장 **/	
	public void insertDocument(Document document) throws Exception;

	/**하나의 게시물 읽어들인다 **/
	public Document selectDocument(Document document) throws Exception;
	
	/** 현재글을 기준으로 이전글을 읽어들인다. **/
	public Document selectPrevDocument(Document document) throws Exception;
	
	/** 현재글을 기준으로 다음글을 읽어들인다. **/
	public Document selectNextDocument(Document document) throws Exception;
	
	/**조회수 1 증가 **/
	public void updateDocumentHit(Document document) throws Exception;
	
	/**전체 게시글 목록 조회 **/
	public List<Document> selectDocumentList(Document document) throws Exception;
	
	/**전체 게시글 수 조회**/
	public int selectDocumentCount(Document document) throws Exception;
	
	/**자신의 게시물 확인*/
	public int selectDocumentCountByMemberId(Document document) throws Exception;
	
	/**자신의 비밀번호 확인*/
	public int selectDocumentCountByPw(Document document) throws Exception;
	
	/**자신의 게시물 삭제 */
	public void deleteDocument(Document document) throws Exception;
	
	/**자신의 게시물 수정 */
	public void updateDocument(Document document) throws Exception;
	
	/** 탈퇴시 게시물 처리	 */
	public void updateDocumentUserOut(Document document) throws Exception;
	
	
}
