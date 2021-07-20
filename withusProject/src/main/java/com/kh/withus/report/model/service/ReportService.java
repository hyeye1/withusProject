package com.kh.withus.report.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.report.model.vo.Report;

public interface ReportService {

	// 신고회원 조회
	//int selectListCount();
	ArrayList<Report> selectReportList(int reportNo);
	
	// 처리중 버튼(update)
	int reportSubmit(int rno);
	int reportReset(int rno);
	
	
	
	// 검색결과
	//int countSearch(HashMap<String, String> map);
	//ArrayList<Report> selectSearchReport(HashMap<String, String> map, PageInfo pi);

}
