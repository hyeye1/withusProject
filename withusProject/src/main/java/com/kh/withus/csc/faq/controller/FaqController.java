package com.kh.withus.csc.faq.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.withus.csc.faq.model.service.FaqService;
import com.kh.withus.csc.faq.model.vo.Faq;

@Controller
public class FaqController {
	
	@Autowired
	private FaqService fService;
	
	/* 사용자페이지 */
	// faq 조회
	@RequestMapping("list.faq")
	public String selectList(Model model) {
		ArrayList<Faq> list = fService.selectList();
		model.addAttribute("list", list);
		return "csc/faqListView";
	}

	
	// faq 추가
	@RequestMapping("enrollForm.faq")
	public String enrollForm() {
		return "csc/faqEnrollForm";
	}
	
	@RequestMapping("insert.faq")
	public String insertFaq(Faq f, HttpSession session, Model model) {
		System.out.println(f);
		int result = fService.insertFaq(f);
		if(result > 0) {
			session.setAttribute("alertMsg", "faq가 등록되었습니다.");
			return "redirect:list.faq";
		}else {
			model.addAttribute("errorMsg", "faq가 등록되지않았습니다.");
			return "common/errorPage";
		}
	}
	
	
	// faq 수정
	@RequestMapping("updateForm.faq")
	public String updateForm(int faqNo, Model model) {
		model.addAttribute("f", fService.selectFaq(faqNo));
		return "csc/faqUpdateEnroll";
	}
	
	@RequestMapping("update.faq")
	public String updateFaq(Faq f, HttpSession session, Model model) {
		System.out.println(f);
		
		int result = fService.updateFaq(f);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "faq가 수정되었습니다.");
			return "redirect:list.faq";
		}else {
			model.addAttribute("errorMsg", "faq가 수정되지않았습니다.");
			return "common/errorPage";
		}
	}
	
	
	// faq 삭제
	@RequestMapping("delete.faq")
	public String deleteFaq(int fno, HttpSession session, Model model) {
		
		int result = fService.deleteFaq(fno);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 삭제되었습니다.");
			return "redirect:list.faq";
		}else {
			model.addAttribute("errorMsg", "삭제 실패되었습니다.");
			return "common/errorPage";
		}
	}
	
	
	// faq 카테고리별 버튼
	@RequestMapping("funding.faq")
	public String selectFunding(Model model) {
		ArrayList<Faq> list = fService.selectFunding();
		model.addAttribute("list", list);
		return "csc/faqListView";
	}
	
	@RequestMapping("delivery.faq")
	public String selectDelivery(Model model) {
		ArrayList<Faq> list = fService.selectDelivery();
		model.addAttribute("list", list);
		return "csc/faqListView";
	}
	
	@RequestMapping("exchange.faq")
	public String selectExchange(Model model) {
		ArrayList<Faq> list = fService.selectExchange();
		model.addAttribute("list", list);
		return "csc/faqListView";
	}
	
	@RequestMapping("etc.faq")
	public String selectEtc(Model model) {
		ArrayList<Faq> list = fService.selectEtc();
		model.addAttribute("list", list);
		return "csc/faqListView";
	}

	
	// ------------------------------------------------------------
	
	
	/* 관리자페이지 
		// faq 조회
		@RequestMapping("faqList.mana")
		public String selectManaList(Model modelM) {
			ArrayList<Faq> listM = fService.selectManaList();
			modelM.addAttribute("listM", listM);
			return "admin/csc/faq/faqManaListView";
		}

		
		// faq 추가
		@RequestMapping("manaEnrollForm.faq")
		public String manaEnrollForm() {
			return "admin/csc/faq/faqManaEnrollForm";
		}
		
		@RequestMapping("manaInsert.faq")
		public String insertManaFaq(Faq fM, HttpSession sessionM, Model modelM) {

			int resultM = fService.insertManaFaq(fM);
			if(resultM > 0) {
				sessionM.setAttribute("alertMsg", "faq가 등록되었습니다.");
				return "redirect:faqList.mana";
			}else {
				modelM.addAttribute("errorMsg", "faq가 등록되지않았습니다.");
				return "common/manaErrorPage";
			}
		}
		
		
		// faq 수정
		@RequestMapping("manaUpdateForm.faq")
		public String updateManaForm(int fnoM, Model modelM) {
			modelM.addAttribute("fM", fService.selectManaFaq(fnoM));
			return "csc/faqUpdateEnroll";
		}
		
		@RequestMapping("manaUpdate.faq")
		public String updateManaFaq(Faq fM, HttpSession sessionM, Model modelM) {
			int result = fService.updateFaq(fM);
			
			if(result > 0) {
				sessionM.setAttribute("alertMsg", "faq가 수정되었습니다.");
				return "redirect:faqList.mana?fno=" + fM.getFaqNo();
			}else {
				modelM.addAttribute("errorMsg", "faq가 수정되지않았습니다.");
				return "common/manaErrorPage";
			}
		}
		
		
		// faq 삭제
		@RequestMapping("delete.faq")
		public String deleteManaFaq(int fnoM, HttpSession sessionM, Model modelM) {
			
			int resultM = fService.deleteFaq(fnoM);
			
			if(resultM > 0) {
				sessionM.setAttribute("alertMsg", "성공적으로 삭제되었습니다.");
				return "redirect:faqList.mana";
			}else {
				modelM.addAttribute("errorMsg", "삭제 실패되었습니다.");
				return "common/manaErrorPage";
			}
		}
		
		
		// faq 카테고리별 버튼
		@RequestMapping("manaFunding.faq")
		public String selectManaFunding(Model model) {
			ArrayList<Faq> list = fService.selectManaFunding();
			model.addAttribute("list", list);
			return "admin/csc/faq/faqManaListView";
		}
		
		@RequestMapping("manaDelivery.faq")
		public String selectManaDelivery(Model model) {
			ArrayList<Faq> list = fService.selectManaDelivery();
			model.addAttribute("list", list);
			return "admin/csc/faq/faqManaListView";
		}
		
		@RequestMapping("manaExchange.faq")
		public String selectManaExchange(Model model) {
			ArrayList<Faq> list = fService.selectManaExchange();
			model.addAttribute("list", list);
			return "admin/csc/faq/faqManaListView";
		}
		
		@RequestMapping("manaEtc.faq")
		public String selectManaEtc(Model model) {
			ArrayList<Faq> list = fService.selectManaEtc();
			model.addAttribute("list", list);
			return "admin/csc/faq/faqManaListView";
		}
		
		*/
	
	
}
