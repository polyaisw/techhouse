
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

	List<BVO> getTBoardListByCate(String category);
	List<BVO> getBoardListByCategoryKeywordNumber(BVO vo);

	int updateState(BVO vo);

	int upTViews(int seq);
	int downTViews(int seq);

	/* int upTRecommend(int seq); */ // 나중에쓸수도잇음
	List<BVO> getBestTBoardListByCate(String category);

	
	
	List<BVO> getTBoardLists(BVO vo);		//페이지네이션용 게시판 출력
	
	/* search */
	
	List<BVO> getTBoardByTitleText(BVO vo); // 제목 + 내용 검색결과
	List<BVO> getTBoardListsBySearch(BVO vo);	//페이지네이션용 검색 결과 출력  
	
	List<BVO> getTBoardByUserName(String name); // 회원 닉네임으로 거래 게시글가져오기
	List<BVO> getTBoardByUserName_P(BVO vo); // 페이지네이션용 회원 닉네임으로 거래 게시글가져오기
	/* search */
	
	
	
	
	
	List<BVO> getTBoardByTitle(String t_title); // 게시글 제목으로 검색
	
	
	int getTBoardListCnt();
}
