package com.tech.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tech.service.interfaces.CommentService;
import com.tech.service.interfaces.TradeService;
import com.tech.valid.TradeValidator;
import com.tech.vo.BVO;
import com.tech.vo.CommentVO;
import com.tech.vo.TradeVO;

import jakarta.validation.Valid;

@Controller
@RequestMapping("/board")
public class TradeController {
	private static final Logger logger = LoggerFactory.getLogger(TradeController.class);
	@Autowired
	private TradeService tradeService;
	TradeVO tradeVO;
	@Autowired
	private CommentService commentService;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.setValidator(new TradeValidator());
	}

	/* trade */
	@GetMapping("/trade/tradeInfo")
	public String tradeInfo() {
		logger.info("중고거래 안내 진입");
		return "/board/trade/info";
	}

	@GetMapping("/trade/tradeBoard")
	public String tradeBoard(Model model) {
		logger.info("거래 게시판 진입");
		List<BVO> list = tradeService.getBoardListByCate("거래게시판");
		model.addAttribute("list", list);
		return "/board/trade/tradeBoard";
	}

	@RequestMapping("/contentTradeForm")
	public String contentTradeForm(@RequestParam("t_seq") String t_seq, Model model) {
		logger.info("거래 게시글 진입");
		int seq = Integer.parseInt(t_seq);
		tradeService.upViews(seq);
		List<CommentVO> commentList = commentService.getCommentListById(seq);
		for (CommentVO comment : commentList) {
			comment.setC_text(comment.getC_text().replace("\r\n", "<br>"));
		}
		tradeVO = (TradeVO) tradeService.getBoardById(seq);
		tradeVO.setT_text(tradeVO.getT_text().replace("\r\n", "<br>"));
		model.addAttribute("tradeContent", tradeVO);
		model.addAttribute("commentList", commentList);

		return "/board/contentTradeForm";
	}

	@RequestMapping("/updateTradeForm")
	public String updateTradeForm(Model model, @RequestParam("t_seq") String t_seq) {

		logger.info("거래 게시글 수정 진입");
		int seq = Integer.parseInt(t_seq);
		tradeVO = (TradeVO) tradeService.getBoardById(seq);

		model.addAttribute("updateTradeContent", tradeVO);

		return "/board/updateTradeForm";
	}

	/* trade */
	@RequestMapping("/insertTradeBoardAction")
	@ResponseBody
	public String insertTradeBoardAction(@ModelAttribute("tradeContent") @Valid TradeVO tradeVO,
			BindingResult bindingResult) {
		logger.info("게시글 글쓰기 액션");

		if (bindingResult.hasErrors()) {
			return "<script> location.href='/board/insertTradeBoardForm'</script>";
		} else {
			int result = tradeService.createBoard(tradeVO);
			if (result == 0) {
				logger.info("등록 실패");
				return "<script>alert('insert_trade_failed'); location.href='/board/insertTradeBoardForm';</script>";
			} else {
				return "<script>alert('insert_trade_complete'); location.href='/board/contentTradeForm?t_seq=" + result
						+ "'</script>";
			}
		}

	}

	@RequestMapping("/deleteTradeBoardAction")
	@ResponseBody
	public String deleteTradeBoardAction(@RequestParam("t_seq") String t_seq, HttpServletRequest request) {
		int seq = Integer.parseInt(t_seq);
		tradeService.deleteBoard(seq);
		logger.info("거래 게시글 삭제 액션");

		return "<script>alert('trade_delete_complete'); location.href='/board/trade/tradeBoard'</script>";
	}

	@RequestMapping("/updateTradeBoardAction")
	@ResponseBody
	public String updateTradeBoardAction(@ModelAttribute("updateTradeContent") @Valid TradeVO tradeVO,
			BindingResult bindingResult) {

		logger.info("거래 게시글 수정 액션");
		if (bindingResult.hasErrors()) {
			return "<script> location.href='/board/updateTradeForm?t_seq=" + tradeVO.getT_seq() + "'</script>";
		} else {
			tradeService.updateBoard(tradeVO);
			return "<script>alert('trade_update_complete'); location.href='/board/contentTradeForm?t_seq="
					+ tradeVO.getT_seq() + "'</script>";

		}
	}
	@RequestMapping("/insertTradeBoardForm")
	public String insertTradeBoardForm() {
		logger.info("거래 게시글 글쓰기 진입");
		return "/board/insertTradeBoardForm";
	}
}
