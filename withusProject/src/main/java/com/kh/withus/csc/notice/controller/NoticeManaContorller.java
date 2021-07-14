package com.kh.withus.csc.notice.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.common.template.pagination;
import com.kh.withus.csc.notice.model.service.NoticeService;
import com.kh.withus.csc.notice.model.vo.Notice;

public class NoticeManaContorller {

	@Autowired
	private NoticeService nService;
	
	/* 관리자 */	
	@RequestMapping("manaList.no")
	public ModelAndView selectListCount(@RequestParam(value="currentPage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = nService.selectListCount();
		PageInfo pi = pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Notice> list = nService.selectList(pi);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("admin/csc/notice/noticeManaListView");
		
		return mv;
	}
	
	@RequestMapping("manaEnrollForm.no")
	public String enrollForm() {
		return "admin/csc/notice/noticeManaEnrollForm";
	}
	
	@RequestMapping("manaInsert.no")
	public String insertNotice(Notice n, MultipartFile cscUpfile, HttpSession session, Model model) {
		
		if(!cscUpfile.getOriginalFilename().equals("")) {
			String changeName = saveFile(session, cscUpfile);
			
			n.setNoticeOriginname(cscUpfile.getOriginalFilename());
			n.setNoticeChangename("resources/cscUploadFile/" + changeName);
		}
		int result = nService.insertNotice(n);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "공지사항이 등록되었습니다.");
			return "redirect:manaList.no";
		}else {
			model.addAttribute("errorMsg", "공지사항이 등록되지않았습니다.");
			return "common/ManaErrorPage";
		}
		
	
		
	}
	
	private String saveFile(HttpSession session, MultipartFile cscUpfile) {
		String savePath = session.getServletContext().getRealPath("/resources/cscUpFiles/");
		
		String originName = cscUpfile.getOriginalFilename(); // 원본명("aaa.jpg")
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		try {
			cscUpfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;	
		}


	@RequestMapping("manaDetail.no")
	public String selectNotice(int nno, Model model) {
		int result = nService.increaseCount(nno);
		
		if(result > 0) {
			Notice n = nService.selectNotice(nno);
			model.addAttribute("n", n);
			return "admin/csc/notice/noticeManaDetailView";
		}else {
			model.addAttribute("errorMsg", "공지사항 상세조회를 실패했습니다.");
			return "common/manaErrorPage";
		}
	}
	
	@RequestMapping("manaDelete.no")
	public String deleteNotice(int nno, String filePath, HttpSession session, Model model) {
		
		int result = nService.deleteNotice(nno);
		
		if(result > 0) {
			if(!filePath.equals("")) {
				new File(session.getServletContext().getRealPath(filePath)).delete();
			}
			
			session.setAttribute("alertMsg", "공지사항이 성공적으로 삭제되었습니다.");
			return "redirect:manaList.no";
			
		} else {
			model.addAttribute("errorMsg", "공지사항 삭제를 실패했습니다.");
			return "common/manaErrorPage";
		}
	}
	
	@RequestMapping("manaUpdateForm.no")
	public String updateForm(int nno, Model model) {
		model.addAttribute("n", nService.selectNotice(nno));
		return "admin/csc/notice/noticeManaUpdateEnroll";
	}
	
	@RequestMapping("manaUpdate.no")
	public String updateNotice(Notice n, MultipartFile cscReUpfile, HttpSession session, Model model){
		
		if(!cscReUpfile.getOriginalFilename().equals("")) {
			String changeName = saveFile(session, cscReUpfile);
			n.setNoticeOriginname(cscReUpfile.getOriginalFilename());
			n.setNoticeChangename("resources/cscUploadFile/" + changeName);
		}
		int result = nService.updateNotice(n);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "공지사항이 수정되었습니다.");
			return "redirect:manaDetail.no?nno=" + n.getNoticeNo();
		}else {
			model.addAttribute("errorMsg", "공지사항이 수정되지않았습니다.");
			return "common/manaErrorPage";
		}
		
	}
	
}