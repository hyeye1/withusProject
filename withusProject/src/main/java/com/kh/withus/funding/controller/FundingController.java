package com.kh.withus.funding.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.withus.category.model.vo.Category;
import com.kh.withus.funding.model.dto.FundingDetail;
import com.kh.withus.funding.model.service.FundingService;
import com.kh.withus.funding.model.vo.Project;
import com.kh.withus.funding.model.vo.Reward;
import com.kh.withus.member.model.vo.Member;
import com.kh.withus.order.model.vo.Order;

@Controller
public class FundingController {
	
	@Autowired
	private FundingService funService;
	
	@RequestMapping("list.fun")
    public ModelAndView selectFundingList(int catNo, ModelAndView mv) {
		
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
		
		//System.out.println(o);
		//System.out.println(fd);
		
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

		//System.out.println(p);
		
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
	
	@RequestMapping("pay.fun")
	public String payForm(Order o, Model model) {
		
		System.out.println(o);
		
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
		
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
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
   
	
}
