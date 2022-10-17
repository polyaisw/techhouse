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
	 BVO getBoardById(int seq);
	 List<BVO> getBoardList();
	 List<BVO> getBoardListByCate (String category);
}



