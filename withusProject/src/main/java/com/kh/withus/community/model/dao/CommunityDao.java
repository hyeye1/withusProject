package com.kh.withus.community.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.community.model.vo.CommuReply;
import com.kh.withus.community.model.vo.Community;

@Repository
public class CommunityDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("communityMapper.selectListCount");
	}
	
	public ArrayList<Community> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("communityMapper.selectList", null, rowBounds);
		
	}
	public ArrayList<Community> selectList1(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("communityMapper.selectList1", null, rowBounds);
		
	}
	
	public ArrayList<Community> selectList2(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("communityMapper.selectList2", null, rowBounds);
		
	}
	
	public ArrayList<Community> selectList3(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("communityMapper.selectList3", null, rowBounds);
		
	}

	
	public int insertCommunity(SqlSessionTemplate sqlSession, Community c) {
		System.out.println("dao실행");
		return sqlSession.insert("communityMapper.insertCommunity", c);
	}
	
	public int increaseCount(SqlSessionTemplate sqlSession, int commuNo) {
		return sqlSession.update("communityMapper.increaseCount", commuNo);
	}
	
	public Community selectCommunity(SqlSessionTemplate sqlSession, int commuNo) {
		return sqlSession.selectOne("communityMapper.selectCommunity", commuNo);
	}
	
	public int deleteCommunity(SqlSessionTemplate sqlSession, int commuNo) {
		return sqlSession.update("communityMapper.deleteCommunity", commuNo);
	}
	
	public int updateCommunity(SqlSessionTemplate sqlSession, Community c) {
		System.out.println(c);
		return sqlSession.update("communityMapper.updateCommunity", c);
	}
	
	public ArrayList<CommuReply> selectCommuReplyList(SqlSessionTemplate sqlSession, int commuNo){
		return (ArrayList)sqlSession.selectList("communityMapper.selectCommuReplyList", commuNo);
	}
	
	public int insertCommuReply(SqlSessionTemplate sqlSession, CommuReply cr) {
		return sqlSession.insert("communityMapper.insertCommuReply", cr);
	}
	
	
	// 검색
	
	public ArrayList<Community> selectCommuSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return (ArrayList)sqlSession.selectList("communityMapper.selectCommuSearchList", map);		
	}
	
	
	
	
	
	
	
}
