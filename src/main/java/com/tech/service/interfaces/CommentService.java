package com.tech.service.interfaces;

import java.util.List;

import com.tech.vo.CommentVO;

public interface CommentService {

	void insertComment(CommentVO vo);
	void deleteComment(int seq);
	List<CommentVO> getCommentListById(int seq);
	
	public List<CommentVO> CommentList() throws Exception;
	
	public List<CommentVO> Comment_name(String name) throws Exception;
}
