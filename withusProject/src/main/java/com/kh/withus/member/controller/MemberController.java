package com.kh.withus.member.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.common.template.pagination;
import com.kh.withus.member.model.service.MemberService;
import com.kh.withus.member.model.vo.Member;


@Controller
public class MemberController {

	
	@Autowired
	private MemberService mService;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	@RequestMapping("loginForm.me")
	public String loginForm() {
		
		
		return "member/loginForm";
		
		
	}
	
	
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m, HttpSession session, ModelAndView mv) {
		
		
		
		// 암호화 작업 후 (단지 아이디 대조만)
		Member loginUser = mService.loginMember(m);
		// 아이디만을 가지고 조회해옴 (실제db에 저장되어있는 비번 암호문)
		
		if(loginUser!= null && bcryptPasswordEncoder.matches(m.getMemberPwd(), loginUser.getMemberPwd())) {
			// 로그인 성공
			session.setAttribute("loginUser", loginUser);
			session.setAttribute("alertMsg", "로그인되었습니다");
			mv.setViewName("redirect:/");
			
		}else {
			// 로그인 실패
			mv.addObject("errorMsg", "로그인실패");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
		
		
	}
	
	
	
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	/*
	@RequestMapping("insert.login")
	public String insertMember(Member m) {
		
	}
	*/
	
	
	//	회원가입페이지
	@RequestMapping("enrollForm.me")
	public String enrollForm() {
		return "member/memberEnrollForm";
	}
	
	@RequestMapping("naver_callback.me")
	public String naver_callback() {
		return "member/naver_callback";
	}

	
	
	@RequestMapping("insert.me")
	public String insertMember(Member m, HttpSession session, Model model) {
		
		System.out.println(m);
		
		// 암호화 작업
		
		String encPwd = bcryptPasswordEncoder.encode(m.getMemberPwd());
		//System.out.println("암호화 후 : " + encPwd); // 같은 평문을 입력해도 매번 다른 암호문이 나옴
		
		m.setMemberPwd(encPwd); // 암호문으로 변경하기
		
		int result = mService.insertMember(m);
		
		if(result > 0) { // 성공
			session.setAttribute("alertMsg", "성공적으로 회원가입되었습니다");
			return "redirect:/";
		}else { // 실패
			model.addAttribute("errorMsg", "회원가입 실패");
			return "common/errorPage";
		}
		
	}
	
	
	
	@ResponseBody
	@RequestMapping("idCheck.me")
	public String ajaxIdCheck(String checkId) {
		
		int count = mService.idCheck(checkId);
		
		return count>0 ? "N":"Y";
		
	}
	
	
	
		
	
	
	
	
	
	
	
	
	
	
	

	// 관리자쪽
	// 회원 조회
	@RequestMapping("memberListView.mana")
	public ModelAndView selectMemberList(@RequestParam(value="currentPage", defaultValue="1") int currentPage,ModelAndView mv) {
		
		int listCount = mService.selectListCount();
		PageInfo pi = pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Member> mList = mService.selectList(pi);
		
		mv.addObject("mList",mList)
		  .addObject("pi", pi)
		  .setViewName("member/manaMemberListView");
		return mv;
	}
	
	// 탈퇴클릭시 ->모달
	@ResponseBody
	@RequestMapping(value="memStatus.mana", produces="apllication/json; charset=utf-8")
		public String ajaxSelectMemStatus(int mno) {
		
		//System.out.println(mno);
		
		Member ms = mService.selectMemStatus(mno);
		//System.out.println(ms);
		
		return new Gson().toJson(ms);
	}
	// 회원 탈퇴
	@RequestMapping("deleteMem.mana")
	public String deleteMemberMana(@RequestParam(defaultValue="") String mStatus,
									 @RequestParam(defaultValue= "") String mamberName,
									 HttpSession session) {
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mStatus", mStatus );
		map.put("mamberName", mamberName );
		
		System.out.println(map);
		
		int delMem = mService.deleteMemberMana(map);
		
		if (delMem > 0) {
			//session.setAttribute("alertMsg", "탈퇴처리 성공");
			return "redirect:/memberListView.mana";
		}else {
			session.setAttribute("alertMsg", "실패실패");
			return "redirect:/memberListView.mana";
		}
		
	}
	
	// 회원 검색
	@RequestMapping("searchMember.mana")
	public ModelAndView searchMember(@RequestParam(defaultValue="") String partnerJoin,
									 @RequestParam(defaultValue="") String memberStatus,
									 @RequestParam(defaultValue="") String memKey,
									 @RequestParam(defaultValue="") String keyword,
									 @RequestParam(value="currentPage", defaultValue="1") int currentPage,
									 ModelAndView mv) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("partnerJoin", partnerJoin);
		map.put("memberStatus", memberStatus);
		map.put("memKey", memKey);
		map.put("keyword", keyword);
		//System.out.println(map);
		
		// 검색결과 리스트 총 갯수
		int count = mService.countSearch(map);
		
		// 페이징 처리
		PageInfo pi = pagination.getPageInfo(count, currentPage, 10, 10);
		
		// 검색결과 담아내기
		ArrayList<Member> mList = mService.searchMember(map, pi);
		//System.out.println(mList);
		
		mv.addObject("pi", pi)
		  .addObject("mList",mList)
		  .addObject("partnerJoin", partnerJoin)
		  .addObject("memberStatus", memberStatus)
		  .addObject("memKey", memKey)
		  .addObject("keyword", keyword)
		  .setViewName("member/manaMemberListView");
		
		return mv;
		
	}
	
	

}
