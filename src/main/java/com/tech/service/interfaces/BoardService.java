
package com.tech.service.interfaces;

import java.util.List;

import com.tech.vo.BVO;

public interface BoardService {

	int createBoard(BVO vo); // 게시글 작성

	BVO getBoardById(int seq); // 게시글 읽기

	void updateBoard(BVO vo); // 게시글 수정

	void deleteBoard(int seq); // 게시글 삭제

	List<BVO> getBoardList(); // 모든 게시판 글 목록

	List<BVO> getBoardListByCate(String category); // 카테고리에 해당하는 게시판 글 목록

	void upViews(int seq);	//조회수 증가
	void upRecommend(int seq);	//추천하기
}
