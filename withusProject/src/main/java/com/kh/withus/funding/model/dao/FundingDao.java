package com.kh.withus.funding.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.withus.funding.model.vo.Project;

@Repository
public class FundingDao {

	public ArrayList<Project> selectList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("fundingMapper.selectList");
	}
	
}
