package com.tech.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tech.common.Pagination;
import com.tech.service.interfaces.BoardService;
import com.tech.service.interfaces.TradeService;
import com.tech.service.interfaces.UserService;
import com.tech.vo.BVO;
import com.tech.vo.UserVO;

@Controller
@RequestMapping("/admin")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	

	@Autowired
	private UserService userService;
	@Autowired
	private TradeService tradeService;
	@Autowired
	private BoardService boardService;
	
	/* 관리자 메인 페이지 이동 */
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void adminMainGET() throws Exception{
		
		logger.info("관리자 페이지 이동");
		
	}	
	
	/* 관리자 메인 페이지 이동 */
	@RequestMapping(value = "/admin_users", method = RequestMethod.GET)
	public void usersGET(Model model) throws Exception{
		
		logger.info("관리자 페이지 이동");
		
		List<UserVO> list = userService.loadmember();
		model.addAttribute("userInfo", list);
	}	

	/* 회원이 작성한 게시글 목록 */
	@RequestMapping(value = { "/board" }, method = RequestMethod.GET)	
		public String b_userSearchAction(Model model, 
				@RequestParam(value ="userName", required=false, defaultValue="") String writer, 
				HttpServletRequest request,
				  @RequestParam(required = false, defaultValue = "1") int page,
				  @RequestParam(required = false, defaultValue = "1") int range) throws
				  Exception 
				{
			
		/* 유저 이름으로 '거래게시판' 카테고리 제외 모든 카페고리 게시글 전부 가져와 갯수 저장 */
		int listCnt = boardService.getBoardByUserName(writer).size();	
		/* 페이지네이션 세팅 */
		Pagination pagination = new Pagination();
		pagination.setWriter(writer);
		pagination.pageInfo(page, range, listCnt);
		/* 페이지 인디케이터 표시 */
		model.addAttribute("pagination", pagination);
		/* 출력 */
		model.addAttribute("boardList", boardService.getBoardByUserName_P((pagination)));
			
		if(writer.equals("")) {	//요청이 안왔으면(다음페이지시)
			model.addAttribute("writer",request.getAttribute("writer"));
		}else {
			writer = writer.trim();
			request.setAttribute("wrtier", writer);	//검색한 결과값이 들어왔으면.. 저장(처음검색)
			model.addAttribute("writer",writer);
		}
		
		return "/admin/admin_board";
	}

	/* 회원이 작성한 게시글 목록 */
	@RequestMapping(value = { "/trade" }, method = RequestMethod.GET)	
		public String t_userSearchAction(Model model, 
				@RequestParam(value ="userName", required=false, defaultValue="") String writer, 
				HttpServletRequest request,
				  @RequestParam(required = false, defaultValue = "1") int page,
				  @RequestParam(required = false, defaultValue = "1") int range) throws
				  Exception 
				{
			
		/* 유저 이름으로 '거래게시판' 카테고리 제외 모든 카페고리 게시글 전부 가져와 갯수 저장 */
		int listCnt2 = tradeService.getBoardByUserName(writer).size();
		System.out.println(listCnt2+"개");
		/* 페이지네이션 세팅 */
		Pagination pagination2 = new Pagination();
		pagination2.setWriter(writer);
		pagination2.pageInfo(page, range, listCnt2);
		/* 페이지 인디케이터 표시 */
		model.addAttribute("pagination2", pagination2);
		/* 출력 */
		model.addAttribute("tradeList", tradeService.getBoardByUserName_P((pagination2)));
		
		
		if(writer.equals("")) {	//요청이 안왔으면(다음페이지시)
			model.addAttribute("writer",request.getAttribute("writer"));
		}else {
			writer = writer.trim();
			request.setAttribute("wrtier", writer);	//검색한 결과값이 들어왔으면.. 저장(처음검색)
			model.addAttribute("writer",writer);
		}
			
		return "/admin/admin_trade";
	}
	
	@ResponseBody
	@PostMapping("getuserInfo")
	public UserVO getuserInfo(String memberId) throws Exception {
		
		UserVO vo = userService.getInfo(memberId);
		return vo;
		
	}
	
	@ResponseBody
	@PostMapping("/getUserBoardList")
	public List<BVO> getUserBoardList(String name) {
		System.out.println("open! user boardList ajax!");
		System.out.println("조회할 회원 아이디 : " + name);
		List<BVO> list = boardService.getUserBoardList(name);
		
		return list;
	}
	
	@ResponseBody
	@PostMapping("/successId")
	public void successId(String id) throws Exception {
		System.out.println(id);
		System.out.println("open! user sign success Id ajax!");
		userService.successId(id);
	}
	
	@ResponseBody
	@PostMapping("/failId")
	public void failId(String id) throws Exception {
		System.out.println(id);
		System.out.println("open! user sign failId Id ajax!");
		userService.failed(id);
	}
	
}
