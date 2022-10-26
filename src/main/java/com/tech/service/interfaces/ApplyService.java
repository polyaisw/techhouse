package com.tech.service.interfaces;

import java.util.List;

import com.tech.vo.ApplyVO;
import com.tech.vo.UserVO;

public interface ApplyService{
	
	void insertApply(ApplyVO vo);	//응모하기
	List<ApplyVO>getApplyList();			//전체 지원 현황
	List<ApplyVO>getApplyListById(String id);			//나의 응모현황, 
	int getApplyCount();			//전체 지원자 수
	int getApplyCountById(String id);		//나의 지원개수
	void deleteAllApply();					//지원기록 초기화
	ApplyVO getRandomSelected();			//당첨자생성
	ApplyVO getApplyMemberBySeq(int a_seq);	//a_seq로 지원자조회
	int updateTicket(UserVO vo);
}
