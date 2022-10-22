
package com.tech.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tech.repository.mapper.BoardMapper;
import com.tech.service.interfaces.BoardService;
import com.tech.vo.BVO;
import com.tech.vo.BoardVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService {
	public static final Logger logger = LoggerFactory.getLogger(BoardServiceImpl.class);
	String success_msg = "성공", failed_msg = "실패", notFound_board_msg = "게시글을 찾을 수 없음";
	BoardMapper bMapper;

	@Autowired
	public BoardServiceImpl(BoardMapper bMapper) {
		this.bMapper = bMapper;
	}

	@Override
	public int createBoard(BVO vo) {
		if (bMapper.insertBoard(vo) == 1) {
			logger.info("insertBoard : "+success_msg);
			return ((BoardVO)vo).getB_seq();
		}else {
			logger.error("insertBoard : "+failed_msg);
			return 0;
		}
	}

	@Override
	public BVO getBoardById(int b_seq) {
		return bMapper.getBoardById(b_seq);
	}

	@Override
	public void deleteBoard(int b_seq) {
		if (bMapper.deleteBoard(b_seq) == 1) {
			logger.info("deleteBoard : "+success_msg);
		}else {
			logger.error("deleteBoard : "+failed_msg);
		}

	}

	@Override
	public List<BVO> getBoardList() {
		return bMapper.getBoardList();
	}

	@Override
	public List<BVO> getBoardListByCate(String b_category) {

		return bMapper.getBoardListByCate(b_category);
	}

	@Override
	public void updateBoard(BVO vo) {
		if(bMapper.updateBoard(vo) == 1) {
			logger.info("updateBoard : "+success_msg);
		}else {
			logger.error("updateBoard : "+failed_msg);
		}
	}

	@Override
	public void upViews(int seq) {
		if(bMapper.upViews(seq) == 1) {
			logger.info("upViews : "+success_msg);
		}else {
			logger.error("upViews : "+failed_msg);
		}
	}

	@Override
	public void upRecommend(int seq) {
		if(bMapper.upRecommend(seq) == 1) {
			logger.info("upRecommend : "+success_msg);
		}else {
			logger.error("upRecommend : "+failed_msg);
		}
	}

}
