package com.tech.service.interfaces;

import com.tech.vo.UserVO;

public interface UserService {
	
	//회원가입
	public void memberJoin(UserVO vo) throws Exception;
	/* 아이디 중복 검사 */
	public int idCheck(String memberId) throws Exception;
	/* 로그인 */
	public UserVO memberLogin(UserVO vo) throws Exception; 
	/* 마이페이지 본인확인 */
	public UserVO mypageCK(UserVO vo) throws Exception; 
	/* 마이페이지 정보수정 */
	public void memberEdit(UserVO vo) throws Exception; 
//	UserVO getUser(UserVO vo);		//유저정보
//	void deleteUser(UserVO vo);	//회원탈퇴
}
