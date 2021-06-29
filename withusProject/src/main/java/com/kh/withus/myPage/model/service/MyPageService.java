package com.kh.withus.myPage.model.service;

import java.util.ArrayList;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.member.model.vo.Member;
import com.kh.withus.myPage.model.vo.MyPage;


public interface MyPageService {
	
	// 임시 로그인 서비스
	MyPage loginMember(MyPage m);
	
	
	
	// 회원 비밀번호 확인 서비스
	//int pwdConfirm(MyPage m);
	
	// 회원 기본 정보수정용 서비스
	int updateMember(MyPage mp);
	
	
	// 비밀번호 변경
	int updatePwd(MyPage m);
	
	
	
	// 회원 탈퇴용 서비스
	int deleteMember(String memberId);

	// 팔로잉 목록
	int selectFollowListCount(int memberNo);
	ArrayList<MyPage> selectFollowList(PageInfo pi, int memberNo);

	// 팔로우
	int unfollowMember(MyPage m);
	int followMember(MyPage m);

	// 팔로우하는 파트너 정보
	MyPage partnerDetail(MyPage m);

	//로그인한 유저의 멤버넘버로 해당 파트너 팔로우 유무체크
	int followCheck(MyPage m);

	// 파트너의 팔로워 수
	int followerCount(int followMemberNo);
	
	// 파트너의 펀딩수
	int fundingCount(MyPage m);
	
	// 파트너의 펀딩리스트
	ArrayList<MyPage> fundingList(PageInfo pi, MyPage m);


	// 좋아요
	int likeListCount(int memberNo);
	ArrayList<MyPage> likeList(PageInfo pi, int memberNo);


	// 나의문의내역리스트
	int myQueryListCount(int memberNo);
	ArrayList<MyPage> myQueryList(PageInfo pi, int memberNo);
	
	// 문의내역 상세
	MyPage myQueryDetail(int otoNo);
	
	// 문의내역삭제
	int deleteQuery(int otoNo);
	
	
	// 나의 펀딩내역리스트
	int myFundingListCount(int memberNo);
	ArrayList<MyPage> myFundingList(PageInfo pi, int memberNo);


	// 나의 주문내역
	MyPage myFundingDetail(MyPage m);


	// 주분정보 업데이트
	int updateOrder(MyPage m);


	// 주문내역 옵션리스트
	//ArrayList<MyPage> selectOptionList(MyPage m);
	//ArrayList<OptionList> selectOptionList(OptionList o);

	
	// 환불신청
	int refundRequest(MyPage m);


	// 주문상태 업데이트
	int orderStatusUpdate(MyPage m);


	// 메인 좋아요
	ArrayList<MyPage> mainLikeList(int memberNo);


	// 메인문의
	ArrayList<MyPage> mainQueryList(int memberNo);



	// 메인팔로잉목록
	ArrayList<MyPage> mainFollowList(int memberNo);


	//---------------------------------파트너
	
	//파트너정보
	MyPage partnerInfo(MyPage m);


	// 파트너 펀딩수
	int partnerfundingCount(MyPage m);


	// 파트너 펀딩정보
	ArrayList<MyPage> partnerfundingList(PageInfo pi, MyPage m);


	


	


	



	


	



	






	



	



	


	

	

	
	

}
