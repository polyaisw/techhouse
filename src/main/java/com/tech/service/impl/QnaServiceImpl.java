package com.tech.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tech.repository.mapper.QnaMapper;
import com.tech.service.interfaces.QnaService;
import com.tech.vo.QnaVO;

@Service("qnaService")
public class QnaServiceImpl implements QnaService {

	public static final Logger logger = LoggerFactory.getLogger(ProductServiceImpl.class);
	String success_msg = "성공", failed_msg = "실패", notFound_board_msg = "게시글을 찾을 수 없음";
	QnaMapper qMapper;

	@Autowired
	public QnaServiceImpl(QnaMapper qMapper) {
		super();
		this.qMapper = qMapper;
	}

	@Override
	public int insertQna(QnaVO vo) {

		if (qMapper.insertQna(vo) == 1) {
			return vo.getQ_seq();
		} else {
			logger.error("insertQna : " + failed_msg);
			return 0;
		}

	}

	@Override
	public QnaVO getQnaById(int q_seq) {
		for (QnaVO arg : qMapper.getQnaList()) {
			if (q_seq == arg.getQ_seq())
				return qMapper.getQnaById(q_seq);
			else {
				logger.error("getQnaById : " + notFound_board_msg);
				return null; // null이 리턴되면 모달메시지띄우기
			}
		}
		return null;

	}

	@Override
	public List<QnaVO> getQnaList() {
		return qMapper.getQnaList();
	}

	@Override
	public void deleteQna(int q_seq) {

		for (QnaVO arg : qMapper.getQnaList()) {
			if (q_seq == arg.getQ_seq()) {
				if (qMapper.deleteQna(q_seq) == 1) {
				} else {
					logger.error("deleteQna : " + failed_msg);
				}
			} else {
				logger.error("deleteQna : " + notFound_board_msg);
			}
		}
	}

	@Override
	public void updateState(QnaVO vo) {

		qMapper.updateState(vo);

	}

}
