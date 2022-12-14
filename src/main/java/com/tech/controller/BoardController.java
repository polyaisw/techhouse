package com.tech.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.http.HttpResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tech.common.Pagination;
import com.tech.service.interfaces.BoardService;
import com.tech.service.interfaces.CommentService;
import com.tech.service.interfaces.ImageService;
import com.tech.service.interfaces.QnaService;
import com.tech.valid.BoardValidator;
import com.tech.vo.BVO;
import com.tech.vo.BoardVO;
import com.tech.vo.CommentVO;
import com.tech.vo.ImageVO;
import com.tech.vo.ProductVO;
import com.tech.vo.QnaVO;
import com.tech.vo.UserVO;

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
	@Autowired
	private ImageService imageService;	//?????? ??????????????????

	BoardVO boardVO;
	ProductVO productVO;

	/* community */
	@GetMapping("/community/free")
	public String free(Model model, 
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) 
					throws Exception {
		logger.info("??????????????? ??????");
		 String category = "???????????????";
		
		 /*????????? ??????*/
		  int listCnt = boardService.getBoardListByCate(category).size(); 
		  System.out.println(listCnt +"???  ???????????????");
		  Pagination pagination = new Pagination(); 
		  pagination.pageInfo(page, range, listCnt);
		  pagination.setCategory(category); 
		  model.addAttribute("pagination", pagination); 
		  model.addAttribute("list", boardService.getBoardLists(pagination));
		 
		/* ?????????5??? */
		BoardVO boardVO = new BoardVO(category,"b_recommed",5);
		model.addAttribute("recommedList",boardService.getBoardListByCategoryKeywordNumber(boardVO));
		
		/* ?????????5??? */
		BoardVO boardVO2 = new BoardVO(category,"b_views",5);
		model.addAttribute("viewsList",boardService.getBoardListByCategoryKeywordNumber(boardVO2));

		/* ???????????? ?????? */
		model.addAttribute("noticeList",boardService.getBoardListByCategoryKeywordNumber(new BoardVO("????????????","b_seq",999)));
		
		return "/board/community/free";
	}

	@GetMapping("/community/mysetting")
	public String mysetting(Model model,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) 
					throws Exception {
		logger.info("??????????????? ??????");
		String category = "???????????????";

		  int listCnt = boardService.getBoardListByCate(category).size(); 
		  Pagination pagination = new Pagination(); 
		  pagination.pageInfo(page, range, listCnt);
		  pagination.setCategory(category); 
		  model.addAttribute("pagination", pagination);
		  
		  model.addAttribute("list", boardService.getBoardLists(pagination));
		  model.addAttribute("mySettingListBest",boardService.getBoardListByCategoryKeywordNumber(new BoardVO("???????????????","b_recommed",5)));
		  model.addAttribute("noticeList",boardService.getBoardListByCategoryKeywordNumber(new BoardVO("????????????","b_seq",999)));
		  
		return "/board/community/mysetting";
	}

	@GetMapping("/community/hobby")
	public String hobby(Model model,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) 
					throws Exception {
		
		logger.info("?????? ?????? ??????");
		String category = "????????????";
		
		 /*????????? ??????*/
		  int listCnt = boardService.getBoardListByCate(category).size(); 
		  Pagination pagination = new Pagination(); 
		  pagination.pageInfo(page, range, listCnt);
		  pagination.setCategory(category); 
		  model.addAttribute("pagination", pagination); 
		  model.addAttribute("list", boardService.getBoardLists(pagination));
		 
		/* ?????????5??? */
		BoardVO boardVO = new BoardVO(category,"b_recommed",5);
		model.addAttribute("recommedList",boardService.getBoardListByCategoryKeywordNumber(boardVO));
		
		/* ?????????5??? */
		BoardVO boardVO2 = new BoardVO(category,"b_views",5);
		model.addAttribute("viewsList",boardService.getBoardListByCategoryKeywordNumber(boardVO2));
		
		model.addAttribute("noticeList",boardService.getBoardListByCategoryKeywordNumber(new BoardVO("????????????","b_seq",999)));
		
		return "/board/community/hobby";
	}

	/* news */
	@GetMapping("/news/trend")
	public String trend(Model model,@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) 
					throws Exception {
		logger.info("IT/?????????  ??????");
		String category = "IT/?????????";
		
		 /*????????? ??????*/
		  int listCnt = boardService.getBoardListByCate(category).size(); 
		  Pagination pagination = new Pagination(); 
		  pagination.pageInfo(page, range, listCnt);
		  pagination.setCategory(category); 
		  model.addAttribute("pagination", pagination); 
		  model.addAttribute("list", boardService.getBoardLists(pagination));
		 
		/* ?????????5??? */
		BoardVO boardVO = new BoardVO(category,"b_recommed",5);
		model.addAttribute("recommedList",boardService.getBoardListByCategoryKeywordNumber(boardVO));
		
		/* ?????????5??? */
		BoardVO boardVO2 = new BoardVO(category,"b_views",5);
		model.addAttribute("viewsList",boardService.getBoardListByCategoryKeywordNumber(boardVO2));
		
		model.addAttribute("noticeList",boardService.getBoardListByCategoryKeywordNumber(new BoardVO("????????????","b_seq",999)));
		return "/board/news/trend";
	}

	@GetMapping("/news/issue")
	public String issue(Model model,@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) 
					throws Exception {
		logger.info("????????? ??????");
		String category = "?????????";
		
		 /*????????? ??????*/
		  int listCnt = boardService.getBoardListByCate(category).size(); 
		  Pagination pagination = new Pagination(); 
		  pagination.pageInfo(page, range, listCnt);
		  pagination.setCategory(category); 
		  model.addAttribute("pagination", pagination); 
		  model.addAttribute("list", boardService.getBoardLists(pagination));
		 
		/* ?????????5??? */
		BoardVO boardVO = new BoardVO(category,"b_recommed",5);
		model.addAttribute("recommedList",boardService.getBoardListByCategoryKeywordNumber(boardVO));
		
		/* ?????????5??? */
		BoardVO boardVO2 = new BoardVO(category,"b_views",5);
		model.addAttribute("viewsList",boardService.getBoardListByCategoryKeywordNumber(boardVO2));
		
		model.addAttribute("noticeList",boardService.getBoardListByCategoryKeywordNumber(new BoardVO("????????????","b_seq",999)));
		return "/board/news/issue";
	}

	@GetMapping("/news/gameInfo")
	public String gameInfo(Model model,@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) 
					throws Exception {
		logger.info("?????????????????? ??????");
		String category = "??????????????????";
		
		
		 /*????????? ??????*/
		  int listCnt = boardService.getBoardListByCate(category).size(); 
		  Pagination pagination = new Pagination(); 
		  pagination.pageInfo(page, range, listCnt);
		  pagination.setCategory(category); 
		  model.addAttribute("pagination", pagination); 
		  model.addAttribute("list", boardService.getBoardLists(pagination));
		
		
		List<BVO> list = boardService.getBoardListByCate(category);
		model.addAttribute("list", list);
		
		model.addAttribute("gameInfoListBest",boardService.getBoardListByCategoryKeywordNumber(new BoardVO(category,"b_seq",5)));
		  model.addAttribute("noticeList",boardService.getBoardListByCategoryKeywordNumber(new BoardVO("????????????","b_seq",999)));
		return "/board/news/gameInfo";
	}

	@GetMapping("/news/hotDeal")
	public String hotDeal(Model model,@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) 
					throws Exception {
		logger.info("??????/?????? ??????");
		String category = "??????/??????";
		
		 /*????????? ??????*/
		  int listCnt = boardService.getBoardListByCate(category).size(); 
		  Pagination pagination = new Pagination(); 
		  pagination.pageInfo(page, range, listCnt);
		  pagination.setCategory(category); 
		  model.addAttribute("pagination", pagination); 
		  model.addAttribute("list", boardService.getBoardLists(pagination));
		 
		/* ?????????5??? */
		BoardVO boardVO = new BoardVO(category,"b_recommed",5);
		model.addAttribute("recommedList",boardService.getBoardListByCategoryKeywordNumber(boardVO));
		
		/* ?????????5??? */
		BoardVO boardVO2 = new BoardVO(category,"b_views",5);
		model.addAttribute("viewsList",boardService.getBoardListByCategoryKeywordNumber(boardVO2));
		
		model.addAttribute("noticeList",boardService.getBoardListByCategoryKeywordNumber(new BoardVO("????????????","b_seq",999)));
		return "/board/news/hotDeal";
	}

	/* trade */
	@GetMapping("/trade/mybench")
	public String mybench(Model model) {
		logger.info("???????????? ?????? ??????");
		List<BVO> list = boardService.getBoardListByCate("??????????????????");
		model.addAttribute("list", list);
		return "/board/trade/mybench";
	}

	@GetMapping("/trade/aftertrade")
	public String aftertrade(Model model,@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) 
					throws Exception  {
		logger.info("?????? ?????? ??????");
		String category = "????????????";
		
		 /*????????? ??????*/
		  int listCnt = boardService.getBoardListByCate(category).size(); 
		  Pagination pagination = new Pagination(); 
		  pagination.pageInfo(page, range, listCnt);
		  pagination.setCategory(category); 
		  model.addAttribute("pagination", pagination); 
		  model.addAttribute("list", boardService.getBoardLists(pagination));
		 
		/* ?????????5??? */
		BoardVO boardVO = new BoardVO(category,"b_recommed",5);
		model.addAttribute("recommedList",boardService.getBoardListByCategoryKeywordNumber(boardVO));
		
		/* ?????????5??? */
		BoardVO boardVO2 = new BoardVO(category,"b_views",5);
		model.addAttribute("viewsList",boardService.getBoardListByCategoryKeywordNumber(boardVO2));
		
		model.addAttribute("noticeList",boardService.getBoardListByCategoryKeywordNumber(new BoardVO("????????????","b_seq",999)));
		
		return "/board/trade/aftertrade";
	}

	/* center */
	@GetMapping("/center/qna")
	public String qna(Model model) throws IOException {
		logger.info("1:1 ?????? ??????");
		return "/board/center/qna";
	}

	@GetMapping("/center/report")
	public String report(Model model,@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) 
					throws Exception {
		logger.info("???????????? ?????? ??????");
		String category = "??????????????????";
		
		 /*????????? ??????*/
		  int listCnt = boardService.getBoardListByCate(category).size(); 
		  Pagination pagination = new Pagination(); 
		  pagination.pageInfo(page, range, listCnt);
		  pagination.setCategory(category); 
		  model.addAttribute("pagination", pagination); 
		  model.addAttribute("list", boardService.getBoardLists(pagination));
		  
		  model.addAttribute("noticeList",boardService.getBoardListByCategoryKeywordNumber(new BoardVO("????????????","b_seq",999)));
		  
		return "/board/center/report";
	}

	// ---------------------------------------------------------------------------------------------------------------------

	@RequestMapping("/insertBoardForm")
	public String insertBoardForm() {
		logger.info("????????? ????????? ??????");
		return "/board/insertBoardForm";
	}
	
	@RequestMapping("/insertNoticeBoardForm")
	public String insertNoticeBoardForm() {
		logger.info("???????????? ????????? ??????");
		return "/board/insertNoticeBoardForm";
	}
	
	@RequestMapping("/contentForm")
	public String contentForm(@RequestParam("b_seq") String b_seq, Model model) {
		logger.info("????????? ??????");
		int seq = Integer.parseInt(b_seq);
		
		/* ????????? ?????? */
		boardService.upViews(seq);
		
		/* ????????????????????? */
		boardVO = (BoardVO) boardService.getBoardById(seq);
		
		/* ???????????? */
		boardVO.setB_text(boardVO.getB_text().replace("\r\n", "<br>"));
		
		/* ??????????????? */
		List<CommentVO> commentList = commentService.getCommentListById(seq);

		for (CommentVO comment : commentList) {
			comment.setC_text(comment.getC_text().replace("\r\n", "<br>"));
		}
		int commentCnt = commentList.size();
		
		/* ?????? ?????? */
		boardVO.setB_commentcount(commentCnt);
		
		/* ?????????????????? */
		List<ImageVO> imageList = imageService.getImageListById(seq);
		
		
		model.addAttribute("boardContent", boardVO);
		model.addAttribute("commentList", commentList);
		model.addAttribute("imageList", imageList);
		
		return "/board/contentForm";
	}

	@RequestMapping("/contentReportForm")
	public String contentReportForm(@RequestParam("b_seq") String b_seq, Model model) {
		logger.info("?????? ????????? ??????");
		int seq = Integer.parseInt(b_seq);
		/* ????????? ?????? */
		boardService.upViews(seq);
		
		/* ????????? ???????????? */
		boardVO = (BoardVO) boardService.getBoardById(seq);
		
		/* ???????????? */
		boardVO.setB_text(boardVO.getB_text().replace("\r\n", "<br>"));
		
		/* ?????????????????? */
		List<ImageVO> imageList = imageService.getImageListById(seq);
		

		model.addAttribute("imageList", imageList);
		model.addAttribute("boardContent", boardVO);

		return "/board/contentReportForm";
	}

	@RequestMapping("/updateForm")
	public String updateForm(@RequestParam("b_seq") String b_seq, Model model) {

		// required??? ?????????????????? ???????????????????????? 404????????? ?????????.
		// defaultValue??? required??? false?????? ?????? ??????????????? ???????????? ????????????
		int seq = Integer.parseInt(b_seq);
		logger.info("????????? ?????? ??????");
		boardVO = (BoardVO) boardService.getBoardById(seq);
		model.addAttribute("updateContent", boardVO);

		return "/board/updateForm";
	}

//---------------------------------------------Action--------------------------------------------------
	/* board */
	@RequestMapping("/insertBoardAction")
	@ResponseBody
	public String insertBoardAction(@ModelAttribute("boardContent") @Valid BoardVO boardVO,
			BindingResult bindingResult,MultipartHttpServletRequest files, HttpServletRequest request) {
		logger.info("????????? ????????? ??????");
		

		ServletContext application = request.getServletContext();
		
				//???????????? ?????? ??? ??????
				String uploadFolder = (String) application.getAttribute("path");
				System.out.println("?????? ?????? : "+uploadFolder);
				
				  
				List<MultipartFile> list = files.getFiles("files");
				List<String> i_list = new ArrayList<String>();
				for(int i = 0; i<list.size(); i++) {
					String fileRealName = list.get(i).getOriginalFilename();
					System.out.println("?????? ?????? : "+fileRealName);
					if(fileRealName.equals("") || fileRealName == null) {
						String fileRealName_ = "thumb_default.png";
						boardVO.setB_uploadImg(fileRealName_);
					}else {
						
					
					long size = list.get(i).getSize();
					
					System.out.println("????????? :" + fileRealName);
					System.out.println("????????? : " + size);
					
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
				

				boardVO.setB_uploadImg(i_list.get(0));	//????????????	??????
					}
				}
				int result = boardService.createBoard(boardVO);	//result??? ??????????????? boardSeq??????..
				
				
				
				ImageVO imageVO = new ImageVO();	//?????? ?????? db??? ??????
				for(int i=0; i<i_list.size(); i++) {
				imageVO.setI_img(i_list.get(i));
				imageVO.setI_boardSeq(result);
				imageService.insertImage(imageVO);
				}
				
		
		
		if (bindingResult.hasErrors()) {
			return "<script> location.href='/board/insertBoardForm'</script>";
		} else {
			if (result == 0) {
				logger.info("?????? ??????");
				return "<script>alert('insert_board_failed'); location.href='/board/insertBoardForm';</script>";
			} else {
				if (boardVO.getB_category().equals("??????????????????")) {
					return "<script>alert('insert_board_complete'); location.href='/board/contentReportForm?b_seq="
							+ result + "'</script>";
				} else {
					return "<script>alert('insert_board_complete'); location.replace('/board/contentForm?b_seq=" + result
							+ "');</script>";
				}
			}
		}
	}

	@RequestMapping("/updateBoardAction")
	@ResponseBody
	public String updateBoardAction(
			@ModelAttribute("updateContent") @Valid BoardVO boardVO, 
			HttpServletRequest request,
			MultipartHttpServletRequest files,
			BindingResult bindingResult

	/*
	 * , @RequestParam("b_title") String b_title,
	 * 
	 * @RequestParam("b_text") String b_text, @RequestParam("b_category") String
	 * b_category,
	 * 
	 * @RequestParam("b_uploadImg") String b_uploadImg
	 */) {

		logger.info("????????? ?????? ??????");
		/*
		 * boardVO.setB_seq(b_seq); boardVO.setB_title(b_title);
		 * boardVO.setB_category(b_category); boardVO.setB_uploadImg(b_uploadImg);
		 * boardVO.setB_text(b_text);
		 */
	
		/* ?????? ???????????? ??????????????? ?????? */
		imageService.deleteImage(boardVO.getB_seq());
		
		/* ??????????????? ??????????????? ?????? */
		ServletContext application = request.getServletContext();
		
			//???????????? ?????? ??? ??????
			String uploadFolder = (String) application.getAttribute("path");
			List<MultipartFile> list = files.getFiles("files");
			List<String> i_list = new ArrayList<String>();
			for(int i = 0; i<list.size(); i++) {
				String fileRealName = list.get(i).getOriginalFilename();
				long size = list.get(i).getSize();
				
				System.out.println("????????? :" + fileRealName);
				System.out.println("????????? : " + size);
				
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
			ImageVO imageVO = new ImageVO();	//?????? ?????? db??? ??????
			for(int i=0; i<i_list.size(); i++) {
			imageVO.setI_img(i_list.get(i));
			imageVO.setI_boardSeq(boardVO.getB_seq());
			imageService.insertImage(imageVO);
			}
			boardVO.setB_uploadImg(i_list.get(0));	//????????????	??????

		
		
		
		if (bindingResult.hasErrors()) {
			return "<script> location.href='/board/updateForm?b_seq=" + boardVO.getB_seq() + "'</script>";
		} else {
			boardService.updateBoard(boardVO);
			if (boardVO.getB_category().equals("??????????????????")) {
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
		logger.info("????????? ?????? ??????");

		return "<script>alert('delete_complete'); location.href='/main'</script>";
	}

	@RequestMapping("/recommendAction")
	@ResponseBody
	public String recommendAction(@RequestParam("b_seq") String b_seq) {
		logger.info("???????????? ??????");
		int seq = Integer.parseInt(b_seq);
		boardService.upRecommend(seq);
		boardService.downViews(seq);

		return "<script>location.href='/board/contentForm?b_seq=" + b_seq + "'</script>";
	}

	/* comment */
	@RequestMapping("/insertCommentAction")
	@ResponseBody
	public String insertCommentAction(
			@RequestParam("c_writer") String c_writer, 
			@RequestParam("c_text") String c_text,
			@RequestParam("c_boardSeq") String c_boardSeq, 
			@RequestParam("t_seq") @Nullable String t_seq,
			@RequestParam(value ="q_seq", required=false, defaultValue="") String q_seq) {
		logger.info("?????? ?????? ??????");
		int seq = Integer.parseInt(c_boardSeq);
		commentService.insertComment(new CommentVO(c_writer, c_text, seq));

		System.out.println("q_seq : "+q_seq);
		
		/* qna?????? ????????? ??????????????? */
		
		
		if (t_seq != null) {
			return "<script>alert('comment_complete'); location.href='/board/contentTradeForm?t_seq=" + c_boardSeq
					+ "'</script>";
		}else if(!q_seq.equals("")) {
			return "<script>alert('comment_complete'); location.href='/board/contentQnaForm?q_seq="+c_boardSeq +"'</script>";
		}else {
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
		logger.info("?????? ?????? ??????");
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
	public String qnaAction(@RequestParam("q_boardSeq") String q_boardSeq, @RequestParam("q_writer") String q_writer,
			@RequestParam("q_category") String q_category, @RequestParam("q_title") String q_title,
			@RequestParam("q_text") String q_text, @RequestParam("q_email") String q_email,
			@RequestParam("q_tel") String q_tel, MultipartHttpServletRequest files,
			HttpServletRequest request) {

		logger.info("1:1 ?????? ?????? ??????");
		int seq;
		try {
			seq = Integer.parseInt(q_boardSeq);
		} catch (NumberFormatException e) {
			logger.error("qnaAction : q_boardSeq??? ??????????????? ?????? ?????????, default : 0");
			seq = 0; // ???????????? ?????????????????? ?????? ???
		}
		
		ServletContext application = request.getServletContext();
		
		//???????????? ?????? ??? ??????
		String uploadFolder = (String) application.getAttribute("path");
		System.out.println("?????? ?????? : "+uploadFolder);
		
		  
		List<MultipartFile> list = files.getFiles("files");
		List<String> i_list = new ArrayList<String>();
		for(int i = 0; i<list.size(); i++) {
			String fileRealName = list.get(i).getOriginalFilename();
			long size = list.get(i).getSize();
			
			System.out.println("????????? :" + fileRealName);
			System.out.println("????????? : " + size);
			
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

		int result = qnaService.insertQna(new QnaVO(seq, q_writer, q_category, q_title, q_text, q_email, q_tel, i_list.get(0)));
		
		
		
		ImageVO imageVO = new ImageVO();	//?????? ?????? db??? ??????
		for(int i=0; i<i_list.size(); i++) {
		imageVO.setI_img(i_list.get(i));
		imageVO.setI_boardSeq(result);
		imageService.insertImage(imageVO);
		}
		

		return "<script>alert('qna_complete'); location.href='/main'</script>";
	}
	
	
	
	
	@RequestMapping(value = "/upload_ok", method = RequestMethod.POST)
	public String upload(@RequestParam("file") MultipartFile file) {
		String fileRealName = file.getOriginalFilename(); // ???????????? ????????? ??? ?????? ?????????!
		long size = file.getSize(); // ?????? ?????????

		System.out.println("????????? : " + fileRealName);
		System.out.println("????????????(byte) : " + size);
		
		
		// ????????? ????????? ???????????? fileextension?????? .jsp???????????? ????????? ?????? ??????
		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
		String uploadFolder = "C:\\test\\upload";

		/*
		 * ?????? ???????????? ???????????? ????????? ????????? ?????? ????????? ?????? ?????? ???????????? ????????? ?????? ???????????? ?????? ????????? ????????? ???????????? ??? ????????????.
		 * ???????????? ???????????? ?????? ??????????????? ?????? ????????? ?????? ????????????.(???????????? ???????????? ??????) ????????? ?????? ????????? ?????? db??? ????????? ?????????
		 * ???????????? ????????? ????????? ??????.
		 */

		UUID uuid = UUID.randomUUID();
		System.out.println(uuid.toString());
		String[] uuids = uuid.toString().split("-");

		String uniqueName = uuids[0];
		System.out.println("????????? ???????????????" + uniqueName);
		System.out.println("????????????" + fileExtension);

		// File saveFile = new File(uploadFolder+"\\"+fileRealName); uuid ?????? ???

		File saveFile = new File(uploadFolder + "\\" + uniqueName + fileExtension); // ?????? ???
		
		try {
			file.transferTo(saveFile); // ?????? ?????? ???????????????(filewriter ????????? ????????? ????????? ???????????????.)
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "home";
	}
//---------------------------------------------------?????? ?????????-----------------------------------------------------------------

	@RequestMapping(value = "/upload_ok2", method = RequestMethod.POST)
	public String upload2(MultipartHttpServletRequest files) {
		

		//???????????? ?????? ??? ??????
		String uploadFolder = "C:\\test\\upload";
		List<MultipartFile> list = files.getFiles("files");
		for(int i = 0; i<list.size(); i++) {
			String fileRealName = list.get(i).getOriginalFilename();
			long size = list.get(i).getSize();
			
			System.out.println("????????? :" + fileRealName);
			System.out.println("?????????" + size);
			
			File saveFile = new File(uploadFolder + "\\" + fileRealName);
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
	
		return "home";
	}

	// ------------------------------------------------------------------------------------------------------------------

	// @InitBinder??? ??? ???????????? ???????????? handler??? ?????? ??? ???????????? ???????????? ??? ??????Validator????????? ??????????????????
	// ????????????.
	// @InitBinder??? ????????? ???????????? ???????????? ????????? ???????????? ????????? ??? ??????.
	// ex)?????? boardVO??? ???????????? ???????????? BoardValidator???????????? ???????????? setValidator???????????? ????????? ?????????.
	/*
	 * @InitBinder public void initBinder(WebDataBinder binder) {
	 * binder.setValidator(new BoardValidator()); }
	 */
}
