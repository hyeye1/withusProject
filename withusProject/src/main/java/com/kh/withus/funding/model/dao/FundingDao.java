package com.kh.withus.funding.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.withus.category.model.vo.Category;
import com.kh.withus.funding.model.dto.FundingDetail;
import com.kh.withus.funding.model.vo.Project;
import com.kh.withus.funding.model.vo.ProjectReply;
import com.kh.withus.funding.model.vo.Reward;
import com.kh.withus.order.model.vo.Order;

@Repository
public class FundingDao {
	
	public ArrayList<Category> selectCate(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("fundingMapper.selectCate");
	}
	
    public ArrayList<Project> selectAllList(SqlSessionTemplate sqlSession) {
       return (ArrayList)sqlSession.selectList("fundingMapper.selectAllList");
    }
   
    public ArrayList<Project> selectList(SqlSessionTemplate sqlSession, int catNo) {
       return (ArrayList)sqlSession.selectList("fundingMapper.selectList", catNo);
    }
	
	public int increaseCount(SqlSessionTemplate sqlSession, int projectNo) {
		return sqlSession.update("fundingMapper.increaseCount", projectNo);
	}
	
	public FundingDetail selectFunding(SqlSessionTemplate sqlSession, int projectNo) {
		return sqlSession.selectOne("fundingMapper.selectFunding", projectNo);
	}

	public ArrayList<FundingDetail> selectReward(SqlSessionTemplate sqlSession, int projectNo) {
		return (ArrayList)sqlSession.selectList("fundingMapper.selectReward", projectNo);
	}
	
	public ArrayList<FundingDetail> selectDetailReward(SqlSessionTemplate sqlSession, int projectNo) {
		return (ArrayList)sqlSession.selectList("fundingMapper.selectDetailReward", projectNo);
	}
	
	public FundingDetail selectOneReward(SqlSessionTemplate sqlSession, int rewardNo) {
		return sqlSession.selectOne("fundingMapper.selectOneReward", rewardNo);
	}
	
	public int insertOrderTable(SqlSessionTemplate sqlSession, Order o) {
		return sqlSession.insert("fundingMapper.insertOrderTable", o);
	}
	
	public int minusStock(SqlSessionTemplate sqlSession, Order o) {
		return sqlSession.update("fundingMapper.minusStock", o);
	}

	public int insertProject(SqlSessionTemplate sqlSession, Project p) {
		return sqlSession.insert("fundingMapper.insertProject", p);
    }

	public int insertReward(SqlSessionTemplate sqlSession, Reward r) {
		return sqlSession.insert("fundingMapper.insertReward", r);		
	}
	
	public ArrayList<Project> selectSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return (ArrayList)sqlSession.selectList("fundingMapper.selectSearchList", map);		
	}

	public int insertReply(SqlSessionTemplate sqlSession, ProjectReply r) {
		return sqlSession.insert("fundingMapper.insertReply", r);
	}
	
	public ArrayList<ProjectReply> selectReplyList(SqlSessionTemplate sqlSession, int pno) {
		return (ArrayList)sqlSession.selectList("fundingMapper.selectReplyList", pno);
	}

	
	
}
