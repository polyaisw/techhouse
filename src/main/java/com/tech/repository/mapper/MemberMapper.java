package com.tech.repository.mapper;

import com.tech.vo.UserVO;

public interface MemberMapper {
	
	//회원가입
	public void memberJoin(UserVO vo);
	
	/* 아이디 중복 검사 */
	public int idCheck(String memberId);
	
	/* 닉네임 중복 검사 */
	public int nameCheck(String membername);
	
	/* 로그인 */
	public UserVO memberLogin(UserVO vo);
	
	/* 마이페이지 정보수정 */
	public void memberEdit(UserVO vo);
	
	/* 회원 탈퇴 */
	public void memberDel(UserVO vo);
	
	/* 핸드폰번호 인증 */
	public Boolean phoneAuth(String tel);
	
	/* 핸드폰번호 인증 확인*/
	public Boolean phoneAuthOk();
	
}
