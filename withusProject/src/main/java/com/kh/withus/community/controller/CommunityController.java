package com.kh.withus.community.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.community.model.service.CommunityService;
import com.kh.withus.community.model.vo.Community;

import javafx.scene.control.Pagination;

@Controller
public class CommunityController {

	@Autowired
	private CommunityService cService;
	
	/*
	@RequestMapping("community.me")
	public String community() {
		return "community/communityMain";
	}
	*/
	@RequestMapping("community.main")
	public ModelAndView selectBoardList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = cService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Community> list = cService.selectList(pi);
		
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("community/communityMain");
		
		return mv;
	}
	
	
	@RequestMapping("commu.detail")
	public String commuDetail() {
		return "community/commuDetail";
	}
	
	@RequestMapping("commu.enroll")
	public String commuEnroll() {
		return "community/commuEnrollForm";
	}
	
	
	@RequestMapping("insert.co")
	public void insertCommunity(Community c, MultipartFile upfile) {
		// 전달된 파일이 있을 경우 => 파일명 수정 작업 후 서버에 업로드 => 파일원본명,실제서버에업로드된경로를 c 추가로 담기
		if(!upfile.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(session, upfile);
			
			c.setOriginName(upfile.getOriginalFilename());
			c.setChangeName("resources/uploadFiles/" + changeName); // 업로드된파일명+파일명
			
		}
		
		int result = cService.insertBoard(b); // servieImpl, dao, sql 작성
		
		System.out.println(result);
		
		// 성공했을 경우
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 게시글 작성되었습니다");
			return "redirect:community.main";
			
		}else {// 실패했을 경우 
			model.addAttribute("errorMsg", "게시글 작성 실패");
			return "common/errorPage";
		}
	}
	
	
	// 전달받은 첨부파일 수정명 작업해서 서버에 업로드 시키는 메소드
	public void saveFile() {
		
	
}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
