package com.kh.withus.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.withus.member.model.vo.Member;

public class AdminLoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		
		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginUser");
		//Member loginAdmin = (Member) session.getAttribute("loginAdmin");
		//System.out.println("사용자"+loginUser);
		//System.out.println("관리자"+loginAdmin);
		
	    // 로그인 유무 확인
		if( loginUser == null || !loginUser.getMemberStatus().equals("A")) {
			session.setAttribute("alertMsg", "접근 가능한 페이지가 아닙니다.");
			response.sendRedirect(request.getContextPath());
			return false;
		}else {
			return true;
			// 로그인 상태에서 관리자인지 판단
			/*
			 * if(loginAdmin.getMemberStatus().equals("A") && loginAdmin != null ) { // 관리자일
			 * 경우
			 * 
			 * 
			 * } else { // 일반 회원일 경우
			 * 
			 * session.setAttribute("alertMsg", "접근 가능한 페이지가 아닙니다.");
			 * response.sendRedirect(request.getContextPath()); return false; }
			 */
		}
	    
		
	}

}