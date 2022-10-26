package com.tech.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tech.repository.mapper.ApplyMapper;
import com.tech.repository.mapper.MemberMapper;
import com.tech.service.interfaces.ApplyService;
import com.tech.vo.ApplyVO;
import com.tech.vo.UserVO;

@Service("applyService")
public class ApplyServiceImpl implements ApplyService {

	public static final Logger logger = LoggerFactory.getLogger(ApplyServiceImpl.class);
	String success_msg = "성공", failed_msg = "실패", notFound_msg = "찾을 수 없음";
	ApplyMapper aMapper;
	MemberMapper mMapper;

	@Autowired
	public ApplyServiceImpl(ApplyMapper bMapper,MemberMapper mMapper) {
		this.aMapper = bMapper;
		this.mMapper = mMapper;
	}

	@Override
	public void insertApply(ApplyVO vo) {

		if (aMapper.insertApply(vo) == 1) {
			logger.info("insertApply : " + success_msg);	//성공
			/*
			 * UserVO uVO = mMapper.getUser(id); //세션아이디에 맞는 유저객체
			 * uVO.setTicket(uVO.getTicket()-1); //티켓 개수 감소 mMapper.updateUser(uVO);
			 * //정보수정완료
			 */			
		} else {
			logger.error("insertApply : " + failed_msg);
		}
	}

	@Override
	public List<ApplyVO> getApplyList() {
		
		return aMapper.getApplyList();
		}
	

	@Override
	public List<ApplyVO> getApplyListById(String Id) {	//회원아이디
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getApplyCount() {
		int count = aMapper.getApplyCount();
		return count;
	}

	@Override
	public int getApplyCountById(String id) {	//회원아이디
		int countByName = aMapper.getApplyCountById(id);
		return countByName;
	}

	@Override
	public ApplyVO getRandomSelected() {
		int count = aMapper.getApplyCount();
		double randomValue = Math.random();
		int selectedId = (int)(randomValue*count)+1;	//당첨된 a_seq
		
		return aMapper.getApplyMemberBySeq(selectedId);
	}

	@Override
	public void deleteAllApply() {
		aMapper.deleteAllApply();
		
	}

	@Override
	public ApplyVO getApplyMemberBySeq(int a_seq) {
		
		return aMapper.getApplyMemberBySeq(a_seq);
	}

	@Override
	public int updateTicket(UserVO vo) {
		// TODO Auto-generated method stub
		return aMapper.updateTicket(vo);
	}

}
