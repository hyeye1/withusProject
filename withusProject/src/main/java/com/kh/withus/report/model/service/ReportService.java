package com.kh.withus.report.model.service;

import java.util.ArrayList;

import com.kh.withus.common.model.vo.PageInfo;
import com.kh.withus.report.model.vo.Report;

public interface ReportService {

	// 신고회원 조회
	int selectListCount();
	ArrayList<Report> selectList(PageInfo pi);

}
