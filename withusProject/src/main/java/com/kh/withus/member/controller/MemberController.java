package com.kh.withus.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.withus.member.model.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService mService;
	
	/*
	@RequestMapping("login.me")
	public String loginMember(HttpSession session) {
		
	}
	*/
	
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("enrollForm.me")
	public String enrollForm() {
		return "member/memberEnrollForm";
	}
	
}
