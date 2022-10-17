
package com.tech.repository.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tech.vo.BVO;

@Mapper
public interface TradeMapper {
	 int insertTBoard(BVO vo);
	 int updateTBoard(BVO vo);
	 int deleteTBoard(int seq);
	 BVO getTBoardById(int seq);
	 List<BVO> getTBoardList();
	 List<BVO> getTBoardListByCate (String category);
	int updateState(BVO vo);
	int upTViews(int seq);
}
