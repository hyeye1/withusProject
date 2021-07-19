package com.kh.withus.report.model.service;

import java.util.ArrayList;
import java.util.HashMap;

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
	public ArrayList<Report> selectReportList(int reportNo) {
		return rDao.selectReportList(sqlSession, reportNo);
	}

	@Override
	public String reportSubmit(int reportNo) {
		return rDao.reportSubmit(sqlSession, reportNo);
	}
	
	/*
	@Override
	public int selectListCount() {
		return rDao.selectListCount(sqlSession);
	}
	
	
	@Override
	public ArrayList<Report> selectReportList(int reportNo) {
		return rDao.selectReportList(sqlSession);
	}
	
	@Override
	public int reportReset(int rno) {
		return rDao.reportReset(sqlSession, rno);
	}
	
	@Override
	public int reportSubmit(int rno) {
		return rDao.reportSubmit(sqlSession, rno);
	}
	*/



	
	
	
	/*
	@Override
	public int countSearch(HashMap<String, String> map) {
		return rDao.countSearch(sqlSession, map);
	}
	@Override
	public ArrayList<Report> selectSearchReport(HashMap<String, String> map, PageInfo pi) {
		return rDao.selectSearchReport(sqlSession, map, pi);
	}
	*/

}
