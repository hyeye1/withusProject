package com.kh.withus.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.member.model.dao.MemberDao;
import com.kh.withus.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao mDao;
	
	@Override
	public Member loginMember(Member m) {
		return mDao.loginMember(sqlSession, m);
	}

	@Override
	public int insertMember(Member m) {
		return mDao.insertMember(sqlSession, m);
	}

	@Override
	public int updateMember(Member m) {
		return mDao.updateMember(sqlSession, m);
	}

	@Override
	public int deleteMember(String memberId) {
		return mDao.deleteMember(sqlSession, memberId);
	}

	@Override
	public int idCheck(String memberId) {
		return mDao.idCheck(sqlSession, memberId);
	}

	@Override
	public int insertMemberLogin(Member m) {
		return mDao.insertMemberLogin(sqlSession, m);
	}

	// 관리자
	@Override
	public int selectListCount() {
		return mDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Member> selectList(PageInfo pi) {
		return mDao.selectList(sqlSession, pi);
	}

	@Override
	public Member selectMemStatus(int memberNo) {
		return mDao.selectMemStatus(sqlSession, memberNo);
	}
	
	@Override
	public int deleteMemberMana(HashMap<String, Object> map) {
		return mDao.deleteMemberMana(sqlSession, map);
	}

	@Override
	public int countSearch(HashMap<String, String> map) {
		return mDao.countSearch(sqlSession, map);
	}

	@Override
	public ArrayList<Member> searchMember(HashMap<String, String> map, PageInfo pi) {
		return mDao.searchMember(sqlSession, map, pi);
	}
	
	
	
	
	

}
