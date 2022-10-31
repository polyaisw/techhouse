
package com.tech.repository.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tech.vo.UserVO;

@RunWith(SpringJUnit4ClassRunner.class)

@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MemberMapperTests {

	@Autowired
	private MemberMapper memberMapper;

	@Test
	public void memberLogin() throws Exception {

		UserVO vo = new UserVO();

		vo.setId("sko03kim4");
		vo.setPassword("ac159ac159!");

		memberMapper.memberLogin(vo);
		System.out.println("결과 값 : " + memberMapper.memberLogin(vo));
		System.out.println("결과 값2 : " + vo);

	}

	@Test
	public void memberIdChk() throws Exception {
		String id = "test";
		String id2 = "test2";
		memberMapper.idCheck(id);
		memberMapper.idCheck(id2);
	}

	@Test
	public void memberJoin() throws Exception {
		UserVO vo = new UserVO();
		vo.setId("테스트이메일");
		vo.setPassword("테스트 비밀번호");
		vo.setName("테스트 닉네임");
		vo.setProfileimg("테스트 프로필");
		vo.setTel("테스트 연락처");
		memberMapper.memberJoin(vo);
	}

}
