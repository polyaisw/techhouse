
package com.tech.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tech.repository.mapper.BoardMapper;
import com.tech.repository.mapper.TradeMapper;
import com.tech.service.interfaces.BoardService;
import com.tech.service.interfaces.TradeService;
import com.tech.vo.BVO;
import com.tech.vo.BoardVO;
import com.tech.vo.TradeVO;

@Service("tradeService")
public class TradeServiceImpl implements TradeService {
	public static final Logger logger = LoggerFactory.getLogger(TradeServiceImpl.class);
	String success_msg = "성공", failed_msg = "실패", notFound_board_msg = "게시글을 찾을 수 없음";

	TradeMapper tMapper;

	@Autowired
	public TradeServiceImpl(TradeMapper tMapper) {
		this.tMapper = tMapper;
	}

	
	@Override
	public void createBoard(BVO vo) {
		tMapper.insertTBoard(vo);
	}

	@Override
	public BVO getBoardById(int t_seq) {
		return  tMapper.getTBoardById(t_seq);
	}

	@Override
	public void updateBoard(BVO vo) {
		tMapper.updateTBoard(vo);
	}

	@Override
	public void updateState(BVO vo) {
		tMapper.updateState(vo);
	}

	@Override
	public void deleteBoard(int t_seq) {
		tMapper.deleteTBoard(t_seq);
	}

	@Override
	public List<BVO> getBoardList() {
		return tMapper.getTBoardList();
	}

	@Override
	public List<BVO> getBoardListByCate(String t_category) {
		return tMapper.getTBoardListByCate(t_category);
	}


	@Override
	public void upViews(int seq) {
		if(tMapper.upTViews(seq) == 1) {
			logger.info("upViews : "+success_msg);
		}else {
			logger.error("upViews : "+failed_msg);
		}
	}
	

}
