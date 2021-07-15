package com.kh.withus.report.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.report.model.dao.ReportDao;
import com.kh.withus.report.model.vo.Report;

@Service
public class ReportServiceImpl implements ReportService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private ReportDao rDao;
	
	
	@Override
	public int selectListCount() {
		return rDao.selectListCount(sqlSession);
	}
	@Override
	public ArrayList<Report> selectList(PageInfo pi) {
		return rDao.selectList(sqlSession, pi);
	}

}
