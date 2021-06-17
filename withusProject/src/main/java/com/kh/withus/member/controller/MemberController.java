package com.kh.withus.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.withus.member.model.vo.Member;

@Controller
public class MemberController {

	/*
	@Autowired
	private MemberService mService;
	*/
	
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

	@RequestMapping("insert.me")
	public String insertMember(Member m) {
		System.out.println(m);
		
		return "member/memberEnrollForm";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	// 관리자쪽
	@RequestMapping("memberListView.mana")
	public String selectMemberList() {
		return "member/manaMemberListView";
	}
	

}
