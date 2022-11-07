package com.tech.controller;

import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tech.common.Pagination;
import com.tech.service.MemberService;
import com.tech.service.interfaces.BoardService;
import com.tech.service.interfaces.TradeService;
import com.tech.service.interfaces.UserService;
import com.tech.vo.UserVO;


@Controller
@RequestMapping(value = "/member")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserService userService;
	@Autowired
	private TradeService tradeService;
	@Autowired
	private BoardService boardService;
	
	@Autowired
    private BCryptPasswordEncoder pwEncoder;
	
	//회원가입 페이지 이동
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public void joinGET() {
		
		logger.info("회원가입 페이지 진입");
				
	}
	
	//회원가입
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String joinPOST(UserVO vo) throws Exception{
		
		String rawPw = "";
		String encodePw = "";
		
		rawPw = vo.getPassword();
		encodePw = pwEncoder.encode(rawPw);
		vo.setPassword(encodePw);
		
		logger.info("join 진입");
		
		userService.memberJoin(vo);
		
		logger.info("join Service 성공");
		
		return "redirect:/";
		
	}
	
	// 닉네임 중복 검사
	@RequestMapping(value = "/myNameChk", method = RequestMethod.POST)
	@ResponseBody
	public String myNameChkPOST(String membername, HttpServletRequest request) throws Exception{
		int result;

		HttpSession session = request.getSession();
		
		UserVO vo2 = (UserVO) session.getAttribute("member");
		
		String rename = vo2.getName();
		
		System.out.println("리네임 : "+ rename);
		System.out.println("작성 이름 : "+membername);
		
		if(!rename.equals(membername)) {
		
			String chkName = "^[a-z가-힣]{1}(?=.*[a-z가-힣])[a-z0-9가-힣]{2,10}$";
			logger.info("아이디 정규화 체크 진입");
			
			boolean rs = Pattern.matches(chkName, membername);
			if(rs != true) {
				return "fail2";
			}
			
			
			logger.info("memberNameChk() 진입");
			
			result = userService.nameCheck(membername);
			
			logger.info("결과값 = " + result);
			
			if(result != 0) {
				
				return "fail";	// 중복 아이디가 존재
				
			} else {
				
				return "success";	// 중복 아이디 x
				
			}	
		}
		return "successed";
		
	} // memberIdChkPOST() 종료
	
	// 닉네임 중복 검사
	@RequestMapping(value = "/memberNameChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberNameChkPOST(String membername, HttpServletRequest request) throws Exception{
		int result;

		
		String chkName = "^[a-z가-힣]{1}(?=.*[a-z가-힣])[a-z0-9가-힣]{2,10}$";
		logger.info("아이디 정규화 체크 진입");
		
		boolean rs = Pattern.matches(chkName, membername);
		if(rs != true) {
			return "fail2";
		}
		
		
		logger.info("memberNameChk() 진입");
		
		result = userService.nameCheck(membername);
		
		logger.info("결과값 = " + result);
		
		if(result != 0) {
			
			return "fail";	// 중복 아이디가 존재
			
		} else {
			
			return "success";	// 중복 아이디 x
			
		}	
		
	} // memberIdChkPOST() 종료
	
	// 아이디 중복 검사
	@RequestMapping(value = "/memberIdChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberIdChkPOST(String memberId) throws Exception{
		int result;
		
		String chkId = "^[a-z]{1}(?=.*[a-z])(?=.*[0-9]).{5,19}$";
		logger.info("아이디 정규화 체크 진입");
		
		boolean rs = Pattern.matches(chkId, memberId);
		if(rs != true) {
			return "fail2";
		}

		
		logger.info("memberIdChk() 진입");
		
		result = userService.idCheck(memberId);
		
		logger.info("결과값 = " + result);
		
		if(result != 0) {
			
			return "fail";	// 중복 아이디가 존재
			
		} else {
			
			return "success";	// 중복 아이디 x
			
		}	
		
	} // memberIdChkPOST() 종료
	
	// 비밀번호 정규화 & 확인 검사
	@RequestMapping(value = "/memberPwChk", method = RequestMethod.POST)
	@ResponseBody
	public String memberPwChkPOST(String memberPw) throws Exception{
		
		String chkPw = "^(?=.*[a-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\\\(\\\\)\\-_=+]).{5,19}$";
		logger.info("비밀번호 정규화 체크 진입");
		
		boolean rs = Pattern.matches(chkPw, memberPw);
		
		logger.info("memberPwChk() 진입");
		
		if(rs != true) {
			
			return "fail";	// 중복 아이디가 존재
			
		} else {
			
			return "success";	// 중복 아이디 x
			
		}	
		
	}
	
	//로그인 페이지 이동
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET() {
		
		logger.info("로그인 페이지 진입");
		
	}
	
	/* 로그인 */
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String loginPOST(HttpServletRequest request, UserVO vo, RedirectAttributes rttr) throws Exception{
		
		//System.out.println("login 메서드 진입");
		//System.out.println("전달된 데이터 : " + vo);
		
		HttpSession session = request.getSession();
		String rawPw = "";
		String encodePw = "";
		UserVO vo2 = userService.memberLogin(vo);
		int black = userService.memberBlack(vo.getId());
		System.out.println(black);
		if(vo2 != null) {
			rawPw = vo.getPassword();
			encodePw = vo2.getPassword();
			if(black >= 1) {
				rttr.addFlashAttribute("result", 1);
				return "redirect:/member/login"; //로그인 페이지로 이동
			}
			if(true == pwEncoder.matches(rawPw, encodePw)) {
				
				vo2.setPassword(""); //인코딩된 비밀번호 정보 지움
				session.setAttribute("member", vo2); //session에 사용자 정보 저장
				session.setAttribute("memberPW", rawPw);
				return "redirect:/"; //메인페이지로 이동
				
			}else { 
				rttr.addFlashAttribute("result", 0);
				return "redirect:/member/login"; //로그인 페이지로 이동
			}
			
		}else {	//일치하는 아이디가 존재하지 않을 시 (로그인 실패)
			rttr.addFlashAttribute("result", 0);
			return "redirect:/member/login"; //로그인 페이지로 이동
		}
		
	}
	
	/* 메인페이지 로그아웃 */
    @RequestMapping(value="logout", method=RequestMethod.GET)
    public String logoutMainGET(HttpServletRequest request) throws Exception{
        
    	logger.info("logoutMainGET메서드 진입");
    	
    	HttpSession session = request.getSession();
    	
    	session.invalidate();
    	
    	return "redirect:/main";
    	
    }

	
	//마이페이지-정보변경 이동
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypage() {
		logger.info("로그인됨 : 마이 페이지진입");
		return "/member/mypage";
	}

	
	//마이페이지-작성 판매글 목록 이동
	@RequestMapping(value = "/mypage_trade", method = RequestMethod.GET)
	public String mypage_trade() {
		logger.info("마이페이지-작성 판매글 목록 이동");
		return "/member/mypage_trade";
	}

	
	//회원탈퇴 이동
	@RequestMapping(value = "/my_del", method = RequestMethod.GET)
	public String mypageDelGET() {
		logger.info("회원 탈퇴 이동");
		return "/member/my_del";
	}
	
	/* 마이페이지 본인확인 */
	@RequestMapping(value = "/mypage.do", method = RequestMethod.POST)
	public String mypageCK(HttpServletRequest request, UserVO vo, RedirectAttributes rttr) throws Exception {

		HttpSession session = request.getSession();
		
		String rawPw = "";
		String encodePw = "";
		
		UserVO vo2 = userService.memberLogin(vo);
		
		if(vo2 != null) {
			rawPw = vo.getPassword();
			encodePw = vo2.getPassword();
			
			if(true == pwEncoder.matches(rawPw, encodePw)) {
				
				vo2.setPassword(""); //인코딩된 비밀번호 정보 지움
				session.setAttribute("mypageCK", vo2); //session에 사용자 정보 저장
				return "redirect:/member/mypage"; //마이페이지로 이동
				
			}else { 
				rttr.addFlashAttribute("result", 0);
				return "redirect:/member/mypage"; //마이 페이지로 이동
			}
			
		}else {	//일치하는 아이디가 존재하지 않을 시 (로그인 실패)
			rttr.addFlashAttribute("result", 0);
			return "redirect:/member/mypage"; //로그인 페이지로 이동
		}
	}
	
	//회원수정
	@RequestMapping(value = "/mypage", method = RequestMethod.POST)
	public String mypagePOST(UserVO vo, HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		
		String rawPw = "";
		String encodePw = "";
		
		rawPw = vo.getPassword();
		encodePw = pwEncoder.encode(rawPw);
		vo.setPassword(encodePw);
		
		logger.info("edit 진입");
		
		userService.memberEdit(vo);
		
		logger.info("edit Service 성공");
		
		session.invalidate();
		
		return "member/login";
		
	}
	
	//회원탈퇴
	@RequestMapping(value = "/my_del.do", method = RequestMethod.POST)
	public String memberDel(UserVO vo, HttpServletRequest request, RedirectAttributes rttr) throws Exception{
		
		String rawPw = "";
		String encodePw = "";
    	
    	HttpSession session = request.getSession();
    	
		
    	UserVO vo2 = userService.memberLogin(vo);
		
		if(vo2 != null) {
			rawPw = vo.getPassword();
			encodePw = vo2.getPassword();
			
			if(true == pwEncoder.matches(rawPw, encodePw)) {
				
				vo2.setPassword(""); //인코딩된 비밀번호 정보 지움
		    	session.invalidate(); //세션 삭제
		    	userService.memberDel(vo);
				return "redirect:/"; //메인페이지로 이동
				
			}else { 
				rttr.addFlashAttribute("result", 0);
				return "redirect:/member/my_del"; //마이 페이지로 이동
			}
			
		}else {	//일치하는 아이디가 존재하지 않을 시 (로그인 실패)
			rttr.addFlashAttribute("result", 0);
			return "redirect:/member/my_del"; //로그인 페이지로 이동
		}
		
	}
	//랜덤인증번호발송
	
	@PostMapping("/phoneAuth")
	@ResponseBody
	public Boolean phoneAuth(String tel, HttpServletRequest request) {

	    try { // 이미 가입된 전화번호가 있으면
	        if(MemberService.memberTelCount(tel) > 0) 
	            return true; 
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    HttpSession session = request.getSession();

	    String code = MemberService.sendRandomMessage(tel);
	    session.setAttribute("rand", code);
	    
	    return false;
	}

	@PostMapping("/phoneAuthOk")
	@ResponseBody
	public Boolean phoneAuthOk(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
	    String rand = (String) session.getAttribute("rand");
	    String code = (String) request.getParameter("code");

	    System.out.println(rand + " : " + code);

	    if (rand.equals(code)) {
	        session.removeAttribute("rand");
	        return false;
	    } 

	    return true;
	}	

	/* 회원이 작성한 게시글 목록 */
	@RequestMapping(value = { "/board" }, method = RequestMethod.GET)	
		public String b_userSearchAction(Model model, 
				@RequestParam(value ="userName", required=false, defaultValue="") String writer, 
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
			
		return "/member/mypage_board";
	}

	/* 회원이 작성한 게시글 목록 */
	@RequestMapping(value = { "/trade" }, method = RequestMethod.GET)	
		public String t_userSearchAction(Model model, 
				@RequestParam(value ="userName", required=false, defaultValue="") String writer, 
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
		
			
		return "/member/mypage_trade";
	}

}




	

