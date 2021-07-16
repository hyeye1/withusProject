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
		
	    // 로그인 유무 확인
		if(loginUser == null) {
			session.setAttribute("alertMsg", "로그인 후 이용가능한 서비스 입니다.");
			response.sendRedirect(request.getContextPath());
			return false;
		}else {
			// 로그인 상태에서 관리자인지 판단
			if(loginUser.getMemberStatus().equals("A")) {  // 관리자일 경우
				
				return true;
				
			} else {	// 일반 회원일 경우
				
				session.setAttribute("alertMsg", "접근 가능한 페이지가 아닙니다.");
				response.sendRedirect(request.getContextPath());
				return false;
			}
		}
	    
		
	}

}