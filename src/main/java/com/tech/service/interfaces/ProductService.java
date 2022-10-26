
  package com.tech.service.interfaces;
  
import java.util.List;

import com.tech.vo.ApplyVO;
import com.tech.vo.ProductVO;
  
  public interface ProductService{

	  //응모 진행중인 상품
	  
	 void insertProduct(ProductVO vo);	//상품 등록
	 void updateProduct(ProductVO vo); 	//상품 수정
	 ProductVO getProductById(int prod_seq);			//상품 가져오기
	 void deleteProduct(int prod_seq);	//상품 삭제
	 void insertSelectedMember(ApplyVO vo);		//당첨자 등록
	 List<ProductVO> getProductList();
	 void updatePosting (ProductVO vo);	//포스트 게시 / 내리기
	 String inputCloseTime(ProductVO vo);
  }
 