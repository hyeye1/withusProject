package com.kh.withus.member.model.dao;

import java.util.ArrayList;

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
	
	//관리자
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.selectListCount");
	}
	
	public ArrayList<Member> selectList (SqlSessionTemplate sqlSession, PageInfo pi){

		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); //몇개의 게시물을 건너 뛰고
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectMemList", null, rowBounds);
	}	
	
	public int updateMemStatus(SqlSessionTemplate sqlSession, String mId,String mStatus) {
		return sqlSession.update("memberMapper.updateMemStatus", mId);
	}
	
}
