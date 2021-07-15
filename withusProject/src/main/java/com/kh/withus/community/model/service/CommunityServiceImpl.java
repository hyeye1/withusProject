package com.kh.withus.community.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.community.model.dao.CommunityDao;
import com.kh.withus.community.model.vo.CommuReply;
import com.kh.withus.community.model.vo.Community;

@Service
public class CommunityServiceImpl implements CommunityService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private CommunityDao cDao;
	
	@Override
	public int selectListCount() {
		return cDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Community> selectList(PageInfo pi) {
		return cDao.selectList(sqlSession, pi);
	}

	@Override
	public int insertCommunity(Community c) {
		System.out.println("서비스 실행");
		return cDao.insertCommunity(sqlSession, c);
	}

	@Override
	public int increaseCount(int commuNo) {
		return cDao.increaseCount(sqlSession, commuNo);
	}

	@Override
	public Community selectCommunity(int commuNo) {
		return cDao.selectCommunity(sqlSession, commuNo);
	}

	@Override
	public int updateCommunity(Community c) {
		return cDao.updateCommunity(sqlSession, c);
	}

	@Override
	public int deleteCommunity(int commuNo) {
		return cDao.deleteCommunity(sqlSession, commuNo);
	}

	@Override
	public ArrayList<CommuReply> selectCommuReplyList(int commuNo) {
		return cDao.selectCommuReplyList(sqlSession, commuNo);
	}

	@Override
	public int insertCommuReply(CommuReply cr) {
		return cDao.insertCommuReply(sqlSession, cr);
	}

	// 검색
	@Override
	public ArrayList<Community> selectCommuSearchList(HashMap<String, String> map) {
		return cDao.selectCommuSearchList(sqlSession, map);
	}

	
	
}
