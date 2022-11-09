package com.tech.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tech.service.interfaces.CommentService;
import com.tech.service.interfaces.ImageService;
import com.tech.service.interfaces.QnaService;
import com.tech.vo.BoardVO;
import com.tech.vo.CommentVO;
import com.tech.vo.ImageVO;
import com.tech.vo.QnaVO;

@Controller
@RequestMapping("/board")
public class QnaController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private QnaService qnaService;
	@Autowired
	private CommentService commentService;
	@Autowired
	private ImageService imageService;
	
	
	
	
	
	
	@RequestMapping("/contentQnaForm")
	public String contentQnaForm(@RequestParam("q_seq") String q_seq, Model model) {
		logger.info("게시글 진입");
		int seq = Integer.parseInt(q_seq);
		
		/* 게시글가져오기 */
		QnaVO qnaVO = qnaService.getQnaById(seq);
		/* 공백처리 */
		qnaVO.setQ_text(qnaVO.getQ_text().replace("\r\n", "<br>"));
		
		/* 댓글리스트 */
		List<CommentVO> commentList = commentService.getCommentListById(seq);		//qna용 

		for (CommentVO comment : commentList) {
			comment.setC_text(comment.getC_text().replace("\r\n", "<br>"));
		}
		
		
		/* 이미지리스트 */
		List<ImageVO> imageList = imageService.getImageListById(seq);
		
		
		model.addAttribute("qnaContent", qnaVO);
		model.addAttribute("commentList", commentList);
		model.addAttribute("imageList", imageList);
		
		return "/board/contentQnaForm";
	}
	
	@RequestMapping("/updateQnaForm")
	public String updateQnaForm(@RequestParam("q_seq") String q_seq, Model model) {

		int seq = Integer.parseInt(q_seq);
		logger.info("게시글 수정 진입");
		QnaVO qnaVO = qnaService.getQnaById(seq);
		

		List<ImageVO> imageList = imageService.getImageListById(seq);

		model.addAttribute("imageList", imageList);
		model.addAttribute("updateContent", qnaVO);

		/* 이미지업로드는 하지않음 */
		
		return "/board/updateQnaForm";
	}
	
	@RequestMapping("/updateQnaAction")
	@ResponseBody
	public String updateQnaAction(QnaVO qnaVO) {
		
		qnaVO.setQ_complete(1);
		qnaService.updateState(qnaVO);
		
		
		return "<script>alert('answer_complete'); location.href='/board/contentQnaForm?q_seq="+qnaVO.getQ_seq() + "'</script>";
	}
}
