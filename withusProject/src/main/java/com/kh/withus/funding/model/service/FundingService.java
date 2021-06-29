package com.kh.withus.funding.model.service;

import java.util.ArrayList;

import com.kh.withus.funding.model.dto.FundingDetail;
import com.kh.withus.funding.model.vo.Project;

public interface FundingService {

	// 펀딩 리스트 조회
	ArrayList<Project> selectList();
	
	// 상세페이지 조회
	int increaseCount(int projectNo);
	FundingDetail selectFunding(int projectNo);
	ArrayList<FundingDetail> selectReward(int projectNo);
	
	// 버튼 또는 div 클릭 후 리워드 조회
	ArrayList<FundingDetail> selectDetailReward(int projectNo);
	
}
