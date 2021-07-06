package com.kh.withus.csc.notice.controller;

import java.io.File;
import java.util.ArrayList;

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
import com.kh.withus.csc.notice.model.service.NoticeService;
import com.kh.withus.csc.notice.model.vo.Notice;

@Controller
public class NoticeController {
	
	// 6/25  윤경 생성
	@Autowired
	private NoticeService nService;
	
	@RequestMapping("list.no")
	public ModelAndView selectListCount(@RequestParam(value="currentPage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = nService.selectListCount();
		PageInfo pi = pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Notice> list = nService.selectList(pi);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("csc/noticeListView");
		
		return mv;
	}
	
	/*
	@RequestMapping("enrollForm.no")
	public String enrollForm() {
		return "notice/noticeEnrollForm";
	}
	
	@RequestMapping("insert.bo")
	public String insertNotice(Notice n, MultipartFile upfile, HttpSession session, Model model) {
		
		if(!upfile.getOriginalFilename().equals("")) {
			String changeName = saveFile(session, upfile);
			
			n.setNoticeOriginname(upfile.getOriginalFilename());
			n.setNoticeChangename("resources/cscUploadFile/" + changeName);
		}
		
		int result = nService.insertNotice(n);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "공지사항이 등록되었습니다.");
			return "redirect:list.no";
		}else {
			model.addAttribute("errorMsg", "공지사항이 등록되지않았습니다.");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("detail.no")
	public String selectNotice(int nno, Model model) {
		int result = nService.increaseCount(nno);
		
		if(result > 0) {
			Notice n = nService.selectNotice(nno);
			model.addAttribute("n", n);
			return "notice/noticeDetatilView";
		}else {
			model.addAttribute("errorMsg", "공지사항 상세조회를 실패했습니다.");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("delete.no")
	public String deleteNotice(int nno, String filePath, HttpSession session, Model model) {
		
		int result = nService.deleteNotice(nno);
		
		if(result > 0) {
			if(!filePath.equals("")) {
				new File(session.getServletContext().getRealPath(filePath)).delete();
			}
			
			session.setAttribute("alertMsg", "공지사항이 성공적으로 삭제되었습니다.");
			return "redirect:list.no";
			
		} else {
			model.addAttribute("errorMsg", "공지사항 삭제를 실패했습니다.");
			return "common/errorPage";
		}
	}
	*/
	
	/*
	@RequestMapping("updateForm.no")
	public String updateForm(int nno, Model model){
	}
	*/

}
