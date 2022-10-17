package com.tech.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tech.repository.mapper.MemberMapper;
import com.tech.service.interfaces.UserService;
import com.tech.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {

	
	@Autowired
	MemberMapper memberMapper;
//	private final User user;

//	@Autowired
//	public UserServiceImpl(User user) {
//		this.user = user;
//	}
	
	@Override
	public void memberJoin(UserVO vo) throws Exception{
		
		memberMapper.memberJoin(vo);
		
	}

	/* 아이디 중복 검사 */
	@Override
	public int idCheck(String memberId) throws Exception {
		
		return memberMapper.idCheck(memberId);
	}
	
	/* 로그인 */
	@Override
	public UserVO memberLogin(UserVO vo) throws Exception{
		
		return memberMapper.memberLogin(vo);
		
	}
	
//	@Override
//	public UserVO getUser(UserVO vo) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public void updateUser(UserVO vo) {
//		// TODO Auto-generated method stub
//		
//	}
//
//	@Override
//	public void deleteUser(UserVO vo) {
//		// TODO Auto-generated method stub
//		
//	}



}
