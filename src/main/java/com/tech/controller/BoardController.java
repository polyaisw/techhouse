package com.tech.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tech.service.interfaces.ApplyService;
import com.tech.service.interfaces.BoardService;
import com.tech.service.interfaces.CommentService;
import com.tech.service.interfaces.ProductService;
import com.tech.service.interfaces.QnaService;
import com.tech.service.interfaces.TradeService;
import com.tech.vo.ApplyVO;
import com.tech.vo.BVO;
import com.tech.vo.BoardVO;
import com.tech.vo.CommentVO;
import com.tech.vo.ProductVO;
import com.tech.vo.QnaVO;
import com.tech.vo.TradeVO;
import com.tech.vo.UserVO;

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
	private TradeService tradeService;
	@Autowired
	private CommentService commentService;
	@Autowired
	private ProductService productService;
	@Autowired
	private ApplyService applyService;

	BoardVO boardVO;
	ProductVO productVO;
	TradeVO tradeVO;

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

	/* apply */
	@GetMapping("/apply/product")
	public String apply(Model model) {
		logger.info("이달의 상품페이지 진입");

		// 관리자용 상품테이블 표시
		List<ProductVO> lists = productService.getProductList();
		model.addAttribute("productList", lists);

		// 게시용 상품 표시
		for (ProductVO productVO : lists) {
			if (productVO.getProd_posting() == 1)
				model.addAttribute("productContent", productVO);
		}

		// 관리자용 지원자현황테이블 표시
		List<ApplyVO> a_lists = applyService.getApplyList();
		model.addAttribute("applyList", a_lists);

		int applyCountNum = applyService.getApplyCount(); // 총 지원개수
		int applyCountMe = applyService.getApplyCountById("kys123"); // 내가지원한 개수

		double applyPercent = (applyCountMe / (double) applyCountNum) * 100; // 당첨확률

		if (String.valueOf(applyPercent).equals("NaN"))
			applyPercent = 0;

		String percent = String.format("%.1f", applyPercent);

		model.addAttribute("count", applyCountNum);
		model.addAttribute("countMe", applyCountMe);
		model.addAttribute("percent", percent);

		// 타임아웃 시 당첨
		ApplyVO aVO2 = applyService.getRandomSelected();
		// 당첨자 등록
		productService.insertSelectedMember(aVO2);

		return "/board/apply/product";
	}

	@GetMapping("/apply/roulette")
	public String roullete() {
		logger.info("룰렛 진입");
		return "/board/apply/roulette";
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

	@RequestMapping("/insertTradeBoardForm")
	public String insertTradeBoardForm() {
		logger.info("거래 게시글 글쓰기 진입");
		return "/board/insertTradeBoardForm";
	}

	@RequestMapping("/contentForm")
	public String contentForm(@RequestParam("b_seq") String b_seq, Model model) {
		logger.info("게시글 진입");
		int seq = Integer.parseInt(b_seq);
		boardService.upViews(seq);
		boardVO = (BoardVO) boardService.getBoardById(seq);
		boardVO.setB_text(boardVO.getB_text().replace("\r\n","<br>"));
		List<CommentVO> commentList = commentService.getCommentListById(seq);
		
		for(CommentVO comment: commentList) {
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
		boardVO.setB_text(boardVO.getB_text().replace("\r\n","<br>"));
		model.addAttribute("boardContent", boardVO);

		return "/board/contentReportForm";
	}

	@RequestMapping("/contentTradeForm")
	public String contentTradeForm(@RequestParam("t_seq") String t_seq, Model model) {
		logger.info("거래 게시글 진입");
		int seq = Integer.parseInt(t_seq);
		tradeService.upViews(seq);
		List<CommentVO> commentList = commentService.getCommentListById(seq);
		for(CommentVO comment: commentList) {
			comment.setC_text(comment.getC_text().replace("\r\n", "<br>"));
		}
		tradeVO = (TradeVO) tradeService.getBoardById(seq);
		tradeVO.setT_text(tradeVO.getT_text().replace("\r\n","<br>"));
		model.addAttribute("tradeContent", tradeVO);
		model.addAttribute("commentList", commentList);
		
		return "/board/contentTradeForm";
	}

	@RequestMapping("/updateForm")
	public String updateForm(Model model, @RequestParam("b_seq") String b_seq) {

		logger.info("게시글 수정 진입");
		int seq = Integer.parseInt(b_seq);
		boardVO = (BoardVO) boardService.getBoardById(seq);

		model.addAttribute("updateContent", boardVO);

		return "/board/updateForm";
	}

	@RequestMapping("/updateTradeForm")
	public String updateTradeForm(Model model, @RequestParam("t_seq") String t_seq) {

		logger.info("거래 게시글 수정 진입");
		int seq = Integer.parseInt(t_seq);
		tradeVO = (TradeVO) tradeService.getBoardById(seq);

		model.addAttribute("updateTradeContent", tradeVO);

		return "/board/updateTradeForm";
	}

	@RequestMapping("/updateProductForm")
	public String updateProductForm(Model model, @RequestParam("prod_seq") String prod_seq) {

		logger.info("상품 수정 진입");
		int seq = Integer.parseInt(prod_seq);

		productVO = productService.getProductById(seq);
		model.addAttribute("productContent", productVO);

		return "/board/updateProductForm";
	}

//---------------------------------------------Action--------------------------------------------------
	/* board */
	@RequestMapping("/insertBoardAction")
	@ResponseBody
	public String insertBoardAction(@RequestParam("b_writer") String b_writer, @RequestParam("b_title") String b_title,
			@RequestParam("b_text") String b_text, @RequestParam("b_category") String b_category,
			@RequestParam("b_uploadImg") String b_uploadImg) {
		logger.info("게시글 글쓰기 액션");

		int result = boardService.createBoard(new BoardVO(b_title, b_writer, b_text, b_uploadImg, b_category));
		logger.info("result");
		if (result == 0) {
			logger.info("등록 실패");
			return "<script>alert('insert_board_failed'); location.href='/board/insertBoardForm';</script>";
		} else {
			if (b_category.equals("사기피해신고")) {
				return "<script>alert('insert_board_complete'); location.href='/board/contentReportForm?b_seq=" + result
						+ "'</script>";
			} else {
				return "<script>alert('insert_board_complete'); location.href='/board/contentForm?b_seq=" + result
						+ "'</script>";
			}
		}
	}

	@RequestMapping("/updateBoardAction")
	@ResponseBody
	public String updateBoardAction(@RequestParam("b_seq") String b_seq, @RequestParam("b_title") String b_title,
			@RequestParam("b_text") String b_text, @RequestParam("b_category") String b_category,
			@RequestParam("b_uploadImg") String b_uploadImg) {

		logger.info("게시글 수정 액션");
		int seq = Integer.parseInt(b_seq);
		boardVO.setB_seq(seq);
		boardVO.setB_title(b_title);
		boardVO.setB_category(b_category);
		boardVO.setB_uploadImg(b_uploadImg);
		boardVO.setB_text(b_text);

		boardService.updateBoard(boardVO);
		if (b_category.equals("사기피해신고")) {
			return "<script>alert('update_complete'); location.href='/board/contentReportForm?b_seq=" + b_seq
					+ "'</script>";
		} else {
			return "<script>alert('update_complete'); location.href='/board/contentForm?b_seq=" + b_seq + "'</script>";
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

	/* trade */
	@RequestMapping("/insertTradeBoardAction")
	@ResponseBody
	public String insertTradeBoardAction(@RequestParam("t_writer") String t_writer,
			@RequestParam("t_title") String t_title, @RequestParam("t_text") String t_text,
			@RequestParam("t_category") String t_category, @RequestParam("t_uploadImg") String t_uploadImg,
			@RequestParam("t_price") String t_price, @RequestParam("t_prodName") String t_prodName) {
		logger.info("게시글 글쓰기 액션");

		int result = tradeService
				.createBoard(new TradeVO(t_title, t_writer, t_prodName, t_price, t_text, t_uploadImg, t_category));
		logger.info("result");
		if (result == 0) {
			logger.info("등록 실패");
			return "<script>alert('insert_trade_failed'); location.href='/board/insertTradeBoardForm';</script>";
		} else {
			return "<script>alert('insert_trade_complete'); location.href='/board/contentTradeForm?t_seq=" + result
					+ "'</script>";
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
	public String updateTradeBoardAction(@RequestParam("t_seq") String t_seq, @RequestParam("t_title") String t_title,
			@RequestParam("t_text") String t_text, @RequestParam("t_uploadImg") String t_uploadImg) {

		logger.info("거래 게시글 수정 액션");
		int seq = Integer.parseInt(t_seq);
		tradeVO.setT_seq(seq);
		tradeVO.setT_title(t_title);
		tradeVO.setT_uploadImg(t_uploadImg);
		tradeVO.setT_text(t_text);

		tradeService.updateBoard(tradeVO);
		return "<script>alert('trade_update_complete'); location.href='/board/contentTradeForm?t_seq=" + t_seq
				+ "'</script>";

	}

	/* apply */

	@RequestMapping("/insertProductAction")
	@ResponseBody
	public String insertProductAction(@RequestParam("prod_productName") String prod_productName,
			@RequestParam("prod_price") String prod_price, @RequestParam("prod_uploadImg") String prod_uploadImg) {
		logger.info("상품 등록 액션");
		productService.insertProduct(new ProductVO(prod_productName, prod_price, prod_uploadImg));

		return "<script>alert('product_comlete'); location.href='/board/apply/product'</script>";
	}

	@RequestMapping("/updateProductAction")
	@ResponseBody
	public String updateProductAction(@RequestParam("prod_seq") String prod_seq,
			@RequestParam("prod_productName") String prod_productName, @RequestParam("prod_price") String prod_price,
			@RequestParam("prod_uploadImg") String prod_uploadImg,
			@RequestParam("prod_selectedId") String prod_selectedId,
			@RequestParam("prod_selectedName") String prod_selectedName,
			@RequestParam("prod_selectedTel") String prod_selectedTel) {

		logger.info("상품 수정 액션");
		int seq = Integer.parseInt(prod_seq);

		productVO = productService.getProductById(seq);
		productVO.setProd_productName(prod_productName);
		productVO.setProd_price(prod_price);
		productVO.setProd_uploadImg(prod_uploadImg);
		productVO.setProd_selectedId(prod_selectedId);
		productVO.setProd_selectedName(prod_selectedName);
		productVO.setProd_selectedTel(prod_selectedTel);

		productService.updateProduct(productVO);

		return "<script>alert('update_product_complete'); location.href='/board/apply/product'</script>";
	}

	@RequestMapping("/deleteProductAction")
	@ResponseBody
	public String deleteProductAction(@RequestParam("prod_seq") String prod_seq, HttpServletRequest request) {
		int seq = Integer.parseInt(prod_seq);
		productService.deleteProduct(seq);
		logger.info("상품 삭제 액션");

		return "<script>alert('delete_product_complete'); location.href='/board/apply/product'</script>";
	}

	@RequestMapping("/insertApplyAction")
	@ResponseBody
	public String insertApplyAction(@RequestParam("prod_productName") String prod_productName) {
		logger.info(prod_productName);
		System.out.println(prod_productName);
		logger.info("응모 지원 액션");
		// 세션에있는 객체가져와 세팅
		UserVO vo = new UserVO();
		vo.setId("kys123");
		vo.setTel("0101010101");
		vo.setName("김예성");
		vo.setTicket(10);

		ApplyVO aVO = new ApplyVO(prod_productName, vo.getId(), vo.getName(), vo.getTel());

		applyService.insertApply(aVO); // 이게 성공하면 티켓개수를 줄인다. updateUser 구현후에 수정

		return "<script>alert('apply_product_comlete'); location.href='/board/apply/product'</script>";
	}

	@RequestMapping("/PostProductAction")
	@ResponseBody
	public String PostProductAction(Model model, @RequestParam("prod_seq") String prod_seq) {
		logger.info("상품 게시 액션");
		int seq = Integer.parseInt(prod_seq);

		List<ProductVO> lists = productService.getProductList();
		for (ProductVO productVO : lists) {
			productVO.setProd_posting(0);
			productService.updatePosting(productVO);
		}

		productVO = productService.getProductById(seq);

		productVO.setProd_posting(1);
		productService.updatePosting(productVO);

		return "<script>alert('post_product_complete'); location.href='/board/apply/product'</script>";
	}

	@RequestMapping("/UnPostProductAction")
	@ResponseBody
	public String UnPostProductAction() {
		logger.info("상품 게시물 내리기 액션");

		List<ProductVO> lists = productService.getProductList();
		for (ProductVO productVO : lists) {
			productVO.setProd_posting(0);
			productService.updatePosting(productVO);
		}
		return "<script>alert('unpost_product_complete'); location.href='/board/apply/product'</script>";
	}

	@RequestMapping("/deleteAllApplyAction")
	@ResponseBody
	public String deleteAllApplyAction() {
		applyService.deleteAllApply();
		logger.info("응모한 회원 기록 삭제 액션");

		return "<script>alert('delete_all_complete'); location.href='/board/apply/product'</script>";
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

	/* comment */
	@RequestMapping("/insertCommentAction")
	@ResponseBody
	public String insertCommentAction(@RequestParam("c_writer") String c_writer, @RequestParam("c_text") String c_text,
			@RequestParam("c_boardSeq") String c_boardSeq,
			@RequestParam("t_seq") @Nullable String t_seq) {
		logger.info("댓글 쓰기 액션");
		int seq = Integer.parseInt(c_boardSeq);
		commentService.insertComment(new CommentVO(c_writer, c_text, seq));

		if(t_seq != null) {
			return "<script>alert('comment_complete'); location.href='/board/contentTradeForm?t_seq=" + c_boardSeq
					+ "'</script>";
		}
		else {
			return "<script>alert('comment_complete'); location.href='/board/contentForm?b_seq=" + c_boardSeq
					+ "'</script>";
		}
	}

	@RequestMapping("/deleteCommentAction")
	@ResponseBody
	public String deleteCommentAction(
			@RequestParam("c_seq") String c_seq, 
			@RequestParam("c_boardSeq") String c_boardSeq,
			@RequestParam("t_seq") @Nullable String t_seq,
			HttpServletRequest request) {
		int seq = Integer.parseInt(c_seq);
		commentService.deleteComment(seq);
		logger.info("댓글 삭제 액션");
		if(t_seq != null) {
			return "<script>alert('delete_comment_complete'); location.href='/board/contentTradeForm?t_seq="+t_seq+"'</script>";
		}else {
			return "<script>alert('delete_comment_complete'); location.href='/board/contentForm?b_seq="+c_boardSeq+"'</script>";
		}
	}

}
