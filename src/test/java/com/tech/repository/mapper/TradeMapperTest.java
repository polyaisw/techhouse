
package com.tech.repository.mapper;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tech.service.interfaces.BoardService;
import com.tech.service.interfaces.TradeService;
import com.tech.vo.BVO;
import com.tech.vo.TradeVO;

import junit.framework.Assert;

@RunWith(SpringJUnit4ClassRunner.class)

@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class TradeMapperTest {

	@Autowired
	private TradeMapper tMapper;

	@Test
	public void 게시판수정() throws Exception {
		TradeVO vo = (TradeVO) tMapper.getTBoardById(1);
		vo.setT_prodName("수정_상품");
		vo.setT_price("수정_999999");

		int row = tMapper.updateTBoard(vo);

		assertEquals(row, 1);
	}

	@Test
	public void 게시판작성() throws Exception {
		TradeVO vo = new TradeVO("작성_title", "작성_작성자", "작성_상품명", "작성_가격", "작성_글내용", null, "작성_카테고리"); // null은 이미지명

		int row = tMapper.insertTBoard(vo);

		assertEquals(row, 1);
	}

	@Test
	public void 게시판삭제() throws Exception {
		TradeVO vo = new TradeVO();
		vo.setT_seq(2);

		tMapper.deleteTBoard(vo.getT_seq());

		assertNull(tMapper.getTBoardById(vo.getT_seq()));
	}

	@Test
	public void 게시판가져오기() throws Exception {
		List<BVO> lists = tMapper.getTBoardList();
		
	}

	@Test
	public void 게시판가져오기아이디() throws Exception {
		TradeVO vo = new TradeVO();
		vo = (TradeVO) tMapper.getTBoardById(1);
		System.out.println(vo);
		System.out.println("-------------------------------------------------");

	}

	@Test
	public void 게시판가져오기카테고리() throws Exception {
		TradeVO vo = new TradeVO();
		vo.setT_category("t_category");
		
		List<BVO> lists = tMapper.getTBoardListByCate(vo.getT_category());
		for (BVO list : lists) {
			System.out.println(list);
		}
		System.out.println("-------------------------------------------------");
	}
	
	@Test
	public void 게시판상태변경() throws Exception{
		TradeVO vo = (TradeVO) tMapper.getTBoardById(1);
		vo.setT_state("판매중");
		
		tMapper.updateState(vo);
		TradeVO vo2 = (TradeVO) tMapper.getTBoardById(1);
		
		
		assertEquals(vo.getT_state(), vo2.getT_state());
		
	}

}
