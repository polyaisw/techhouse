
package com.tech.service.interfaces;

import java.util.List;

import com.tech.vo.BVO;

public interface BoardService {

	int createBoard(BVO vo); // 게시글 작성

	BVO getBoardById(int seq); // 게시글 읽기

	void updateBoard(BVO vo); // 게시글 수정

	void deleteBoard(int seq); // 게시글 삭제

	List<BVO> getBoardList(); // 모든 게시판 글 목록
	int getBoardListCnt();	//페이지네이션용
	List<BVO> getBoardLists(BVO vo); //vo=pagination  카테고리  게시판 출력할때 사용
	List<BVO> getBoardListsBySearch(BVO vo);	//vo=pagination  카테고리내의 검색결과
	
	List<BVO> getBoardListByCategoryKeywordNumber(BVO vo);	// ex) 자유게시판 조회수순으로 5개 가져오기			b_category, b_특징, number

	List<BVO> getBoardByUserName(String name); // 회원 닉네임으로 거래 게시글가져오기
	
	void upViews(int seq); // 조회수 증가
	void downViews(int seq); // 조회수 감소
	void upRecommend(int seq); // 추천하기
	
	
	
	
	/* 하 ..*/
	List<BVO> getBoardListByCate(String category); // 카테고리에 해당하는 게시판 글 목록
	List<BVO> getBoardByTitleText(BVO vo); // 제목 + 내용
	List<BVO> getBestBoardListByCate(String category); // 10개 가져오기 추천수순
	List<BVO> getHotDealBoardList(); // 3개 가져오기 최신순 핫딜 슬라이드용
	List<BVO> getBoardByTitle(String title); // 게시글 제목으로 검색


}
