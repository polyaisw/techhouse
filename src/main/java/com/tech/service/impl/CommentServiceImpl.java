package com.tech.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tech.repository.mapper.CommentMapper;
import com.tech.service.interfaces.CommentService;
import com.tech.vo.CommentVO;

@Service("commentService")
public class CommentServiceImpl implements CommentService {
	public static final Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);
	String success_msg = "성공", failed_msg = "실패", notFound_comment_msg = "댓글을 찾을 수 없음";
	CommentMapper cMapper;
	
	
	
	@Autowired
	public CommentServiceImpl(CommentMapper cMapper) {
		super();
		this.cMapper = cMapper;
	}

	@Override
	public void insertComment(CommentVO vo) {
		
		if (cMapper.insertComment(vo) == 1) {
			logger.info("insertComment : "+success_msg);
		}else {
			logger.error("insertComment : "+failed_msg);
		}
		
	}

	@Override
	public void deleteComment(int c_seq) {	//댓글 시퀀스
		if (cMapper.deleteComment(c_seq) == 1) {
			logger.info("deleteComment : "+success_msg);
		}else {
			logger.error("deleteComment : "+failed_msg);
		}
	}

	@Override
	public List<CommentVO> getCommentListById(int b_seq) {
		return cMapper.getCommentListById(b_seq);	//보드 시퀀스
		
	}

}
