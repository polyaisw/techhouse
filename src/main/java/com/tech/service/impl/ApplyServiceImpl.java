package com.tech.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.tech.repository.mapper.ApplyMapper;
import com.tech.repository.mapper.BoardMapper;
import com.tech.service.interfaces.ApplyService;
import com.tech.vo.ApplyVO;

public class ApplyServiceImpl implements ApplyService {

	public static final Logger logger = LoggerFactory.getLogger(ApplyServiceImpl.class);
	String success_msg = "성공", failed_msg = "실패", notFound_msg = "찾을 수 없음";
	ApplyMapper aMapper;

	@Autowired
	public ApplyServiceImpl(ApplyMapper bMapper) {
		this.aMapper = bMapper;
	}

	
	@Override
	public void insertApply(ApplyVO vo) {
		
		/*
		 * if (aMapper.insertApply() == 1) { logger.info("insertApply : "+success_msg);
		 * }else { logger.error("insertApply : "+failed_msg); }
		 */
		
		
	}

	@Override
	public ApplyVO getApplyList() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public ApplyVO getApplyListByName(String name) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public int getApplyCount() {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int getApplyCountByName(String name) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public ApplyVO getSelected() {
		// TODO Auto-generated method stub
		return null;
	}


}
