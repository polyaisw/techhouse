package com.tech.repository.mapper;

import java.util.List;

import com.tech.vo.ApplyVO;
import com.tech.vo.UserVO;

public interface ApplyMapper {

	int insertApply(ApplyVO vo);
	int getApplyCount();
	int getApplyCountById(String id);
	List<ApplyVO> getApplyList();
	int deleteAllApply();
	ApplyVO getApplyMemberBySeq(int a_seq);
	int updateTicket(UserVO vo);
}
