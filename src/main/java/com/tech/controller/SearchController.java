package com.tech.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tech.common.Pagination;
import com.tech.service.interfaces.BoardService;
import com.tech.service.interfaces.TradeService;
import com.tech.vo.BVO;
import com.tech.vo.BoardVO;
import com.tech.vo.TradeVO;

@Controller
public class SearchController {
	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);
	
	@Autowired TradeService tradeService;
	@Autowired BoardService boardService;
	
	

	/* 중고거래게시판용  얘는 카테고리가 하나라 검색어만 받으면 결과가 나옴*/
	@RequestMapping(value = "/searchAction", method = RequestMethod.GET)
	public String searchAction(@RequestParam("searchKeyword") String keyword,
			Model model,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) {
		
		keyword = keyword.trim();
		TradeVO tradeVO = new TradeVO();
		/* 검색어 세팅 */
		tradeVO.setKeyword(keyword);
		
		/* 제목+내용 검색결과의 개수 */
		int listCnt = tradeService.getBoardByTitleText(tradeVO).size();	
		
		/* 페이지 인디케이터 설정 */
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);
		pagination.setCategory("거래게시판");
		pagination.setKeyword(keyword);
		

		/* 검색결과 게시글 표시 */
		model.addAttribute("list", tradeService.getBoardListsBySearch((pagination)));
		return "/board/trade/tradeBoard";
	}
	
	
	  @RequestMapping(value = "/searchBoardAction", method = RequestMethod.GET)
	  public String searchBoardAction( Model model,
	  @RequestParam("searchKeyword") String keyword,
	  @RequestParam("b_category") String b_category,
	  @RequestParam(value= "url", required = false, defaultValue = "/main") String url,
	  @RequestParam(required = false, defaultValue = "1") int page,
	  @RequestParam(required = false, defaultValue = "1") int range) throws
	  Exception {
			
		  keyword = keyword.trim();
			
		  BoardVO boardVO = new BoardVO();
		  
		  /* 검색어 */
		  boardVO.setKeyword(keyword);
		  
		 /* 게시판종류 */
		  boardVO.setB_category(b_category);
		  
		/* 제목+내용 검색결과의 개수 */
	  int listCnt = boardService.getBoardByTitleText(boardVO).size();
	  
	  
	  
	  Pagination pagination = new Pagination(); 
	  pagination.pageInfo(page, range, listCnt); 
	  pagination.setCategory(b_category);
	  pagination.setKeyword(keyword);
	  
		/* 페이지 인디케이터 표시 */
	  model.addAttribute("pagination", pagination);
	  
		/* 검색결과 게시글 표시 */
	  model.addAttribute("list", boardService.getBoardListsBySearch((pagination)));
	  
	  
		/* 추천수 5개 표시 */
		boardVO.setKeyword("b_recommed");
		boardVO.setB_category(b_category);
		boardVO.setListSize(5);
		model.addAttribute("recommedList",boardService.getBoardListByCategoryKeywordNumber(boardVO));
		
		/* 조회수5개  표시*/
		boardVO.setKeyword("b_views");
		boardVO.setB_category(b_category);
		boardVO.setListSize(5);
		model.addAttribute("viewsList",boardService.getBoardListByCategoryKeywordNumber(boardVO));
	  
	  
	  
	  
	  if(url.equals("/main")) {
		  logger.error("board_search error");
		  return "redirect:"+url;	//에러인경우 메인으로
	  }else {
		  return url;
	  }
	  
	  }
	 
}
