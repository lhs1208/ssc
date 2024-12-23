package com.ssc.service;

import java.util.List;

import com.ssc.model.Comment;

public interface CommentService {
	
	/** 댓글 추가 */
	public void insertComment(Comment comment) throws Exception;
	
	/** 하나의 댓글 읽기 */
	public Comment selectComment(Comment comment) throws Exception;
	
	/** 하나의 게시물에 속한 여러개의 댓글 읽기 */
	public List<Comment> selectCommentList(Comment comment) throws Exception;

	/**자신의 댓글인지 검사한다 */
	public int selectCommentCountByUserId(Comment comment) throws Exception;
	
	/**비밀번호를 검사한다.*/
	public int selectCommentCountByPw(Comment comment) throws Exception;
	
	/** 댓글 삭제 */
	public void deleteComment(Comment comment) throws Exception;
		
	/** 댓글 수정 */
	public void updateComment(Comment comment) throws Exception;

	/**특정 게시물에 속한 몯느 덧글을 삭제한다.*/
	public void deleteCommentAll(Comment comment) throws Exception;
	
	/**회원과 댓글간의 참조관계를 해제한다. */
	public void updateCommentUserOut(Comment comment) throws Exception;

}
