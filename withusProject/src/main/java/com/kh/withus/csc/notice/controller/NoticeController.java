package com.kh.withus.csc.notice.controller;

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

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.common.template.pagination;
import com.kh.withus.csc.notice.model.service.NoticeService;
import com.kh.withus.csc.notice.model.vo.Notice;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService nService;
	
	/* 사용자 */ 
	@RequestMapping("list.no")
	public ModelAndView selectListCount(@RequestParam(value="currentPage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = nService.selectListCount();
		PageInfo pi = pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Notice> list = nService.selectList(pi);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("csc/noticeListView");
		
		return mv;
	}
	
	// 관리자(user01@withus.com) 일때만 보이는 버튼
	@RequestMapping("enrollForm.no")
	public String enrollForm() {
		return "csc/noticeEnrollForm";
	}
	
	// 관리자(user01@withus.com) 일때만 보이는 버튼
	@RequestMapping("insert.no")
	public String insertNotice(Notice n, MultipartFile cscUpfile, HttpSession session, Model model) {
		
		if(!cscUpfile.getOriginalFilename().equals("")) {
			String changeName = saveFile(session, cscUpfile);
			
			n.setNoticeOriginname(cscUpfile.getOriginalFilename());
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


	@RequestMapping("detail.no")
	public String selectNotice(int nno, Model model) {
		int result = nService.increaseCount(nno);
		
		if(result > 0) {
			Notice n = nService.selectNotice(nno);
			model.addAttribute("n", n);
			return "csc/noticeDetailView";
		}else {
			model.addAttribute("errorMsg", "공지사항 상세조회를 실패했습니다.");
			return "common/errorPage";
		}
	}
	
	// 관리자(user01@withus.com) 일때만 보이는 버튼
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
	
	@RequestMapping("updateForm.no")
	public String updateForm(int nno, Model model) {
		model.addAttribute("n", nService.selectNotice(nno));
		return "csc/noticeUpdateEnroll";
	}
	
	@RequestMapping("update.no")
	public String updateNotice(Notice n, MultipartFile cscReUpfile, HttpSession session, Model model){
		
		if(!cscReUpfile.getOriginalFilename().equals("")) {
			String changeName = saveFile(session, cscReUpfile);
			n.setNoticeOriginname(cscReUpfile.getOriginalFilename());
			n.setNoticeChangename("resources/cscUploadFile/" + changeName);
		}
		int result = nService.updateNotice(n);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "공지사항이 수정되었습니다.");
			return "redirect:detail.no?nno=" + n.getNoticeNo();
		}else {
			model.addAttribute("errorMsg", "공지사항이 수정되지않았습니다.");
			return "common/errorPage";
		}
		
	}
	
	
	
	
	// -------------------------------------------------------------------------------------------
	
	
	
	
	
	/* 관리자 */
	// 공지사항 조회
	@RequestMapping("noticeList.mana")
	public ModelAndView selectManaListCount(@RequestParam(value="currentPage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = nService.selectManaListCount();
		PageInfo mpi = pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Notice> mlist = nService.selectManaList(mpi);
		
		mv.addObject("mpi", mpi).addObject("mlist", mlist).setViewName("admin/csc/notice/noticeManaListView");
		
		return mv;
	}
	
	
	
	// 공지사항 작성
	@RequestMapping("manaEnrollForm.no")
	public String ManaEnrollForm() {
		return "admin/csc/notice/noticeManaEnrollForm";
	}
	
	@RequestMapping("manaInsert.no")
	public String insertManaNotice(Notice nM, MultipartFile cscUpfileM, HttpSession sessionM, Model modelM) {
		
		if(!cscUpfileM.getOriginalFilename().equals("")) {
			String changeName = saveFile(sessionM, cscUpfileM);
			
			nM.setNoticeOriginname(cscUpfileM.getOriginalFilename());
			nM.setNoticeChangename("resources/cscUploadFile/" + changeName);
		}
		int result = nService.insertNotice(nM);
		
		if(result > 0) {
			sessionM.setAttribute("alertMsg", "공지사항이 등록되었습니다.");
			return "redirect:noticeList.mana";
		}else {
			modelM.addAttribute("errorMsg", "공지사항이 등록되지않았습니다.");
			return "common/manaErrorPage";
		}
	
	}
	
	
	// 공지사항 상세조회
	@RequestMapping("manaDetail.no")
	public String selectManaNotice(int nnoM, Model modelM) {
		int result = nService.increaseCount(nnoM);
		
		System.out.println(nnoM);
		
		if(result > 0) {
			Notice nM = nService.selectNotice(nnoM);
			modelM.addAttribute("nM", nM);
			return "admin/csc/notice/noticeManaDetailView";
		}else {
			modelM.addAttribute("errorMsg", "공지사항 상세조회를 실패했습니다.");
			return "common/manaErrorPage";
		}
	}
	
	
	// 공지사항 등록
	@RequestMapping("manaUpdateForm.no")
	public String updateManaForm(int nnoM, Model modelM) {
		modelM.addAttribute("nM", nService.selectNotice(nnoM));
		return "admin/csc/notice/noticeManaUpdateEnroll";
	}
	
	@RequestMapping("manaUpdate.no")
	public String updateManaNotice(Notice nM, MultipartFile cscReUpfileM, HttpSession sessionM, Model modelM){
		
		if(!cscReUpfileM.getOriginalFilename().equals("")) {
			String changeName = saveFile(sessionM, cscReUpfileM);
			nM.setNoticeOriginname(cscReUpfileM.getOriginalFilename());
			nM.setNoticeChangename("resources/cscUploadFile/" + changeName);
		}
		int result = nService.updateNotice(nM);
		
		if(result > 0) {
			sessionM.setAttribute("alertMsg", "공지사항이 수정되었습니다.");
			return "redirect:detail.no?nnoM=" + nM.getNoticeNo();
		}else {
			modelM.addAttribute("errorMsg", "공지사항이 수정되지않았습니다.");
			return "common/manaErrorPage";
		}
		
	}
	
	@RequestMapping("manaDelete.no")
	public String deleteManaNotice(int nnoM, String filePath, HttpSession sessionM, Model modelM) {
		
		int result = nService.deleteNotice(nnoM);
		
		if(result > 0) {
			if(!filePath.equals("")) {
				new File(sessionM.getServletContext().getRealPath(filePath)).delete();
			}
			
			sessionM.setAttribute("alertMsg", "공지사항이 성공적으로 삭제되었습니다.");
			return "redirect:noticeList.mana";
			
		} else {
			modelM.addAttribute("errorMsg", "공지사항 삭제를 실패했습니다.");
			return "common/manaErrorPage";
		}
	}
	
	

}
