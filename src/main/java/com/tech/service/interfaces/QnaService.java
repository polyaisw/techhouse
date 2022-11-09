package com.tech.service.interfaces;

import java.util.List;

import com.tech.vo.QnaVO;

public interface QnaService {

	int insertQna(QnaVO vo);	
	QnaVO getQnaById(int q_seq);
	List<QnaVO> getQnaList();
	void deleteQna(int q_seq);
	void updateState(QnaVO vo);
	
	public List<QnaVO> getQna_name_list() throws Exception;
	
	public List<QnaVO> getQna_list(String q_writer) throws Exception;
}
