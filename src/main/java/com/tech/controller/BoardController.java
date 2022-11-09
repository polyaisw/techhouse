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
	private ImageService imageService;	//다중 파일업로드용

	BoardVO boardVO;
	ProductVO productVO;

	/* community */
	@GetMapping("/community/free")
	public String free(Model model, 
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) 
					throws Exception {
		logger.info("자유게시판 진입");
		 String category = "자유게시판";
		
		 /*게시글 출력*/
		  int listCnt = boardService.getBoardListByCate(category).size(); 
		  System.out.println(listCnt +"개  자유게시판");
		  Pagination pagination = new Pagination(); 
		  pagination.pageInfo(page, range, listCnt);
		  pagination.setCategory(category); 
		  model.addAttribute("pagination", pagination); 
		  model.addAttribute("list", boardService.getBoardLists(pagination));
		 
		/* 추천수5개 */
		BoardVO boardVO = new BoardVO(category,"b_recommed",5);
		model.addAttribute("recommedList",boardService.getBoardListByCategoryKeywordNumber(boardVO));
		
		/* 조회수5개 */
		BoardVO boardVO2 = new BoardVO(category,"b_views",5);
		model.addAttribute("viewsList",boardService.getBoardListByCategoryKeywordNumber(boardVO2));

		/* 공지사항 전부 */
		model.addAttribute("noticeList",boardService.getBoardListByCategoryKeywordNumber(new BoardVO("공지사항","b_seq",999)));
		
		return "/board/community/free";
	}

	@GetMapping("/community/mysetting")
	public String mysetting(Model model,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) 
					throws Exception {
		logger.info("인증게시판 진입");
		String category = "인증게시판";

		  int listCnt = boardService.getBoardListByCate(category).size(); 
		  Pagination pagination = new Pagination(); 
		  pagination.pageInfo(page, range, listCnt);
		  pagination.setCategory(category); 
		  model.addAttribute("pagination", pagination);
		  
		  model.addAttribute("list", boardService.getBoardLists(pagination));
		  model.addAttribute("mySettingListBest",boardService.getBoardListByCategoryKeywordNumber(new BoardVO("인증게시판","b_recommed",5)));
		  model.addAttribute("noticeList",boardService.getBoardListByCategoryKeywordNumber(new BoardVO("공지사항","b_seq",999)));
		  
		return "/board/community/mysetting";
	}

	@GetMapping("/community/hobby")
	public String hobby(Model model,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) 
					throws Exception {
		
		logger.info("취미 공유 진입");
		String category = "취미공유";
		
		 /*게시글 출력*/
		  int listCnt = boardService.getBoardListByCate(category).size(); 
		  Pagination pagination = new Pagination(); 
		  pagination.pageInfo(page, range, listCnt);
		  pagination.setCategory(category); 
		  model.addAttribute("pagination", pagination); 
		  model.addAttribute("list", boardService.getBoardLists(pagination));
		 
		/* 추천수5개 */
		BoardVO boardVO = new BoardVO(category,"b_recommed",5);
		model.addAttribute("recommedList",boardService.getBoardListByCategoryKeywordNumber(boardVO));
		
		/* 조회수5개 */
		BoardVO boardVO2 = new BoardVO(category,"b_views",5);
		model.addAttribute("viewsList",boardService.getBoardListByCategoryKeywordNumber(boardVO2));
		
		model.addAttribute("noticeList",boardService.getBoardListByCategoryKeywordNumber(new BoardVO("공지사항","b_seq",999)));
		
		return "/board/community/hobby";
	}

	/* news */
	@GetMapping("/news/trend")
	public String trend(Model model,@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) 
					throws Exception {
		logger.info("IT/트렌드  진입");
		String category = "IT/트렌드";
		
		 /*게시글 출력*/
		  int listCnt = boardService.getBoardListByCate(category).size(); 
		  Pagination pagination = new Pagination(); 
		  pagination.pageInfo(page, range, listCnt);
		  pagination.setCategory(category); 
		  model.addAttribute("pagination", pagination); 
		  model.addAttribute("list", boardService.getBoardLists(pagination));
		 
		/* 추천수5개 */
		BoardVO boardVO = new BoardVO(category,"b_recommed",5);
		model.addAttribute("recommedList",boardService.getBoardListByCategoryKeywordNumber(boardVO));
		
		/* 조회수5개 */
		BoardVO boardVO2 = new BoardVO(category,"b_views",5);
		model.addAttribute("viewsList",boardService.getBoardListByCategoryKeywordNumber(boardVO2));
		
		model.addAttribute("noticeList",boardService.getBoardListByCategoryKeywordNumber(new BoardVO("공지사항","b_seq",999)));
		return "/board/news/trend";
	}

	@GetMapping("/news/issue")
	public String issue(Model model,@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) 
					throws Exception {
		logger.info("핫이슈 진입");
		String category = "핫이슈";
		
		 /*게시글 출력*/
		  int listCnt = boardService.getBoardListByCate(category).size(); 
		  Pagination pagination = new Pagination(); 
		  pagination.pageInfo(page, range, listCnt);
		  pagination.setCategory(category); 
		  model.addAttribute("pagination", pagination); 
		  model.addAttribute("list", boardService.getBoardLists(pagination));
		 
		/* 추천수5개 */
		BoardVO boardVO = new BoardVO(category,"b_recommed",5);
		model.addAttribute("recommedList",boardService.getBoardListByCategoryKeywordNumber(boardVO));
		
		/* 조회수5개 */
		BoardVO boardVO2 = new BoardVO(category,"b_views",5);
		model.addAttribute("viewsList",boardService.getBoardListByCategoryKeywordNumber(boardVO2));
		
		model.addAttribute("noticeList",boardService.getBoardListByCategoryKeywordNumber(new BoardVO("공지사항","b_seq",999)));
		return "/board/news/issue";
	}

	@GetMapping("/news/gameInfo")
	public String gameInfo(Model model,@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) 
					throws Exception {
		logger.info("게임출시정보 진입");
		String category = "게임출시정보";
		
		
		 /*게시글 출력*/
		  int listCnt = boardService.getBoardListByCate(category).size(); 
		  Pagination pagination = new Pagination(); 
		  pagination.pageInfo(page, range, listCnt);
		  pagination.setCategory(category); 
		  model.addAttribute("pagination", pagination); 
		  model.addAttribute("list", boardService.getBoardLists(pagination));
		
		
		List<BVO> list = boardService.getBoardListByCate(category);
		model.addAttribute("list", list);
		
		model.addAttribute("gameInfoListBest",boardService.getBoardListByCategoryKeywordNumber(new BoardVO(category,"b_seq",5)));
		  model.addAttribute("noticeList",boardService.getBoardListByCategoryKeywordNumber(new BoardVO("공지사항","b_seq",999)));
		return "/board/news/gameInfo";
	}

	@GetMapping("/news/hotDeal")
	public String hotDeal(Model model,@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) 
					throws Exception {
		logger.info("꿀딜/장터 진입");
		String category = "꿀딜/장터";
		
		 /*게시글 출력*/
		  int listCnt = boardService.getBoardListByCate(category).size(); 
		  Pagination pagination = new Pagination(); 
		  pagination.pageInfo(page, range, listCnt);
		  pagination.setCategory(category); 
		  model.addAttribute("pagination", pagination); 
		  model.addAttribute("list", boardService.getBoardLists(pagination));
		 
		/* 추천수5개 */
		BoardVO boardVO = new BoardVO(category,"b_recommed",5);
		model.addAttribute("recommedList",boardService.getBoardListByCategoryKeywordNumber(boardVO));
		
		/* 조회수5개 */
		BoardVO boardVO2 = new BoardVO(category,"b_views",5);
		model.addAttribute("viewsList",boardService.getBoardListByCategoryKeywordNumber(boardVO2));
		
		model.addAttribute("noticeList",boardService.getBoardListByCategoryKeywordNumber(new BoardVO("공지사항","b_seq",999)));
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
	public String aftertrade(Model model,@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) 
					throws Exception  {
		logger.info("거래 후기 진입");
		String category = "거래후기";
		
		 /*게시글 출력*/
		  int listCnt = boardService.getBoardListByCate(category).size(); 
		  Pagination pagination = new Pagination(); 
		  pagination.pageInfo(page, range, listCnt);
		  pagination.setCategory(category); 
		  model.addAttribute("pagination", pagination); 
		  model.addAttribute("list", boardService.getBoardLists(pagination));
		 
		/* 추천수5개 */
		BoardVO boardVO = new BoardVO(category,"b_recommed",5);
		model.addAttribute("recommedList",boardService.getBoardListByCategoryKeywordNumber(boardVO));
		
		/* 조회수5개 */
		BoardVO boardVO2 = new BoardVO(category,"b_views",5);
		model.addAttribute("viewsList",boardService.getBoardListByCategoryKeywordNumber(boardVO2));
		
		model.addAttribute("noticeList",boardService.getBoardListByCategoryKeywordNumber(new BoardVO("공지사항","b_seq",999)));
		
		return "/board/trade/aftertrade";
	}

	/* center */
	@GetMapping("/center/qna")
	public String qna(Model model) throws IOException {
		logger.info("1:1 문의 진입");
		return "/board/center/qna";
	}

	@GetMapping("/center/report")
	public String report(Model model,@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) 
					throws Exception {
		logger.info("사기피해 신고 진입");
		String category = "사기피해신고";
		
		 /*게시글 출력*/
		  int listCnt = boardService.getBoardListByCate(category).size(); 
		  Pagination pagination = new Pagination(); 
		  pagination.pageInfo(page, range, listCnt);
		  pagination.setCategory(category); 
		  model.addAttribute("pagination", pagination); 
		  model.addAttribute("list", boardService.getBoardLists(pagination));
		  
		  model.addAttribute("noticeList",boardService.getBoardListByCategoryKeywordNumber(new BoardVO("공지사항","b_seq",999)));
		  
		return "/board/center/report";
	}

	// ---------------------------------------------------------------------------------------------------------------------

	@RequestMapping("/insertBoardForm")
	public String insertBoardForm() {
		logger.info("게시글 글쓰기 진입");
		return "/board/insertBoardForm";
	}
	
	@RequestMapping("/insertNoticeBoardForm")
	public String insertNoticeBoardForm() {
		logger.info("공지사항 글쓰기 진입");
		return "/board/insertNoticeBoardForm";
	}
	
	@RequestMapping("/contentForm")
	public String contentForm(@RequestParam("b_seq") String b_seq, Model model) {
		logger.info("게시글 진입");
		int seq = Integer.parseInt(b_seq);
		
		/* 조회수 증가 */
		boardService.upViews(seq);
		
		/* 게시글가져오기 */
		boardVO = (BoardVO) boardService.getBoardById(seq);
		
		/* 공백처리 */
		boardVO.setB_text(boardVO.getB_text().replace("\r\n", "<br>"));
		
		/* 댓글리스트 */
		List<CommentVO> commentList = commentService.getCommentListById(seq);

		for (CommentVO comment : commentList) {
			comment.setC_text(comment.getC_text().replace("\r\n", "<br>"));
		}
		int commentCnt = commentList.size();
		
		/* 댓글 갯수 */
		boardVO.setB_commentcount(commentCnt);
		
		/* 이미지리스트 */
		List<ImageVO> imageList = imageService.getImageListById(seq);
		
		
		model.addAttribute("boardContent", boardVO);
		model.addAttribute("commentList", commentList);
		model.addAttribute("imageList", imageList);
		
		return "/board/contentForm";
	}

	@RequestMapping("/contentReportForm")
	public String contentReportForm(@RequestParam("b_seq") String b_seq, Model model) {
		logger.info("신고 게시글 진입");
		int seq = Integer.parseInt(b_seq);
		/* 조회수 증가 */
		boardService.upViews(seq);
		
		/* 게시글 가져오기 */
		boardVO = (BoardVO) boardService.getBoardById(seq);
		
		/* 공백처리 */
		boardVO.setB_text(boardVO.getB_text().replace("\r\n", "<br>"));
		
		/* 이미지리스트 */
		List<ImageVO> imageList = imageService.getImageListById(seq);
		

		model.addAttribute("imageList", imageList);
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
			BindingResult bindingResult,MultipartHttpServletRequest files, HttpServletRequest request) {
		logger.info("게시글 글쓰기 액션");
		

		ServletContext application = request.getServletContext();
		
				//서버에서 저장 할 경로
				String uploadFolder = (String) application.getAttribute("path");
				System.out.println("저장 경로 : "+uploadFolder);
				
				  
				List<MultipartFile> list = files.getFiles("files");
				List<String> i_list = new ArrayList<String>();
				for(int i = 0; i<list.size(); i++) {
					String fileRealName = list.get(i).getOriginalFilename();
					System.out.println("파일 이름 : "+fileRealName);
					if(fileRealName.equals("") || fileRealName == null) {
						String fileRealName_ = "thumb_default.png";
						boardVO.setB_uploadImg(fileRealName_);
					}else {
						
					
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
				

				boardVO.setB_uploadImg(i_list.get(0));	//썸네일용	저장
					}
				}
				int result = boardService.createBoard(boardVO);	//result는 새로생성된 boardSeq값임..
				
				
				
				ImageVO imageVO = new ImageVO();	//다중 파일 db로 저장
				for(int i=0; i<i_list.size(); i++) {
				imageVO.setI_img(i_list.get(i));
				imageVO.setI_boardSeq(result);
				imageService.insertImage(imageVO);
				}
				
		
		
		if (bindingResult.hasErrors()) {
			return "<script> location.href='/board/insertBoardForm'</script>";
		} else {
			if (result == 0) {
				logger.info("등록 실패");
				return "<script>alert('insert_board_failed'); location.href='/board/insertBoardForm';</script>";
			} else {
				if (boardVO.getB_category().equals("사기피해신고")) {
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

		logger.info("게시글 수정 액션");
		/*
		 * boardVO.setB_seq(b_seq); boardVO.setB_title(b_title);
		 * boardVO.setB_category(b_category); boardVO.setB_uploadImg(b_uploadImg);
		 * boardVO.setB_text(b_text);
		 */
	
		/* 기존 게시글의 이미지전부 삭제 */
		imageService.deleteImage(boardVO.getB_seq());
		
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
			imageVO.setI_boardSeq(boardVO.getB_seq());
			imageService.insertImage(imageVO);
			}
			boardVO.setB_uploadImg(i_list.get(0));	//썸네일용	저장

		
		
		
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
		logger.info("댓글 쓰기 액션");
		int seq = Integer.parseInt(c_boardSeq);
		commentService.insertComment(new CommentVO(c_writer, c_text, seq));

		System.out.println("q_seq : "+q_seq);
		
		/* qna에서 작성한 댓글이라면 */
		
		
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
	public String qnaAction(@RequestParam("q_boardSeq") String q_boardSeq, @RequestParam("q_writer") String q_writer,
			@RequestParam("q_category") String q_category, @RequestParam("q_title") String q_title,
			@RequestParam("q_text") String q_text, @RequestParam("q_email") String q_email,
			@RequestParam("q_tel") String q_tel, MultipartHttpServletRequest files,
			HttpServletRequest request) {

		logger.info("1:1 문의 쓰기 액션");
		int seq;
		try {
			seq = Integer.parseInt(q_boardSeq);
		} catch (NumberFormatException e) {
			logger.error("qnaAction : q_boardSeq의 숫자입력이 되지 않았음, default : 0");
			seq = 0; // 문의자가 게시글번호를 모를 때
		}
		
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

		int result = qnaService.insertQna(new QnaVO(seq, q_writer, q_category, q_title, q_text, q_email, q_tel, i_list.get(0)));
		
		
		
		ImageVO imageVO = new ImageVO();	//다중 파일 db로 저장
		for(int i=0; i<i_list.size(); i++) {
		imageVO.setI_img(i_list.get(i));
		imageVO.setI_boardSeq(result);
		imageService.insertImage(imageVO);
		}
		

		return "<script>alert('qna_complete'); location.href='/main'</script>";
	}
	
	
	
	
	@RequestMapping(value = "/upload_ok", method = RequestMethod.POST)
	public String upload(@RequestParam("file") MultipartFile file) {
		String fileRealName = file.getOriginalFilename(); // 파일명을 얻어낼 수 있는 메서드!
		long size = file.getSize(); // 파일 사이즈

		System.out.println("파일명 : " + fileRealName);
		System.out.println("용량크기(byte) : " + size);
		
		
		// 서버에 저장할 파일이름 fileextension으로 .jsp이런식의 확장자 명을 구함
		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
		String uploadFolder = "C:\\test\\upload";

		/*
		 * 파일 업로드시 파일명이 동일한 파일이 이미 존재할 수도 있고 사용자가 업로드 하는 파일명이 언어 이외의 언어로 되어있을 수 있습니다.
		 * 타인어를 지원하지 않는 환경에서는 정산 동작이 되지 않습니다.(리눅스가 대표적인 예시) 고유한 랜던 문자를 통해 db와 서버에 저장할
		 * 파일명을 새롭게 만들어 준다.
		 */

		UUID uuid = UUID.randomUUID();
		System.out.println(uuid.toString());
		String[] uuids = uuid.toString().split("-");

		String uniqueName = uuids[0];
		System.out.println("생성된 고유문자열" + uniqueName);
		System.out.println("확장자명" + fileExtension);

		// File saveFile = new File(uploadFolder+"\\"+fileRealName); uuid 적용 전

		File saveFile = new File(uploadFolder + "\\" + uniqueName + fileExtension); // 적용 후
		
		try {
			file.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "home";
	}
//---------------------------------------------------파일 업로드-----------------------------------------------------------------

	@RequestMapping(value = "/upload_ok2", method = RequestMethod.POST)
	public String upload2(MultipartHttpServletRequest files) {
		

		//서버에서 저장 할 경로
		String uploadFolder = "C:\\test\\upload";
		List<MultipartFile> list = files.getFiles("files");
		for(int i = 0; i<list.size(); i++) {
			String fileRealName = list.get(i).getOriginalFilename();
			long size = list.get(i).getSize();
			
			System.out.println("파일명 :" + fileRealName);
			System.out.println("사이즈" + size);
			
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

	// @InitBinder는 이 컨트롤러 클래스의 handler중 입력 폼 데이터를 바인딩할 때 어떤Validator객체로 검증하는지를
	// 지정한다.
	// @InitBinder는 하나의 컨트롤러 클래스당 하나의 메서드를 사용할 수 있다.
	// ex)나는 boardVO의 입력폼을 할꺼니깐 BoardValidator클래스를 정의하고 setValidator메서드로 세팅을 하였다.
	/*
	 * @InitBinder public void initBinder(WebDataBinder binder) {
	 * binder.setValidator(new BoardValidator()); }
	 */
}
