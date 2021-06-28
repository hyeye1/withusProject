package com.kh.withus.funding.model.service;

import java.util.ArrayList;

import com.kh.withus.funding.model.dto.FundingDetail;
import com.kh.withus.funding.model.vo.Project;

public interface FundingService {

	// 게시판 리스트 조회
	ArrayList<Project> selectList();
	
	// 상세페이지 조회
	int increaseCount(int projectNo);
	FundingDetail selectFunding(int projectNo);
	ArrayList<FundingDetail> selectReward(int projectNo);
	
}
