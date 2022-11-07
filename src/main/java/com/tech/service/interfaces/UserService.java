package com.tech.service.interfaces;

import java.util.List;

import com.tech.vo.UserVO;

public interface UserService {
	
	//회원가입
	public void memberJoin(UserVO vo) throws Exception;
	/* 아이디 중복 검사 */
	public int idCheck(String memberId) throws Exception;
	/* 아이디 중복 검사 */
	public int nameCheck(String membername) throws Exception;
	/* 로그인 */
	public UserVO memberLogin(UserVO vo) throws Exception; 
	
	public int memberBlack(String memberId) throws Exception;
	/* 마이페이지 본인확인 */
	public UserVO mypageCK(UserVO vo) throws Exception; 
	/* 마이페이지 정보수정 */
	public void memberEdit(UserVO vo) throws Exception; 
	/* 회원 탈퇴 */
	public void memberDel(UserVO vo) throws Exception; 
//	UserVO getUser(UserVO vo);		//유저정보
//	void deleteUser(UserVO vo);	//회원탈퇴
	
	/* 핸드폰번호 인증 */
	public Boolean phoneAuth(String tel) throws Exception;
	
	/* 핸드폰번호 인증 확인*/
	public Boolean phoneAuthOk() throws Exception;
	
	/* 모든 유저 조회  */
	public List<UserVO> loadmember() throws Exception;
	/* 유저 블랙 해지 */
	public void successId(String memberId) throws Exception; 
	/* 유저 블랙 */
	public void failed(String memberId) throws Exception; 
	
	public UserVO getInfo(String memberId) throws Exception;

}
