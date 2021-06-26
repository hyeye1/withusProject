package com.kh.withus.funding.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.withus.funding.model.dao.FundingDao;
import com.kh.withus.funding.model.vo.Project;

@Service
public class FundingServiceImpl implements FundingService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private FundingDao funDao;

	@Override
	public ArrayList<Project> selectList() {
		return funDao.selectList(sqlSession);
	}

}
