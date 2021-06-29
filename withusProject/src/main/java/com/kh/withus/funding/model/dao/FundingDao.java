package com.kh.withus.funding.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.withus.funding.model.dto.FundingDetail;
import com.kh.withus.funding.model.vo.Project;

@Repository
public class FundingDao {

	public ArrayList<Project> selectList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("fundingMapper.selectList");
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
	
}
