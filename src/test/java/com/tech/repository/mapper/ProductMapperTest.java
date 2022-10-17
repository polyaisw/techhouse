package com.tech.repository.mapper;

import org.junit.Assert.*;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tech.vo.ProductVO;
import com.tech.vo.ApplyVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ProductMapperTest {

	public static final Logger logger = LoggerFactory.getLogger(ProductMapper.class);

	@Autowired
	private ProductMapper pMapper;
	/* private ApplyService applyService; */

	/*
	 * @Test public void 응모글등록하기() throws Exception { ProductVO vo = new
	 * ProductVO("작성_RTX4090", "작성_3500000", "작성_image");
	 * 
	 * int row = pMapper.insertProduct(vo);
	 * 
	 * assertEquals(row, 1); }
	 */
	
	/*
	 * @Test public void 응모글삭제하기() throws Exception { ProductVO vo = new
	 * ProductVO(); vo.setProd_seq(2);
	 * 
	 * pMapper.deleteProduct(vo.getProd_seq());
	 * 
	 * assertNull(pMapper.getProductById(vo.getProd_seq())); }
	 * 
	 * @Test public void 응모글수정하기() throws Exception { ProductVO vo = new
	 * ProductVO("수정_RTX4090", "수정_3500000", "수정_image"); vo.setProd_seq(1);
	 * 
	 * int row = pMapper.updateProduct(vo);
	 * 
	 * assertEquals(row, 1); }
	 */
	  
	  @Test public void 아이디로응모글가져오기() throws Exception { 

	  
	  ProductVO vo2 = pMapper.getProductById(1);
	  System.out.println(vo2.toString());
	  }
	  
	/*
	 * @Test public void 당첨자등록하기() throws Exception {
	 * 
	 * ProductVO vo2 = pMapper.getProductById(1); ApplyVO vo = new ApplyVO(
	 * vo2.getProd_productName(), "당첨자이메일", "당첨자닉네임", "당첨자연락처");
	 * 
	 * 
	 * int row = pMapper.insertSelectedMember(vo);
	 * 
	 * 
	 * assertEquals(row, 1); }
	 * 
	 * @Test public void 추첨완료된상품수정불가() throws Exception {
	 * 
	 * }
	 */
}
