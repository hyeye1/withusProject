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
	
	@RequestMapping("insert.me")
	public String insertMember(Member m) {
		System.out.println(m);
		
		return "member/memberEnrollForm";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
