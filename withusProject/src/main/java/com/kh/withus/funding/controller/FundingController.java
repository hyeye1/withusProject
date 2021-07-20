package com.kh.withus.funding.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.withus.category.model.vo.Category;
import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.common.template.pagination;
import com.kh.withus.funding.model.dto.FundingDetail;
import com.kh.withus.funding.model.service.FundingService;
import com.kh.withus.funding.model.vo.Project;
import com.kh.withus.funding.model.vo.ProjectReply;
import com.kh.withus.funding.model.vo.Reward;
import com.kh.withus.funding.model.vo.Search;
import com.kh.withus.member.model.vo.Member;
import com.kh.withus.myPage.model.service.MyPageService;
import com.kh.withus.myPage.model.vo.MyPage;
import com.kh.withus.order.model.vo.Order;

@Controller
public class FundingController {
	
	@Autowired
	private FundingService funService;
	@Autowired
	private MyPageService mpService;
	
	@ResponseBody
	@RequestMapping(value="menuList3.main", produces="application/json; charset=utf-8")
	public String ajaxSelectMenuList3() {
		
		HashMap<String, Object> map = funService.ajaxSelectMenuList3();
		
		return new Gson().toJson(map);
		
	}
	
	@RequestMapping("menuList.fun")
    public ModelAndView selectMenuList(String menu, ModelAndView mv) {
		
		ArrayList<Project> pList = null;
		
		switch(menu){
		
			case "famous":
				pList = funService.selectFamousList();
				break;
				
			case "eve":
				pList = funService.selectEveList();
				break;
				
			case "new": 
				pList = funService.selectNewList();
				break;
				
			case "ready":
				pList = funService.selectReadyList();
				break;
			
		}
		
		mv.addObject("menu", menu)
		.addObject("pList", pList) 
		.setViewName("funding/menuListView");
		
		return mv;
	}
	
	@RequestMapping("search.fun")
    public ModelAndView selectSearchList(Search s, ModelAndView mv) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", s.getCondition());
		map.put("keyword", s.getKeyword());
		
		ArrayList<Project> list = funService.selectSearchList(map);
		
		mv.addObject("list", list)
		.setViewName("funding/fundingListView");
		
		return mv;
	}
	
	@RequestMapping("list.fun")
    public ModelAndView selectFundingList(int catNo, String menu, ModelAndView mv) {
		
		// 전체 카테고리 사진, 명 조회
		ArrayList<Category> cList = funService.selectCate();
		ArrayList<Project> list = null;
		
		// 펀딩 상품 조회
		if(catNo == 1) {
			list = funService.selectAllList();
		} else {
			list = funService.selectList(catNo);
		}
		
		mv.addObject("list", list)
		.addObject("cList", cList)
		.addObject("catNo", catNo)
		.setViewName("funding/fundingListView");
		
		return mv;
	}
		      
	
	@RequestMapping("list.rew")
	public String selectRewardList(int pno, @RequestParam(value="rno", defaultValue="0") int rno, Model model) {
		
		model.addAttribute("pno", pno);
		ArrayList<FundingDetail> drList = funService.selectDetailReward(pno);
		model.addAttribute("drList", drList);
		
		if(rno != 0) { // 리워드 클릭시
			model.addAttribute("rno", rno);
		}
		
		return "funding/rewardListView";
		
	}

	@RequestMapping("detail.fd")
	public String selectFunding(int pno, Model model) {
		int result= funService.increaseCount(pno);
		
		if(result>0) {
			FundingDetail p = funService.selectFunding(pno);
			model.addAttribute("p", p);
			ArrayList<FundingDetail> rList = funService.selectReward(pno);
			model.addAttribute("rList", rList);
			return "funding/fundingDetails";
		}else {
			model.addAttribute("errorMsg", "상세페이지 조회 실패");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("check.fun")
	public String insertOrder(Order o, int rewardNo, Model model) {
		
		FundingDetail fd = funService.selectOneReward(rewardNo);
		
		model.addAttribute("fd", fd);
		model.addAttribute("o", o);
		return "funding/payCheckForm";
	}
	
	@RequestMapping("register.fd")
	public String FundingRegistration(HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser == null) {
			session.setAttribute("alertMsg", "로그인해주세요.");
			return "redirect:loginForm.me";
		}else {
			return "funding/fundingRegistration";
			
		}
	}

	   
	@RequestMapping("success.fd")
	public String fundingSuccess(Project p, MultipartFile upfile, HttpSession session, Model model) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");

		p.setMemberNo(loginUser.getMemberNo());
		
		/*
		 * 만약 다중 첨부파일 업로드 기능일 겨웅?
		 * <input type="file"> 요소들 다 동일한 키값으로 부여
		 * Controller쪽에서 매개변수로 MultipartFile[] 키값 으로 받아오면됨
		*/		 
		
		// 곧바로 받아내지지 않음 => 파일업로드 관련 라이브러리 추가 + 파일업로드 관련 클래스 빈등록
		
		// 전달된 파일이 있을 경우 => 파일명 수정 작업 후 서버에 업로드 => 파일원본명,실제서버에업로드된경로를 b 추가로 담기
		if(!upfile.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(session, upfile);
			
			//p.setProjectThum(upfile.getOriginalFilename());
			//String originName = upfile.getOriginalFilename();
			p.setProjectThum("resources/project_thumbnail/" + changeName); // 업로드된파일명+파일명
			
		}

		// servieImpl, dao, sql 작성
		int result = funService.insertProject(p);

		if(result>0) {
			session.setAttribute("alertMsg", "성공적으로 프로젝트 등록 승인 요청을 보냈습니다.");
			return "redirect:/";
			
		}else {
			// 프로젝트 등록 실패했을 경우 
			model.addAttribute("errorMsg", "프로젝트 등록 실패");
			return "common/errorPage";
		}
	}

	   // 미리보기(혜)
	   @RequestMapping("preview.fd")
	   public String fundingPreview(Project p, FundingDetail fd, ArrayList<FundingDetail> rList, HttpSession session, Model model) {
	      
	      Member loginUser = (Member)session.getAttribute("loginUser");
	      p.setMemberNo(loginUser.getMemberNo());
	      
	      // 컨트롤러에서 전달값을 Project에 받고, 
	      // 그걸 다시 담아서 jsp에 포워딩하기.
	      model.addAttribute("p", p);
	      model.addAttribute("fd",fd);
	      model.addAttribute("rList", rList);
	      model.addAttribute("loginUser", loginUser);
	      
	      return "funding/fundingPreview";

	   }
	
	@RequestMapping("pay.fun")
	public String payForm(Order o, Model model) {
		
		FundingDetail fd = funService.selectOneReward(o.getRewardNo());
		
		model.addAttribute("fd", fd);
		model.addAttribute("o", o);
		
		int result = funService.insertOrderTable(o);
		
		if(result>0) {
			funService.minusStock(o);
			return "funding/payComplete";
		}else {
			model.addAttribute("errorMsg", "데이터 저장 실패");
			return "common/errorPage";
		}
		
	}

	public String saveFile(HttpSession session, MultipartFile upfile) {
		
		String savePath = session.getServletContext().getRealPath("/resources/project_thumbnail/");
		
		String originName = upfile.getOriginalFilename();  // 원본명 ("aaa.jpg")
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 900000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
		
	}
	
	
	// 프로젝트 댓글입력
	@ResponseBody
	@RequestMapping("rinsert.fd")
	public String ajaxInsertReply(ProjectReply r, int memberNo) {
		 
		 r.setMemberNo(memberNo);
		
		 int result = funService.insertReply(r);
		 if(result>0) {
			 return "success";
		 }else {
			 return "fail";
		 }	
		 
		
	}
	
	
	// 프로젝트 댓글부분
	@ResponseBody
	@RequestMapping(value="proReply.fd", produces="application/json; charset=utf-8")
	public String ajaxSelectReplyList(int pno) {
		
		return new Gson().toJson(funService.selectReplyList(pno));
		
	}
	
	// 프로젝트 댓글 삭제(관리자)
	@ResponseBody
	@RequestMapping("deleteReply.fd")
	public String deleteReply(int replyNo) {
		 
		 int result = funService.deleteReply(replyNo);
		 
		 if(result>0) {
			 return "success";
		 }else {
			 return "fail";
		 }	
		 
		
		
	}
	
	// 프로젝트 대댓글부분
	@ResponseBody
	@RequestMapping(value="proReReply.fd", produces="application/json; charset=utf-8")
	public String ajaxSelectReReplyList(String replyNo) {

		return null;
		
		//return new Gson().toJson(funService.selectReplyList(pno));
		
	}
	
	// 팔로우 상태 확인
	@ResponseBody
	@RequestMapping("followCheck.fd")
	public String followCheck(String memberNo, String followMemberNo, HttpSession session) {
		
		
		MyPage m = new MyPage();
		m.setMemberNo(Integer.parseInt(followMemberNo));
		m.setFollowMemberNo(Integer.parseInt(memberNo));
		
		int result = mpService.followCheck(m);
				
		if(result>0) { // 팔로우중
			return "Y";
					
		}else { // 언팔중
			return "N";
		}
					
			
	}
	
	// 좋아요 상태 확인
	@ResponseBody
	@RequestMapping("likeyCheck.fd")
	public String likeyCheck(String memberNo, String projectNo, HttpSession session) {
		
		
		MyPage m = new MyPage();
		m.setMemberNo(Integer.parseInt(memberNo));
		m.setProjectNo(Integer.parseInt(projectNo));
		
		
		int result = funService.likeyCheck(m);
				
		if(result>0) { // 좋아요중
			return "liked";
					
		}else { // 안좋아요중
			return "dislike";
		}
			
	}
	
	// 좋아요 해제
	@ResponseBody
	@RequestMapping("dislike.fd")
	public String dislike(String memberNo, String projectNo, HttpSession session) {
		
		MyPage m = new MyPage();
		m.setMemberNo(Integer.parseInt(memberNo));
		m.setProjectNo(Integer.parseInt(projectNo));
		
		int result = funService.dislike(m);
				
		if(result>0) { // 좋아요중
			return "Y";
					
		}else { // 안좋아요중
			return "N";
		}
			
	}
	
	// 좋아요
	@ResponseBody
	@RequestMapping("like.fd")
	public String like(String memberNo, String projectNo, HttpSession session) {
		
		MyPage m = new MyPage();
		m.setMemberNo(Integer.parseInt(memberNo));
		m.setProjectNo(Integer.parseInt(projectNo));
		
		int result = funService.like(m);
				
		if(result>0) { // 좋아요중
			return "Y";
					
		}else { // 안좋아요중
			return "N";
		}
			
	}	
	
	// +현정 : 관리자
	// 펀딩 리스트 조회
	@RequestMapping("fundingListView.mana")
	public ModelAndView selectFundingList(@RequestParam(value="currentPage", defaultValue="1") int currentPage,
			 ModelAndView mv) {
		
		int listCount = funService.selectFListCount();
		PageInfo pi = pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Project> fdList = funService.selectFundingList(pi);
		
		mv.addObject("fdList",fdList)
		.addObject("pi", pi)
		.setViewName("admin/fundingManaListView");
		return mv;
		
	}

	// 펀딩 승인처리 , 미리보기로 처리하기
	   @RequestMapping("fundingConsiderPre.mana")
	   public String fundingConsiderPre(int pno, Model model) {
	
		   //Project p = funService.selectFundingConsider(pno);
		   FundingDetail p = funService.fundingConsiderPre(pno);
		   Member m = funService.selectPartnerInfo(pno);
		   ArrayList<FundingDetail> r = funService.selectFundingReward(pno);
		   
		   model.addAttribute("p", p); 
		   model.addAttribute("m", m); 
		   model.addAttribute("r", r); 
		   
	      return "admin/fundingManaConsider";

	   }
	
	   // 승인/반려
	   @RequestMapping("fundingConsider.mana")
		public String updateProjectStatus(@RequestParam(defaultValue="") int pno,
											@RequestParam(defaultValue="") String considerBtn,
											HttpSession session, HttpServletRequest request) {
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("pno", pno);
			map.put("considerBtn", considerBtn);
			
			int result = funService.updateProjectStatus(map);
			
			// 이전 url 가져오기
			String referer = (String)request.getHeader("REFERER");
			//System.out.println(referer);
			
			if(result > 0 ) {
				session.setAttribute("alertMsg", "프로젝트 승인 처리 완료");
				return "redirect:fundingListView.mana";
			}else {
				session.setAttribute("alertMsg", "실패실패");
				return "redirect:fundingConsiderPre.mana?pno=" + pno;
			}
			 
		}
	   
	   // 펀딩 검색?정렬?
	   @RequestMapping("searchFunding.mana")
		public ModelAndView searchM(@RequestParam(defaultValue="") String condition,
										 @RequestParam(defaultValue="") String sort,
										 @RequestParam(defaultValue="") String keyword,
										 @RequestParam(value="currentPage", defaultValue="1") int currentPage,
										 ModelAndView mv) {
			
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("condition", condition);
			map.put("sort", sort);
			map.put("keyword", keyword);
			
			// 검색결과 리스트 총 갯수
			int count = funService.countSearchFdMana(map);
			
			// 페이징 처리
			PageInfo pi = pagination.getPageInfo(count, currentPage, 10, 10);
			
			// 검색결과 담아내기
			ArrayList<Project> fdList = funService.searchFundingMana(map, pi);
			
			mv.addObject("pi", pi)
			  .addObject("fdList",fdList)
			  .addObject("condition", condition)
			  .addObject("sort", sort)
			  .addObject("keyword", keyword)
			  .setViewName("admin/fundingManaListView");
			
			return mv;
			
		}
	   
}
