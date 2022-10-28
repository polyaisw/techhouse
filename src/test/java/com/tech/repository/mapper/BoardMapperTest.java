/*
 * package com.tech.repository.mapper;
 * 
 * import static org.junit.Assert.*;
 * 
 * import java.util.List;
 * 
 * import org.junit.Assert; import org.junit.Test; import
 * org.junit.runner.RunWith; import
 * org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.test.context.ContextConfiguration; import
 * org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
 * 
 * import com.tech.service.interfaces.BoardService; import com.tech.vo.BVO;
 * import com.tech.vo.BoardVO;
 * 
 * @RunWith(SpringJUnit4ClassRunner.class)
 * 
 * @ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
 * public class BoardMapperTest {
 * 
 * @Autowired private BoardMapper bMapper;
 * 
 * @Test public void 게시판수정() throws Exception { // given BoardVO vo = new
 * BoardVO("수정_title", "수정_writer", "수정_text", "수정_uploadImg", "수정_category");
 * vo.setB_seq("100001");
 * 
 * // when int row = bMapper.updateBoard(vo);
 * 
 * // then assertEquals(row, 1); }
 * 
 * @Test public void 게시판작성() throws Exception { // given BoardVO vo = new
 * BoardVO("작성_title", "작성_writer", "작성_text", "작성_uploadImg", "작성_category");
 * 
 * // when int row = bMapper.insertBoard(vo);
 * 
 * // then assertEquals(row, 1);
 * 
 * }
 * 
 * @Test public void 게시판삭제() throws Exception { // given BoardVO vo = new
 * BoardVO(); vo.setB_seq("100002");
 * 
 * // when bMapper.deleteBoard(vo.getB_seq());
 * 
 * // then assertNull(bMapper.getBoardById(vo.getB_seq())); // 지웠으니 null이어야한다. }
 * 
 * @Test public void 게시판가져오기() throws Exception { // given
 * 
 * // when List<BVO> lists = bMapper.getBoardList(); // then
 * 
 * }
 * 
 * @Test public void 게시판가져오기아이디() throws Exception { BoardVO vo = (BoardVO)
 * bMapper.getBoardById(100003);
 * 
 * }
 * 
 * @Test public void 게시판가져오기카테고리() throws Exception { BoardVO vo = new
 * BoardVO(); vo.setB_category("작성_category"); List<BVO> lists =
 * bMapper.getBoardListByCate(vo.getB_category()); }
 * 
 * }
 */