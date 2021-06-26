package com.kh.withus.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public int deleteMember(String m) {
		return mDao.deleteMember(sqlSession, m);
	}

	@Override
	public int idCheck(String memberId) {
		// TODO Auto-generated method stub
		return 0;
	}

	
}
