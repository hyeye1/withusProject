package com.kh.withus.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
}
