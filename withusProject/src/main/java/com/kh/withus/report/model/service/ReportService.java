package com.kh.withus.report.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.report.model.vo.Report;

public interface ReportService {

	// 신고회원 조회
	int selectListCount();
	ArrayList<Report> selectList(PageInfo pi);
	
	// 신고거절
	int reportReset(int rno);
	
	// 신고수락
	int reportSubmit(int rno);
	
	// 검색결과
	//int countSearch(HashMap<String, String> map);
	//ArrayList<Report> selectSearchReport(HashMap<String, String> map, PageInfo pi);

}
