package com.tech.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		logger.info("메인 페이지 리다이렉트");
		return "redirect:main";
	}
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		logger.info("메인 페이지 진입");
		return "home";
	}
}
