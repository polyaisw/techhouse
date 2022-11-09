package com.tech.controller;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.tech.common.Pagination;
import com.tech.service.interfaces.BoardService;
import com.tech.service.interfaces.ProductService;
import com.tech.service.interfaces.TradeService;
import com.tech.vo.BVO;
import com.tech.vo.BoardVO;
import com.tech.vo.ProductVO;
import com.tech.vo.TradeVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	BoardService boardService;
	@Autowired
	TradeService tradeService;
	@Autowired
	ProductService productService;

	BoardVO boardVO;
	TradeVO tradeVO;
	ProductVO productVO;

	@RequestMapping(value = { "/main", "/" }, method = RequestMethod.GET)
	public String home(Model model, HttpServletRequest request) {

		ServletContext application = request.getServletContext();
		application.setAttribute("path", request.getServletContext().getRealPath("resources/images/user_upload"));
		
		
		/* 최신글 */
		model.addAttribute("issueList",boardService.getBoardListByCategoryKeywordNumber(new BoardVO("핫이슈","b_seq",5)));
		model.addAttribute("trendList",boardService.getBoardListByCategoryKeywordNumber(new BoardVO("IT/트렌드","b_seq",5)));
		model.addAttribute("hotDealList",boardService.getBoardListByCategoryKeywordNumber(new BoardVO("꿀딜/장터","b_seq",5)));
		model.addAttribute("gameInfoList",boardService.getBoardListByCategoryKeywordNumber(new BoardVO("게임출시정보","b_seq",5)));
		model.addAttribute("freeList",boardService.getBoardListByCategoryKeywordNumber(new BoardVO("자유게시판","b_seq",13)));
		model.addAttribute("mySettingList",boardService.getBoardListByCategoryKeywordNumber(new BoardVO("인증게시판","b_seq",5)));
		model.addAttribute("mySettingListBest",boardService.getBoardListByCategoryKeywordNumber(new BoardVO("인증게시판","b_recommed",3)));
		model.addAttribute("hobbyList",boardService.getBoardListByCategoryKeywordNumber(new BoardVO("취미공유","b_seq",5)));
		model.addAttribute("tradeList",tradeService.getBestBoardListByCate("거래게시판"));
		
		return "home";

	}
	


	
	
}
