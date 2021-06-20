package com.kh.withus.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.withus.member.model.service.MemberService;

@Controller
public class MemberController {

	
	@Autowired
	private MemberService mService;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("login.me")
	public String loginForm() {
		return "member/loginForm";
	}
	
	
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("enrollForm.me")
	public String enrollForm() {
		return "member/memberEnrollForm";
	}
	
	@RequestMapping("naver_callback.me")
	public String naver_callback() {
		return "member/naver_callback";
	}

	
	/*
	@RequestMapping("insert.me")
	public String insertMember(Member m, HttpSession session, Model model) {
		
		//System.out.println("암호화 전 : " + m.getUserPwd());
		
		// 암호화 작업
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		//System.out.println("암호화 후 : " + encPwd); // 같은 평문을 입력해도 매번 다른 암호문이 나옴
		
		//m.setUserPwd(encPwd); // 암호문으로 변경하기
		
		int result = mService.insertMember(m);
		
		if(result > 0) { // 성공
			session.setAttribute("alertMsg", "성공적으로 회원가입되었습니다");
			return "redirect:/";
		}else { // 실패
			model.addAttribute("errorMsg", "회원가입 실패");
			return "common/errorPage";
		}
		
	}
	*/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	// 관리자쪽
	@RequestMapping("memberListView.mana")
	public String selectMemberList() {
		return "member/manaMemberListView";
	}
	

}
