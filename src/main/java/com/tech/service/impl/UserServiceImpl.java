package com.tech.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.test.context.BootstrapWith;

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

	/* 닉네임 중복 검사 */
	@Override
	public int nameCheck(String membername) throws Exception {
		
		return memberMapper.nameCheck(membername);
	}
	
	/* 로그인 */
	@Override
	public UserVO memberLogin(UserVO vo) throws Exception{
		
		return memberMapper.memberLogin(vo);
		
	}
	
	@Override
	public int memberBlack(String memberId) throws Exception{
		
		return memberMapper.memberBlack(memberId);
		
	}
	
	/* 마이페이지 본인확인 */
	@Override
	public UserVO mypageCK(UserVO vo) throws Exception{
		
		return memberMapper.memberLogin(vo);
		
	}
	
	/* 마이페이지 정보수정 */
	public void memberEdit(UserVO vo) throws Exception{
		
		memberMapper.memberEdit(vo);
		
	}
	
	/* 회원 탈퇴 */
	public void memberDel(UserVO vo) throws Exception{
		
		memberMapper.memberDel(vo);
	}
//	@Override
//	public UserVO getUser(UserVO vo) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public void deleteUser(UserVO vo) {
//		// TODO Auto-generated method stub
//		
//	}

	@Override
	public Boolean phoneAuth(String tel) throws Exception {
		return memberMapper.phoneAuth(tel);
	}

	@Override
	public Boolean phoneAuthOk() throws Exception {
		return memberMapper.phoneAuthOk();
	}
	
	/* 모든 유저 조회 */
	@Override
	public List<UserVO> loadmember() throws Exception{
		return memberMapper.loadmember();
	}
	
	/* 유저 블랙 해지 */
	@Override
	public void successId(String memberId) throws Exception{
		
		memberMapper.successId(memberId);
		
	}
	
	/* 유저 블랙 */
	@Override
	public void failed(String memberId) throws Exception{
		
		memberMapper.failed(memberId);
		
	}
	
	@Override
	public UserVO getInfo(String memberId) throws Exception{
		
		return memberMapper.getInfo(memberId);
		
	}

}
