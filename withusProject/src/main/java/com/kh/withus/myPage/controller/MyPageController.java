package com.kh.withus.myPage.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.common.template.pagination;
import com.kh.withus.member.model.service.MemberService;
import com.kh.withus.member.model.vo.Member;
import com.kh.withus.myPage.model.service.MyPageService;
import com.kh.withus.myPage.model.vo.MyPage;





@Controller
public class MyPageController {
	
	@Autowired
	private MemberService mService;
	@Autowired
	private MyPageService mpService;
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	/*
	
	//임시 로그인/로그아웃 부분
	@RequestMapping("login.me")
	public ModelAndView loginMember(MyPage m, HttpSession session, ModelAndView mv) {
		
		
		
		MyPage loginUser = mService.loginMember(m);
		
		//System.out.println(loginUser.getMemberPwd());
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getMemberPwd(), loginUser.getMemberPwd())) {
			// 로그인 성공
			session.setAttribute("loginUser", loginUser);
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
	
	*/
	
	// 마이페이지메인
	@RequestMapping("myPage.me")
	public ModelAndView myPage(HttpSession session, ModelAndView mv) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		
		// 펀딩내역 수
		int fundingCount = mpService.myFundingListCount(loginUser.getMemberNo());
		
		// 좋아요리스트
		ArrayList<MyPage> mainLikeList = mpService.mainLikeList(loginUser.getMemberNo());
		Collections.shuffle(mainLikeList); // 섞기
		
		
		// 문의내역리스트
		ArrayList<MyPage> mainQueryList = mpService.mainQueryList(loginUser.getMemberNo());
		
		// 팔로우리스트
		ArrayList<MyPage> mainFollowList = mpService.mainFollowList(loginUser.getMemberNo());
		Collections.shuffle(mainFollowList); // 섞기
		
		
		
		mv.addObject("fundingCount", fundingCount)
		  .addObject("mainLikeList", mainLikeList)
		  .addObject("mainQueryList", mainQueryList)
		  .addObject("mainFollowList", mainFollowList)
		  .setViewName("myPage/main/myPageMain");
		
		return mv;
		
	
		
	}

	
	
	// 내정보 -> 비밀번호 확인창으로
	@RequestMapping("myInfo.me")
	public String myInfo() {
		return "myPage/info/pageMyInfoMain";
	}
	
	
	
	// 로그인된 유저 비밀번호 확인
	@RequestMapping("pwdConfirm.me")
	public String pwdConfirm(String memberPwd, HttpServletRequest request, HttpSession session) {
		
		
		// 비밀번호 암호화 전
		// 입력받은 비밀번호
		//String memberPwd = request.getParameter("memberPwd");
		
		// 로그인된 유저
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		/*
		if(bcryptPasswordEncoder.matches(m.getMemberPwd(), loginUser.getMemberPwd()))) {
			return "myPage/info/pageMyInfoDetail";
			
		}*/
		
		// 암호화후
		if(bcryptPasswordEncoder.matches(memberPwd, loginUser.getMemberPwd())) {
			return "myPage/info/pageMyInfoDetail";
		
		}else {
			session.setAttribute("alertMsg", "비밀번호가 틀립니다");
			return "myPage/info/pageMyInfoMain";
		}
				
		
		
		
	}
	
	
	
	
	// 기본정보수정
	@RequestMapping("update.me")
	public String updateMember(Member m, MyPage mp, MultipartFile file, HttpSession session, Model model, String deleteProfile) {
		
		
		// 기본이미지까지 지워버림 --> 경로가 기본이미지경로일때는 파일 삭제하지말기
		if(!file.getOriginalFilename().equals("")) { // 넘어오는값이 있을경우
			
			if(!mp.getMemberProfile().equals("resources/member_profile/profile_basic.jpg"))   { // 기본파일경로명이 아닐때는 그 파일 삭제
				
				new File(session.getServletContext().getRealPath(mp.getMemberProfile())).delete();
			} 
			
			
			// 새로운 파일 업로드
			String changeName = saveFile(session, file);
			mp.setMemberProfile("resources/member_profile/" + changeName); 
				
		}
		
		if(deleteProfile.equals("delete")) { // 기존파일을 삭제하고 기본이미지로 변경
			
			if(!mp.getMemberProfile().equals("resources/member_profile/profile_basic.jpg"))   { // 기본파일경로명이 아닐때는 그 파일 삭제
				
				new File(session.getServletContext().getRealPath(mp.getMemberProfile())).delete();
			} 
			
			mp.setMemberProfile("resources/member_profile/profile_basic.jpg");
		
		}		
		
		int result = mpService.updateMember(mp); 
		
		if(result > 0) { // 수정성공했을 경우
			
			session.setAttribute("alertMsg", "성공적으로 수정되었습니다.");
			session.setAttribute("loginUser", mService.loginMember(m));
			return "myPage/info/pageMyInfoDetail";
			
		}else {// 실패했을 경우 
			model.addAttribute("errorMsg", "정보 수정 실패");
			return "common/errorPage";
		}
		
		
	
	
	}
	
	
	// 비밀번호수정
	@RequestMapping("updatePwd")
	public String updatePwd(String newPwd, Member m, MyPage mp, HttpSession session, Model model) {
		
		System.out.println(m.getMemberNo());
		
		// 암호화 작업
		String encPwd = bcryptPasswordEncoder.encode(newPwd);
		//System.out.println("암호화 후 : " + encPwd); // 같은 평문을 입력해도 매번 다른 암호문이 나옴
		
		m.setMemberPwd(encPwd); // 암호문 변경
		
		int result = mpService.updatePwd(mp);
		
		if(result > 0) { // 성공 => 알람창 출력할 문구 담아서 => 메인페이지 (url재요청)
			session.setAttribute("alertMsg", "비밀번호가 변경되었습니다");
			session.setAttribute("loginUser", mService.loginMember(m));
			return "myPage/info/pageMyInfoDetail";
			
		}else { // 실패 => 에러문구 담아서 => 에러페이지로 포워딩
			model.addAttribute("errorMsg", "에러");
			return "common/errorPage";
		}
		
		
	}
	//회원탈퇴폼 페이지
	@RequestMapping("deleteForm.me")
	public String deleteForm(HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		session.setAttribute("loginUser", loginUser);
		
		return "myPage/info/memberDrop";
	}	
	
	

	// 회원탈퇴 유저 비밀번호 확인 ajax
	@ResponseBody
	@RequestMapping("pwd.me")
	public String pwd(String checkPwd, HttpSession session) {
			
			
		// 비밀번호 암호화 전
		// 입력받은 비밀번호
		
				
		// 로그인된 유저
		Member loginUser = (Member)session.getAttribute("loginUser");
				
		/* 암호화 전
		if(checkPwd.equals(loginUser.getMemberPwd())) {
			return "Y";
					
		}else {
			return "N";
		}
		*/
		
		if(bcryptPasswordEncoder.matches(checkPwd, loginUser.getMemberPwd())) {
			return "Y";
					
		}else {
			return "N";
		}
		
		
		
					
			
	}
	
	
	
	
	
	
	
	// 회원탈퇴
	@RequestMapping("delete.me")
	public String deleteMember(HttpSession session, Model model) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		int result = mpService.deleteMember(loginUser.getMemberId());
		
		if(result > 0) {
			session.removeAttribute("loginUser");
			session.setAttribute("alertMsg", "성공적으로 탈퇴되었습니다. 그동안 이용해주셔서 감사합니다.");
			
			// => 메인페이지
			return "redirect:/";
			
		}else { // => 에러페이지
			model.addAttribute("errorMsg", "회원탈퇴 실패");
			return "common/errorPage";
		}
		
		
	}
	
	
	//팔로잉 목록
	@RequestMapping("followlist.me")
	public ModelAndView followList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, ModelAndView mv, HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		
		int listCount = mpService.selectFollowListCount(loginUser.getMemberNo());
		
		PageInfo pi = pagination.getPageInfo(listCount, currentPage, 6, 5);
		//5개씩
		
		
		ArrayList<MyPage> list = mpService.selectFollowList(pi, loginUser.getMemberNo());
		
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("myPage/activity/pageFollowList");
		
		return mv;
		
		
	}
	
	
	// 팔로우 해제/재팔로우 ajax
	@ResponseBody
	@RequestMapping("unfollow.me")
	public String unfollowMember(String memberNo, String followMemberNo, HttpSession session) {
		
		
		MyPage m = new MyPage();
		m.setMemberNo(Integer.parseInt(memberNo));
		m.setFollowMemberNo(Integer.parseInt(followMemberNo));
		
		//System.out.println(memberNo);
		//System.out.println(followMemberNo);
		
		int result = mpService.unfollowMember(m);
				
		
		//System.out.println("언팔로우"+result);
		if(result>0) {
			return "Y";
					
		}else {
			return "N";
		}
					
			
	}
	
	// 팔로우 해제/재팔로우 ajax
	@ResponseBody
	@RequestMapping("follow.me")
	public String followMember(String memberNo, String followMemberNo, HttpSession session) {
		
		
		MyPage m = new MyPage();
		m.setMemberNo(Integer.parseInt(memberNo));
		m.setFollowMemberNo(Integer.parseInt(followMemberNo));
		
		int result = mpService.followMember(m);
				
		if(result>0) {
			return "Y";
					
		}else {
			return "N";
		}
					
			
	}
	
	// 팔로우 수 세기 
	@ResponseBody
	@RequestMapping("followerCount.me")
	public String followMember(int followMemberNo, HttpSession session) {
		
		//System.out.println(followMemberNo);
		
		int followerCount = mpService.followerCount(followMemberNo);
				
		//System.out.println(followerCount);
		
		String count =  Integer.toString(followerCount); // 문자열만 넘어가서 변환해줌..
		
		return count; // 해당 파트너의 팔로우수
					
		
			
	}	
	
	
	
	// 파트너 디테일
	@RequestMapping("partnerDetail.me")
	public String partnerDetail(@RequestParam(value="currentPage", defaultValue="1") int currentPage, MyPage m, HttpSession session, Model model) {
		
		//로그인한 유저의 멤버넘버로 해당 파트너 팔로우 유무체크
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		if(loginUser !=null) { // 로그인 상태일 때
			
			// 팔로우멤버번호 거꾸로 집어넣기 
			m.setFollowMemberNo(loginUser.getMemberNo());
			
			// 로그인한 멤버가 해당 파트너를 팔로우할경우 result 1로 반환 (또는 더 크게 DB에 중복삽입됬을경우)
			int result = mpService.followCheck(m);
			
			// 파트너정보
			MyPage member = mpService.partnerDetail(m);
			
			
			// 파트너의 오픈펀딩수
			int fundingCount = mpService.fundingCount(m);
			
			PageInfo pi = pagination.getPageInfo(fundingCount, currentPage, 5, 3);
			//3개씩
			
			// 펀딩리스트
			ArrayList<MyPage> fundingList = mpService.fundingList(pi, m);

			
			
			
			
			
			if(member != null) {
				
				session.setAttribute("result", result);
				session.setAttribute("m", member);
				//session.setAttribute("followerCount", followerCount);
				session.setAttribute("fundingCount", fundingCount);
				session.setAttribute("pi", pi);
				session.setAttribute("fundingList", fundingList);
				return "myPage/activity/partnerDetail";
				
			}else { // => 에러페이지
				model.addAttribute("errorMsg", "에러가발생했습니다");
				return "common/errorPage";
			}
		
		
		
		} else { // 로그인상태가 아닐때
			
			// 파트너정보
			MyPage member = mpService.partnerDetail(m);
			
			
			// 파트너의 오픈펀딩수
			int fundingCount = mpService.fundingCount(m);
			
			PageInfo pi = pagination.getPageInfo(fundingCount, currentPage, 5, 3);
			//3개씩
			
			// 펀딩 리스트
			ArrayList<MyPage> fundingList = mpService.fundingList(pi, m);			

			
			if(member != null) {
				session.setAttribute("m", member);
				//session.setAttribute("followerCount", followerCount);
				session.setAttribute("fundingCount", fundingCount);
				session.setAttribute("pi", pi);
				session.setAttribute("fundingList", fundingList);
				return "myPage/activity/partnerDetail";
				
			}else { // => 에러페이지
				model.addAttribute("errorMsg", "에러가발생했습니다");
				return "common/errorPage";
			}
			
		}
		
		
		
	}
	
	
	
	
	
	
	
	// 전달받은 첨부파일 수정명 작업해서 서버에 업로드 시킨 후 해당 수정된파일명(서버에 업로된파일명)을 반환
	// 프로필사진
	public String saveFile(HttpSession session, MultipartFile file) {
		
		String savePath = session.getServletContext().getRealPath("/resources/member_profile/");
		
		String originName = file.getOriginalFilename();  // 원본명 ("aaa.jpg")
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 900000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		try {
			file.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
		
	}
	
	//나의문의내역 리스트
	@RequestMapping("myQuery.me")
	public ModelAndView myQuery(@RequestParam(value="currentPage", defaultValue="1") int currentPage, ModelAndView mv, HttpSession session) {
		
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		
		int listCount = mpService.myQueryListCount(loginUser.getMemberNo());
		
		PageInfo pi = pagination.getPageInfo(listCount, currentPage, 5, 6);
		//6개씩
		
		
		ArrayList<MyPage> list = mpService.myQueryList(pi, loginUser.getMemberNo());
		
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("myPage/activity/pageMyQueryList");
		
		return mv;
		
	}
	
	
	//문의내역 상세
	@RequestMapping("myQueryDetail")
	public String myQueryDetail(HttpSession session, Model model, int otoNo) {
		
		
		
		MyPage m = mpService.myQueryDetail(otoNo);
		
		
		
		if(m != null) {
			
			session.setAttribute("detail", m);
			return "myPage/activity/pageMyQueryDetail";
			
		}else {
			
			model.addAttribute("errorMsg", "오류발생");
			return "common/errorPage";
			
		}
		
	}
	
	//문의내역 삭제
	@RequestMapping("deleteQuery.me")
	public String deleteQuery(HttpSession session, Model model, int otoNo) {
		
		
		System.out.println(otoNo);
		
		int result = mpService.deleteQuery(otoNo);
		
		
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "문의가 삭제되었습니다");
			return "redirect:myQuery.me";
					
		}else {
			
			model.addAttribute("errorMsg", "오류발생");
			return "common/errorPage";
			
		}
		
	}	
	
	
	
	
	
	
	
	
	
	// 좋아요
	@RequestMapping("like.me")
	public ModelAndView like(@RequestParam(value="currentPage", defaultValue="1") int currentPage, ModelAndView mv, HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		
		int listCount = mpService.likeListCount(loginUser.getMemberNo());
		
		PageInfo pi = pagination.getPageInfo(listCount, currentPage, 5, 6);
		//6개씩
		
		
		ArrayList<MyPage> likeList = mpService.likeList(pi, loginUser.getMemberNo());
		
		
		mv.addObject("pi", pi)
		  .addObject("likeList", likeList)
		  .setViewName("myPage/activity/pageLike");
		
		return mv;
		
	}
	
	
	//나의펀딩내역 리스트
	@RequestMapping("myFunding.me")
	public ModelAndView myFunding(@RequestParam(value="currentPage", defaultValue="1") int currentPage, ModelAndView mv, HttpSession session) {
		
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		
		int listCount = mpService.myFundingListCount(loginUser.getMemberNo());
		
		PageInfo pi = pagination.getPageInfo(listCount, currentPage, 5, 6);
		//6개씩
		
		
		ArrayList<MyPage> list = mpService.myFundingList(pi, loginUser.getMemberNo());
		
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("myPage/activity/pageMyFundingList");
		
		return mv;
		
	}
	
	
	
	@RequestMapping("myFundingDetail.me")
	public ModelAndView myFundingDetail(MyPage m, HttpSession session, ModelAndView mv){
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		m.setMemberNo(loginUser.getMemberNo());
		
		// 주문내역 리스트
		MyPage orderList = mpService.myFundingDetail(m);
		
		
		// 리워드별 총금액 : 각각 리워드금액*갯수
		int rewardTotal = orderList.getRewardPrice()*orderList.getOrderCount(); 
		int rewardPlus = orderList.getOrderPlus();
		int totalPrice = rewardTotal+rewardPlus;
		
		
		
		mv.addObject("orderList", orderList)
		  .addObject("rewardTotal", rewardTotal)
		  .addObject("totalPrice", totalPrice)
		  .setViewName("myPage/activity/pageMyFundingDetail");
		
		return mv;
		
	}
	
	
	
	// 주문정보 수정
	@RequestMapping("updateOrder.me")
	public String updateOrder(MyPage m, HttpSession session, Model model) {
		
		// 주문번호,  수취인명, 핸드폰번호, 우편번호, 일반 주소, 상세주소
		int result = mpService.updateOrder(m); 
		
		
		
		// 수정성공했을 경우
		if(result > 0) {
			
			session.setAttribute("alertMsg", "배송정보가 수정되었습니다.");
			return "redirect:myFundingDetail.me?orderNo=" + m.getOrderNo();
			
		}else {// 실패했을 경우 
			model.addAttribute("errorMsg", "정보 수정 실패");
			return "common/errorPage";
		}
	}
	
	// 환불신청
	// 첨부파일
	@RequestMapping("refundRequest.me")
	public String refundRequest(MyPage m, MultipartFile file, HttpSession session, Model model) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		m.setMemberNo(loginUser.getMemberNo());
		
		System.out.println(m.getBankAccount() + m.getBankName());
		
		

		
		if(!file.getOriginalFilename().equals("")) { // 넘어오는값이 있을경우
			
			// 파일 업로드
			String changeName = refundFile(session, file);
			m.setRChangeName("resources/refund_files/" + changeName); 
				
		}
		
		//환불신청테이블에 인서트
		int result = mpService.refundRequest(m); 
		
		// 신청성공했을 경우
		if(result > 0 ) {
			
			
			
			//주문상태 '환불신청중'으로 업데이트 + 환불은행정보
			int update = mpService.orderStatusUpdate(m); 
			
			if(update>0) {
				
				session.setAttribute("alertMsg", "펀딩금 반환이 신청되었습니다");
				return "redirect:myFundingDetail.me?orderNo=" + m.getOrderNo();
				
			} else {
				
				model.addAttribute("errorMsg", "오류가 발생했습니다");
				return "common/errorPage";
				
			}
			
			
			
			
		}else {// 실패했을 경우 
			model.addAttribute("errorMsg", "오류가 발생했습니다");
			return "common/errorPage";
		}
		
	}
	
	 //환불신청 파일
	 public String refundFile(HttpSession session, MultipartFile file) {
		
		String savePath = session.getServletContext().getRealPath("/resources/refund_files/");
		
		String originName = file.getOriginalFilename();  // 원본명 ("aaa.jpg")
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 900000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		try {
			file.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
		
	}
	
	
	
	
	//-파트너----------------------------------------------------------------------//
	
	// 펀딩스튜디오메인
	@RequestMapping("fundingMain.me")
	public String fundingMain(@RequestParam(value="currentPage", defaultValue="1") int currentPage, MyPage m, HttpSession session, Model model) {
		
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		m.setMemberNo(loginUser.getMemberNo());
		
		
		
		// 파트너의 펀딩 정보들
		// 파트너의 펀딩수(상태 전부)
		int fundingCount = mpService.partnerfundingCount(m);
		
		PageInfo pi = pagination.getPageInfo(fundingCount, currentPage, 5, 6);
		//6개씩
		
		ArrayList<MyPage> fundingList = mpService.partnerfundingList(pi, m);
		Collections.shuffle(fundingList); // 섞기
		
		session.setAttribute("loginUser", loginUser);
		session.setAttribute("fundingCount", fundingCount);
		session.setAttribute("fundingList", fundingList);
		
		return "myPage/partner/pageMyFundingMain";
		
		
		// 귀찮아서 페이징 그대로씀
		
		
		
	}
	
	// 나의펀딩
	@RequestMapping("partnerFunding.me")
	public String partnerFunding(@RequestParam(value="currentPage", defaultValue="1") int currentPage, MyPage m, HttpSession session, Model model) {
		
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		m.setMemberNo(loginUser.getMemberNo());
		
		
		
		
		// 파트너의 팔로워수
		int followMemberNo = m.getMemberNo();
		int followerCount = mpService.followerCount(followMemberNo);
		
		// 파트너의 펀딩 정보들
		// 파트너의 펀딩수(상태 전부)
		int fundingCount = mpService.partnerfundingCount(m);
		
		PageInfo pi = pagination.getPageInfo(fundingCount, currentPage, 5, 6);
		//6개씩
		
		ArrayList<MyPage> fundingList = mpService.partnerfundingList(pi, m);			

		
		if(m != null) {
			session.setAttribute("m", m);
			session.setAttribute("followerCount", followerCount);
			session.setAttribute("fundingCount", fundingCount);
			session.setAttribute("pi", pi);
			session.setAttribute("fundingList", fundingList);
			return "myPage/partner/pagePartnerFunding";
			
		}else { // => 에러페이지
			model.addAttribute("errorMsg", "에러가발생했습니다");
			return "common/errorPage";
		}
			
		
		// 파트너 조인 'N'일경우 인터셉터에서 처리
		
			
	}
	
	// 파트너 정보 페이지
	@RequestMapping("partnerInfo.me")
	public String partnerInfo(HttpSession session, Model model) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		session.setAttribute("loginUser", loginUser);
		return "myPage/partner/pagePartnerInfo";	
		
			
	}
	
	
	
	// 파트너정보수정
	@RequestMapping("partnerUpdate.me")
	public String updatePartner(MyPage mp, MultipartFile file, HttpSession session, Model model, String deleteProfile, Member m) {
		
		
		// 기본이미지까지 지워버림 --> 경로가 기본이미지경로일때는 파일 삭제하지말기
		if(!file.getOriginalFilename().equals("")) { // 넘어오는값이 있을경우
			
			if(!mp.getMemberProfile().equals("resources/member_profile/profile_basic.jpg"))   { // 기본파일경로명이 아닐때는 그 파일 삭제
				
				new File(session.getServletContext().getRealPath(mp.getMemberProfile())).delete();
			} 
			
			
			// 새로운 파일 업로드
			String changeName = saveFile(session, file);
			mp.setMemberProfile("resources/member_profile/" + changeName); 
				
		}
		
		if(deleteProfile.equals("delete")) { // 기존파일을 삭제하고 기본이미지로 변경
			
			if(!mp.getMemberProfile().equals("resources/member_profile/profile_basic.jpg"))   { // 기본파일경로명이 아닐때는 그 파일 삭제
				
				new File(session.getServletContext().getRealPath(mp.getMemberProfile())).delete();
			} 
			
			mp.setMemberProfile("resources/member_profile/profile_basic.jpg");
		
		}				
		
		int result = mpService.updateMember(mp); 
		
		if(result > 0) { // 수정성공했을 경우
			
			session.setAttribute("alertMsg", "성공적으로 수정되었습니다.");
			session.setAttribute("loginUser", mService.loginMember(m));
			return "myPage/partner/pagePartnerInfo";
			
		}else {// 실패했을 경우 
			model.addAttribute("errorMsg", "정보 수정 실패");
			return "common/errorPage";
		}
		
		
	
	
	}
		
		
	// 파트너조인 폼
	@RequestMapping("partnerJoinForm.me")
	public String partnerJoinForm(HttpSession session, Model model) {
		
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		
		if(loginUser.getPartnerJoin().equals("Y")) {
			
			session.setAttribute("alertMsg", "파트너님 안녕하세요");
			return "myPage/partner/pageMyFundingMain";
			
		} else {
			
			session.setAttribute("loginUser", loginUser);
			return "myPage/partner/partnerJoinForm";
		}
		
		
		
		
		
	}
	
	// 파트너조인
	@RequestMapping("partnerJoin.me")
	public String partnerJoinForm(MyPage mp, MultipartFile file, HttpSession session, Model model, String deleteProfile, Member m) {
		
		if(!file.getOriginalFilename().equals("")) { // 넘어오는값이 있을경우
			
			if(!mp.getMemberProfile().equals("resources/member_profile/profile_basic.jpg"))   { // 기본파일경로명이 아닐때는 그 파일 삭제
				
				new File(session.getServletContext().getRealPath(mp.getMemberProfile())).delete();
			} 
			
			
			// 새로운 파일 업로드
			String changeName = saveFile(session, file);
			mp.setMemberProfile("resources/member_profile/" + changeName); 
				
		}
		
		if(deleteProfile.equals("delete")) { // 기존파일을 삭제하고 기본이미지로 변경
			
			if(!mp.getMemberProfile().equals("resources/member_profile/profile_basic.jpg"))   { // 기본파일경로명이 아닐때는 그 파일 삭제
				
				new File(session.getServletContext().getRealPath(mp.getMemberProfile())).delete();
			} 
			
			mp.setMemberProfile("resources/member_profile/profile_basic.jpg");
		
		}
		
		int result = mpService.partnerJoin(mp); 
		
		if(result > 0) { // 수정성공했을 경우
			
			session.setAttribute("alertMsg", "파트너 등록이 완료되었습니다.");
			session.setAttribute("loginUser", mService.loginMember(m));
			return "myPage/partner/pageMyFundingMain";
			
		}else {// 실패했을 경우 
			model.addAttribute("errorMsg", "에러발생");
			return "common/errorPage";
		}
		
		
	}	
		
	
	
}
