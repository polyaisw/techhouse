package com.tech.repository.mapper;

import com.tech.vo.UserVO;

public interface MemberMapper {
	
	//회원가입
	public void memberJoin(UserVO vo);
	
	/* 아이디 중복 검사 */
	public int idCheck(String memberId);
	
	/* 로그인 */
	public UserVO memberLogin(UserVO vo);
	
}
