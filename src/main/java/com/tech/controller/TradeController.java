package com.tech.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tech.common.Pagination;
import com.tech.service.interfaces.BoardService;
import com.tech.service.interfaces.CommentService;
import com.tech.service.interfaces.ImageService;
import com.tech.service.interfaces.TradeService;
import com.tech.valid.TradeValidator;
import com.tech.vo.BVO;
import com.tech.vo.BoardVO;
import com.tech.vo.CommentVO;
import com.tech.vo.ImageVO;
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
	@Autowired
	private BoardService boardService;
	@Autowired
	private ImageService imageService;

	/*
	 * @InitBinder public void initBinder(WebDataBinder binder) {
	 * binder.setValidator(new TradeValidator()); }
	 */

	/* trade */
	@GetMapping("/trade/tradeInfo")
	public String tradeInfo() {
		logger.info("중고거래 안내 진입");
		return "/board/trade/info";
	}

	@GetMapping("/trade/tradeBoard")
	public String tradeBoard(Model model, 
	@RequestParam(required = false, defaultValue = "1") int page,
	@RequestParam(required = false, defaultValue = "1") int range) 
			throws Exception {
		logger.info("거래 게시판 진입");
		 String category = "거래게시판";
			
		 /*게시글 출력*/
		  int listCnt = tradeService.getBoardListCnt(); 
		  Pagination pagination = new Pagination(); 
		  pagination.pageInfo(page, range, listCnt);
		  pagination.setCategory(category); 
		  model.addAttribute("pagination", pagination); 
		  model.addAttribute("list", tradeService.getBoardLists(pagination));
		  
		  
		  model.addAttribute("noticeList",boardService.getBoardListByCategoryKeywordNumber(new BoardVO("공지사항","b_seq",999)));
		  
		return "/board/trade/tradeBoard";
	}

	@RequestMapping("/contentTradeForm")
	public String contentTradeForm(@RequestParam("t_seq") String t_seq, Model model) {
		logger.info("거래 게시글 진입");
		int seq = Integer.parseInt(t_seq);
		
		/* 조회수증가 */
		tradeService.upViews(seq);
		
		/* 댓글리스트로드 */
		List<CommentVO> commentList = commentService.getCommentListById(seq);
		for (CommentVO comment : commentList) {
			comment.setC_text(comment.getC_text().replace("\r\n", "<br>"));
		}

		model.addAttribute("commentList", commentList);
		
		/* 게시글가져오기 */
		tradeVO = (TradeVO) tradeService.getBoardById(seq);
		tradeVO.setT_text(tradeVO.getT_text().replace("\r\n", "<br>"));
		model.addAttribute("tradeContent", tradeVO);

		/* 이미지로드 */
		model.addAttribute("imageList",imageService.getImageListById(seq));
		
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
			MultipartHttpServletRequest files, HttpServletRequest request,
			BindingResult bindingResult) {
		logger.info("게시글 글쓰기 액션");
		
		
		ServletContext application = request.getServletContext();
		
		//서버에서 저장 할 경로
		String uploadFolder = (String) application.getAttribute("path");
		System.out.println("저장 경로 : "+uploadFolder);
		
		  
		List<MultipartFile> list = files.getFiles("files");
		List<String> i_list = new ArrayList<String>();
		for(int i = 0; i<list.size(); i++) {
			String fileRealName = list.get(i).getOriginalFilename();
			long size = list.get(i).getSize();
			
			System.out.println("파일명 :" + fileRealName);
			System.out.println("사이즈 : " + size);
			
			File saveFile = new File(uploadFolder + "\\" + fileRealName);
			i_list.add(fileRealName);
			try {
				list.get(i).transferTo(saveFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		

		tradeVO.setT_uploadImg(i_list.get(0));	//썸네일용	저장
		
		/* 이미지가 안들어왔을 경우 기본값 설정 */
		if(tradeVO.getT_uploadImg().equals("") || tradeVO.getT_uploadImg() == null) {
			  tradeVO.setT_uploadImg("trade_default.png"); }
			  
		/* 현재 상품명은 사용하지 않음 ""값으로 저장 */
		if(tradeVO.getT_prodName().equals("") || tradeVO.getT_prodName() == null) {
			  tradeVO.setT_prodName(""); }
		
		
		int result = tradeService.createBoard(tradeVO);	//result는 새로생성된 tradeSeq값임..

		
		ImageVO imageVO = new ImageVO();	//다중 파일 db로 저장
		for(int i=0; i<i_list.size(); i++) {
		imageVO.setI_img(i_list.get(i));
		imageVO.setI_boardSeq(result);
		imageService.insertImage(imageVO);
		}
		
		
		
		

		
		  
		 
		
		
		if (bindingResult.hasErrors()) {
			return "<script> location.href='/board/insertTradeBoardForm'</script>";
		} else {
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
	public String deleteTradeBoardAction(
			@RequestParam("t_seq") String t_seq, HttpServletRequest request) {
		int seq = Integer.parseInt(t_seq);
		tradeService.deleteBoard(seq);
		logger.info("거래 게시글 삭제 액션");

		return "<script>alert('trade_delete_complete'); location.href='/board/trade/tradeBoard'</script>";
	}

	@RequestMapping("/updateTradeBoardAction")
	@ResponseBody
	public String updateTradeBoardAction(
			HttpServletRequest request,
			MultipartHttpServletRequest files,
			@ModelAttribute("updateTradeContent") @Valid TradeVO tradeVO,
			BindingResult bindingResult) {


		/* 기존 게시글의 이미지전부 삭제 */
		imageService.deleteImage(tradeVO.getT_seq());
		
		/* 재업로드한 이미지들을 등록 */
		ServletContext application = request.getServletContext();
		
		//서버에서 저장 할 경로
		String uploadFolder = (String) application.getAttribute("path");
		
		
		List<MultipartFile> list = files.getFiles("files");
		List<String> i_list = new ArrayList<String>();
		for(int i = 0; i<list.size(); i++) {
			String fileRealName = list.get(i).getOriginalFilename();
			long size = list.get(i).getSize();
			
			System.out.println("파일명 :" + fileRealName);
			System.out.println("사이즈 : " + size);
			
			File saveFile = new File(uploadFolder + "\\" + fileRealName);
			i_list.add(fileRealName);
			try {
				list.get(i).transferTo(saveFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		ImageVO imageVO = new ImageVO();	//다중 파일 db로 저장
		for(int i=0; i<i_list.size(); i++) {
		imageVO.setI_img(i_list.get(i));
		imageVO.setI_boardSeq(tradeVO.getT_seq());
		imageService.insertImage(imageVO);
		}
		tradeVO.setT_uploadImg(i_list.get(0));	//썸네일용	저장
		
		if(tradeVO.getT_uploadImg() == null|| tradeVO.getT_uploadImg().equals("")){
			tradeVO.setT_uploadImg("trade_default.png");
		}
		
		
		
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
