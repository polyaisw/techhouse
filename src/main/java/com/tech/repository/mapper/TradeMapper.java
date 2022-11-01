
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
	List<BVO> getTBoardLists(BVO vo);

	List<BVO> getTBoardListByCate(String category);
	List<BVO> getBoardListByCategoryKeywordNumber(BVO vo);
	List<BVO> getTBoardListsBySearch(BVO vo);

	int updateState(BVO vo);

	int upTViews(int seq);
	int downTViews(int seq);

	/* int upTRecommend(int seq); */ // 나중에쓸수도잇음
	List<BVO> getBestTBoardListByCate(String category);

	List<BVO> getTBoardByUserName(String name); // 회원 닉네임으로 거래 게시글가져오기

	List<BVO> getTBoardByTitle(String t_title); // 게시글 제목으로 검색

	List<BVO> getTBoardByTitleText(BVO vo); // 제목 + 내용
	
	int getTBoardListCnt();
}
