
package com.tech.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tech.repository.mapper.ProductMapper;
import com.tech.service.interfaces.ProductService;
import com.tech.vo.ApplyVO;
import com.tech.vo.ProductVO;

@Service("productService")
public class ProductServiceImpl implements ProductService {
	public static final Logger logger = LoggerFactory.getLogger(ProductServiceImpl.class);
	ProductMapper prodMapper;
	String success_msg = "성공", failed_msg = "실패", notFound_msg = "상품을 찾을 수 없음", notFound_board_msg = "게시글을 찾을 수 없음";

	@Autowired
	public ProductServiceImpl(ProductMapper prodMapper) {
		super();
		this.prodMapper = prodMapper;

	}

	@Override
	public void insertProduct(ProductVO vo) {
		if (prodMapper.insertProduct(vo) == 1) {
		} else {
			logger.error("insertProduct : " + failed_msg);
		}

	}

	@Override
	public void updateProduct(ProductVO vo) {
		// vo 객체에 시퀀스도 함께 온다
		for (ProductVO arg : prodMapper.getProductList()) {
			if (vo.getProd_seq() == arg.getProd_seq()) {
				if (prodMapper.updateProduct(vo) == 1) {
				} else {
					logger.error("updateProduct : " + failed_msg);
				}
			} else {
				logger.error("updateProduct : " + notFound_board_msg);
			}
		}
	}

	@Override
	public ProductVO getProductById(int prod_seq) {

		return prodMapper.getProductById(prod_seq);

		/*
		 * for (ProductVO arg : prodMapper.getProductList()) { if (prod_seq ==
		 * arg.getProd_seq()) return else { logger.error("getProductById : " +
		 * notFound_board_msg); return null; // null이 리턴되면 모달메시지띄우기 } } return null;
		 */
	}

	@Override
	public void deleteProduct(int prod_seq) {

		for (ProductVO arg : prodMapper.getProductList()) {
			if (prod_seq == arg.getProd_seq()) {
				if (prodMapper.deleteProduct(prod_seq) == 1) {
				} else {
					logger.error("deleteProduct : " + failed_msg);
				}
			} else {

				logger.error("deleteProduct : " + notFound_board_msg);
			}
		}
	}

	@Override
	public void insertSelectedMember(ApplyVO vo) {
		// 해당상품명, 당첨자 mail, name, tel이 넘어온다
		// prodname에 맞는 상품에 당첨자 정보를 등록한다.

		prodMapper.insertSelectedMember(vo);
	}

	@Override
	public List<ProductVO> getProductList() {
		return prodMapper.getProductList();
	}

	@Override
	public void updatePosting(ProductVO vo) {
		for (ProductVO arg : prodMapper.getProductList()) {
			if (vo.getProd_seq() == arg.getProd_seq()) {
				if (prodMapper.updatePosting(vo) == 1) {
				} else {
					logger.error("updatePosting : " + failed_msg);
				}
			} else {
				logger.error("updatePosting : " + notFound_board_msg);
			}
		}
	}

}