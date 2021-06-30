package com.kh.withus.myPage.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.myPage.model.dao.MyPageDao;
import com.kh.withus.myPage.model.vo.MyPage;


@Service
public class MyPageServiceImpl implements MyPageService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MyPageDao mpDao;
	
	
	//임시 로그인
	@Override
	public MyPage loginMember(MyPage m) {
		
		//Member loginUser = mDao.loginMember(sqlSession, m);
		//return loginUser;
		return mpDao.loginMember(sqlSession, m);
	}

	
	


	// 기본정보 변경
	@Override
	public int updateMember(MyPage m) {
		
		return mpDao.updateMember(sqlSession, m);
	}
	
	// 비밀번호 변경
	@Override
	public int updatePwd(MyPage m) {
		return mpDao.updatePwd(sqlSession, m);
	}
	

	@Override
	public int deleteMember(String memberId) {
		
		return mpDao.deleteMember(sqlSession, memberId);
	}

	@Override
	public int selectFollowListCount(int memberNo) {
		return mpDao.selectFollowListCount(sqlSession, memberNo);
	}

	@Override
	public ArrayList<MyPage> selectFollowList(PageInfo pi, int memberNo) {
		return mpDao.selectFollowList(sqlSession, pi, memberNo);
	}

	@Override
	public int unfollowMember(MyPage m) {
		
		return mpDao.unfollowMember(sqlSession, m);
	}

	@Override
	public int followMember(MyPage m) {
		return mpDao.followMember(sqlSession, m);
	}

	@Override
	public MyPage partnerDetail(MyPage m) {
		
		return mpDao.partnerDetail(sqlSession, m);
	}

	
	@Override
	public int followCheck(MyPage m) {
		
		return mpDao.followCheck(sqlSession, m);
	}

	@Override
	public int followerCount(int followMemberNo) {
		
		return mpDao.followerCount(sqlSession, followMemberNo);
	}

	@Override
	public int fundingCount(MyPage m) {
		return mpDao.fundingCount(sqlSession, m);
	}
	
	@Override
	public ArrayList<MyPage> fundingList(PageInfo pi, MyPage m) {
		return mpDao.fundingList(sqlSession, pi, m);
	}

	// 좋아요 리스트
	@Override
	public int likeListCount(int memberNo) {
		
		return mpDao.likeListCount(sqlSession, memberNo);
	}

	@Override
	public ArrayList<MyPage> likeList(PageInfo pi, int memberNo) {
		
		return mpDao.likeList(sqlSession, pi, memberNo);
	}

	// 나의 문의내역 리스트 카운트
	@Override
	public int myQueryListCount(int memberNo) {
		return mpDao.myQueryListCount(sqlSession, memberNo);
	}

	// 나의 문의내역 리스트
	@Override
	public ArrayList<MyPage> myQueryList(PageInfo pi, int memberNo) {
		return mpDao.myQueryList(sqlSession, pi, memberNo);
	}
	
	//나의 문의 상세
	@Override
	public MyPage myQueryDetail(int otoNo) {
		return mpDao.myQueryDetail(sqlSession, otoNo);
	}
	
	//문의내역 삭제
	@Override
	public int deleteQuery(int otoNo) {
		return mpDao.deleteQuery(sqlSession, otoNo);
	}


	

	// 나의 펀딩리스트
	@Override
	public int myFundingListCount(int memberNo) {
		return mpDao.myFundingListCount(sqlSession, memberNo);
	}


	@Override
	public ArrayList<MyPage> myFundingList(PageInfo pi, int memberNo) {
		return mpDao.myFundingList(sqlSession, pi, memberNo);
	}




	// 나의 주문내역
	@Override
	public MyPage myFundingDetail(MyPage m) {
		return mpDao.myFundingDetail(sqlSession, m);
	}

	@Override
	public int updateOrder(MyPage m) {
		return mpDao.updateOrder(sqlSession, m);
	}



	/*

	@Override
	public ArrayList<MyPage> selectOptionList(MyPage m) {
		return mDao.selectOptionList(sqlSession, m);
	}
	 
	public ArrayList<OptionList> selectOptionList(OptionList o) {
		return mDao.selectOptionList(sqlSession, o);
	}
	*/


	@Override
	public int refundRequest(MyPage m) {
		return mpDao.refundRequest(sqlSession, m);
	}


	@Override
	public int orderStatusUpdate(MyPage m) {
		return mpDao.orderStatusUpdate(sqlSession, m);
	}



	@Override
	public ArrayList<MyPage> mainLikeList(int memberNo) {
		return mpDao.mainLikeList(sqlSession, memberNo);
	}





	@Override
	public ArrayList<MyPage> mainQueryList(int memberNo) {
		return mpDao.mainQueryList(sqlSession, memberNo);
	}



	@Override
	public ArrayList<MyPage> mainFollowList(int memberNo) {
		return mpDao.mainFollowList(sqlSession, memberNo);
	}



	//-------------파트너

	
	//파트너정보
	@Override
	public MyPage partnerInfo(MyPage m) {
		return mpDao.partnerInfo(sqlSession, m);
	}




	// 파트너가만든 펀딩수
	@Override
	public int partnerfundingCount(MyPage m) {
		return mpDao.partnerfundingCount(sqlSession, m);
	}




	// 파트너가만든 펀딩 정보
	@Override
	public ArrayList<MyPage> partnerfundingList(PageInfo pi, MyPage m) {
		return mpDao.partnerfundingList(sqlSession,pi, m);
	}

	// 파트너조인
	@Override
	public int partnerJoin(MyPage m) {
		return mpDao.partnerJoin(sqlSession,m);
	}		






	





	








	





	


















	

	

	

}
