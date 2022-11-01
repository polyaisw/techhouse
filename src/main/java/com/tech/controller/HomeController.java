package com.tech.controller;

import java.util.List;

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

		List<BVO> issueList = boardService.getBestBoardListByCate("핫이슈"); // 추천수 순 10개
		model.addAttribute("issueList", issueList);

		List<BVO> trendList = boardService.getBestBoardListByCate("IT/트렌드"); // 추천수 순 10개
		model.addAttribute("trendList", trendList);

		List<BVO> tradeList = tradeService.getBestBoardListByCate("거래게시판"); // 조회수 순 8개
		model.addAttribute("tradeList", tradeList);

		
		
		
		/*	//게시글 많은 순으로 유저정보 4개 
		 * List<UserVO> userList = userService.~
		 * model.addAttribute("userList",userList);
		 */

		List<BVO> hotDealList = boardService.getHotDealBoardList();
		model.addAttribute("hotDealList", hotDealList);

		/*
		 * ServletContext application = request.getServletContext();
		 * application.getAttribute("productAppContent");
		 */

		return "home";

	}
	
	


	
	
}
