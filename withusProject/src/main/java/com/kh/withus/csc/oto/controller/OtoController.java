package com.kh.withus.csc.oto.controller;

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
import com.kh.withus.csc.oto.model.service.OtoService;
import com.kh.withus.csc.oto.model.vo.Oto;

@Controller
public class OtoController {

	// 6/27 윤경 생성
	@Autowired
	private OtoService oService;
	
	@RequestMapping("list.oto")
	public ModelAndView selectOtoList(@RequestParam (value="currentPage", defaultValue="1")int currentPage, ModelAndView mv) {
		
		int listCount = oService.selectListCount();
		PageInfo pi = pagination.getPageInfo(listCount, currentPage, 10, 5, null);
		
		ArrayList<Oto> list = oService.selectList(pi);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("csc/otoListView");
		
		return mv;
	}
	
	@RequestMapping("enrollForm.oto")
	public String enrollForm() {
		return "csc/otoEnrollForm";
	}
	
	@RequestMapping("insert.oto")
	public String insertOto(Oto o, MultipartFile cscUpfile, HttpSession session, Model model) {
		
		if(!cscUpfile.getOriginalFilename().equals("")) {
			String changeName = saveFile(session, cscUpfile);
			
			o.setOtoOriginname(cscUpfile.getOriginalFilename());
			o.setOtoChangename("resources/cscUploadFile/" + changeName);
		}
		
		int result = oService.insertOto(o);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "1:1문의가 등록되었습니다.");
			return "redirect:list.oto";
		}else {
			model.addAttribute("errorMsg", "1:1문의가 등록되지않았습니다.");
			return "common/errorPage";
		}
	}
	
	private String saveFile(HttpSession session, MultipartFile upfile) {
		String savePath = session.getServletContext().getRealPath("/resources/cscUpFiles/");
		
		String originName = upfile.getOriginalFilename(); // 원본명("aaa.jpg")
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;	
		}


	@RequestMapping("detail.oto")
	public String selectOto(int ono, Model model) {
		int result = oService.increaseCount(ono);
		
		if(result > 0) {
			Oto o = oService.selectOto(ono);
			model.addAttribute("o", o);
			return "csc/otoDetailView";
		}else {
			model.addAttribute("errorMsg", "문의하기 조회를 실패했습니다.");
			return "common/errorPage";
		}
	}
	
	@RequestMapping("delete.oto")
	public String deleteOto(int ono, String filePath, HttpSession session, Model model) {
		int result = oService.deleteOto(ono);
		
		if(result > 0) {
			if(!filePath.contentEquals("")) {
				new File(session.getServletContext().getRealPath(filePath)).delete();
			}
			
			session.setAttribute("alertMsg", "성공적으로 삭제되었습니다.");
			return "redirect:list.oto";
		}else {
			model.addAttribute("errorMsg", "삭제를 실패했습니다.");
			return "common/errorPage";
		}
	}
	
}
