package com.kh.withus.funding.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.withus.funding.model.dto.FundingDetail;
import com.kh.withus.category.model.vo.Category;
import com.kh.withus.funding.model.dao.FundingDao;
import com.kh.withus.funding.model.vo.Project;
import com.kh.withus.order.model.vo.Order;

@Service
public class FundingServiceImpl implements FundingService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private FundingDao funDao;
	
	@Override
	public ArrayList<Category> selectCate() {
		return funDao.selectCate(sqlSession);
	}
	
	@Override
	public ArrayList<Project> selectList() {
		return funDao.selectList(sqlSession);
	}
	
	@Override
	public int increaseCount(int projectNo) {
		return funDao.increaseCount(sqlSession, projectNo);
	}

	@Override
	public FundingDetail selectFunding(int projectNo) {
		return funDao.selectFunding(sqlSession, projectNo);
	}

	@Override
	public ArrayList<FundingDetail> selectReward(int projectNo) {
		return funDao.selectReward(sqlSession, projectNo);
	}

	@Override
	public ArrayList<FundingDetail> selectDetailReward(int projectNo) {
		return funDao.selectDetailReward(sqlSession, projectNo);
	}

	@Override
	public FundingDetail selectOneReward(int rewardNo) {
		return funDao.selectOneReward(sqlSession, rewardNo);
	}

	@Override
	public int insertOrderTable(Order o) {
		return funDao.insertOrderTable(sqlSession, o);
	}

	@Override
	public int minusStock(Order o) {
		return funDao.minusStock(sqlSession, o);
	}

}
