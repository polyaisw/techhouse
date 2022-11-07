package com.tech.repository.mapper;

import java.util.List;

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
	
	/* 블랙조회 */
	public int memberBlack(String memberId);
	
	/* 마이페이지 정보수정 */
	public void memberEdit(UserVO vo);
	
	/* 회원 탈퇴 */
	public void memberDel(UserVO vo);
	
	/* 핸드폰번호 인증 */
	public Boolean phoneAuth(String tel);
	
	/* 핸드폰번호 인증 확인*/
	public Boolean phoneAuthOk();
	
	/* 모든 유저 조회 */
	public List<UserVO> loadmember();
	/* 유저 블랙 해지 */
	public void successId(String memberId); 
	/* 유저 블랙 */
	public void failed(String memberId); 
	
	public UserVO getInfo(String memberId);
	
}
