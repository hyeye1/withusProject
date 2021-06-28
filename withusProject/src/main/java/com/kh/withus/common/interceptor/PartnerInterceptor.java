package com.kh.withus.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.withus.member.model.vo.Member;

public class PartnerInterceptor extends HandlerInterceptorAdapter{
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		
		// boolean값 리턴
		// 이때 true가 리턴되면 기존의 요청 흐름대로 해당 Controller를 제대로 실행함
		//      false가 리턴되면 해당 Controller 실행 안됨
		// Interceptor가 사용되는 경우 : 로그인한 회원인지 아닌지 체크, 로그인한 회원의 권한 체크
		HttpSession session = request.getSession();
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		String PartnerJoin = loginUser.getPartnerJoin();
		
		if(PartnerJoin.equals("N")) { //파트너조인전
			
			session.setAttribute("alertMsg", "파트너 등록 후 이용가능한 서비스입니다");
			response.sendRedirect(request.getContextPath()+"/fundingMain.me");
			
			return false;
		}else { // 파트너조인
			
		
			return true;
		}
		
		/*
		 * Interceptor 클래스를 만들어서 작성만했다고 끝 아님
		 * 어떤 요청을 가로챌건지 설정하면서 Interceptor클래스 빈으로 등록해야됨(servlet-context.xml에서 등록)
		 */
		
		
	}
	
	
	

}



