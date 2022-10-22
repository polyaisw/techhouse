package com.tech.service.interfaces;

import com.tech.vo.BVO;

public interface TradeService extends BoardService {

	void updateState(BVO vo); //판매글 타입변경 0: 판매중, 1: 거래중, 2: 거래완료, 3: 안심거래

	
}
