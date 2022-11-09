package com.tech.repository.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tech.vo.CommentVO;

@Mapper
public interface CommentMapper {

	int insertComment(CommentVO vo);
	int deleteComment(int seq);
	List<CommentVO> getCommentListById(int seq);
	
	public List<CommentVO> CommentList(); 
	
	public List<CommentVO> Comment_name(String name); 
}
