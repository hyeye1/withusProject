package com.kh.withus.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.member.model.vo.Member;

@Repository
public class MemberDao {
	
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}
	
	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMember", m);
	}
	
	public int deleteMember(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.update("memberMapper.deleteMember", memberId);
	}
	
	public int idCheck(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.selectOne("memberMapper.idCheck", memberId);
	}
	
	public int insertMemberLogin(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper,insertMemberLogin", m);
	}
	
	// 관리자
	// 로그인
	public Member loginAdmin(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginAdmin", m);
	}
	
	// 페이징 처리
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.selectListCount");
	}
	
	// 전체 회원 조회
	public ArrayList<Member> selectList (SqlSessionTemplate sqlSession, PageInfo pi){

		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); //몇개의 게시물을 건너 뛰고
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectMemList", null, rowBounds);
	}	
	
	// 탈퇴클릭시 모달 
	public Member selectMemStatus(SqlSessionTemplate sqlSession, int memberNo) {
		return sqlSession.selectOne("memberMapper.selectMemStatus", memberNo);
	}
	
	// 회원 탈퇴
	public int deleteMemberMana(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.update("memberMapper.deleteMemberMana", map);
	}
	
	// 검색 페이징 처리
	public int countSearch(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("memberMapper.countSearch", map);
	}
	
	// 검색
	public ArrayList<Member> searchMember(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.searchMember", map, rowBounds);
	}

	
}
