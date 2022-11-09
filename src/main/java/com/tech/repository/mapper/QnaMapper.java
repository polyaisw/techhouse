package com.tech.repository.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tech.vo.QnaVO;

@Mapper
public interface QnaMapper {

	
	 int insertQna(QnaVO vo);
	 int updateQna(QnaVO vo);
	 int deleteQna(int q_seq);
	 int updateState(QnaVO vo);		//상태변경 0: 미처리   1: 처리완료
	 QnaVO getQnaById(int q_seq);
	 List<QnaVO> getQnaList();
	 
	 public List<QnaVO> getQna_name_list();
	 
	 public List<QnaVO> getQna_list(String q_writer);
}
