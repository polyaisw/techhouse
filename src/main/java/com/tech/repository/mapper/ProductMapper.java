package com.tech.repository.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tech.vo.ApplyVO;
import com.tech.vo.ProductVO;

@Mapper
public interface ProductMapper {
	
	int insertProduct(ProductVO vo);
	int updateProduct(ProductVO vo);
	int deleteProduct(int prod_seq);
	ProductVO getProductById(int prod_seq);
	List<ProductVO> getProductList();
	
	int insertSelectedMember(ApplyVO vo);
	
	int updatePosting(ProductVO vo);
	}
