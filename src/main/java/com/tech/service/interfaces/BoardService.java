
package com.tech.service.interfaces;

import java.util.List;

import com.tech.vo.BVO;

public interface BoardService {

	int createBoard(BVO vo); // 게시글 작성

	BVO getBoardById(int seq); // 게시글 읽기

	void updateBoard(BVO vo); // 게시글 수정

	void deleteBoard(int seq); // 게시글 삭제

	
	int getBoardListCnt();	//모든 카테고리의 게시글 갯수 (거래게시판 카테고리 제외)
	List<BVO> getBoardListByCategoryKeywordNumber(BVO vo);	// 키워드를 통해 설정한 개수 가져오기  ex) 자유게시판의 조회수순으로 5개   
	List<BVO> getBoardLists(BVO vo); 			//페이지네이션용  카테고리의  게시판 출력할때 사용

	/* search */
	List<BVO> getBoardByTitleText(BVO vo); 		// 제목 + 내용으로 검색결과
	List<BVO> getBoardListsBySearch(BVO vo);	//페이지네이션용  카테고리내의 검색결과
	

	List<BVO> getBoardByUserName(String name); // 회원 닉네임 검색으로 모든 카페고리의 게시글 가져오기(거래게시판 카테고리 제외)
	List<BVO> getBoardByUserName_P(BVO vo);		//페이지네이션용
	/* search */
	
	
	
	void upViews(int seq); // 조회수 증가
	void downViews(int seq); // 조회수 감소
	void upRecommend(int seq); // 추천하기
	
	
	
	

	List<BVO> getBoardList(); // 모든 게시판 글 목록	x
	List<BVO> getBoardListByCate(String category); // 카테고리에 해당하는 게시판 글 목록
	List<BVO> getBestBoardListByCate(String category); // 10개 가져오기 추천수순
	List<BVO> getHotDealBoardList(); // 3개 가져오기 최신순 핫딜 슬라이드용
	List<BVO> getBoardByTitle(String title); // 게시글 제목으로 검색


}
