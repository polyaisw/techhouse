package com.tech.service.interfaces;

import java.util.List;

import com.tech.vo.BVO;
import com.tech.vo.ProductVO;
import com.tech.vo.QnaVO;

public interface QnaService {

	void insertQna(QnaVO vo);	
	QnaVO getQnaById(int q_seq);
	List<QnaVO> getQnaList();
	void deleteQna(int q_seq);
	void updateState(QnaVO vo);
}
