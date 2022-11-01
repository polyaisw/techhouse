package com.tech.repository.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tech.vo.BVO;

@Mapper
public interface BoardMapper {
	int insertBoard(BVO vo);

	int updateBoard(BVO vo);

	int deleteBoard(int seq);

	int upViews(int seq);
	int downViews(int seq);

	int upRecommend(int seq);

	BVO getBoardById(int seq);

	List<BVO> getBoardList();
	List<BVO> getBoardLists(BVO vo);
	
	List<BVO> getBoardListByCategoryKeywordNumber(BVO vo);

	List<BVO> getBoardListsBySearch(BVO vo);
	
	List<BVO> getBoardListByCate(String category);

	List<BVO> getBestBoardListByCate(String category);

	List<BVO> getHotDealBoardList(); // 3개 가져오기

	List<BVO> getBoardByUserName(String name); // 회원 닉네임으로 게시글가져오기

	List<BVO> getBoardByTitle(String b_title); // 게시글 제목으로 검색

	List<BVO> getBoardByTitleText(BVO vo); // 제목 + 내용
	
	int getBoardListCnt();
	// git ignore test
}
