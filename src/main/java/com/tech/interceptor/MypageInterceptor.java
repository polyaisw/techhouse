package com.tech.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.mysql.cj.Session;
import com.tech.vo.UserVO;

public class MypageInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		
		System.out.println("MypageInterceptor preHandle 작동");
		
		HttpSession session = request.getSession();
		
		UserVO vo =(UserVO)session.getAttribute("member");
        
		if(vo == null) {
			response.sendRedirect("/main");
			
			return false;
		}
		
		return true;
		
	}
	
}
