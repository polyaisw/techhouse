package com.tech.service.interfaces;

import com.tech.vo.ApplyVO;

public interface ApplyService{
	
	void insertApply(ApplyVO vo);	//응모하기
	ApplyVO getApplyList();			//전체 지원 현황
	ApplyVO getApplyListByName(String name);			//나의 응모현황, 닉네임으로 찾기
	int getApplyCount();			//전체 지원자 수
	int getApplyCountByName(String name);		//나의 지원개수
	ApplyVO getSelected();			//당첨자생성
	
	
}
