package com.kh.withus.myPage.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.myPage.model.vo.MyPage;


@Repository
public class MyPageDao {

	
	//임시로그인
	public MyPage loginMember(SqlSessionTemplate sqlSession, MyPage m) {
		return sqlSession.selectOne("myPageMapper.loginMember", m);
	}
	
	// 회원탈퇴
	public int deleteMember(SqlSessionTemplate sqlSession, String memberId) {
		
		return sqlSession.update("myPageMapper.deleteMember", memberId);
	}

	// 팔로우 목록 카운트
	public int selectFollowListCount(SqlSessionTemplate sqlSession, int memberNo) {
		
		return sqlSession.selectOne("myPageMapper.selectFollowListCount", memberNo);
	
	}

	// 팔로우 목록 
	public ArrayList<MyPage> selectFollowList(SqlSessionTemplate sqlSession, PageInfo pi, int memberNo) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("myPageMapper.selectFollowList", memberNo, rowBounds);
	}

	// 회원 기본정보수정
	public int updateMember(SqlSessionTemplate sqlSession, MyPage m) {
		
		return sqlSession.update("myPageMapper.updateMember", m);
	
	}
	
	
	// 비밀번호 변경
	public int updatePwd(SqlSessionTemplate sqlSession, MyPage m) {
		return sqlSession.update("myPageMapper.updatePwd", m);
	}	


	// 언팔
	public int unfollowMember(SqlSessionTemplate sqlSession, MyPage m) {

		return sqlSession.delete("myPageMapper.unfollowMember", m);
	}
	
	// 팔로우
	public int followMember(SqlSessionTemplate sqlSession, MyPage m) {
		return sqlSession.insert("myPageMapper.followMember", m);
	}

	// 파트너 정보 페이지
	public MyPage partnerDetail(SqlSessionTemplate sqlSession, MyPage m) {
		
		return sqlSession.selectOne("myPageMapper.partnerDetail", m);
	}

	//로그인한 유저의 멤버넘버로 해당 파트너 팔로우 유무체크
	public int followCheck(SqlSessionTemplate sqlSession, MyPage m) {
		
		return sqlSession.selectOne("myPageMapper.followCheck", m);
	}

	// 파트너 팔로워수 카운트
	public int followerCount(SqlSessionTemplate sqlSession, int followMemberNo) {
		
		return sqlSession.selectOne("myPageMapper.followerCount", followMemberNo);
	}
	
	// 파트너 펀딩수 카운트
	public int fundingCount(SqlSessionTemplate sqlSession, MyPage m) {
		return sqlSession.selectOne("myPageMapper.fundingCount", m);
	}
	
	// 파트너 펀딩리스트
	public ArrayList<MyPage> fundingList(SqlSessionTemplate sqlSession, PageInfo pi, MyPage m) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("myPageMapper.fundingList", m, rowBounds);
	}
	

	// 좋아요 목록 카운트
	public int likeListCount(SqlSessionTemplate sqlSession, int memberNo) {
		
		return sqlSession.selectOne("myPageMapper.likeListCount", memberNo);
	}

	// 좋아요 목록
	public ArrayList<MyPage> likeList(SqlSessionTemplate sqlSession, PageInfo pi, int memberNo) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("myPageMapper.likeList", memberNo, rowBounds);
	}

	// 나의문의내역 카운트
	public int myQueryListCount(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("myPageMapper.myQueryListCount", memberNo);
	}

	// 나의 문의 목록
	public ArrayList<MyPage> myQueryList(SqlSessionTemplate sqlSession, PageInfo pi, int memberNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("myPageMapper.myQueryList", memberNo, rowBounds);
	}
	
	//나의문의 상세
	public MyPage myQueryDetail(SqlSessionTemplate sqlSession, int otoNo) {
		return sqlSession.selectOne("myPageMapper.myQueryDetail", otoNo);
	}
	
	//나의문의 삭제
	public int deleteQuery(SqlSessionTemplate sqlSession, int otoNo) {
		return sqlSession.update("myPageMapper.deleteQuery", otoNo);
	}
	
	
	// 나의 펀딩내역 카운트
	public int myFundingListCount(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("myPageMapper.myFundingListCount", memberNo);
	}

	// 나의 펀딩내역 리스트
	public ArrayList<MyPage> myFundingList(SqlSessionTemplate sqlSession, PageInfo pi, int memberNo) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("myPageMapper.myFundingList", memberNo, rowBounds);
	}

	//펀딩내역 디테일 어레이리스트
	public MyPage myFundingDetail(SqlSessionTemplate sqlSession, MyPage m) {
		
		return sqlSession.selectOne("myPageMapper.myFundingDetail", m);
	}

	// 주문정보 업데이트
	public int updateOrder(SqlSessionTemplate sqlSession, MyPage m) {
		
		return sqlSession.update("myPageMapper.updateOrder", m);
	
	}

	
	// 옵션리스트
	
	/*
	public ArrayList<MyPage> selectOptionList(SqlSessionTemplate sqlSession, MyPage m) {
		
		return (ArrayList)sqlSession.selectList("myPageMapper.selectOptionList", m);
	}
	
	*/
	
	
	

	//환불신청
	public int refundRequest(SqlSessionTemplate sqlSession, MyPage m) {
		
		return sqlSession.insert("myPageMapper.refundRequest", m);
		
	}

	public int orderStatusUpdate(SqlSessionTemplate sqlSession, MyPage m) {
		return sqlSession.update("myPageMapper.orderStatusUpdate", m);
	}

	
	public ArrayList<MyPage> mainLikeList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("myPageMapper.mainLikeList", memberNo);
	}

	public ArrayList<MyPage> mainQueryList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("myPageMapper.mainQueryList", memberNo);
	}

	
	public ArrayList<MyPage> mainFollowList(SqlSessionTemplate sqlSession, int memberNo) {
		return (ArrayList)sqlSession.selectList("myPageMapper.mainFollowList", memberNo);
	}

	//---------------------파트너
	
	//파트너정보
	public MyPage partnerInfo(SqlSessionTemplate sqlSession, MyPage m) {
		return sqlSession.selectOne("myPageMapper.partnerInfo", m);
	}

	// 파트너 펀딩수카운트
	public int partnerfundingCount(SqlSessionTemplate sqlSession, MyPage m) {
		return sqlSession.selectOne("myPageMapper.partnerfundingCount", m);
	}

	// 파트너펀딩정보
	public ArrayList<MyPage> partnerfundingList(SqlSessionTemplate sqlSession, PageInfo pi, MyPage m) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("myPageMapper.partnerfundingList", m, rowBounds);
	}
	
	
	

	
	

	

	
	

	
	

}
