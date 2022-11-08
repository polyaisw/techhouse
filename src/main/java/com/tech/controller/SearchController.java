package com.tech.controller;

import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

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

	@Autowired
	TradeService tradeService;
	@Autowired
	BoardService boardService;

	/* 중고거래게시판용 얘는 카테고리가 하나라 검색어만 받으면 결과가 나옴 */
	@RequestMapping(value = "/searchAction", method = RequestMethod.GET)
	public String searchAction(Model model,HttpServletRequest request,
			@RequestParam(value = "searchKeyword", required=false, defaultValue ="") String keyword, 
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) {

		
		if(keyword.equals("")) {	//요청이 안왔으면(다음페이지시)
			model.addAttribute("keyword",request.getAttribute("keyword"));
		}else {

			keyword = keyword.trim();
			request.setAttribute("keyword", keyword);	//검색한 결과값이 들어왔으면.. 저장(처음검색)
			model.addAttribute("keyword",keyword);
		}
		
		
		keyword = keyword.trim();
		TradeVO tradeVO = new TradeVO();
		/* 검색어 세팅 */
		tradeVO.setKeyword(keyword);

		/* 제목+내용 검색결과의 개수 */
		int listCnt = tradeService.getBoardByTitleText(tradeVO).size();
		System.out.println("거래게시판 검색결과 개수 : "+listCnt);
		
		/* 페이지 인디케이터 설정 */
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);
		pagination.setCategory("거래게시판");
		pagination.setKeyword(keyword);

		/* 페이지 인디케이터 표시 */
		model.addAttribute("pagination", pagination);
		
		/* 검색결과 게시글 표시 */
		model.addAttribute("list", tradeService.getBoardListsBySearch((pagination)));
		
		/* 공지사항표시 */
		model.addAttribute("noticeList",boardService.getBoardListByCategoryKeywordNumber(new BoardVO("공지사항","b_seq",999)));
		
		
		return "/board/trade/tradeBoard";
	}

	@RequestMapping(value = "/searchBoardAction", method = RequestMethod.GET)
	public String searchBoardAction(Model model, HttpServletRequest request,
			@RequestParam(value = "searchKeyword", required = false, defaultValue = "") String keyword,
			@RequestParam(value = "b_category", required = false) String b_category,
			@RequestParam(value = "url", required = false, defaultValue = "/main") String url,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range) throws Exception {

		if(keyword.equals("")) {	//다음페이지시
			model.addAttribute("keyword",request.getAttribute("keyword"));
			model.addAttribute("b_category",request.getAttribute("b_category"));
			model.addAttribute("url",request.getAttribute("url"));
		}else {

			keyword = keyword.trim();
			request.setAttribute("keyword", keyword);	//검색한 결과값이 들어왔으면.. 저장(처음검색)
			request.setAttribute("url", url);
			request.setAttribute("b_category", b_category);
			
			model.addAttribute("keyword",keyword);
			model.addAttribute("url",url);
			model.addAttribute("b_category",b_category);
		}
		
		
		
		BoardVO boardVO = new BoardVO();

		/* 검색어 */
		boardVO.setKeyword(keyword);

		/* 게시판종류 */
		boardVO.setB_category(b_category);

		/* 카테고리의 제목+내용 검색결과의 개수 */
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
		model.addAttribute("recommedList", boardService.getBoardListByCategoryKeywordNumber(boardVO));

		/* 조회수5개 표시 */
		boardVO.setKeyword("b_views");
		boardVO.setB_category(b_category);
		boardVO.setListSize(5);
		model.addAttribute("viewsList", boardService.getBoardListByCategoryKeywordNumber(boardVO));

		/* 공지사항표시 */
		model.addAttribute("noticeList",boardService.getBoardListByCategoryKeywordNumber(new BoardVO("공지사항","b_seq",999)));
		
		/* 게임정보, 인증 베스트 표시 */
		model.addAttribute("gameInfoListBest",boardService.getBoardListByCategoryKeywordNumber(new BoardVO("게임출시정보","b_seq",5)));
		model.addAttribute("mySettingListBest",boardService.getBoardListByCategoryKeywordNumber(new BoardVO("인증게시판","b_recommed",5)));
		
		
		System.out.println(url+" : url");
		if (url.equals("/main")) {
			logger.error("board_search error");
			return "redirect:" + url; // 에러인경우 메인으로
		} else {
			return url;
		}

	}

	/* 회원이 작성한 게시글 목록 */
	@RequestMapping(value = { "/userSearchAction" }, method = RequestMethod.GET)	
		public String userSearchAction(Model model, 
				@RequestParam(value ="userName", required=false, defaultValue="") String writer, 
				  @RequestParam(required = false, defaultValue = "1") int page,
				  @RequestParam(required = false, defaultValue = "1") int range) throws
				  Exception 
				{
			
		
		/* 유저 이름으로 '거래게시판' 카테고리 제외 모든 카페고리 게시글 전부 가져와 갯수 저장 */
		int listCnt = boardService.getBoardByUserName(writer).size();	
		System.out.println("게시판"+listCnt+"개");
		
		/* 페이지네이션 세팅 */
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);
		pagination.setWriter(writer);
		
		/* 페이지 인디케이터 표시 */
		model.addAttribute("pagination", pagination);
		
		/* 출력 */
		model.addAttribute("boardList", boardService.getBoardByUserName_P((pagination)));
		
		//----------------------------------------------------------------------------------------------
		/* 거래게시판 부분*/
		int listCnt2 = tradeService.getBoardByUserName(writer).size();
		System.out.println("거래게시판"+listCnt2+"개");
		
		Pagination pagination2 = new Pagination();
		pagination2.setWriter(writer);
		pagination2.pageInfo(page, range, listCnt2);

		model.addAttribute("pagination2", pagination2);
		
		model.addAttribute("tradeList", tradeService.getBoardByUserName_P((pagination2)));
			return "getUserBoardList_";
		}
	 
}
