package com.kh.withus.community.controller;

import java.io.File;
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

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.common.template.pagination;
import com.kh.withus.community.model.service.CommunityService;
import com.kh.withus.community.model.vo.Community;

import javafx.scene.control.Pagination;


@Controller
public class CommunityController {

	@Autowired
	private CommunityService cService;

	
	@RequestMapping("commu.main")
	public ModelAndView selectCommunityMain(@RequestParam(value="currentPage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = cService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Community> list = cService.selectList(pi);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("community/commuListView");
		
		return mv;
	}
	
	
	@RequestMapping("commu.detail")
	public String selectCommunity(int cno, Model model) {
		int result = cService.increaseCount(cno);  
		
		if(result > 0) {
			Community c = cService.selectCommunity(cno); 
			model.addAttribute("c", c);
			return "community/commuDetail";
			
		}else {
			model.addAttribute("errorMsg", "게시글 상세조회 실패");
			return "common/errorPage";      
		}
	}
	
	
	@RequestMapping("commu.enroll")
	public String commuEnroll() {
		return "community/commuEnrollForm";
	}
	
	
	@RequestMapping("insert.co")
	public String insertCommunity(Community c, MultipartFile upfile, HttpSession session, Model model) {
		// 전달된 파일이 있을 경우 => 파일명 수정 작업 후 서버에 업로드 => 파일원본명,실제서버에업로드된경로를 c 추가로 담기
		if(!upfile.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(session, upfile);
			
			c.setcommuOrigin(upfile.getOriginalFilename());
			c.setcommuChange("resources/uploadFiles/" + commuChange); // 업로드된파일명+파일명
			
		}
		
		int result = cService.insertCommunity(c); // servieImpl, dao, sql 작성
		
		System.out.println(result);
		
		// 성공했을 경우
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 게시글 작성되었습니다");
			return "redirect:commu.main";
			
		}else {// 실패했을 경우 
			model.addAttribute("errorMsg", "게시글 작성 실패");
			return "common/errorPage";
		}
	}
	
	
	
	@RequestMapping("delete.co")
	public String deleteCommunity(int cno, String filePath, 
							  HttpSession session, Model model) {
			// filePath : 첨부파일 존재했다면 "resources/uploadFiles/xxxxxx.pdf"
			// filePath : 첨부파일 존재안했다면 ""
		
		int result = cService.deleteCommunity(cno);
		
		if(result > 0) {
			
			// 첨부파일이 있었을 경우 => 서버에 업로드된 파일 찾아서 삭제 
			if(!filePath.equals("")) {
				new File(session.getServletContext().getRealPath(filePath)).delete();
			}
			
			session.setAttribute("alertMsg", "성공적으로 게시글이 삭제되었습니다.");
			return "redirect:commu.main";
			
		}else {
			
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			return "common/errorPage";
			
		}
	}
	
	@RequestMapping("updateForm.co")
	public String updateForm(int cno, Model model) {
		model.addAttribute("c", cService.selectCommunity(cno));
		return "community/commuUpdateForm";
	}
	
	@RequestMapping("update.co")
	public String updateCommunity(Community c, MultipartFile reupfile, HttpSession session, Model model) {
		
		if(!reupfile.getOriginalFilename().equals("")) { // 새로 넘어온 첨부파일이 있을 경우
			// 새로 넘어온 첨부파일있는데 기존의 첨부파일이 있었을 경우 => 서버에 업로드 되어있는 기존의 파일 찾아서 지울꺼임
			if(c.getCommuChange() != null) {
				new File(session.getServletContext().getRealPath(c.getCommuChange())).delete();
			}
			
			// 그리고 새로 넘어온 첨부파일 서버에 업로드 시킴
			String commuChange = saveFile(session, reupfile);
			c.setCommuOrigin(reupfile.getOriginalFilename());
			c.setCommuChange("resources/uploadFiles/" + CommuChange);
		}
		
		int result = cService.updateCommunity(c);
		
		if(result > 0) { 
			session.setAttribute("alertMsg", "게시글이 성공적으로 수정되었습니다");
			return "redirect:commu.detail?cno=" + c.getCommuNo();
		}else { // 실패 => 에러문구 담아서 => 에러페이지 포워딩
			model.addAttribute("errorMsg", "게시글 수정 실패");
			return "common/errorPage";
		}
		
		
	}
	
	
	// 전달받은 첨부파일 수정명 작업해서 서버에 업로드 시킨 후 해당 수정된파일명(서버에 업로된파일명)을 반환하는 메소드
		public String saveFile(HttpSession session, MultipartFile upfile) {
			
			String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
			
			String commuOrigin = upfile.getOriginalFilename();  // 원본명 ("aaa.jpg")
			
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			int ranNum = (int)(Math.random() * 900000 + 10000);
			String ext = commuOrigin.substring(commuOrigin.lastIndexOf("."));
			
			String commuChange = currentTime + ranNum + ext;
			
			try {
				upfile.transferTo(new File(savePath + commuChange));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			return commuChange;
			
		}
		
		/*
		@ResponseBody
		@RequestMapping(value="rlist.co", produces="application/json; charset=utf-8")
		public String ajaxSelectCommuReplyList(int cno) {
			return new Gson().toJson(cService.selectCommuReplyList(cno));
		}
		
		@ResponseBody
		@RequestMapping("rinsert.co")
		public String ajaxInsertCommuReply(CommuReply cr) {
			int result = cService.insertCommuReply(cr);
			if(result > 0) {
				return "success";
			}else {
				return "fail";
			}
		}
		*/
	
	
	
	
	
	
	
	
	
	
	
}
