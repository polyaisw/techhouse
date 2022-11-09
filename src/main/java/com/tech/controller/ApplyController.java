package com.tech.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.tech.service.interfaces.ApplyService;
import com.tech.service.interfaces.ProductService;
import com.tech.vo.ApplyVO;
import com.tech.vo.ProductVO;
import com.tech.vo.UserVO;

@Controller
@RequestMapping("/board")
public class ApplyController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private ProductService productService;
	@Autowired
	private ApplyService applyService;
	
	ProductVO productVO;
	
	/* apply */
	@GetMapping("/apply/product")
	public String apply(Model model, HttpSession session, HttpServletRequest request) {
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

		
		
		int applyCountNum = 0;
		int applyCountMe = 0;
		double applyPercent = 0;
		UserVO userVO = (UserVO)session.getAttribute("member");
		if(userVO != null) {
			 applyCountNum = applyService.getApplyCount(); // 총 지원개수
			 applyCountMe = applyService.getApplyCountById(userVO.getId()); // 내가지원한 개수
			 applyPercent = (applyCountMe / (double) applyCountNum) * 100; // 당첨확률
		}
		/*UserVO userVO = (UserVO)session.getAttribute("member");
		int applyCountNum = applyService.getApplyCount(); // 총 지원개수
		int applyCountMe = applyService.getApplyCountById(userVO.getId()); // 내가지원한 개수

		double applyPercent = (applyCountMe / (double) applyCountNum) * 100; // 당첨확률
*/
		if (String.valueOf(applyPercent).equals("NaN"))
			applyPercent = 0;

		String percent = String.format("%.1f", applyPercent);

		model.addAttribute("count", applyCountNum);
		model.addAttribute("countMe", applyCountMe);
		model.addAttribute("percent", percent);


		//현재시각
		
		  String nowTime =
		  LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")
		  );
		  
		  ServletContext application = request.getServletContext();
		  application.setAttribute("nowTime", nowTime);
		 
		
		return "/board/apply/product";
	}

	@GetMapping("/apply/roulette")
	public String roullete() {
		logger.info("룰렛 진입");
		return "/board/apply/roulette";
	}


	@RequestMapping("/updateProductForm")
	public String updateProductForm(Model model, @RequestParam("prod_seq") String prod_seq) {

		logger.info("상품 수정 진입");
		int seq = Integer.parseInt(prod_seq);

		productVO = productService.getProductById(seq);
		model.addAttribute("productContent", productVO);

		return "/board/updateProductForm";
	}

	/* apply */

	@RequestMapping("/insertProductAction")
	@ResponseBody
	public String insertProductAction(@RequestParam("prod_productName") String prod_productName,
			@RequestParam("prod_price") String prod_price,
			MultipartFile file, HttpServletRequest request	) {
		logger.info("상품 등록 액션");
		

		ProductVO productVO = new ProductVO();
		
		ServletContext application = request.getServletContext();
		/* 이미지 업로드 */
		String fileRealName = file.getOriginalFilename(); // 파일명을 얻어낼 수 있는 메서드!
		long size = file.getSize(); // 파일 사이즈
		
		

		System.out.println("파일명 : " + fileRealName);
		System.out.println("용량크기(byte) : " + size);
		
			// 미 업로드시 기본값 설정 
		  if (fileRealName == null || fileRealName.equals("")){
				System.out.println("파일 미 업로드로 기본값으로 설정합니다 ");
			  productVO.setProd_uploadImg("product_default.png");
		} else {
		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
		String uploadFolder = (String) application.getAttribute("path");
		
		UUID uuid = UUID.randomUUID();
		System.out.println(uuid.toString());
		String[] uuids = uuid.toString().split("-");

		String uniqueName = uuids[0];
		System.out.println("생성된 고유문자열" + uniqueName);
		System.out.println("확장자명" + fileExtension);

		// File saveFile = new File(uploadFolder+"\\"+fileRealName); uuid 적용 전

		File saveFile = new File(uploadFolder + "\\" + uniqueName + fileExtension); // 적용 후
		System.out.println("업로드 파일 전체 경로 : "+saveFile);
		try {
			file.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		productVO.setProd_uploadImg(uniqueName + fileExtension);
		/* 이미지 업로드 끝 */
		}

			productVO.setProd_productName(prod_productName);
			productVO.setProd_price(prod_price);
			productService.insertProduct(productVO);
		return "<script>alert('product_comlete'); location.href='/board/apply/product'</script>";
	}

	@RequestMapping("/updateProductAction")
	@ResponseBody
	public String updateProductAction(MultipartFile file, HttpServletRequest request,
			@RequestParam("prod_seq") String prod_seq,
			@RequestParam("prod_productName") String prod_productName, 
			@RequestParam("prod_price") String prod_price,
			@RequestParam("prod_selectedId") String prod_selectedId,
			@RequestParam("prod_selectedName") String prod_selectedName,
			@RequestParam("prod_selectedTel") String prod_selectedTel) {

		logger.info("상품 수정 액션");
		int seq = Integer.parseInt(prod_seq);

		
		
		
		ServletContext application = request.getServletContext();
		productVO = productService.getProductById(seq);
		/* 이미지 업로드 */
		String fileRealName = file.getOriginalFilename(); // 파일명을 얻어낼 수 있는 메서드!
		long size = file.getSize(); // 파일 사이즈
		
		

		System.out.println("파일명 : " + fileRealName);
		System.out.println("용량크기(byte) : " + size);
		
			// 미 업로드시 기본값 설정 
		  if (fileRealName == null || fileRealName.equals("")){
				System.out.println("파일 미 업로드로 기본값으로 설정합니다 ");
			  productVO.setProd_uploadImg("product_default.png");
		} else {
		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
		String uploadFolder = (String) application.getAttribute("path");
		
		UUID uuid = UUID.randomUUID();
		System.out.println(uuid.toString());
		String[] uuids = uuid.toString().split("-");

		String uniqueName = uuids[0];
		System.out.println("생성된 고유문자열" + uniqueName);
		System.out.println("확장자명" + fileExtension);

		// File saveFile = new File(uploadFolder+"\\"+fileRealName); uuid 적용 전

		File saveFile = new File(uploadFolder + "\\" + uniqueName + fileExtension); // 적용 후
		System.out.println("업로드 파일 전체 경로 : "+saveFile);
		try {
			file.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		productVO.setProd_uploadImg(uniqueName + fileExtension);
		}
		productVO.setProd_productName(prod_productName);
		productVO.setProd_price(prod_price);
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
	public String insertApplyAction(@RequestParam("prod_productName") String prod_productName, HttpSession session) {
		logger.info(prod_productName);
		System.out.println(prod_productName);
		logger.info("응모 지원 액션");
		// 세션에있는 객체가져와 세팅
		UserVO userVO = (UserVO) session.getAttribute("member");
		userVO.setTicket(userVO.getTicket()-1);
		ApplyVO applyVO = new ApplyVO(prod_productName, userVO.getId(), userVO.getName(), userVO.getTel());
		
		applyService.insertApply(applyVO); // 이게 성공하면 티켓개수를 줄인다. 
		applyService.updateTicket(userVO);	//티켓개수 감소
		return "<script>alert('apply_product_comlete'); location.href='/board/apply/product'</script>";
	}

	@RequestMapping("/PostProductAction")
	@ResponseBody
	public String PostProductAction(Model model, HttpServletRequest request,
			@RequestParam("prod_seq") String prod_seq,
			@RequestParam("closeHour") int closeHour, HttpSession session) {
		logger.info("상품 게시 액션");
		int seq = Integer.parseInt(prod_seq);

		//모든 게시글 내리기
		List<ProductVO> lists = productService.getProductList();
		
		  for (ProductVO productVO : lists) { productVO.setProd_posting(0);
		  productService.updatePosting(productVO); }
		 
		
		LocalDateTime curDateTime = LocalDateTime.now().plusSeconds(closeHour);	//현재시각+설정시간이값을 db로 넣는다.
		
		
		String closeTime_ = curDateTime.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));	//현재타임을 초까지 계산
		
		logger.info(closeTime_);
		
		productVO = productService.getProductById(seq);
		productVO.setProd_posting(1);
		productVO.setProd_closeTime(closeTime_);
		productService.updatePosting(productVO);
		  String closeTime = productService.inputCloseTime(productVO);
			logger.info(closeTime.toString());
			ServletContext application = request.getServletContext();
			  application.setAttribute("closeTime", closeTime);
			  application.setAttribute("productAppContent", productVO);
		 
		
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
		applyService.deleteAllApply();//지원했던 회원 목록 전부 삭제
		return "<script>alert('unpost_product_complete'); location.href='/board/apply/product'</script>";
	}

	@RequestMapping("/deleteAllApplyAction")
	@ResponseBody
	public String deleteAllApplyAction() {
		applyService.deleteAllApply();
		logger.info("응모한 회원 기록 삭제 액션");

		return "<script>alert('delete_all_complete'); location.href='/board/apply/product'</script>";
	}

	@RequestMapping("/timeoutAction")
	public String timeoutAction(HttpServletRequest request) {
		// 타임아웃 시 당첨
		ApplyVO aVO2 = applyService.getRandomSelected();
		// 당첨자 등록
		productService.insertSelectedMember(aVO2);
		
		ServletContext application = request.getServletContext();
		application.removeAttribute("productAppContent");
		application.removeAttribute("nowTime");
		
		
		logger.info("타임아웃 액션");
		return "redirect:/board/apply/product";
	}
	
}
