package com.tech.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
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

import com.tech.service.interfaces.BoardService;
import com.tech.service.interfaces.CommentService;
import com.tech.service.interfaces.QnaService;
import com.tech.valid.BoardValidator;
import com.tech.vo.BVO;
import com.tech.vo.BoardVO;
import com.tech.vo.CommentVO;
import com.tech.vo.ProductVO;
import com.tech.vo.QnaVO;

import jakarta.validation.Valid;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/board")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	@Autowired
	private BoardService boardService;
	@Autowired
	private QnaService qnaService;
	@Autowired
	private CommentService commentService;

	BoardVO boardVO;
	ProductVO productVO;

	/* community */
	@GetMapping("/community/free")
	public String free(Model model) {
		logger.info("자유게시판 진입");
		List<BVO> list = boardService.getBoardListByCate("자유게시판");

		model.addAttribute("list", list);
		return "/board/community/free";
	}

	@GetMapping("/community/mysetting")
	public String mysetting(Model model) {
		logger.info("인증게시판 진입");
		List<BVO> list = boardService.getBoardListByCate("인증게시판");
		model.addAttribute("list", list);
		return "/board/community/mysetting";
	}

	@GetMapping("/community/hobby")
	public String hobby(Model model) {
		logger.info("취미 공유 진입");
		List<BVO> list = boardService.getBoardListByCate("취미공유");
		model.addAttribute("list", list);
		return "/board/community/hobby";
	}

	/* news */
	@GetMapping("/news/trend")
	public String trend(Model model) {
		logger.info("IT/트렌드  진입");
		List<BVO> list = boardService.getBoardListByCate("IT/트렌드");
		model.addAttribute("list", list);
		return "/board/news/trend";
	}

	@GetMapping("/news/issue")
	public String issue(Model model) {
		logger.info("핫이슈 진입");
		List<BVO> list = boardService.getBoardListByCate("핫이슈");
		model.addAttribute("list", list);
		return "/board/news/issue";
	}

	@GetMapping("/news/gameInfo")
	public String gameInfo(Model model) {
		logger.info("게임출시정보 진입");
		List<BVO> list = boardService.getBoardListByCate("게임출시정보");
		model.addAttribute("list", list);
		return "/board/news/gameInfo";
	}

	@GetMapping("/news/hotDeal")
	public String hotDeal(Model model) {
		logger.info("꿀딜/장터 진입");
		List<BVO> list = boardService.getBoardListByCate("꿀딜/장터");
		model.addAttribute("list", list);
		return "/board/news/hotDeal";
	}

	/* trade */
	@GetMapping("/trade/mybench")
	public String mybench(Model model) {
		logger.info("벤치마킹 인증 진입");
		List<BVO> list = boardService.getBoardListByCate("벤치마킹인증");
		model.addAttribute("list", list);
		return "/board/trade/mybench";
	}

	@GetMapping("/trade/aftertrade")
	public String aftertrade(Model model) {
		logger.info("거래 후기 진입");
		List<BVO> list = boardService.getBoardListByCate("거래후기");
		model.addAttribute("list", list);
		return "/board/trade/aftertrade";
	}

	/* center */
	@GetMapping("/center/qna")
	public String qna(Model model) {
		logger.info("1:1 문의 진입");
		return "/board/center/qna";
	}

	@GetMapping("/center/report")
	public String report(Model model) {
		logger.info("사기피해 신고 진입");
		List<BVO> list = boardService.getBoardListByCate("사기피해신고");
		model.addAttribute("list", list);
		return "/board/center/report";
	}

	// ---------------------------------------------------------------------------------------------------------------------

	@RequestMapping("/insertBoardForm")
	public String insertBoardForm() {
		logger.info("게시글 글쓰기 진입");
		return "/board/insertBoardForm";
	}

	@RequestMapping("/contentForm")
	public String contentForm(@RequestParam("b_seq") String b_seq, Model model) {
		logger.info("게시글 진입");
		int seq = Integer.parseInt(b_seq);
		boardService.upViews(seq);
		boardVO = (BoardVO) boardService.getBoardById(seq);
		boardVO.setB_text(boardVO.getB_text().replace("\r\n", "<br>"));
		List<CommentVO> commentList = commentService.getCommentListById(seq);

		for (CommentVO comment : commentList) {
			comment.setC_text(comment.getC_text().replace("\r\n", "<br>"));
		}

		int commentCnt = commentList.size();
		logger.info(String.valueOf(commentCnt));
		boardVO.setB_commentcount(commentCnt);
		model.addAttribute("boardContent", boardVO);
		model.addAttribute("commentList", commentList);

		return "/board/contentForm";
	}

	@RequestMapping("/contentReportForm")
	public String contentReportForm(@RequestParam("b_seq") String b_seq, Model model) {
		logger.info("신고 게시글 진입");
		int seq = Integer.parseInt(b_seq);
		boardService.upViews(seq);
		boardVO = (BoardVO) boardService.getBoardById(seq);
		boardVO.setB_text(boardVO.getB_text().replace("\r\n", "<br>"));
		model.addAttribute("boardContent", boardVO);

		return "/board/contentReportForm";
	}

	@RequestMapping("/updateForm")
	public String updateForm(@RequestParam("b_seq") String b_seq, Model model) {

		// required는 파라미터값이 들어오지않았을때 404에러를 막는다.
		// defaultValue는 required가 false일때 해당 파라미터의 기본값을 설정한다
		int seq = Integer.parseInt(b_seq);
		logger.info("게시글 수정 진입");
		boardVO = (BoardVO) boardService.getBoardById(seq);
		model.addAttribute("updateContent", boardVO);

		return "/board/updateForm";
	}

//---------------------------------------------Action--------------------------------------------------
	/* board */
	@RequestMapping("/insertBoardAction")
	@ResponseBody
	public String insertBoardAction(@ModelAttribute("boardContent") @Valid BoardVO boardVO,
			BindingResult bindingResult) {
		logger.info("게시글 글쓰기 액션");

		if (bindingResult.hasErrors()) {
			return "<script> location.href='/board/insertBoardForm'</script>";
		} else {
			int result = boardService.createBoard(boardVO);
			if (result == 0) {
				logger.info("등록 실패");
				return "<script>alert('insert_board_failed'); location.href='/board/insertBoardForm';</script>";
			} else {
				if (boardVO.getB_category().equals("사기피해신고")) {
					return "<script>alert('insert_board_complete'); location.href='/board/contentReportForm?b_seq="
							+ result + "'</script>";
				} else {
					return "<script>alert('insert_board_complete'); location.href='/board/contentForm?b_seq=" + result
							+ "'</script>";
				}
			}
		}
	}

	@RequestMapping("/updateBoardAction")
	@ResponseBody
	public String updateBoardAction(@ModelAttribute("updateContent") @Valid BoardVO boardVO, BindingResult bindingResult

	/*
	 * , @RequestParam("b_title") String b_title,
	 * 
	 * @RequestParam("b_text") String b_text, @RequestParam("b_category") String
	 * b_category,
	 * 
	 * @RequestParam("b_uploadImg") String b_uploadImg
	 */) {

		logger.info("게시글 수정 액션");
		/*
		 * boardVO.setB_seq(b_seq); boardVO.setB_title(b_title);
		 * boardVO.setB_category(b_category); boardVO.setB_uploadImg(b_uploadImg);
		 * boardVO.setB_text(b_text);
		 */

		if (bindingResult.hasErrors()) {
			return "<script> location.href='/board/updateForm?b_seq=" + boardVO.getB_seq() + "'</script>";
		} else {
			boardService.updateBoard(boardVO);
			if (boardVO.getB_category().equals("사기피해신고")) {
				return "<script>alert('update_complete'); location.href='/board/contentReportForm?b_seq="
						+ boardVO.getB_seq() + "'</script>";
			} else {
				return "<script>alert('update_complete'); location.href='/board/contentForm?b_seq=" + boardVO.getB_seq()
						+ "'</script>";
			}
		}

	}

	@RequestMapping("/deleteBoardAction")
	@ResponseBody
	public String deleteBoardAction(@RequestParam("b_seq") String b_seq, HttpServletRequest request) {
		int seq = Integer.parseInt(b_seq);
		boardService.deleteBoard(seq);
		logger.info("게시글 삭제 액션");

		return "<script>alert('delete_complete'); location.href='/main'</script>";
	}

	@RequestMapping("/recommendAction")
	@ResponseBody
	public String recommendAction(@RequestParam("b_seq") String b_seq) {
		logger.info("추천하기 액션");
		int seq = Integer.parseInt(b_seq);
		boardService.upRecommend(seq);

		return "<script>location.href='/board/contentForm?b_seq=" + b_seq + "'</script>";
	}

	/* comment */
	@RequestMapping("/insertCommentAction")
	@ResponseBody
	public String insertCommentAction(@RequestParam("c_writer") String c_writer, @RequestParam("c_text") String c_text,
			@RequestParam("c_boardSeq") String c_boardSeq, @RequestParam("t_seq") @Nullable String t_seq) {
		logger.info("댓글 쓰기 액션");
		int seq = Integer.parseInt(c_boardSeq);
		commentService.insertComment(new CommentVO(c_writer, c_text, seq));

		if (t_seq != null) {
			return "<script>alert('comment_complete'); location.href='/board/contentTradeForm?t_seq=" + c_boardSeq
					+ "'</script>";
		} else {
			return "<script>alert('comment_complete'); location.href='/board/contentForm?b_seq=" + c_boardSeq
					+ "'</script>";
		}
	}

	@RequestMapping("/deleteCommentAction")
	@ResponseBody
	public String deleteCommentAction(@RequestParam("c_seq") String c_seq,
			@RequestParam("c_boardSeq") String c_boardSeq, @RequestParam("t_seq") @Nullable String t_seq,
			HttpServletRequest request) {
		int seq = Integer.parseInt(c_seq);
		commentService.deleteComment(seq);
		logger.info("댓글 삭제 액션");
		if (t_seq != null) {
			return "<script>alert('delete_comment_complete'); location.href='/board/contentTradeForm?t_seq=" + t_seq
					+ "'</script>";
		} else {
			return "<script>alert('delete_comment_complete'); location.href='/board/contentForm?b_seq=" + c_boardSeq
					+ "'</script>";
		}
	}

	/* center */
	@RequestMapping("/qnaAction")
	@ResponseBody
	public String qnaAction(@RequestParam("q_boardSeq") String q_boardSeq,
			@RequestParam("q_category") String q_category, @RequestParam("q_title") String q_title,
			@RequestParam("q_text") String q_text, @RequestParam("q_email") String q_email,
			@RequestParam("q_tel") String q_tel, @RequestParam("q_uploadImg") String q_uploadImg) {

		logger.info("1:1 문의 쓰기 액션");
		int seq;
		try {
			seq = Integer.parseInt(q_boardSeq);
		} catch (NumberFormatException e) {
			logger.error("qnaAction : q_boardSeq의 숫자입력이 제대로 되지 않았음");
			seq = 0; // 문의자가 게시글번호를 모를 때
		}

		qnaService.insertQna(new QnaVO(seq, q_category, q_title, q_text, q_email, q_tel, q_uploadImg));

		return "<script>alert('qna_complete'); location.href='/main'</script>";
	}

	// ------------------------------------------------------------------------------------------------------------------

	// @InitBinder는 이 컨트롤러 클래스의 handler중 입력 폼 데이터를 바인딩할 때 어떤Validator객체로 검증하는지를
	// 지정한다.
	// @InitBinder는 하나의 컨트롤러 클래스당 하나의 메서드를 사용할 수 있다.
	// ex)나는 boardVO의 입력폼을 할꺼니깐 BoardValidator클래스를 정의하고 setValidator메서드로 세팅을 하였다.
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.setValidator(new BoardValidator());
	}
}
